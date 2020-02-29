select 
  c.cur_id , c.cur_nombre, c.cur_matriculados,c.cur_precio, 
  m.mat_precio ,  c.cur_precio -  m.mat_precio
from EDUCA.curso c 
JOIN EDUCA.matricula m on c.cur_id = m.cur_id;