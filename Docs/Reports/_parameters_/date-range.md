## dateRange (Object)

| Selection      | num  | offset | unit  | value             |
| -------------- | ---- | ------ | ----- | ----------------- |
| Today          | 1    | 0      | hour  | 0day              |
| Last 24 hours  | 24   | 0      | hour  | 24hour            |
| This week      | 1    | 0      | day   | 0week             |
| Last 7 days    | 7    | 0      | day   | 7day              |
| This month     | 1    | 0      | day   | 0month            |
| Last 30 days   | 30   | 0      | day   | 30day             |
| Last 90 days   | 90   | 0      | day   | 90day             |
| This year      | 1    | 0      | month | 0year             |
| Last 6 months  | 6    | 0      | month | 6month            |
| Last 12 months | 12   | 0      | month | 12month           |
| Custom range   | 1    | 0      | hour  | range:00000:00000 |


**Structure**

```
- dateRange (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
```
