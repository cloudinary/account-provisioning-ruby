# typed: true
# frozen_string_literal: true

require_relative "types"

module CldProvisioning
  module SDKHooks
    # Replaces the default Speakeasy user-agent with a Cloudinary-branded one.
    #
    # Format: Cloudinary/AccountProvisioning Ruby/<sdkVersion> Gen/<genVersion> Schema/<schemaVersion> (<system info>)
    class UserAgentHook < AbstractSDKHook
      extend T::Sig

      sig { override.params(config: SDKConfiguration).returns(SDKConfiguration) }
      def sdk_init(config:)
        original = config.user_agent
        return config unless original.start_with?("speakeasy-sdk/")

        parts = original.split(" ", 5)
        return config if parts.length < 5

        sdk_version = parts[1]
        gen_version = parts[2]
        schema_version = parts[3]

        ruby_version = RUBY_VERSION
        platform = RUBY_PLATFORM

        config.user_agent = "Cloudinary/AccountProvisioning Ruby/#{sdk_version} Gen/#{gen_version} Schema/#{schema_version} (Ruby #{ruby_version}; #{platform})"

        config
      end
    end
  end
end
