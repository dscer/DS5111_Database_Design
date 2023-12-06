
{{ config(materialized='table') }}

SELECT name
FROM instructor
WHERE active = 'False'
-- DO NOT USE ; in these sql files