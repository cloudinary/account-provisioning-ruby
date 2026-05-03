# AccessKeys

## Overview

### Available Operations

* [list](#list) - Get access keys
* [generate](#generate) - Generate an access key
* [delete_by_name](#delete_by_name) - Delete access key by name
* [update](#update) - Update an access key
* [delete](#delete) - Delete access key

## list

Retrieve an array of all access keys for a product environment.

Learn more about retrieving access keys.
<https://cloudinary.com/documentation/provisioning_api#get_access_keys>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAccessKeys" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" example="AccessKeys" -->
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

req = Models::Operations::GetAccessKeysRequest.new(
  sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z',
  sort_by: Models::Operations::SortBy::CREATED_AT,
  sort_order: Models::Operations::SortOrder::ASC
)
res = s.access_keys.list(request: req)

unless res.access_keys_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::GetAccessKeysRequest](../../models/operations/getaccesskeysrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::GetAccessKeysResponse)](../../models/operations/getaccesskeysresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## generate

Generate a new access key.

Learn more about generating access keys.
<https://cloudinary.com/documentation/provisioning_api#generate_an_access_key>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="generateAccessKey" method="post" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" example="MainAccessKey" -->
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
res = s.access_keys.generate(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z', access_key_request: Models::Shared::AccessKeyRequest.new(
  name: 'main_key',
  enabled: true
))

unless res.access_key.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `sub_account_id`                                                            | *::String*                                                                  | :heavy_check_mark:                                                          | The ID of the product environment.                                          | abcde1fghij2klmno3pqrst4uvwxy5z                                             |
| `access_key_request`                                                        | [Models::Shared::AccessKeyRequest](../../models/shared/accesskeyrequest.md) | :heavy_check_mark:                                                          | Access key details.                                                         |                                                                             |
| `account_id`                                                                | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | Account ID                                                                  |                                                                             |

### Response

**[T.nilable(Models::Operations::GenerateAccessKeyResponse)](../../models/operations/generateaccesskeyresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## delete_by_name

Delete a specific access key by name.

Learn more about deleting access keys.
<https://cloudinary.com/documentation/provisioning_api#delete_an_access_key>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteAccessKeyByName" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys" -->
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
res = s.access_keys.delete_by_name(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z', name: 'main_key')

unless res.success_response.nil?
  # handle response
end

```

### Parameters

| Parameter                          | Type                               | Required                           | Description                        | Example                            |
| ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- |
| `sub_account_id`                   | *::String*                         | :heavy_check_mark:                 | The ID of the product environment. | abcde1fghij2klmno3pqrst4uvwxy5z    |
| `name`                             | *::String*                         | :heavy_check_mark:                 | The access key name.               | main_key                           |
| `account_id`                       | *T.nilable(::String)*              | :heavy_minus_sign:                 | Account ID                         |                                    |

### Response

**[T.nilable(Models::Operations::DeleteAccessKeyByNameResponse)](../../models/operations/deleteaccesskeybynameresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update the name and/or status of an existing access key.

Learn more about updating access keys.
<https://cloudinary.com/documentation/provisioning_api#update_an_access_key>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateAccessKey" method="put" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys/{key}" example="MainAccessKey" -->
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
res = s.access_keys.update(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z', key_: '814814814814814', access_key_update_request: Models::Shared::AccessKeyUpdateRequest.new(
  name: 'main_key',
  enabled: true,
  dedicated_for: Models::Shared::DedicatedFor::WEBHOOKS
))

unless res.access_key.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             | Example                                                                                 |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `sub_account_id`                                                                        | *::String*                                                                              | :heavy_check_mark:                                                                      | The ID of the product environment.                                                      | abcde1fghij2klmno3pqrst4uvwxy5z                                                         |
| `key_`                                                                                  | *::String*                                                                              | :heavy_check_mark:                                                                      | The access key (api key).                                                               | 814814814814814                                                                         |
| `access_key_update_request`                                                             | [Models::Shared::AccessKeyUpdateRequest](../../models/shared/accesskeyupdaterequest.md) | :heavy_check_mark:                                                                      | Access key details for update.                                                          |                                                                                         |
| `account_id`                                                                            | *T.nilable(::String)*                                                                   | :heavy_minus_sign:                                                                      | Account ID                                                                              |                                                                                         |

### Response

**[T.nilable(Models::Operations::UpdateAccessKeyResponse)](../../models/operations/updateaccesskeyresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a specific access key.

Learn more about deleting access keys.
<https://cloudinary.com/documentation/provisioning_api#delete_an_access_key>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteAccessKey" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}/access_keys/{key}" -->
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
res = s.access_keys.delete(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z', key_: '814814814814814')

unless res.success_response.nil?
  # handle response
end

```

### Parameters

| Parameter                          | Type                               | Required                           | Description                        | Example                            |
| ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- |
| `sub_account_id`                   | *::String*                         | :heavy_check_mark:                 | The ID of the product environment. | abcde1fghij2klmno3pqrst4uvwxy5z    |
| `key_`                             | *::String*                         | :heavy_check_mark:                 | The access key (api key).          | 814814814814814                    |
| `account_id`                       | *T.nilable(::String)*              | :heavy_minus_sign:                 | Account ID                         |                                    |

### Response

**[T.nilable(Models::Operations::DeleteAccessKeyResponse)](../../models/operations/deleteaccesskeyresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |