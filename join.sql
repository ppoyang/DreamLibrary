SELECT  s.id, s.name, decode(v.vet_id,null,0,1)
  FROM  specialties s 
  LEFT OUTER JOIN vet_specialties v
    ON  s.id = v.specialty_id
    AND v.vet_id = '2'
  ORDER BY s.id;
