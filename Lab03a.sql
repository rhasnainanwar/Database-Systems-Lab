CREATE DATABASE lab03;
USE lab03;
CREATE TABLE IF NOT EXISTS Student (
	snum INT NOT NULL PRIMARY KEY,
    sname CHAR(30),
    major CHAR(30),
    level CHAR(2)
);

CREATE TABLE IF NOT EXISTS Faculty (
	fid INT NOT NULL PRIMARY KEY,
    fname CHAR(30),
    deptid INT
);

CREATE TABLE IF NOT EXISTS Class (
	cname CHAR(40) NOT NULL PRIMARY KEY,
	meets_at CHAR(20),
    room CHAR(10),
    fid INT,
    FOREIGN KEY (fid) REFERENCES Faculty(fid)
);

CREATE TABLE IF NOT EXISTS Enrolled (
	snum INT,
    cname CHAR(40),
    FOREIGN KEY (snum) REFERENCES Student(snum),
    FOREIGN KEY (cname) REFERENCES Class(cname)
);