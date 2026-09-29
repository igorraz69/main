-- Summary of slow queries using Performance Schema in MySQL
-- Requires performance_schema to be enabled and statement instrumentation on.
-- Shows the 20 slowest queries by average execution time, excluding system schemas.
SELECT
    DIGEST_TEXT AS query_sample,
    SCHEMA_NAME AS db,
    COUNT_STAR AS exec_count,
    ROUND(TIMER_WAIT/COUNT_STAR/1e6, 2) AS avg_time_ms,
    ROUND(MAX_TIMER_WAIT/1e6, 2) AS max_time_ms,
    ROUND(SUM_LOCK_TIME/1e6, 2) AS total_lock_time_ms,
    SUM_ROWS_EXAMINED AS rows_examined,
    SUM_ROWS_SENT AS rows_sent,
    FIRST_SEEN AS first_seen,
    LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE SCHEMA_NAME NOT IN ('mysql', 'performance_schema', 'information_schema', 'sys')
  AND DIGEST_TEXT IS NOT NULL
ORDER BY AVG_TIMER_WAIT DESC
LIMIT 20;
