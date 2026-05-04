# ScopeTypeEnum

Specifies where the role/policy is applied, either at the account level or within product environments.

## Example Usage

```ruby
require "cloudinary-account-provisioning"

value = ScopeTypeEnum::ACCOUNT

# Open enum: use .deserialize() to create instances from custom string values
custom = ScopeTypeEnum.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `ACCOUNT` | account   |
| `PRODENV` | prodenv   |