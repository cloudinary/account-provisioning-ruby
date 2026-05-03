# Roles

## Overview

All roles include one or more predefined **system policies**, and can be applied to principals to enforce these policies.

You can **manage custom roles**, where you select the system policies.

You can **view system roles**, which contain a fixed set of system policies and are provided by Cloudinary.


### Available Operations

* [list](#list) - Get roles
* [create](#create) - Create custom role
* [get](#get) - Get role
* [update](#update) - Update custom role
* [delete](#delete) - Delete custom role
* [list_principals](#list_principals) - Get a role's principals
* [update_principals](#update_principals) - Assign principals to a role

## list

Retrieve all system and custom roles of a specific `permission_type` (global or content-specific). Optionally filter by `scope_type`, `management_type`, and `policy_parameters`.


### Example Usage

<!-- UsageSnippet language="ruby" operationID="getRoles" method="get" path="/v2/accounts/{account_id}/permissions/roles" example="GetRolesExample" -->
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

req = Models::Operations::GetRolesRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  permission_type: Models::Shared::PermissionTypeEnum::GLOBAL,
  management_type: Models::Shared::ManagementTypeEnum::SYSTEM
)
res = s.roles.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                         | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `request`                                                                         | [Models::Operations::GetRolesRequest](../../models/operations/getrolesrequest.md) | :heavy_check_mark:                                                                | The request object to use for the request.                                        |

### Response

**[T.nilable(Models::Shared::RolesResponse)](../../models/operations/rolesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403                                 | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## create

Create a new custom role.

### Example Usage: createAcctRoleExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createAcctRoleExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'sensitive_account_details_manager_88825hl',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::ACCOUNT,
  name: 'Sensitive account details manager',
  description: 'Responsible for managing users and account security.',
  system_policy_ids: [
    'cld::global::users_and_groups::manage',
    'cld::policy::global::account_security::manage',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: createAcctRoleResponseExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createAcctRoleResponseExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: createContentRoleExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createContentRoleExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'marketing_content_contributor_1357fhe',
  permission_type: 'content',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Marketing content contributor',
  description: 'View all assets in selected folders and contribute to those folders, without permission to download.',
  system_policy_ids: [
    'cld::policy::content::folder::view_download',
    'cld::policy::content::folder::add_assets',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: createContentRoleResponseExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createContentRoleResponseExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: createGlobalRoleExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createGlobalRoleExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing uploads and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: createGlobalRoleResponseExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="createGlobalRoleResponseExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="invalidFieldErrorExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="ruby" operationID="createRole" method="post" path="/v2/accounts/{account_id}/permissions/roles" example="missingFieldsErrorExample" -->
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
res = s.roles.create(create_role: Models::Shared::CreateRole.new(
  id: 'upload_manager_12334565',
  permission_type: 'global',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                       | Type                                                            | Required                                                        | Description                                                     |
| --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- |
| `create_role`                                                   | [Models::Shared::CreateRole](../../models/shared/createrole.md) | :heavy_check_mark:                                              | Role details.                                                   |
| `account_id`                                                    | *T.nilable(::String)*                                           | :heavy_minus_sign:                                              | Account ID                                                      |

### Response

**[T.nilable(Models::Shared::RoleResponse)](../../models/operations/roleresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 409                       | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## get

Get a specific system or custom role.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getRole" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="GetRoleExample" -->
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

req = Models::Operations::GetRoleRequest.new(
  role_id: '<id>',
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.roles.get(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                       | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `request`                                                                       | [Models::Operations::GetRoleRequest](../../models/operations/getrolerequest.md) | :heavy_check_mark:                                                              | The request object to use for the request.                                      |

### Response

**[T.nilable(Models::Shared::RoleResponse)](../../models/operations/roleresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403, 404                            | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## update

Update a specific custom role by providing all relevant details, including those you want to keep as-is.

*Note:* Updating a role with a name that already exists will trigger a 409 error.


### Example Usage: invalidPolicyIDFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="invalidPolicyIDFieldErrorExample" -->
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
res = s.roles.update(role_id: '<id>', role: Models::Shared::Role.new(
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="ruby" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="missingFieldsErrorExample" -->
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
res = s.roles.update(role_id: '<id>', role: Models::Shared::Role.new(
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: updatePolicyResponse

<!-- UsageSnippet language="ruby" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="updatePolicyResponse" -->
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
res = s.roles.update(role_id: '<id>', role: Models::Shared::Role.new(
  name: 'Upload manager',
  description: 'Responsible for managing upload presets and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```
### Example Usage: updateRoleExample

<!-- UsageSnippet language="ruby" operationID="updateRole" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" example="updateRoleExample" -->
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
res = s.roles.update(role_id: '<id>', role: Models::Shared::Role.new(
  name: 'Upload manager',
  description: 'Responsible for managing uploads and uploading new assets.',
  system_policy_ids: [
    'cld::policy::global::upload_presets::manage',
    'cld::policy::global::folder_and_asset_management::create_asset',
  ]
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                           | Type                                                | Required                                            | Description                                         |
| --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- |
| `role_id`                                           | *::String*                                          | :heavy_check_mark:                                  | A unique identifier for the role.                   |
| `role`                                              | [Models::Shared::Role](../../models/shared/role.md) | :heavy_check_mark:                                  | Role details                                        |
| `account_id`                                        | *T.nilable(::String)*                               | :heavy_minus_sign:                                  | Account ID                                          |

### Response

**[T.nilable(Models::Shared::RoleResponse)](../../models/operations/roleresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 404, 409                  | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## delete

Delete a specific custom role.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteRole" method="delete" path="/v2/accounts/{account_id}/permissions/roles/{role_id}" -->
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
res = s.roles.delete(role_id: '<id>')


```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                               | Type                                                                                                                                                                                                                                                                                                    | Required                                                                                                                                                                                                                                                                                                | Description                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `role_id`                                                                                                                                                                                                                                                                                               | *::String*                                                                                                                                                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                                                                                                                                                      | A unique identifier for the role.                                                                                                                                                                                                                                                                       |
| `account_id`                                                                                                                                                                                                                                                                                            | *T.nilable(::String)*                                                                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                                                                      | Account ID                                                                                                                                                                                                                                                                                              |
| `force`                                                                                                                                                                                                                                                                                                 | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                                                                                                                                      | Determines whether the role should be deleted when it has associated principals.<br/>- `true`: Deletes the role even if it has associated principals.<br/>- `false` (default): Prevents deletion if the role has associated principals. You must manually unassociate the principals before deleting the role.<br/> |

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403, 404                            | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## list_principals

Retrieve all principals associated with a specific role.

### Example Usage: GetRolePrincipalsExample

<!-- UsageSnippet language="ruby" operationID="getRolePrincipals" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="GetRolePrincipalsExample" -->
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

req = Models::Operations::GetRolePrincipalsRequest.new(
  role_id: '<id>',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.roles.list_principals(request: req)

unless res.nil?
  # handle response
end

```
### Example Usage: GetRolePrincipalsWithParamKeyValueExample

<!-- UsageSnippet language="ruby" operationID="getRolePrincipals" method="get" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="GetRolePrincipalsWithParamKeyValueExample" -->
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

req = Models::Operations::GetRolePrincipalsRequest.new(
  role_id: '<id>',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.roles.list_principals(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::GetRolePrincipalsRequest](../../models/operations/getroleprincipalsrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Shared::PrincipalsResponse)](../../models/operations/principalsresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403, 404                            | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## update_principals

Add or remove principals associated with a role.

### Example Usage: invalidOperationFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="updateRolePrincipals" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="invalidOperationFieldErrorExample" -->
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
res = s.roles.update_principals(role_id: '<id>', update_role_principals_request: Models::Shared::UpdateRolePrincipalsRequest.new(
  operation: Models::Shared::OperationEnum::ADD,
  principals: [
    Models::Shared::UpdateRolePrincipal.new(
      principal_type: Models::Shared::PrincipalTypeEnum::USER,
      principal_id: '1234abc',
      scope_id: '975l29lz02jt0836fhwi',
      policy_parameters: Models::Shared::UpdateRolePrincipalPolicyParameters.new
    ),
  ]
))


```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="ruby" operationID="updateRolePrincipals" method="put" path="/v2/accounts/{account_id}/permissions/roles/{role_id}/principals" example="missingFieldsErrorExample" -->
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
res = s.roles.update_principals(role_id: '<id>', update_role_principals_request: Models::Shared::UpdateRolePrincipalsRequest.new(
  operation: Models::Shared::OperationEnum::ADD,
  principals: [
    Models::Shared::UpdateRolePrincipal.new(
      principal_type: Models::Shared::PrincipalTypeEnum::USER,
      principal_id: '1234abc',
      scope_id: '975l29lz02jt0836fhwi',
      policy_parameters: Models::Shared::UpdateRolePrincipalPolicyParameters.new
    ),
  ]
))


```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `role_id`                                                                                         | *::String*                                                                                        | :heavy_check_mark:                                                                                | A unique identifier for the role.                                                                 |
| `update_role_principals_request`                                                                  | [Models::Shared::UpdateRolePrincipalsRequest](../../models/shared/updateroleprincipalsrequest.md) | :heavy_check_mark:                                                                                | Principals details.                                                                               |
| `account_id`                                                                                      | *T.nilable(::String)*                                                                             | :heavy_minus_sign:                                                                                | Account ID                                                                                        |

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 404                       | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |