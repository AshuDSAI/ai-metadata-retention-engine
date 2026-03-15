I have an Athena metadata table dataretention_config with columns: system, table_name, column_name, foreign_key_table, foreign_key_field, key_type, dataretention, fieldtag1. Each record defines a child table (table_name + column_name) and a parent table (foreign_key_table + foreign_key_field). fieldtag1 is the column in the parent table storing student ID.

Please generate a single SQL query compatible with Athena that joins each child table to its parent using child.column_name = parent.foreign_key_field.

The query should select the following fields:
object_name = table_name
attribute_name = column_name
value = child.column_name
student_id = parent.fieldtag1

Union all relationships into a single output table called retention_lookup. Do not use any functions or syntax not supported in Athena. Use consistent table aliases (child and parent) and preserve exact column names from the metadata. Return the SQL as a CREATE TABLE AS SELECT statement.

I also have an Athena table called retention_hits with columns: object_name, attribute_name, value, student_id.

For each row in retention_hits, generate an Athena-compatible DELETE statement that deletes rows from object_name where attribute_name = value. Ensure that child tables (StudentRelatedKey) are deleted first and root tables (StudentKey) last. Output a single SQL script that deletes all student-related data for all students in retention_hits. Use only Athena-supported SQL syntax and do not include unsupported functions.