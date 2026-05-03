# PermissionTypeEnum

Specifies whether permissions apply globally or to specific content.

## Example Usage

```ruby
require "cloudinary-account-provisioning"

value = PermissionTypeEnum::GLOBAL

# Open enum: use .deserialize() to create instances from custom string values
custom = PermissionTypeEnum.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `GLOBAL`  | global    |
| `CONTENT` | content   |