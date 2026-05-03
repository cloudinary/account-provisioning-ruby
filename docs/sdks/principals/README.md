# Principals

## Overview

View roles associated with a specified principal, and add or remove a role associated with a principal.


### Available Operations

* [list_roles](#list_roles) - Get a principal's roles
* [update_roles](#update_roles) - Assign roles to a principal
* [inspect](#inspect) - Inspect
* [inspect_multiple](#inspect_multiple) - Inspect multiple

## list_roles

Retrieve all roles associated with a specific principal.

### Example Usage: GetPrincipalRolesExample

<!-- UsageSnippet language="ruby" operationID="getPrincipalRoles" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles" example="GetPrincipalRolesExample" -->
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

req = Models::Operations::GetPrincipalRolesRequest.new(
  principal_type: Models::Shared::PrincipalTypeEnum::USER,
  principal_id: '<id>',
  permission_type: Models::Shared::PermissionTypeEnum::GLOBAL,
  management_type: Models::Shared::ManagementTypeEnum::SYSTEM,
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.principals.list_roles(request: req)

unless res.principal_roles_response.nil?
  # handle response
end

```
### Example Usage: GetPrincipalRolesWithParamKeyValueExample

<!-- UsageSnippet language="ruby" operationID="getPrincipalRoles" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles" example="GetPrincipalRolesWithParamKeyValueExample" -->
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

req = Models::Operations::GetPrincipalRolesRequest.new(
  principal_type: Models::Shared::PrincipalTypeEnum::USER,
  principal_id: '<id>',
  permission_type: Models::Shared::PermissionTypeEnum::GLOBAL,
  management_type: Models::Shared::ManagementTypeEnum::SYSTEM,
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.principals.list_roles(request: req)

unless res.principal_roles_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::GetPrincipalRolesRequest](../../models/operations/getprincipalrolesrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::GetPrincipalRolesResponse)](../../models/operations/getprincipalrolesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 404                            | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## update_roles

Add or remove roles associated with a principal.

### Example Usage: InvalidOperationFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="updatePrincipalRoles" method="put" path="/v2/accounts/{account_id}/permissions/principal_roles" example="InvalidOperationFieldErrorExample" -->
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
res = s.principals.update_roles(update_principal_roles_request: Models::Shared::UpdatePrincipalRolesRequest.new(
  operation: Models::Shared::OperationEnum::ADD,
  principal: Models::Shared::Principal.new(
    type: Models::Shared::PrincipalTypeEnum::USER,
    id: '1234abc'
  ),
  roles: [
    Models::Shared::RoleToManage.new(
      id: 'marketing_content_contributor_1357fhe',
      scope_id: '975l29lz02jt0836fhwi',
      policy_parameters: Models::Shared::RoleToManagePolicyParameters.new
    ),
  ]
))

if res.status_code == 200
  # handle response
end

```
### Example Usage: missingPrincipalFieldsErrorExample

<!-- UsageSnippet language="ruby" operationID="updatePrincipalRoles" method="put" path="/v2/accounts/{account_id}/permissions/principal_roles" example="missingPrincipalFieldsErrorExample" -->
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
res = s.principals.update_roles(update_principal_roles_request: Models::Shared::UpdatePrincipalRolesRequest.new(
  operation: Models::Shared::OperationEnum::ADD,
  principal: Models::Shared::Principal.new(
    type: Models::Shared::PrincipalTypeEnum::USER,
    id: '1234abc'
  ),
  roles: [
    Models::Shared::RoleToManage.new(
      id: 'marketing_content_contributor_1357fhe',
      scope_id: '975l29lz02jt0836fhwi',
      policy_parameters: Models::Shared::RoleToManagePolicyParameters.new
    ),
  ]
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `update_principal_roles_request`                                                                  | [Models::Shared::UpdatePrincipalRolesRequest](../../models/shared/updateprincipalrolesrequest.md) | :heavy_check_mark:                                                                                | Principal and roles details.                                                                      |
| `account_id`                                                                                      | *T.nilable(::String)*                                                                             | :heavy_minus_sign:                                                                                | Account ID                                                                                        |

### Response

**[T.nilable(Models::Operations::UpdatePrincipalRolesResponse)](../../models/operations/updateprincipalrolesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 404                       | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## inspect

Retrieves principals and their assigned roles within a specified scope, based on query filters.

Use this endpoint to determine which users, groups, API keys, or account API keys have roles applied at:
* A specific `scope_type` ("account" or "prodenv")
* A specific `scope_id` (for product environments)
* Optional content filters (such as `folder_id`, `collection_id`, or `param_key` / `param_value`)
* Optional `principal_type` (and `principal_id`)

The response includes all principals that match the specified filters, along with the roles applied to them within that context.

This endpoint is useful when you want to:
* Audit who has access within a given scope
* Identify all principals assigned to roles for a specific folder, collection, asset, or product environment
* Retrieve role assignments dynamically based on filtering criteria


### Example Usage: InspectExampleAllFolders

<!-- UsageSnippet language="ruby" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleAllFolders" -->
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

req = Models::Operations::InspectRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  principal_type: Models::Shared::PrincipalTypeEnum::USER,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.principals.inspect(request: req)

unless res.principal_roles_inspect_response.nil?
  # handle response
end

```
### Example Usage: InspectExampleFolder

<!-- UsageSnippet language="ruby" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleFolder" -->
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

req = Models::Operations::InspectRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  principal_type: Models::Shared::PrincipalTypeEnum::USER,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.principals.inspect(request: req)

unless res.principal_roles_inspect_response.nil?
  # handle response
end

```
### Example Usage: InspectExampleProdEnv

<!-- UsageSnippet language="ruby" operationID="inspect" method="get" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectExampleProdEnv" -->
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

req = Models::Operations::InspectRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  principal_type: Models::Shared::PrincipalTypeEnum::USER,
  param_key: [
    'folder_id',
  ],
  param_value: [
    'asdfjkl12347890',
  ]
)
res = s.principals.inspect(request: req)

unless res.principal_roles_inspect_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                       | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `request`                                                                       | [Models::Operations::InspectRequest](../../models/operations/inspectrequest.md) | :heavy_check_mark:                                                              | The request object to use for the request.                                      |

### Response

**[T.nilable(Models::Operations::InspectResponse)](../../models/operations/inspectresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 404                            | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## inspect_multiple

Retrieves role assignments for a specified list of principals within a shared scope and optional policy parameters.

Use this endpoint when you already know which principals you want to evaluate and want to check their role assignments in a single request.

In this request:
* You explicitly provide the `principals` array in the request body.
* All principals are evaluated against the same `scope_type`, optional `scope_id`, and optional `policy_parameters`.
* Unlike `Inspect`, this endpoint doesn't search for matching principals. It evaluates only the principals you provide.

This endpoint is useful for:
* Verify role assignments for multiple specified principals at once
* Comparing role assignments across specific users, groups, or keys
* Reducing multiple per-principal `Inspect` calls into a single request


### Example Usage: InspectMultipleRequestExample

<!-- UsageSnippet language="ruby" operationID="inspectMultiple" method="post" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectMultipleRequestExample" -->
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
res = s.principals.inspect_multiple(inspect_request: Models::Shared::InspectRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  principals: [
    Models::Shared::Principal.new(
      type: Models::Shared::PrincipalTypeEnum::USER,
      id: '1234abc'
    ),
    Models::Shared::Principal.new(
      type: Models::Shared::PrincipalTypeEnum::USER,
      id: '4567xyz'
    ),
    Models::Shared::Principal.new(
      type: Models::Shared::PrincipalTypeEnum::API_KEY,
      id: 'a382ltieo893jhioqpg8urp'
    ),
  ],
  policy_parameters: Models::Shared::InspectRequestPolicyParameters.new
))

unless res.principal_roles_inspect_response.nil?
  # handle response
end

```
### Example Usage: InspectMultipleResponseExample

<!-- UsageSnippet language="ruby" operationID="inspectMultiple" method="post" path="/v2/accounts/{account_id}/permissions/principal_roles/inspect" example="InspectMultipleResponseExample" -->
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
res = s.principals.inspect_multiple(inspect_request: Models::Shared::InspectRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  principals: [
    Models::Shared::Principal.new(
      type: Models::Shared::PrincipalTypeEnum::USER,
      id: '1234abc'
    ),
  ]
))

unless res.principal_roles_inspect_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                               | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `inspect_request`                                                       | [Models::Shared::InspectRequest](../../models/shared/inspectrequest.md) | :heavy_check_mark:                                                      | Role assignments for multiple principals.                               |
| `account_id`                                                            | *T.nilable(::String)*                                                   | :heavy_minus_sign:                                                      | Account ID                                                              |

### Response

**[T.nilable(Models::Operations::InspectMultipleResponse)](../../models/operations/inspectmultipleresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 404                            | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |