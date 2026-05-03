# ProductEnvironments

## Overview

### Available Operations

* [list](#list) - Get product environments
* [create](#create) - Create product environment
* [get](#get) - Get product environment
* [update](#update) - Update product environment
* [delete](#delete) - Delete product environment

## list

Return an array of all product environments, or if conditions are specified,
return the relevant product environments.


Learn more about getting product environments.
<https://cloudinary.com/documentation/provisioning_api#get_product_environments>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getProductEnvironments" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts" example="ProductEnvironments" -->
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

req = Models::Operations::GetProductEnvironmentsRequest.new(
  enabled: true,
  prefix: 'product'
)
res = s.product_environments.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                     | Type                                                                                                          | Required                                                                                                      | Description                                                                                                   |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                     | [Models::Operations::GetProductEnvironmentsRequest](../../models/operations/getproductenvironmentsrequest.md) | :heavy_check_mark:                                                                                            | The request object to use for the request.                                                                    |

### Response

**[T.nilable(Models::Shared::ProductEnvironmentsResponse)](../../models/operations/productenvironmentsresponse.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## create

Create a new product environment. Any users that have access to all product environments will also automatically
have access to the new product environment.


Learn more about creating product environments.
<https://cloudinary.com/documentation/provisioning_api#create_product_environment>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createProductEnvironment" method="post" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts" example="ProductEnvironment3" -->
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
res = s.product_environments.create(product_environment_request: Models::Shared::ProductEnvironmentRequest.new(
  name: 'Product3 Application',
  cloud_name: 'product3',
  base_sub_account_id: '0aaaaa1bbbbb2ccccc3ddddd4eeeee5f'
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `product_environment_request`                                                                 | [Models::Shared::ProductEnvironmentRequest](../../models/shared/productenvironmentrequest.md) | :heavy_check_mark:                                                                            | Product environment details.                                                                  |
| `account_id`                                                                                  | *T.nilable(::String)*                                                                         | :heavy_minus_sign:                                                                            | Account ID                                                                                    |

### Response

**[T.nilable(Models::Shared::ProductEnvironment)](../../models/operations/productenvironment.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 409, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a specific product environment.

Learn more about retrieving specific product environments.
<https://cloudinary.com/documentation/provisioning_api#get_product_environment>

### Example Usage: ProductEnvironment1

<!-- UsageSnippet language="ruby" operationID="getProductEnvironment" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment1" -->
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
res = s.product_environments.get(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z')

unless res.nil?
  # handle response
end

```
### Example Usage: ProductEnvironment2

<!-- UsageSnippet language="ruby" operationID="getProductEnvironment" method="get" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment2" -->
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
res = s.product_environments.get(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                          | Type                               | Required                           | Description                        | Example                            |
| ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- |
| `sub_account_id`                   | *::String*                         | :heavy_check_mark:                 | The ID of the product environment. | abcde1fghij2klmno3pqrst4uvwxy5z    |
| `account_id`                       | *T.nilable(::String)*              | :heavy_minus_sign:                 | Account ID                         |                                    |

### Response

**[T.nilable(Models::Shared::ProductEnvironment)](../../models/operations/productenvironment.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 404, 420, 429       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update the details of a product environment.

Learn more about updating product environments.
<https://cloudinary.com/documentation/provisioning_api#update_product_environment>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateProductEnvironment" method="put" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" example="ProductEnvironment1" -->
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
res = s.product_environments.update(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z', product_environment_update_request: Models::Shared::ProductEnvironmentUpdateRequest.new(
  name: 'Product3 Application',
  cloud_name: 'product3'
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               | Example                                                                                                   |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `sub_account_id`                                                                                          | *::String*                                                                                                | :heavy_check_mark:                                                                                        | The ID of the product environment.                                                                        | abcde1fghij2klmno3pqrst4uvwxy5z                                                                           |
| `product_environment_update_request`                                                                      | [Models::Shared::ProductEnvironmentUpdateRequest](../../models/shared/productenvironmentupdaterequest.md) | :heavy_check_mark:                                                                                        | Product environment details to update.                                                                    |                                                                                                           |
| `account_id`                                                                                              | *T.nilable(::String)*                                                                                     | :heavy_minus_sign:                                                                                        | Account ID                                                                                                |                                                                                                           |

### Response

**[T.nilable(Models::Shared::ProductEnvironment)](../../models/operations/productenvironment.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a specific product environment.

Learn more about deleting product environments.
<https://cloudinary.com/documentation/provisioning_api#delete_product_environment>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteProductEnvironment" method="delete" path="/v1_1/provisioning/accounts/{account_id}/sub_accounts/{sub_account_id}" -->
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
res = s.product_environments.delete(sub_account_id: 'abcde1fghij2klmno3pqrst4uvwxy5z')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                          | Type                               | Required                           | Description                        | Example                            |
| ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- | ---------------------------------- |
| `sub_account_id`                   | *::String*                         | :heavy_check_mark:                 | The ID of the product environment. | abcde1fghij2klmno3pqrst4uvwxy5z    |
| `account_id`                       | *T.nilable(::String)*              | :heavy_minus_sign:                 | Account ID                         |                                    |

### Response

**[T.nilable(Models::Shared::SuccessResponse)](../../models/operations/successresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |