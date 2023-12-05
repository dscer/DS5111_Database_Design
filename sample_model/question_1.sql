
{{ config(materialized='table') }}

SELECT mnemonic, name
FROM course
WHERE active = 'True'
-- DO NOT USE ; in these sql files