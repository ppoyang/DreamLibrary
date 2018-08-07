
CREATE TABLE user_tbl (
  user_id varchar2(10) NOT NULL PRIMARY KEY,
  user_pwd varchar2(10) NOT NULL,
  user_name varchar2(20) NOT NULL,
  user_birth varchar2(8) NOT NULL,
  user_addr varchar2(100) NOT NULL,
  user_tel varchar2(15),
  adm_check varchar2(1) default '0'
);


CREATE TABLE book_tbl (
  book_id varchar2(10) NOT NULL,
  book_code varchar2(2) not null,
  book_name varchar2(50) NOT NULL,
  book_author varchar2(30) NOT NULL,
  book_date varchar2(8) NOT NULL,
  book_pub  varchar2(100) NOT NULL,
  book_in_date date,
  book_imgPath varchar2(100),
  PRIMARY KEY (book_id)
);

CREATE TABLE rent_tbl (
  rent_no varchar2(12) NOT NULL,
  user_id varchar2(10) NOT NULL,
  book_id varchar2(10) not null,
  book_rent_date date NOT NULL,
  book_re_due_date date NOT NULL,
  book_re_date date,
  book_status varchar2(1) default '1',
  PRIMARY KEY (rent_no),
  foreign key(user_id) references user_tbl(user_id),
  foreign key(book_id) references book_tbl(book_id)
);


create or replace trigger user_id_tri
after update on user_tbl
for each row
begin
  update rent_tbl
  set user_id=:new.user_id
  where user_id=:old.user_id;
end;

create or replace trigger book_id_tri
after update on book_tbl
for each row
begin
  update rent_tbl
  set book_id=:new.book_id
  where book_id=:old.book_id;
end;
