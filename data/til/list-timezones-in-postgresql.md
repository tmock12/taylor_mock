%{
  title: "List and search timezones in postgresql",
  tags: ~w(postgres sql),
  date: ~D[2023-10-30],
  slug: "rixyaw0jt6"
}

---

Elixir and Postgres both use the IANA time zone database. It's helpful to view all timezones in a database:

```sql
 select * from pg_timezone_names;

               name               | abbrev | utc_offset | is_dst
----------------------------------+--------+------------+--------
 Indian/Mauritius                 | +04    | 04:00:00   | f
 Indian/Chagos                    | +06    | 06:00:00   | f
 Indian/Mayotte                   | EAT    | 03:00:00   | f
 Indian/Christmas                 | +07    | 07:00:00   | f
 Indian/Cocos                     | +0630  | 06:30:00   | f
 Indian/Maldives                  | +05    | 05:00:00   | f
 Indian/Comoro                    | EAT    | 03:00:00   | f
 Indian/Reunion                   | +04    | 04:00:00   | f
 ...etc
 ```

 and be able to query them in various fashion:

 ```sql
 select * from pg_timezone_names where name ~* '^US';

       name        | abbrev | utc_offset | is_dst
-------------------+--------+------------+--------
 US/Alaska         | AKDT   | -08:00:00  | t
 US/Pacific        | PDT    | -07:00:00  | t
 US/Eastern        | EDT    | -04:00:00  | t
 US/Michigan       | EDT    | -04:00:00  | t
 US/Arizona        | MST    | -07:00:00  | f
 US/Indiana-Starke | CDT    | -05:00:00  | t
 US/Aleutian       | HDT    | -09:00:00  | t
 US/Hawaii         | HST    | -10:00:00  | f
 US/East-Indiana   | EDT    | -04:00:00  | t
 US/Central        | CDT    | -05:00:00  | t
 US/Mountain       | MDT    | -06:00:00  | t
 US/Samoa          | SST    | -11:00:00  | f
 ```
