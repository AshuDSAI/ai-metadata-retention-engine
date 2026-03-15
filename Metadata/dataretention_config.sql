-- Metadata configuration table used by the AI Metadata Retention Engine
-- Defines how student_id can be retrieved from each table for retention processing

CREATE TABLE dataretention_config (
    system VARCHAR,
    table_name VARCHAR,
    column_name VARCHAR,
    foreign_key_table VARCHAR,
    foreign_key_field VARCHAR,
    key_type VARCHAR, 
    dataretention VARCHAR, -- DIRECT: student_id exists in the table | INDIRECT: retrieved via parent table
    fieldtag1 VARCHAR -- Attribute in parent table containing the student identifier
);