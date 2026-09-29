# MySQL slow query helpers

Корисні SQL-скрипти для діагностики повільних запитів у MySQL.

## Файли

- [`slow_queries.sql`](slow_queries.sql) — топ-20 найповільніших statements через Performance Schema (за середнім часом виконання).

## Використання

1. Увімкніть `performance_schema` і statement instrumentation.
2. Виконайте скрипт на MySQL-інстансі:

```bash
mysql -u root -p < slow_queries.sql
```

Системні схеми (`mysql`, `performance_schema`, `information_schema`, `sys`) виключені з вибірки.
