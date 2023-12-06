
{{ config(materialized='table') }}

SELECT i.name AS instructor_name, t.mnemonic AS course_mnemonic, t.term AS course_term
FROM teaches t
JOIN instructor i ON t.instructor_id = i.id
WHERE t.mnemonic = 'ds5100' AND t.term = 'summer2021'
-- DO NOT USE ; in these sql files