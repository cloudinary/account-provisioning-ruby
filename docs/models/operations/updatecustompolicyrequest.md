# UpdateCustomPolicyRequest


## Fields

| Field                                                                           | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `account_id`                                                                    | *T.nilable(::String)*                                                           | :heavy_minus_sign:                                                              | Account ID                                                                      |
| `policy_id`                                                                     | *::String*                                                                      | :heavy_check_mark:                                                              | A unique identifier for the custom permission policy.                           |
| `update_custom_policy`                                                          | [Models::Shared::UpdateCustomPolicy](../../models/shared/updatecustompolicy.md) | :heavy_check_mark:                                                              | Policy details                                                                  |