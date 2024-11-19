CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT CHECK (credits BETWEEN 1 AND 5)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE SET NULL
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    experience_years INT CHECK (experience_years >= 0)
);

CREATE TABLE course_assignments (
    assignment_id SERIAL PRIMARY KEY,
    teacher_id INT REFERENCES teachers(teacher_id) ON DELETE SET DEFAULT,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE
);
INSERT INTO students (full_name, age, email)
VALUES
    ('Ali Karimov', 20, 'ali.karimov@example.com'),
    ('Zarina Mahmudova', 22, 'zarina.mahmudova@example.com'),
    ('Bekzod Nematov', 19, 'bekzod.nematov@example.com'),
    ('Nodir Hasanov', 21, 'nodir.hasanov@example.com'),
    ('Shirin Norboyeva', 23, 'shirin.norboyeva@example.com'),
    ('Asalbek Tursunov', 24, 'asalbek.tursunov@example.com'),
    ('Lola Salimova', 20, 'lola.salimova@example.com');

INSERT INTO courses (course_code, credits)
VALUES
    ('CS101', 3),
    ('MATH202', 4),
    ('HIST301', 2);

INSERT INTO teachers (full_name, experience_years)
VALUES
    ('Olimjon Rahimov', 5),
    ('Dilnoza Xudoyberdiyeva', 10);

INSERT INTO course_assignments (teacher_id, course_id)
VALUES
    (1, 1),
    (2, 2);
ALTER TABLE students RENAME TO learners;

ALTER TABLE learners RENAME COLUMN age TO student_age;
DELETE FROM learners WHERE student_id = 3;
DELETE FROM learners WHERE student_id = 4;
