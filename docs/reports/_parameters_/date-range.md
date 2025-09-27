## dateRange (Object)

**Description:**  
The dateRange object defines time periods for data analysis across all report endpoints.
Provides absolute date boundaries and relative time calculations for flexible selection.

### Predefined Date Range Values

The following table shows common predefined date range configurations that can be used with Umami reports:

| Selection      | num  | offset | unit  | value             | Description |
| -------------- | ---- | ------ | ----- | ----------------- | ----------- |
| Today          | 1    | 0      | hour  | 0day              | Current day from midnight |
| Last 24 hours  | 24   | 0      | hour  | 24hour            | Past 24 hours from now |
| This week      | 1    | 0      | day   | 0week             | Current week from Monday |
| Last 7 days    | 7    | 0      | day   | 7day              | Past 7 days from today |
| This month     | 1    | 0      | day   | 0month            | Current month from 1st |
| Last 30 days   | 30   | 0      | day   | 30day             | Past 30 days from today |
| Last 90 days   | 90   | 0      | day   | 90day             | Past 90 days from today |
| This year      | 1    | 0      | month | 0year             | Current year from January |
| Last 6 months  | 6    | 0      | month | 6month            | Past 6 months from now |
| Last 12 months | 12   | 0      | month | 12month           | Past 12 months from now |
| Custom range   | 1    | 0      | hour  | range:00000:00000 | User-defined date range |


### Object Structure

The dateRange object contains the following properties:

```json
{
  "dateRange": {
    "startDate": "2025-05-13T22:00:00.000Z",
    "endDate": "2025-05-20T21:59:59.999Z",
    "num": 1,
    "offset": 0,
    "unit": "day",
    "value": "7day"
  }
}
```

#### Property Descriptions

- **startDate** (String, required): Absolute start date in ISO 8601 format (e.g., `2025-05-13T22:00:00.000Z`)
- **endDate** (String, required): Absolute end date in ISO 8601 format (e.g., `2025-05-20T21:59:59.999Z`) 
- **num** (Integer, required): Number of time units for relative date calculations (e.g., `1`, `24`, `7`, `30`)
- **offset** (Integer, required): Time offset for date calculations, typically `0` for current period
- **unit** (String, required): Time unit for calculations - valid values: `hour`, `day`, `month`, `year`
- **value** (String, required): Formatted identifier for the date range (e.g., `0day`, `24hour`, `7day`, `30day`)

#### Usage Notes

- For custom date ranges, use `range:startTimestamp:endTimestamp` format in the `value` field
- The `num`, `offset`, `unit`, and `value` fields work together to calculate relative dates
- `startDate` and `endDate` provide absolute boundaries regardless of relative calculations
- All timestamps should be in UTC format
