CREATE TABLE `departments` (
  `dept_no` VARCHAR(4) PRIMARY KEY NOT NULL,
  `dept_name` VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE `employees` (
  `emp_no` INT PRIMARY KEY NOT NULL,
  `birth_date` DATE NOT NULL,
  `first_name` VARCHAR NOT NULL,
  `last_name` VARCHAR NOT NULL,
  `gender` VARCHAR NOT NULL,
  `hire_date` DATE NOT NULL
);

CREATE TABLE `dept_manager` (
  `dept_no` VARCHAR(4) NOT NULL,
  `emp_no` INT NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`dept_no`, `emp_no`)
);

CREATE TABLE `dept_emp` (
  `emp_no` INT NOT NULL,
  `dept_no` VARCHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `dept_no`)
);

CREATE TABLE `titles` (
  `emp_no` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE,
  PRIMARY KEY (`emp_no`, `title`, `from_date`)
);

CREATE TABLE `salaries` (
  `emp_no` INT NOT NULL,
  `salary` INT NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`)
);

ALTER TABLE `dept_manager` ADD FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`);

ALTER TABLE `dept_manager` ADD FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`);

ALTER TABLE `titles` ADD FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

ALTER TABLE `salaries` ADD FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`);

