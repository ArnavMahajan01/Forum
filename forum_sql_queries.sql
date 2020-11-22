use forum;
select * from forum_category;
select * from forum_questions;
select question_id, question_header, views_count, created_by, updated_dt from forum_questions where forum_id=2 and status = 1;