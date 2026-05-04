# ProductEnvironment

Product Environment


## Fields

| Field                                                                         | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `cloud_name`                                                                  | *T.nilable(::String)*                                                         | :heavy_minus_sign:                                                            | N/A                                                                           |
| `name`                                                                        | *T.nilable(::String)*                                                         | :heavy_minus_sign:                                                            | The cloud name of the product environment.                                    |
| `enabled`                                                                     | *T.nilable(T::Boolean)*                                                       | :heavy_minus_sign:                                                            | Whether the product environment is enabled or disabled.                       |
| `id`                                                                          | *T.nilable(::String)*                                                         | :heavy_minus_sign:                                                            | The ID of the product environment.                                            |
| `api_access_keys`                                                             | T::Array<[Models::Shared::ApiAccessKey](../../models/shared/apiaccesskey.md)> | :heavy_minus_sign:                                                            | The list of the product environment's access keys.                            |
| `created_at`                                                                  | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html)          | :heavy_minus_sign:                                                            | The date when the product environment was created.                            |
| `updated_at`                                                                  | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html)          | :heavy_minus_sign:                                                            | The date when the product environment was last updated.                       |