CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(50) UNIQUE
);

DESCRIBE student;

ALTER TABLE student ADD gpa DECIMAL(3,2);
ALTER TABLE student DROP COLUMN gpa;

SELECT * FROM student;

INSERT INTO student VALUES (1, 'Jack', 'Computer Science');
INSERT INTO student VALUES (2, 'Kate', 'Software Engineering');
INSERT INTO student VALUES (3, 'John', 'Elec Elect');
INSERT INTO student VALUES (4, 'Jack', 'Petroleum Engineering');

INSERT INTO student(student_id, name) VALUES (1, 'Jack');
INSERT INTO student VALUES (2, 'Kate', 'Software Engineering');
INSERT INTO student VALUES (3, 'John', NULL);
INSERT INTO student VALUES (4, 'Jack', 'Petroleum Engineering');


CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20),
    department VARCHAR(50),
    PRIMARY KEY(student_id)
);

DROP TABLE student;

DESCRIBE student;

SELECT * FROM student;

INSERT INTO student(name, department) VALUES ('Jack', 'Computer Science');
INSERT INTO student(name, department) VALUES ('Kate', 'Software Engineering');
INSERT INTO student(name, department)VALUES ('John', 'Data Engineering');
INSERT INTO student(name, department) VALUES ('Jack', 'Data Science');
INSERT INTO student(name, department) VALUES ('Mark', 'Cloud Engineering');

UPDATE student 
SET department = 'Petroleum Engineer'
WHERE student_id = 5;

UPDATE student 
SET department = 'Cloud Engineering'
WHERE department IS NULL;

UPDATE student 
SET department = 'Machine Learning'
WHERE department = 'Petroleum Engineer' AND student_id = 5;

UPDATE student 
SET department = 'Data Analysis'
WHERE department = 'Data Science' OR department = 'Machine Learning';

UPDATE student 
SET department = 'Data Science'
WHERE department = 'Data Analysis' AND  student_id = 4;

UPDATE student 
SET department = 'Machine Learning'
WHERE department = 'Data Analysis' AND  student_id = 5;

UPDATE student 
SET name = 'Jude'
WHERE department = 'Computer Science' OR student_id = 5;

UPDATE student 
SET name = 'Renne'
WHERE name = 'Jude' AND student_id = 5;

DELETE FROM student
WHERE student_id = 2 OR name = 'John';

SELECT name, department FROM student
ORDER BY student_id;

SELECT name, department FROM student
ORDER BY student_id
LIMIT 2;

SELECT name, department FROM student
ORDER BY department, name;

SELECT name, department FROM student
ORDER BY department DESC;

SELECT name, department FROM student
ORDER BY student_id ASC;

SELECT * FROM student
WHERE department = 'Computer Science';

SELECT * FROM student
WHERE department <> 'Data Science';

SELECT * FROM student
WHERE department = 'Data Science' AND student_id = 4;

SELECT * FROM student
WHERE department = 'Data Science' AND student_id >= 4;

SELECT * FROM student
WHERE name IN ('Jack', 'Kate', 'Renne');

SELECT * FROM student
WHERE name IN ('Jack', 'Kate', 'Renne') AND department = 'Data Science';
