# UserGroup

User group.


## Fields

| Field                                                                              | Type                                                                               | Required                                                                           | Description                                                                        |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `id`                                                                               | *T.nilable(::String)*                                                              | :heavy_minus_sign:                                                                 | The user group's ID.                                                               |
| `name`                                                                             | *T.nilable(::String)*                                                              | :heavy_minus_sign:                                                                 | The user group's name.                                                             |
| `users`                                                                            | T::Array<[Models::Shared::UserGroupUser](../../models/shared/usergroupuser.md)>    | :heavy_minus_sign:                                                                 | A list of user group users.<br/>Only returned in extended_details.<br/>            |
| `created_at`                                                                       | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html)               | :heavy_minus_sign:                                                                 | The date when the user group was created.<br/>Only returned in extended_details.<br/> |
| `updated_at`                                                                       | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html)               | :heavy_minus_sign:                                                                 | The date when the user group was last updated.<br/>Only returned in extended_details.<br/> |