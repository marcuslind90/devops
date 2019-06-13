# Track Postgres Metrics using Kibana

Full Kibana setup using Docker-Compose.

Get started by:

`docker-compose up -d`

Note that we collect the `statement` metrics from PostgreSQL. To enable these metrics the following setting must be set within the `postgresql.conf` file.

```
shared_preload_libraries = 'pg_stat_statements'

pg_stat_statements.max = 10000
pg_stat_statements.track = all
```
