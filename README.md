AI Metadata Retention Engine
A metadata-driven SQL generation framework that leverages Amazon Q and Amazon Athena to automate data retention workflows across large relational schemas. This system reduces manual SQL development, enforces data governance, and scales to hundreds of interrelated tables.

1. Problem
In large data platforms, student data exists across hundreds of tables. To perform data retention or deletion, all records linked to a student must be identified.

Traditional approaches required manually writing SQL joins for each table, which was:
• Time-consuming
• Error-prone
• Difficult to maintain
• Hard to scale as schemas evolve

2. Metadata Logic
Not all tables store student_id directly. 
Two scenarios exist:
DIRECT: student_id exists directly in the table.Example: enrollment.student_id
FK (Foreign Key): student_id exists in a parent table referenced via a foreign key.Example: attendance.course_id → course.student_id
A metadata configuration table defines these relationships. Amazon Q reads this metadata and generates SQL automatically to retrieve student_id from all tables according to the configuration.

3. Before vs After
Before - Manual SQL Approach:
• Engineers manually wrote SQL joins for each table
• Union queries were built for all tables containing or linking to student_id
• Hard to maintain when schema changes

Limitations:
• Time consuming
• Repetitive
High risk of missing related records

After - AI + Metadata Driven:
· Metadata configuration defines table relationships 
· Amazon Q generates SQL automatically for each table, handling DIRECT and FK scenarios
· Athena executes generated SQL to produce a retention_lookup table with all related records

FOR EXAMPLE: -- Direct
SELECT student_id FROM enrollment;
-- Foreign Key
SELECT a.course_id, c.student_id
FROM attendance a
JOIN course c ON a.course_id = c.course_id;

Benefits:
·Fully automated SQL generation
·Scales to hundreds of tables
·Easy to maintain as schema evolves
·Reduces manual errors and effort

4. Architecture
Metadata Config Table 
↓Amazon Q Prompt 
↓Dynamic SQL (joins + Union) Generation
↓Amazon Athena Execution
↓Retention Lookup Table
↓
Used by Retention Process to delete records

5. Tech Stack

·Amazon Q - AI-assisted query generation
· Amazon Athena - SQL execution at scale
· SQL - Relational query logic
· Metadata-driven architecture – Scalable and maintainable

6. Skills Demonstrated
· Metadata modeling for relational schemas
· AI-assisted SQL generation
· Scalable query automation
· Data governance and compliance
· Large schema relationship management

7. Future Improvements
· Recursive foreign key traversal for deep schema relationships
· Integration with AWS Glue Data Catalog or similar tools
· Support for complex graph relationships between entities
· Automated retention validation workflows

