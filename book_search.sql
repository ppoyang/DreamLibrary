create or replace function fun_bookstatus(book_id varchar2)
    return varchar2
is
    book_status varchar(1);
begin
select book_status into book_status
  from rent_tbl
  where book_id = book_id
    and book_status = '1';

    return book_status;
exception
    when others then
        dbms_output.put_line('exception occurred! (' || sqlcode || ') : ' || sqlerrm);
        return '';
end;


select book_id, book_name, book_author, book_pub, book_date, 
       decode(fun_bookstatus(book_id),null,'0',fun_bookstatus(book_id)) as book_status
  from book_tbl
 where book_id = '010000102'
  order by book_id asc;
