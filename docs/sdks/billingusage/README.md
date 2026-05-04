# BillingUsage

## Overview

### Available Operations

* [get](#get) - Get billing usage information

## get

Retrieve billing usage metrics for your account and product environments,
including storage, bandwidth, impressions, and transformations.

If `year` is provided:
  - **Annual subscription**: Returns the single annual usage cycle that began in the specified year (if any).
  - **Monthly subscription**: Returns all monthly usage cycles that began in the specified year.

If `year` is not provided:
  - Returns usage for the year in which the current active subscription period began.
  - If no active subscription exists, an empty list is returned.

**Note**: Usage metrics are updated daily, so calling this endpoint once per day gives you the latest data.


### Example Usage: AdvancedExtraPAYG

<!-- UsageSnippet language="ruby" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="AdvancedExtraPAYG" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.billing_usage.get(year: 2024)

unless res.nil?
  # handle response
end

```
### Example Usage: AdvancedPAYG

<!-- UsageSnippet language="ruby" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="AdvancedPAYG" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.billing_usage.get(year: 2024)

unless res.nil?
  # handle response
end

```
### Example Usage: MultiPlan

<!-- UsageSnippet language="ruby" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="MultiPlan" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.billing_usage.get(year: 2024)

unless res.nil?
  # handle response
end

```
### Example Usage: ProPAYG

<!-- UsageSnippet language="ruby" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="ProPAYG" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.billing_usage.get(year: 2024)

unless res.nil?
  # handle response
end

```
### Example Usage: ProPAYGPlus

<!-- UsageSnippet language="ruby" operationID="getBillingUsage" method="get" path="/v1_1/provisioning/accounts/{account_id}/billing_usage" example="ProPAYGPlus" -->
```ruby
require 'cloudinary_account_provisioning'

Models = ::CldProvisioning::Models
s = ::CldProvisioning::CldProvisioning.new(
  account_id: '<id>',
  security: Models::Shared::Security.new(
    provisioning_api_key: 'CLOUDINARY_PROVISIONING_API_KEY',
    provisioning_api_secret: 'CLOUDINARY_PROVISIONING_API_SECRET'
  )
)
res = s.billing_usage.get(year: 2024)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                  | Type                                                                                       | Required                                                                                   | Description                                                                                | Example                                                                                    |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `account_id`                                                                               | *T.nilable(::String)*                                                                      | :heavy_minus_sign:                                                                         | Account ID                                                                                 |                                                                                            |
| `year`                                                                                     | *T.nilable(::Integer)*                                                                     | :heavy_minus_sign:                                                                         | The year to retrieve billing usage for. Behavior depends on subscription type (see above). | 2024                                                                                       |
| `include_prodenv_breakdown`                                                                | *T.nilable(T::Boolean)*                                                                    | :heavy_minus_sign:                                                                         | Whether to include usage details by product environment. **Default**: false.<br/>          |                                                                                            |

### Response

**[T.nilable(T::Array[Models::Shared::BillingUsageResponse])](../../models/operations/.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 401, 403, 404, 429       | application/json              |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |