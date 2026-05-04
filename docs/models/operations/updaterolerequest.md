# UpdateRoleRequest


## Fields

| Field                                               | Type                                                | Required                                            | Description                                         |
| --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- |
| `account_id`                                        | *T.nilable(::String)*                               | :heavy_minus_sign:                                  | Account ID                                          |
| `role_id`                                           | *::String*                                          | :heavy_check_mark:                                  | A unique identifier for the role.                   |
| `role`                                              | [Models::Shared::Role](../../models/shared/role.md) | :heavy_check_mark:                                  | Role details                                        |