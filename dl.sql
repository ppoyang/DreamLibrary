
create database dreamLibDB;

use dreamLibDB;

CREATE TABLE `user_tbl` (
  user_id varchar(10) NOT NULL,
  user_pwd varchar(10) NOT NULL,
  user_name varchar(20) NOT NULL,
  user_birth char(6) NOT NULL,
  user_addr varchar(100) NOT NULL,
  user_tel varchar(15),
  adm_check char(1) default '0',
  PRIMARY KEY (user_id)
)DEFAULT CHARSET=utf8;

CREATE TABLE book_tbl (
  book_id varchar(10) NOT NULL,
  book_code char(2) not null,
  book_name varchar(50) NOT NULL,
  book_author varchar(30) NOT NULL,
  book_date char(8) NOT NULL,
  book_pub  varchar(100) NOT NULL,
  book_in_date date,
  book_imgPath varchar(100),
  PRIMARY KEY (book_id)
)DEFAULT CHARSET=utf8;

CREATE TABLE rent_tbl (
  rent_no varchar(12) NOT NULL,
  user_id varchar(10) NOT NULL,
  book_id varchar(10) not null,
  book_rent_date date NOT NULL,
  book_re_due_date date NOT NULL,
  book_re_date date,
  book_status char(1) default '1',
  PRIMARY KEY (rent_no),
  CONSTRAINT `fk_book_rent_1` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_book_rent_2` FOREIGN KEY (`book_id`) REFERENCES `book_tbl` (`book_id`) ON UPDATE CASCADE
)DEFAULT CHARSET=utf8;

select * from user_tbl;