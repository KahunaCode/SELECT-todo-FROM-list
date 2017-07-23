DROP USER IF EXISTS "michael";

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS "todo_app";

CREATE DATABASE "todo_app";

\c todo_app

CREATE TABLE tasks (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
description text,
created_at TIMESTAMP,
updated_at TIMESTAMP,
completed BOOLEAN
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES ('Study SQL', 'Compleate this exercise', NOW(), NOW(), NULL);

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'read all of the documentation');

SELECT title FROM tasks WHERE completed_at = NULL;

UPDATE tasks SET completed_at = NOW() WHERE title LIKE 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE 'mistake 1';

SELECT title, description FROM tasks where title LIKE 'mistake';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title;