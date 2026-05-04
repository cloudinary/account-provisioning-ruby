# Users

## Overview

Manage the users for your account.


Learn more about users management.
<https://cloudinary.com/documentation/provisioning_api#users>

### Available Operations

* [list](#list) - Get users
* [create](#create) - Create user
* [get](#get) - Get user
* [update](#update) - Update user
* [delete](#delete) - Delete user
* [get_groups](#get_groups) - Get user groups
* [list_sub_accounts](#list_sub_accounts) - Get user sub-accounts

## list

Returns an array of all users in the account, or if conditions are specified, returns the relevant users.


Learn more about retrieving users.
<https://cloudinary.com/documentation/provisioning_api#get_users>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getUsers" method="get" path="/v1_1/provisioning/accounts/{account_id}/users" example="Users" -->
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

req = Models::Operations::GetUsersRequest.new(
  pending: false,
  prefix: 'john',
  from: Date.parse('2023-01-01T00:00:00Z'),
  to: Date.parse('2024-12-31T00:00:00Z')
)
res = s.users.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                         | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `request`                                                                         | [Models::Operations::GetUsersRequest](../../models/operations/getusersrequest.md) | :heavy_check_mark:                                                                | The request object to use for the request.                                        |

### Response

**[T.nilable(Models::Shared::UsersResponse)](../../models/operations/usersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## create

Create a new user.

Learn more about creating users.
<https://cloudinary.com/documentation/provisioning_api#create_user>

### Example Usage: CreateUserExample

<!-- UsageSnippet language="ruby" operationID="createUser" method="post" path="/v1_1/provisioning/accounts/{account_id}/users" example="CreateUserExample" -->
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
res = s.users.create(request_body: Models::Operations::CreateUserRequestBody.new(
  name: 'jenny_bar',
  email: 'jenny_bar@example.com',
  role: Models::Operations::Role::MASTER_ADMIN
))

unless res.nil?
  # handle response
end

```
### Example Usage: UserResponseExample

<!-- UsageSnippet language="ruby" operationID="createUser" method="post" path="/v1_1/provisioning/accounts/{account_id}/users" example="UserResponseExample" -->
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
res = s.users.create(request_body: Models::Operations::CreateUserRequestBody.new(
  name: 'John',
  email: 'john@example.com',
  role: Models::Operations::Role::TECHNICAL_ADMIN,
  enabled: true
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request_body`                                                                                | [Models::Operations::CreateUserRequestBody](../../models/operations/createuserrequestbody.md) | :heavy_check_mark:                                                                            | User details.                                                                                 |
| `account_id`                                                                                  | *T.nilable(::String)*                                                                         | :heavy_minus_sign:                                                                            | Account ID                                                                                    |

### Response

**[T.nilable(Models::Shared::User)](../../models/operations/user.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## get

Retrieve a specific user.

Learn more about retrieving a specific user.
<https://cloudinary.com/documentation/provisioning_api#get_user>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getUser" method="get" path="/v1_1/provisioning/accounts/{account_id}/users/{user_id}" example="UserResponseExample" -->
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
res = s.users.get(user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::User)](../../models/operations/user.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update the details of a user.

Learn more about updating a specific user.
<https://cloudinary.com/documentation/provisioning_api#update_user>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateUser" method="put" path="/v1_1/provisioning/accounts/{account_id}/users/{user_id}" example="UserJohn" -->
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
res = s.users.update(user_id: '0abed8dfcc039ea05e2a1d494fd442', user_request: Models::Shared::UserRequest.new(
  name: 'John',
  email: 'john@example.com',
  role: Models::Shared::UserRequestRole::TECHNICAL_ADMIN,
  enabled: true
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                         | Type                                                              | Required                                                          | Description                                                       | Example                                                           |
| ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| `user_id`                                                         | *::String*                                                        | :heavy_check_mark:                                                | The ID of the user.                                               | 0abed8dfcc039ea05e2a1d494fd442                                    |
| `user_request`                                                    | [Models::Shared::UserRequest](../../models/shared/userrequest.md) | :heavy_check_mark:                                                | User details to update.                                           |                                                                   |
| `account_id`                                                      | *T.nilable(::String)*                                             | :heavy_minus_sign:                                                | Account ID                                                        |                                                                   |

### Response

**[T.nilable(Models::Shared::User)](../../models/operations/user.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a specific user.

Learn more about deleting a specific user.
<https://cloudinary.com/documentation/provisioning_api#delete_user>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteUser" method="delete" path="/v1_1/provisioning/accounts/{account_id}/users/{user_id}" -->
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
res = s.users.delete(user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::SuccessResponse)](../../models/operations/successresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_groups

Retrieve the groups that a specific user belongs to.

Learn more about retrieving user groups.
<https://cloudinary.com/documentation/provisioning_api#get_users_groups>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getGroupsForUser" method="get" path="/v1_1/provisioning/accounts/{account_id}/users/{user_id}/groups" example="UserGroupsList" -->
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
res = s.users.get_groups(user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::UserGroupsListResponse)](../../models/operations/usergroupslistresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_sub_accounts

Retrieve the product environments (sub-accounts) that a specific user has access to.

Learn more about retrieving user sub-accounts.
<https://cloudinary.com/documentation/provisioning_api#get_user_sub_accounts>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getSubAccountsForUser" method="get" path="/v1_1/provisioning/accounts/{account_id}/users/{user_id}/sub_accounts" example="UserSubAccounts" -->
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
res = s.users.list_sub_accounts(user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::UserSubAccountsResponse)](../../models/operations/usersubaccountsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |