
{{ config(materialized='table') }}

SELECT mnemonic, name
FROM course
WHERE active = 'False'
-- DO NOT USE ; in these sql files