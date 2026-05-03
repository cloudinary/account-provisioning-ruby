# SystemPolicies

## Overview

### Available Operations

* [list](#list) - Get system policies

## list

Retrieve all system-defined permission policies. Optionally filter the results by `scope_type` (account or product environment) and/or `permission_type` (global or content-specific).

**Note:** If `scope_type` isn't specified as `prodenv`, the account-level policies will be returned.


### Example Usage

<!-- UsageSnippet language="ruby" operationID="getSystemPolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/system" example="SystemPoliciesExample" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.system_policies.list(permission_type: Models::Shared::PermissionTypeEnum::GLOBAL, scope_type: Models::Shared::ScopeTypeEnum::PRODENV)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                  | Type                                                                                                                                                                                                                                                                                       | Required                                                                                                                                                                                                                                                                                   | Description                                                                                                                                                                                                                                                                                | Example                                                                                                                                                                                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `account_id`                                                                                                                                                                                                                                                                               | *T.nilable(::String)*                                                                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Account ID                                                                                                                                                                                                                                                                                 |                                                                                                                                                                                                                                                                                            |
| `permission_type`                                                                                                                                                                                                                                                                          | [T.nilable(Models::Shared::PermissionTypeEnum)](../../models/shared/permissiontypeenum.md)                                                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Specifies whether to retrieve roles whose permissions apply globally across all contexts within the scope (i.e., security settings for the account, or all folders in a product environment), or specifically to designated content instances (i.e., folder with external ID "fg3841spr"). | global                                                                                                                                                                                                                                                                                     |
| `scope_type`                                                                                                                                                                                                                                                                               | [T.nilable(Models::Shared::ScopeTypeEnum)](../../models/shared/scopetypeenum.md)                                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                                                                         | Specifies the level for retrieving policies or roles, either at the account level or within product environments.                                                                                                                                                                          | prodenv                                                                                                                                                                                                                                                                                    |

### Response

**[T.nilable(Models::Shared::SystemPoliciesResponse)](../../models/operations/systempoliciesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403                                 | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |