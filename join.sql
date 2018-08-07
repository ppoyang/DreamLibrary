SELECT  s.id, s.name, decode(v.vet_id,null,0,1)
  FROM  specialties s 
  LEFT OUTER JOIN vet_specialties v
    ON  s.id = v.specialty_id
    AND v.vet_id = '2'
  ORDER BY s.id;
  
  
  SELECT  fun_getname(v.vet_id), s.id, s.name, decode(v.vet_id,null,0,1)
  FROM  specialties s 
  LEFT OUTER JOIN vet_specialties v
    ON  s.id = v.specialty_id
    AND v.vet_id = '2'
  ORDER BY s.id;
  
  
create or replace function fun_getname(vet_id number)
    return varchar2
is
    vet_name varchar(100);
begin
 
 
    select 
        last_name||' '||first_name into vet_name
    from vets
    where id = vet_id;

    return vet_name;
  
exception
    when others then
        dbms_output.put_line('exception occurred! (' || sqlcode || ') : ' || sqlerrm);
        return '';
end;
