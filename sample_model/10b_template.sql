
{{ config(materialized='table') }}

SELECT *
FROM nasa_facilities
WHERE status = 'Active'
-- DO NOT USE ; in these sql files