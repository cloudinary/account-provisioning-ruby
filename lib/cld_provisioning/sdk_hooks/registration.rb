# typed: true
# frozen_string_literal: true

#
# This file is only ever generated once on the first generation and then is free to be modified.
# Any hooks you wish to add should be registered in the init_hooks method.
#
# Hooks are registered per SDK instance, and are valid for the lifetime of the SDK instance.
#

require_relative "./types"
require_relative "./account_config"
require_relative "./cloudinary_account_hook"
require_relative "./user_agent_hook"

module CldProvisioning
  module SDKHooks
    class Registration
      extend T::Sig

      sig do
        params(
          hooks: Hooks
        )
          .void
      end
      def self.init_hooks(hooks)
        config = AccountConfig.new
        account_hook = CloudinaryAccountHook.new(config: config)

        hooks.register_sdk_init_hook(account_hook)
        hooks.register_before_request_hook(account_hook)
        hooks.register_sdk_init_hook(UserAgentHook.new)
      end
    end
  end
end
