# BillingUsageResponse


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `plan_name`                                                                 | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | The name of the plan (e.g., "Pro PAYG", "Advanced PAYG").                   |
| `metric_usage`                                                              | T::Array<[Models::Shared::MetricUsage](../../models/shared/metricusage.md)> | :heavy_minus_sign:                                                          | N/A                                                                         |