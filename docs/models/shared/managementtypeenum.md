# ManagementTypeEnum

Specifies whether the role's policies are managed by Cloudinary (`system`) or by the user (`custom`).

## Example Usage

```ruby
require "cloudinary-account-provisioning"

value = ManagementTypeEnum::SYSTEM

# Open enum: use .deserialize() to create instances from custom string values
custom = ManagementTypeEnum.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `SYSTEM` | system   |
| `CUSTOM` | custom   |