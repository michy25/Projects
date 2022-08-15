use Project2

select *
from home

select *
from school

-- Data Exploration --
-- 1. Learning style and test score
  -- find mean final_test
select avg(final_test)
from school
  -- Average final test score at 67.
  
  -- Number of students in different learning style
select count(student_id), learning_style 
from school
group by learning_style
  -- 6768 visual and 9132 auditory, there are more auditory learning style students.
  
  -- Which learning style students have higer than average final test score
select learning_style, count(student_id) as No_of_students_scoring_above_average
from school
where final_test > 67 
group by learning_style
  -- 4249 students using visual style and 3577 students using auditory style, shows that visual style students tend to have
  -- higher score.

-- 2. Study hours and test score
  -- Average study hour per week
  select avg(hours_per_week)
  from home
  -- Students studied on average 10 hours per week.

  -- Does having tuition improve test score when students studied for more than 10 hours.  
select count(s.student_id), h.tuition
from school as s
left join home as h
on s.student_id = h.student_id
where h.hours_per_week > 10 and s.final_test > 67
group by h.tuition
-- Students who studied for more than 10 hours per week scoring the average mark, there are more students (approx 1500) attending tuition
-- than students (approx 800) who do not have tuition.
-- Students who do not have tuition tend to perform the same as students who have tuition given both set of students put in more
-- than 10 hours of study hours per week.