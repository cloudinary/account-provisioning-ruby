# EffectivePolicies

## Overview

### Available Operations

* [list](#list) - Get effective policies

## list

Retrieve all roles (along with their system permission policies) associated with principals, and all custom permission policies directly added to principals, all within a specified scope.

Optionally specify a principal to only include roles and policies associated with that principal.


### Example Usage

<!-- UsageSnippet language="ruby" operationID="getEffectivePolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/effective" example="EffectivePoliciesExample" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CloudinaryAccountProvisioning::Models
s = ::CloudinaryAccountProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)

req = Models::Operations::GetEffectivePoliciesRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  principal_type: Models::Shared::PrincipalTypeEnum::USER
)
res = s.effective_policies.list(request: req)

unless res.effective_policies_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                 | [Models::Operations::GetEffectivePoliciesRequest](../../models/operations/geteffectivepoliciesrequest.md) | :heavy_check_mark:                                                                                        | The request object to use for the request.                                                                |

### Response

**[T.nilable(Models::Operations::GetEffectivePoliciesResponse)](../../models/operations/geteffectivepoliciesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 404                       | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |