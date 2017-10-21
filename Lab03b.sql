# Add a new attribute age in STUDENT table. The age should be not less than 18 and not greater than 35.

ALTER TABLE Student
ADD age INT CHECK (age >= 18 AND age <= 35);

# Modify data type of attribute: NAME (i.e. cname, sname, fname) in all tables to varchar data type.

ALTER TABLE Student
MODIFY sname VARCHAR(30);

ALTER TABLE Faculty
MODIFY fname VARCHAR(30);

SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE Class
MODIFY cname VARCHAR(40);
SET FOREIGN_KEY_CHECKS = 1;

# Add a new NOT NULL constraint to DEPTID in FACULTY table.
ALTER TABLE Faculty
MODIFY deptid INT NOT NULL;