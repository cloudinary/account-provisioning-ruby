# typed: true
# frozen_string_literal: true

require "base64"
require_relative "types"
require_relative "account_config"

module CldProvisioning
  module SDKHooks
    # Populates account_id from CLOUDINARY_ACCOUNT_URL on init, and
    # attaches Basic auth (provisioning_api_key:provisioning_api_secret) to every request.
    #
    # Credential resolution order:
    #   1. Explicit security passed to the SDK constructor
    #   2. CLOUDINARY_ACCOUNT_URL / individual CLOUDINARY_ACCOUNT_* env vars
    class CloudinaryAccountHook < AbstractSDKHook
      extend T::Sig

      sig { params(config: AccountConfig).void }
      def initialize(config:)
        @config = T.let(config, AccountConfig)
      end

      sig { override.params(config: SDKConfiguration).returns(SDKConfiguration) }
      def sdk_init(config:)
        account_id = config.globals.dig(:parameters, :pathParam, :account_id)
        if (account_id.nil? || (account_id.is_a?(String) && account_id.empty?)) && !@config.account_id.empty?
          config.globals[:parameters] ||= {}
          params = T.must(config.globals[:parameters])
          params[:pathParam] ||= {}
          T.must(params[:pathParam])[:account_id] = @config.account_id
        end

        config
      end

      sig { override.params(hook_ctx: BeforeRequestHookContext, request: Faraday::Request).returns(Faraday::Request) }
      def before_request(hook_ctx:, request:)
        key, secret = resolve_credentials(hook_ctx)

        if key.empty? || secret.empty?
          raise "Provisioning API key and secret are required"
        end

        encoded = Base64.strict_encode64("#{key}:#{secret}")
        request.headers["Authorization"] = "Basic #{encoded}"

        request
      end

      private

      sig { params(hook_ctx: BeforeRequestHookContext).returns([String, String]) }
      def resolve_credentials(hook_ctx)
        key = @config.provisioning_api_key
        secret = @config.provisioning_api_secret

        security = resolve_security(hook_ctx.security_source)
        return [key, secret] unless security

        if security.is_a?(Models::Shared::Security)
          key = security.provisioning_api_key unless security.provisioning_api_key.empty?
          secret = security.provisioning_api_secret unless security.provisioning_api_secret.empty?
        elsif security.is_a?(Hash)
          sym_sec = security.transform_keys(&:to_sym)
          if sym_sec[:cloudinary_account_auth]
            auth = sym_sec[:cloudinary_account_auth]
            auth = auth.transform_keys(&:to_sym) if auth.is_a?(Hash)
            key = auth[:provisioning_api_key] || key if auth.is_a?(Hash)
            secret = auth[:provisioning_api_secret] || secret if auth.is_a?(Hash)
          elsif sym_sec[:provisioning_api_key] || sym_sec[:provisioning_api_secret]
            key = sym_sec[:provisioning_api_key] || key
            secret = sym_sec[:provisioning_api_secret] || secret
          end
        end

        [key.to_s, secret.to_s]
      end

      sig { params(source: T.untyped).returns(T.untyped) }
      def resolve_security(source)
        return nil if source.nil?
        source.is_a?(Proc) ? source.call : source
      end
    end
  end
end
