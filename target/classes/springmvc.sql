CREATE DATABASE springmvc;

CREATE TABLE `user` (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  user_name varchar(50) NOT NULL,
  user_password varchar(50) NOT NULL,
  isadmin int(11) NOT NULL,
  PRIMARY KEY (user_id)
);
CREATE TABLE `employee` (
  emp_id int(11) NOT NULL AUTO_INCREMENT,
  emp_name varchar(100) NOT NULL,
  NRC varchar(45) NOT NULL,
  phone int(11) NOT NULL,
  email varchar(45) NOT NULL,
  birthdate date NOT NULL,
  address varchar(225) NOT NULL,
  basic salary int(11) NOT NULL,
  children int(11) NOT NULL,
  parent int(11) NOT NULL,
  PRIMARY KEY (user_id)
);

INSERT INTO `user` (user_id, user_name, user_password) VALUES (1, 'admin', 'admin@1234',1);
INSERT INTO `user` (user_id, user_name, user_password) VALUES (2, 'user123', 'user@123',0);