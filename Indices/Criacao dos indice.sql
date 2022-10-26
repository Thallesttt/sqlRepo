 --Select Padrão
 select * from tb_aluno A inner join armario B on  A.id = b.id_aluno
 where a.nome_completo = 'Adriaens Janczewski';
 Select A.id,a.nome_completo from tb_aluno A 
where A.id in (2,99);

--Criação de Index
create index indicealuno on tb_aluno(nome_completo);
create index indicearmario on armario(numero_armario);
create unique index indicealuno on tb_aluno(id);
create unique index indicearmario on armario(id);

-- drop dos indices
drop index indicealuno;
drop index indicearmario;

CREATE TABLE armario (
						id SERIAL PRIMARY KEY,
					    numero_armario INT,
					   id_aluno INT,
FOREIGN KEY(id_aluno) References tb_aluno(id));