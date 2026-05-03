# UserGroups

## Overview

### Available Operations

* [list](#list) - Get User Groups
* [create](#create) - Create User Group
* [get](#get) - Get User Group
* [update](#update) - Update User Group
* [delete](#delete) - Delete User Group
* [list_users](#list_users) - Get Users in User Group
* [add_user](#add_user) - Add User to User Group
* [remove_user](#remove_user) - Remove User from User Group

## list

Retrieve an array of all user groups in the account.

Learn more about retrieving user groups.
<https://cloudinary.com/documentation/provisioning_api#get_user_groups>

### Example Usage: UserGroups

<!-- UsageSnippet language="ruby" operationID="getUserGroups" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroups" -->
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
res = s.user_groups.list(extended_details: true)

unless res.nil?
  # handle response
end

```
### Example Usage: UserGroupsExtendedDetails

<!-- UsageSnippet language="ruby" operationID="getUserGroups" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroupsExtendedDetails" -->
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
res = s.user_groups.list(extended_details: true)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               | Example                                                                                                   |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `account_id`                                                                                              | *T.nilable(::String)*                                                                                     | :heavy_minus_sign:                                                                                        | Account ID                                                                                                |                                                                                                           |
| `extended_details`                                                                                        | *T.nilable(T::Boolean)*                                                                                   | :heavy_minus_sign:                                                                                        | Whether to only return extended (true) or basic information about the group (false).<br/>**Default**: false.<br/> | true                                                                                                      |

### Response

**[T.nilable(Models::Shared::UserGroupsResponse)](../../models/operations/usergroupsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## create

Create a new user group for the account.

Learn more about creating user groups.
<https://cloudinary.com/documentation/provisioning_api#create_user_group>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createUserGroup" method="post" path="/v1_1/provisioning/accounts/{account_id}/user_groups" example="UserGroupDesigners" -->
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
res = s.user_groups.create(user_group_request: Models::Shared::UserGroupRequest.new(
  name: 'Designers',
  extended_details: false
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `user_group_request`                                                        | [Models::Shared::UserGroupRequest](../../models/shared/usergrouprequest.md) | :heavy_check_mark:                                                          | User group details.                                                         |
| `account_id`                                                                | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | Account ID                                                                  |

### Response

**[T.nilable(Models::Shared::UserGroup)](../../models/operations/usergroup.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## get

Retrieve a specific user group.

Learn more about retrieving a specific user group.
<https://cloudinary.com/documentation/provisioning_api#get_user_group>

### Example Usage: UserGroupDesigners

<!-- UsageSnippet language="ruby" operationID="getUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesigners" -->
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
res = s.user_groups.get(group_id: '7f08f1f1fc910bf1f25274aef11d27', extended_details: true)

unless res.nil?
  # handle response
end

```
### Example Usage: UserGroupDesignersExtendedDetails

<!-- UsageSnippet language="ruby" operationID="getUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesignersExtendedDetails" -->
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
res = s.user_groups.get(group_id: '7f08f1f1fc910bf1f25274aef11d27', extended_details: true)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               | Example                                                                                                   |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `group_id`                                                                                                | *::String*                                                                                                | :heavy_check_mark:                                                                                        | The ID of the user group.                                                                                 | 7f08f1f1fc910bf1f25274aef11d27                                                                            |
| `account_id`                                                                                              | *T.nilable(::String)*                                                                                     | :heavy_minus_sign:                                                                                        | Account ID                                                                                                |                                                                                                           |
| `extended_details`                                                                                        | *T.nilable(T::Boolean)*                                                                                   | :heavy_minus_sign:                                                                                        | Whether to only return extended (true) or basic information about the group (false).<br/>**Default**: false.<br/> | true                                                                                                      |

### Response

**[T.nilable(Models::Shared::UserGroup)](../../models/operations/usergroup.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update the name of a specified user group.

Learn more about updating a specific user group.
<https://cloudinary.com/documentation/provisioning_api#update_user_group>

### Example Usage: UserGroupDesignersRequest

<!-- UsageSnippet language="ruby" operationID="updateUserGroup" method="put" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupDesignersRequest" -->
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
res = s.user_groups.update(group_id: '7f08f1f1fc910bf1f25274aef11d27', user_group_request: Models::Shared::UserGroupRequest.new(
  name: 'Designers and Creatives'
))

unless res.nil?
  # handle response
end

```
### Example Usage: UserGroupUpdate

<!-- UsageSnippet language="ruby" operationID="updateUserGroup" method="put" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" example="UserGroupUpdate" -->
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
res = s.user_groups.update(group_id: '7f08f1f1fc910bf1f25274aef11d27', user_group_request: Models::Shared::UserGroupRequest.new(
  name: 'Designers',
  extended_details: false
))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `group_id`                                                                  | *::String*                                                                  | :heavy_check_mark:                                                          | The ID of the user group.                                                   | 7f08f1f1fc910bf1f25274aef11d27                                              |
| `user_group_request`                                                        | [Models::Shared::UserGroupRequest](../../models/shared/usergrouprequest.md) | :heavy_check_mark:                                                          | User group details to update.                                               |                                                                             |
| `account_id`                                                                | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | Account ID                                                                  |                                                                             |

### Response

**[T.nilable(Models::Shared::UserGroup)](../../models/operations/usergroup.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## delete

Delete a user group with the specified ID.

Learn more about deleting a specific user group.
<https://cloudinary.com/documentation/provisioning_api#delete_user_group>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteUserGroup" method="delete" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}" -->
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
res = s.user_groups.delete(group_id: '7f08f1f1fc910bf1f25274aef11d27')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `group_id`                     | *::String*                     | :heavy_check_mark:             | The ID of the user group.      | 7f08f1f1fc910bf1f25274aef11d27 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::SuccessResponse)](../../models/operations/successresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_users

Retrieve the users in the group with the specified ID.

Learn more about retrieving users in a specific user group.
<https://cloudinary.com/documentation/provisioning_api#get_user_group_users>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getUsersInUserGroup" method="get" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users" example="UserGroupUsers" -->
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
res = s.user_groups.list_users(group_id: '7f08f1f1fc910bf1f25274aef11d27')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `group_id`                     | *::String*                     | :heavy_check_mark:             | The ID of the user group.      | 7f08f1f1fc910bf1f25274aef11d27 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::UserGroupUsersResponse)](../../models/operations/usergroupusersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 401, 404, 420, 429            | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## add_user

Add a user to a group with the specified ID.

Learn more about adding users to a specific user group.
<https://cloudinary.com/documentation/provisioning_api#add_user_to_group>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="addUserToUserGroup" method="post" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users/{user_id}" example="UserGroupUserJohn" -->
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
res = s.user_groups.add_user(group_id: '7f08f1f1fc910bf1f25274aef11d27', user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `group_id`                     | *::String*                     | :heavy_check_mark:             | The ID of the user group.      | 7f08f1f1fc910bf1f25274aef11d27 |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::UserGroupUser)](../../models/operations/usergroupuser.md)**

### Errors

| Error Type                        | Status Code                       | Content Type                      |
| --------------------------------- | --------------------------------- | --------------------------------- |
| Models::Errors::ErrorResponse     | 400, 401, 403, 404, 409, 420, 429 | application/json                  |
| Errors::APIError                  | 4XX, 5XX                          | \*/\*                             |

## remove_user

Remove a user from a group with the specified ID.

Learn more about removing users from a specific user group.
<https://cloudinary.com/documentation/provisioning_api#remove_user_from_group>

### Example Usage

<!-- UsageSnippet language="ruby" operationID="removeUserFromUserGroup" method="delete" path="/v1_1/provisioning/accounts/{account_id}/user_groups/{group_id}/users/{user_id}" example="UserGroupUsers" -->
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
res = s.user_groups.remove_user(group_id: '7f08f1f1fc910bf1f25274aef11d27', user_id: '0abed8dfcc039ea05e2a1d494fd442')

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                      | Type                           | Required                       | Description                    | Example                        |
| ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ | ------------------------------ |
| `group_id`                     | *::String*                     | :heavy_check_mark:             | The ID of the user group.      | 7f08f1f1fc910bf1f25274aef11d27 |
| `user_id`                      | *::String*                     | :heavy_check_mark:             | The ID of the user.            | 0abed8dfcc039ea05e2a1d494fd442 |
| `account_id`                   | *T.nilable(::String)*          | :heavy_minus_sign:             | Account ID                     |                                |

### Response

**[T.nilable(Models::Shared::UserGroupUsersResponse)](../../models/operations/usergroupusersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 420, 429  | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |