# RoleManagementRequest

A role management operation and the roles it applies to.


## Fields

| Field                                                                             | Type                                                                              | Required                                                                          | Description                                                                       | Example                                                                           |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `operation`                                                                       | [Models::Shared::Operation](../../models/shared/operation.md)                     | :heavy_check_mark:                                                                | Whether to add or remove the listed roles.                                        | add                                                                               |
| `roles`                                                                           | T::Array<[Models::Shared::RoleAssignment](../../models/shared/roleassignment.md)> | :heavy_check_mark:                                                                | The roles to add or remove.                                                       |                                                                                   |