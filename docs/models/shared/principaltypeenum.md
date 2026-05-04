# PrincipalTypeEnum

The type of principal.

## Example Usage

```ruby
require "cloudinary-account-provisioning"

value = PrincipalTypeEnum::USER

# Open enum: use .deserialize() to create instances from custom string values
custom = PrincipalTypeEnum.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `USER`             | user               |
| `GROUP`            | group              |
| `API_KEY`          | apiKey             |
| `PROVISIONING_KEY` | provisioningKey    |