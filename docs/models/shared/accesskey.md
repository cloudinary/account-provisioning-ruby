# AccessKey


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `name`                                                               | *T.nilable(::String)*                                                | :heavy_minus_sign:                                                   | The name of the access key.                                          |
| `api_key`                                                            | *T.nilable(::String)*                                                | :heavy_minus_sign:                                                   | The API key.                                                         |
| `api_secret`                                                         | *T.nilable(::String)*                                                | :heavy_minus_sign:                                                   | The API secret.                                                      |
| `created_at`                                                         | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html) | :heavy_minus_sign:                                                   | The date when the access key was created.                            |
| `updated_at`                                                         | [Date](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/Date.html) | :heavy_minus_sign:                                                   | The date when the access key was last updated.                       |
| `enabled`                                                            | *T.nilable(T::Boolean)*                                              | :heavy_minus_sign:                                                   | Whether the access key is enabled or disabled.                       |