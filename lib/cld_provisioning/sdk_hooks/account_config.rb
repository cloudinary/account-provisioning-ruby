# typed: true
# frozen_string_literal: true

require "uri"

module CldProvisioning
  module SDKHooks
    # Parses Cloudinary account configuration from CLOUDINARY_ACCOUNT_URL
    # or individual CLOUDINARY_ACCOUNT_* environment variables.
    #
    # URL format: account://<provisioning_api_key>:<provisioning_api_secret>@<account_id>
    class AccountConfig
      extend T::Sig

      sig { returns(String) }
      attr_reader :account_id

      sig { returns(String) }
      attr_reader :provisioning_api_key

      sig { returns(String) }
      attr_reader :provisioning_api_secret

      sig { void }
      def initialize
        @account_id = T.let("", String)
        @provisioning_api_key = T.let("", String)
        @provisioning_api_secret = T.let("", String)

        account_url = ENV["CLOUDINARY_ACCOUNT_URL"]
        load_from_url(account_url) if account_url && !account_url.empty?

        override_from_env("CLOUDINARY_ACCOUNT_ID") { |v| @account_id = v }
        override_from_env("CLOUDINARY_PROVISIONING_API_KEY") { |v| @provisioning_api_key = v }
        override_from_env("CLOUDINARY_PROVISIONING_API_SECRET") { |v| @provisioning_api_secret = v }
      end

      private

      sig { params(name: String, block: T.proc.params(value: String).void).void }
      def override_from_env(name, &block)
        value = ENV[name]
        block.call(value) if value && !value.empty?
      end

      sig { params(url: String).void }
      def load_from_url(url)
        unless url.start_with?("account://")
          raise ArgumentError, "Invalid CLOUDINARY_ACCOUNT_URL scheme. Expecting 'account://'"
        end

        # Replace custom scheme with http:// so URI can parse it
        parsed = URI.parse(url.sub("account://", "http://"))
        @account_id = parsed.host || ""
        @provisioning_api_key = parsed.user ? URI.decode_www_form_component(T.must(parsed.user)) : ""
        @provisioning_api_secret = parsed.password ? URI.decode_www_form_component(T.must(parsed.password)) : ""
      rescue URI::InvalidURIError => e
        raise ArgumentError, "Invalid CLOUDINARY_ACCOUNT_URL: '#{url}' (#{e.message})"
      end
    end
  end
end
