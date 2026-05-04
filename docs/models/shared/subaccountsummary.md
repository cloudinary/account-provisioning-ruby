# SubAccountSummary

Product environment (sub-account) summary.


## Fields

| Field                                                 | Type                                                  | Required                                              | Description                                           |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| `id`                                                  | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | The product environment's ID.                         |
| `name`                                                | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | The product environment's name.                       |
| `description`                                         | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | The product environment's description.                |
| `cloud_name`                                          | *T.nilable(::String)*                                 | :heavy_minus_sign:                                    | The Cloudinary cloud name of the product environment. |
| `enabled`                                             | *T.nilable(T::Boolean)*                               | :heavy_minus_sign:                                    | Whether the product environment is enabled.           |