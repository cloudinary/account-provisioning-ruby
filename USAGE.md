<!-- Start SDK Example Usage [usage] -->
```ruby
require "cloudinary_account_provisioning"

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: "<id>",
  security: Models::Shared::Security.new(
    provisioning_api_key: "CLOUDINARY_PROVISIONING_API_KEY",
    provisioning_api_secret: "CLOUDINARY_PROVISIONING_API_SECRET"
  )
)

req = Models::Operations::GetProductEnvironmentsRequest.new(
  enabled: true,
  prefix: "product"
)
res = s.product_environments.list(request: req)

unless res.product_environments_response.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->