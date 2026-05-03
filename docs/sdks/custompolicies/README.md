# CustomPolicies

## Overview

### Available Operations

* [list](#list) - Get custom policies
* [create](#create) - Create custom policy
* [get](#get) - Get custom policy
* [update](#update) - Update custom policy
* [delete](#delete) - Delete custom policy

## list

Retrieve all custom permission policies defined for a specific scope. The scope can be at the account level or within a specific product environment.

**Notes:**
  * If `scope_type` isn't specified as `prodenv`, the account-level policies will be returned.

  * If `scope_type` is specified as `prodenv`, `scope_id` is required.


### Example Usage

<!-- UsageSnippet language="ruby" operationID="getCustomPolicies" method="get" path="/v2/accounts/{account_id}/permissions/policies/custom" example="CustomPoliciesExample" -->
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

req = Models::Operations::GetCustomPoliciesRequest.new(
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV
)
res = s.custom_policies.list(request: req)

unless res.custom_policies_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::GetCustomPoliciesRequest](../../models/operations/getcustompoliciesrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::GetCustomPoliciesResponse)](../../models/operations/getcustompoliciesresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403                                 | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## create

Create a new custom policy with a statement defined in Cedar. This policy specifies permissions for a principal, allowing a specific action on a designated resource, within a particular scope.

Learn more about creating a new custom policy
<https://cloudinary.com/documentation/permissions_api_guide#create_a_policy_statement>

### Example Usage: cedarErrorExample

<!-- UsageSnippet language="ruby" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="cedarErrorExample" -->
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
res = s.custom_policies.create(custom_policy: Models::Shared::CustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: createCustomPolicyExample

<!-- UsageSnippet language="ruby" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="createCustomPolicyExample" -->
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
res = s.custom_policies.create(custom_policy: Models::Shared::CustomPolicy.new(
  policy_statement: 'permit(principal == Cloudinary::APIKey::"1234",action==Cloudinary::Action::"read",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains("asdfjkl12347890")} ;',
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: createPolicyResponse

<!-- UsageSnippet language="ruby" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="createPolicyResponse" -->
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
res = s.custom_policies.create(custom_policy: Models::Shared::CustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="invalidFieldErrorExample" -->
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
res = s.custom_policies.create(custom_policy: Models::Shared::CustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: missingFieldsErrorExample

<!-- UsageSnippet language="ruby" operationID="createCustomPolicy" method="post" path="/v2/accounts/{account_id}/permissions/policies/custom" example="missingFieldsErrorExample" -->
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
res = s.custom_policies.create(custom_policy: Models::Shared::CustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `custom_policy`                                                     | [Models::Shared::CustomPolicy](../../models/shared/custompolicy.md) | :heavy_check_mark:                                                  | Policy details.                                                     |
| `account_id`                                                        | *T.nilable(::String)*                                               | :heavy_minus_sign:                                                  | Account ID                                                          |

### Response

**[T.nilable(Models::Operations::CreateCustomPolicyResponse)](../../models/operations/createcustompolicyresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 409                       | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## get

Get a specific custom policy.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getCustomPolicy" method="get" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="CustomPolicyExample" -->
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
res = s.custom_policies.get(policy_id: '<id>')

unless res.custom_policy_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                             | Type                                                  | Required                                              | Description                                           |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| `policy_id`                                           | *::String*                                            | :heavy_check_mark:                                    | A unique identifier for the custom permission policy. |
| `account_id`                                          | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | Account ID                                            |

### Response

**[T.nilable(Models::Operations::GetCustomPolicyResponse)](../../models/operations/getcustompolicyresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403, 404                            | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## update

Update a specific custom policy by providing the entire policy entity in the request body. Ensure the new `policy_statement` includes modifications. Existing permissions will be replaced with the new data.

*Note:* Updating a policy with an identical `policy_statement` will trigger a 409 error.


### Example Usage: cedarErrorExample

<!-- UsageSnippet language="ruby" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="cedarErrorExample" -->
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
res = s.custom_policies.update(policy_id: '<id>', update_custom_policy: Models::Shared::UpdateCustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: invalidFieldErrorExample

<!-- UsageSnippet language="ruby" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="invalidFieldErrorExample" -->
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
res = s.custom_policies.update(policy_id: '<id>', update_custom_policy: Models::Shared::UpdateCustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: missingFieldsUpdateErrorExample

<!-- UsageSnippet language="ruby" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="missingFieldsUpdateErrorExample" -->
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
res = s.custom_policies.update(policy_id: '<id>', update_custom_policy: Models::Shared::UpdateCustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: updateCustomPolicyExample

<!-- UsageSnippet language="ruby" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="updateCustomPolicyExample" -->
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
res = s.custom_policies.update(policy_id: '<id>', update_custom_policy: Models::Shared::UpdateCustomPolicy.new(
  policy_statement: 'permit(principal == Cloudinary::APIKey::"1234",action==Cloudinary::Action::"read",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains("asdfjkl12347890")} ;',
  description: 'Permit read access to the Accessories folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Accessories folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```
### Example Usage: updatePolicyResponse

<!-- UsageSnippet language="ruby" operationID="updateCustomPolicy" method="put" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" example="updatePolicyResponse" -->
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
res = s.custom_policies.update(policy_id: '<id>', update_custom_policy: Models::Shared::UpdateCustomPolicy.new(
  policy_statement: "permit(principal == Cloudinary::APIKey::\\\"1234\\\",action==Cloudinary::Action::\\\"read\\\",resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains(\\\"asdfjkl12347890\\\")} ;\n",
  description: 'Permit read access to the Clothing folder with external ID asdfjkl12347890.',
  scope_type: Models::Shared::ScopeTypeEnum::PRODENV,
  scope_id: '975l29lz02jt0836fhwi',
  name: 'Read access to Clothing folder'
))

unless res.custom_policy_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                       | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `policy_id`                                                                     | *::String*                                                                      | :heavy_check_mark:                                                              | A unique identifier for the custom permission policy.                           |
| `update_custom_policy`                                                          | [Models::Shared::UpdateCustomPolicy](../../models/shared/updatecustompolicy.md) | :heavy_check_mark:                                                              | Policy details                                                                  |
| `account_id`                                                                    | *T.nilable(::String)*                                                           | :heavy_minus_sign:                                                              | Account ID                                                                      |

### Response

**[T.nilable(Models::Operations::UpdateCustomPolicyResponse)](../../models/operations/updatecustompolicyresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 400, 401, 403, 404, 409                  | application/json                         |
| Models::Errors::PermissionsErrorResponse | 500                                      | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |

## delete

Delete a specific custom policy.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteCustomPolicy" method="delete" path="/v2/accounts/{account_id}/permissions/policies/custom/{policy_id}" -->
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
res = s.custom_policies.delete(policy_id: '<id>')

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                             | Type                                                  | Required                                              | Description                                           |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| `policy_id`                                           | *::String*                                            | :heavy_check_mark:                                    | A unique identifier for the custom permission policy. |
| `account_id`                                          | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | Account ID                                            |

### Response

**[T.nilable(Models::Operations::DeleteCustomPolicyResponse)](../../models/operations/deletecustompolicyresponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Models::Errors::PermissionsErrorResponse | 401, 403, 404                            | application/json                         |
| Errors::APIError                         | 4XX, 5XX                                 | \*/\*                                    |