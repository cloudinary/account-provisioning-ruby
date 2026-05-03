# Public

## Overview

View shared Permissions system utilities, including the system roles and policies catalog, Cedar policy validation, and the Cedar schema. These endpoints are publicly accessible and don't require authentication.


### Available Operations

* [get_catalog](#get_catalog) - Get system roles and policies catalog
* [validate_policy](#validate_policy) - Validate a Cedar policy
* [get_schema](#get_schema) - Get Cedar schema

## get_catalog

Retrieves the catalog of predefined system roles and their associated policies.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getSystemRolesAndPoliciesCatalog" method="get" path="/v2/accounts/permissions/public/catalog" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CloudinaryAccountProvisioning::Models
s = ::CloudinaryAccountProvisioning::CldProvisioning.new(
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.public.get_catalog

unless res.system_roles_and_policies_catalog_response.nil?
  # handle response
end

```

### Response

**[T.nilable(Models::Operations::GetSystemRolesAndPoliciesCatalogResponse)](../../models/operations/getsystemrolesandpoliciescatalogresponse.md)**

### Errors

| Error Type       | Status Code      | Content Type     |
| ---------------- | ---------------- | ---------------- |
| Errors::APIError | 4XX, 5XX         | \*/\*            |

## validate_policy

Validate a Cedar policy

### Example Usage

<!-- UsageSnippet language="ruby" operationID="validateCedarPolicy" method="post" path="/v2/accounts/permissions/public/validate" example="ValidateCedarPolicyResponseExample" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CloudinaryAccountProvisioning::Models
s = ::CloudinaryAccountProvisioning::CldProvisioning.new(
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)

req = Models::Shared::ValidateCedarPolicyRequest.new(
  policy: 'permit(principal == Cloudinary::APIKy::"1234", action == Cloudinary::Action::"read", resource is Cloudinary::Folder ) when {resource.ancestor_ids.contains("asdfjkl12347890")} ;'
)
res = s.public.validate_policy(request: req)

unless res.validate_cedar_policy_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Shared::ValidateCedarPolicyRequest](../../models/shared/validatecedarpolicyrequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::ValidateCedarPolicyResponse)](../../models/operations/validatecedarpolicyresponse.md)**

### Errors

| Error Type       | Status Code      | Content Type     |
| ---------------- | ---------------- | ---------------- |
| Errors::APIError | 4XX, 5XX         | \*/\*            |

## get_schema

Get Cedar schema

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getCedarSchema" method="get" path="/v2/accounts/permissions/public/schema" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CloudinaryAccountProvisioning::Models
s = ::CloudinaryAccountProvisioning::CldProvisioning.new(
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.public.get_schema

unless res.cedar_schema_response.nil?
  # handle response
end

```

### Response

**[T.nilable(Models::Operations::GetCedarSchemaResponse)](../../models/operations/getcedarschemaresponse.md)**

### Errors

| Error Type       | Status Code      | Content Type     |
| ---------------- | ---------------- | ---------------- |
| Errors::APIError | 4XX, 5XX         | \*/\*            |