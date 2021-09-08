# All Data in table

SELECT * 
FROM courses

# information regarding each course - price, number of studetns and duration

SELECT course_id,
       price_usd, 
       num_students,
       content_duration_minutes
FROM courses

# course title, num of students total reviews and ratio between reiews and students

SELECT course_title,
       num_students,
       negative_reviews + negative_reviews as 'total_reviews',
       (negative_reviews + negative_reviews) / num_students AS 'reviews_ratio'
FROM courses

# course details and avg lesson duration

SELECT course_id,
       course_title,
       num_lessons,
       content_duration_minutes,
       content_duration_minutes / num_lessons AS "avg_duration"
FROM courses

# course enrolment details and total revenue per course

SELECT course_id,
       course_title,
       num_students,
       price_usd,
       num_students * price_usd AS "total_course_revenues"
FROM courses

# courses by title and subject

SELECT course_id,
CONCAT (course_subject, ","," ",course_title) AS "course_title_&_subject"
FROM courses

# course name and id, price and duration. Decending by price
SELECT course_title,
       course_id,
       price_usd,
       content_duration_minutes,
       content_duration_minutes / 60 AS "content_duration_hours"
FROM courses
ORDER BY price_usd DESC

# course name and id, price and duration. Decending by duration
SELECT course_title,
       course_id,
       price_usd,
       content_duration_minutes,
       content_duration_minutes / 60 AS "content_duration_hours"
FROM courses
ORDER BY content_duration_minutes DESC


# unique course subjects

SELECT DISTINCT course_subject AS "unique_list_of_subjects"
FROM courses

# unique course levels

SELECT DISTINCT course_level AS "unique_list_of_levels"
FROM courses

# unique combinations of course_subject and course_level

SELECT DISTINCT CONCAT(course_subject,", ", course_level) AS "unique_list_of_levels"
FROM courses

# num of course levels by subject - top 10

SELECT course_subject, 
       course_level, 
       COUNT(course_level) AS 'num_of_courses'
FROM courses
GROUP BY (CONCAT(course_subject, course_level))
ORDER BY num_of_courses DESC
LIMIT 10
