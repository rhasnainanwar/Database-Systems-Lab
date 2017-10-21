# 1. Find average age of students.
SELECT AVG(age) FROM student;

# 2. Find the average age of student in course: ‘Organic Chemistry’.
SELECT AVG(s.age) FROM student s, enrolled e WHERE e.snum=s.snum GROUP BY e.cname HAVING e.cname='Organic Chemistry';

# 3. Find eldest student.
SELECT sname, age FROM student GROUP BY age, sname HAVING age = (SELECT max(age) FROM student);

# 4. Find youngest student in ‘Electrical Engineering’ major.
SELECT sname, age FROM student WHERE major='Electrical Engineering' GROUP BY age, sname HAVING age = (SELECT min(age) FROM student);

# 5. Find eldest student in each level.
SELECT level, age FROM student GROUP BY level HAVING max(age);

# 6. Find average age of students in each level
SELECT level, AVG(age) FROM student GROUP BY level;

# 7. Find the number of distinct class rooms
SELECT COUNT(DISTINCT room) FROM class;

# 8. Find the strength of students in each major.
SELECT major, COUNT(*) FROM student GROUP BY major;

# 9. Find strength of students in course: ‘Urban Economics’
SELECT COUNT(*) FROM student s, enrolled e GROUP BY e.cname HAVING e.cname='Urban Economics';

# 10. Find the number of courses for student: ‘Karen Scott’.
SELECT COUNT(*) FROM enrolled e, student s WHERE e.snum=s.snum GROUP BY s.sname HAVING s.sname='Karen Scott';

# 11. Print the level and the average age of students for that level for all levels except ‘JR’.
SELECT level, AVG(age) FROM student GROUP BY level HAVING level<>'JR';

# 12. For each faculty member that has taught classes only in room R128, print the faculty
SELECT f.fname FROM faculty f, class c WHERE f.fid=c.fid GROUP BY c.room HAVING c.room='R128';

# 13. Find the names of all classes and their enrollment strength that have enrollment greater than 2.
SELECT cname, count(*) FROM enrolled GROUP BY cname HAVING count(*)>2;

# 14. Find the names and strength of classes taught by ‘Ivana Teach’.
SELECT e.cname, count(*) FROM enrolled e, class c, faculty f WHERE e.cname=c.cname AND f.fid=c.fid GROUP BY f.fname HAVING f.fname='Ivana Teach';

# 15. Find the number of faculty members that teach to class ‘database Systems’.
SELECT count(*) FROM faculty f, class c WHERE f.fid=c.fid GROUP BY c.cname HAVING c.cname='Database Systems';

# 16. Find the names, strength of faculty members for each class.
SELECT c.cname, COUNT(*) FROM faculty f, class c WHERE c.fid=f.fid GROUP BY c.cname;

# 17. Find the age of youngest student in ‘Database Systems’ class.
SELECT DISTINCT(s.age) FROM student s, class c WHERE c.cname='Database Systems' GROUP BY s.age, s.sname HAVING s.age = (SELECT min(age) FROM student);

# 18. Find the number of classes that occurred in the same room.
SELECT room, COUNT(*) FROM class GROUP BY room;

# 19. Find the name and strength of students taught by each faculty member.
SELECT f.fname, count(e.snum) FROM faculty f, class c, enrolled e WHERE f.fid=c.fid and c.cname=e.cname GROUP BY f.fname;

# 20. Find the age of eldest student in the class taught by ‘Ivana Teach’.
SELECT max(s.age) FROM student s, enrolled e, class c, faculty f WHERE e.snum=s.snum AND e.cname=c.cname AND f.fid=c.fid GROUP BY f.fname HAVING f.fname='Ivana Teach';