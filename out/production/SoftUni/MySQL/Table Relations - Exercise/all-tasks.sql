USE `geography`;

-- 01. One-To-One Relationship

CREATE TABLE `people`(
`person_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`salary` DECIMAL (10,2) DEFAULT 0,
`passport_id` INT UNIQUE
);

CREATE TABLE `passports`(
`passport_id` INT PRIMARY KEY AUTO_INCREMENT,
`passport_number` VARCHAR(8) UNIQUE
);

ALTER TABLE `people`
ADD CONSTRAINT pk_people
PRIMARY KEY (`person_id`),
ADD CONSTRAINT fk_people_passports
FOREIGN KEY (passport_id) 
REFERENCES passports(passport_id);

 INSERT INTO `passports`(`passport_id`, `passport_number`)
 VALUES (101, 'N34FG21B'),
  (102, 'K65LO4R7'),
  (103, 'ZE657QP2');

INSERT INTO `people`(`first_name`, `salary`, `passport_id`)
VALUES ('Roberto', 43300.00, 102),
 ('Tom', 56100.00, 103),
 ('Yana', 60200.00, 101);
 

-- 02. One-To-Many Relationship

CREATE TABLE `manufacturers`(
`manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) UNIQUE NOT NULL,
`established_on` DATE NOT NULL
);

CREATE TABLE `models`(
`model_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`manufacturer_id` INT,
CONSTRAINT fk_models_manufacturers
FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

ALTER TABLE `models` AUTO_INCREMENT = 101;

INSERT INTO `manufacturers`(`name`, `established_on`)
VALUE ('BMW', '1916-03-01' ),
 ('Tesla', '2003-01-01'),
 ('Lada', '1966-05-01');

INSERT INTO `models`(`name`, `manufacturer_id`)
VALUE ('X1', 1),
 ('i6', 1),
 ('Model S', 2),
 ('Model X', 2),
 ('Model 3', 2),
 ('Nova', 3);


-- 03. Many-To-Many Relationship

CREATE TABLE `students`(
`student_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `exams`(
`exam_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

ALTER TABLE `exams` AUTO_INCREMENT = 101;

CREATE TABLE `students_exams`(
`student_id` INT,
`exam_id` INT,
CONSTRAINT pk_students_exams
PRIMARY KEY (`student_id`, `exam_id`),
CONSTRAINT fk_students_exams_students
FOREIGN KEY (student_id) REFERENCES students(student_id),
CONSTRAINT fk_students_exams_exams
FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO `students` (`name`)
VALUE ('Mila'),
 ('Toni'),
 ('Ron');
 
 INSERT INTO `exams` (`name`)
 VALUE ('Spring MVC'),
  ('Neo4j'),
  ('Oracle 11g');
  
  INSERT INTO `students_exams` (`student_id`, `exam_id`)
  VALUE (1, 101),
   (1, 102),
   (2, 101),
   (3, 103),
   (2, 102),
   (2, 103);
   
   
-- 04. Self-Referencing
  
CREATE TABLE `teachers`(
  `teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `manager_id` INT
  );
  
ALTER TABLE `teachers` AUTO_INCREMENT = 101;
  
INSERT INTO `teachers` (`name`, `manager_id`)
VALUE ('John', NULL),
 ('Maya', 106),
 ('Silvia', 106),
 ('Ted', 105),
 ('Mark', 101),
 ('Greta', 101);
  
  
ALTER TABLE `teachers`
ADD   CONSTRAINT fk
FOREIGN KEY (`manager_id`) 
REFERENCES `teachers`(`teacher_id`);


-- 05. Online Store Database

CREATE DATABASE `online_store`;
USE `online_store`;

CREATE TABLE `cities`(
`city_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `item_types`(
`item_type_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `customers`(
`customer_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`birthday` DATE,
`city_id` INT(11),
CONSTRAINT fk_customers_cities
FOREIGN KEY (`city_id`)
REFERENCES `cities`(`city_id`)
);

CREATE TABLE `orders`(
`order_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
`customer_id` INT(11) NOT NULL,
CONSTRAINT fk_orders_customers
FOREIGN KEY (`customer_id`)
REFERENCES `customers`(`customer_id`)
);

CREATE TABLE `items`(
`item_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`item_type_id` INT(11) NOT NULL,
CONSTRAINT fk_items_item_types
FOREIGN KEY (`item_type_id`) 
REFERENCES `item_types`(`item_type_id`)
);

CREATE TABLE `order_items`(
`order_id` INT(11) NOT NULL,
`item_id` INT(11) NOT NULL,
CONSTRAINT pk_order_items
PRIMARY KEY (`order_id`, `item_id`),
CONSTRAINT fk_order_items__orders
FOREIGN KEY (`order_id`)
REFERENCES `orders`(`order_id`),
CONSTRAINT fk_order_items__items
FOREIGN KEY (`item_id`)
REFERENCES `items`(`item_id`)
);


-- 06. University Database

CREATE DATABASE `university`;
USE `university`;

CREATE TABLE `subjects`(
`subject_id` INT PRIMARY KEY AUTO_INCREMENT,
`subject_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `majors`(
`major_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `students`(
`student_id` INT PRIMARY KEY AUTO_INCREMENT,
`student_number` VARCHAR(12) NOT NULL,
`student_name` VARCHAR(50) NOT NULL,
`major_id` INT,
CONSTRAINT fk_students_majors
FOREIGN KEY (`major_id`)
REFERENCES `majors`(`major_id`)
);

CREATE TABLE `payments`(
`payment_id` INT PRIMARY KEY AUTO_INCREMENT,
`payment_date` DATE,
`payment_amount` DECIMAL(8,2),
`student_id` INT,
CONSTRAINT fk_payments_students
FOREIGN KEY (`student_id`)
REFERENCES `students`(`student_id`)
);

CREATE TABLE `agenda`(
`student_id` INT,
`subject_id` INT,
CONSTRAINT pk_agenda
PRIMARY KEY (`student_id`, `subject_id`),
CONSTRAINT fk_agenda_students
FOREIGN KEY (`student_id`)
REFERENCES `students`(`student_id`),
CONSTRAINT fk_agenda_subjects
FOREIGN KEY (`subject_id`)
REFERENCES `subjects`(`subject_id`)
);


-- 09. Peaks in Rila

SELECT 
m.`mountain_range`,
p.`peak_name`,
p.`elevation` AS 'peak_elevation'
FROM `peaks` AS p
JOIN `mountains` AS m ON p.`mountain_id` = m.`id`
WHERE m.`mountain_range` = 'Rila'
ORDER BY p.`elevation` DESC;