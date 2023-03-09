use biblioteca;
select * from livro;
select * from editora;

select * from livro inner join editora on livro.id_Editora = editora.id_Editora;

select livro.id_Livro, livro.titulo, livro.numero_Pagina, editora.nome from livro inner join editora on livro.id_Editora = editora.id_Editora;

select id_Livro, titulo, numero_Pagina, nome from livro 
                                             inner join editora on livro.id_Editora = editora.id_Editora;

select * from autor_livro inner join livro on autor_livro.id_Livro = livro.id_Livro
                           inner join autor on autor_livro.id_Autor = autor.id_Autor
                           inner join editora on editora.id_Editora = livro.id_Editora;
                           
select titulo, autor.nome, editora.nome from autor_livro inner join livro on autor_livro.id_Livro = livro.id_Livro
						  inner join autor on autor_livro.id_Autor = autor.id_Autor
                          inner join editora on editora.id_Editora = livro.id_Editora
                          order by editora.nome;
					
select titulo, autor.nome, editora.nome, area_conhecimento.nome from autor_livro inner join livro on autor_livro.id_Livro = livro.id_Livro
						  inner join autor on autor_livro.id_Autor = autor.id_Autor
                          inner join editora on editora.id_Editora = livro.id_Editora
                          inner join area_conhecimento_livro on area_conhecimento_livro.id_Livro = livro.id_Livro
                          inner join area_conhecimento on area_conhecimento.id_Area_Conhecimento = area_conhecimento_livro.id_Area_Conhecimento
                         -- where autor.nome = 'maria'
                          order by livro.titulo;
                          
select * from livro;

-- inclui um novo livro
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('matematica', 444, '2019-05-12', 400, 3);

select * from livro;

update livro set titulo = 'java básico1' where id_livro = 3;

update livro set titulo = 'luan' where  id_livro = 7;

--  autualizar livro com 2 campos
select * from livro;

update livro set titulo = 'computacao basica 2' , numero_Pagina = 210, ano_Edicao = '2019-03-12' where id_Livro = 1;

-- deletar um livro
delete from livro where livro.id_Livro = 1;

delete from area_conhecimento_livro where id_Livro = 1;

delete from autor_livro where id_Livro = 1;

delete from livro_emprestimo where livro_emprestimo.id_Livro = 1;

delete from pagamento where pagamento.id_Livro = 1;

delete from reserva_livro where id_Livro = 1;

-- slecionar livro_emprestimo com livro
select * from livro_emprestimo inner join livro on livro_emprestimo.id_livro = livro.id_livro where livro.id_livro = 4;


-- deleta aluno
select * from aluno;

delete from aluno where id_Aluno = 3;

delete from afiliacao where id_aluno = 3;

delete from email where id_Aluno = 3;

delete from telefone where id_Aluno = 3;

delete from endereco where id_Aluno = 3;

delete from emprestimo where id_Aluno = 3;

-- deleta professor
select * from professor;

delete from professor where id_Professor = 3;

delete from afiliacao where id_Professor = 3;

delete from email where id_Professor = 3;

delete from telefone where id_Professor = 3;

delete from endereco where id_Professor = 3;

delete from emprestimo where id_Professor = 3;

delete from dependente where id_Professor = 3;

delete from professor_titulacao where id_Professor = 3;

delete from reserva where id_Professor = 3;

-- deletar registro 6 emprestimo
select * from livro_emprestimo;

select * from emprestimo;

select * from pagamento;

delete from emprestimo where id_Emprestimo = 1;

delete from livro_emprestimo where id_Emprestimo = 1;

delete from pagamento where id_Emprestimo = 1 and id_Livro = 2;

-- deletar registro 4 funcionario
select * from funcionario;

delete from funcionario where id_Funcionario = 4;

delete from email where id_Funcionario = 4;

delete from telefone where id_Funcionario = 4;

delete from endereco where id_Funcionario = 4;

delete from emprestimo where id_Funcionario = 4;

delete from dependente where id_Funcionario = 4;

delete from livro_emprestimo where id_Emprestimo = 2;

delete from pagamento where id_Emprestimo = 2 and id_Livro = 5;

delete from habilidade_funcionario where id_Funcionario = 4;

-- deletar cidade
select * from cidade;

select * from bairro;

select * from endereco;
delete from cidade where id_Cidade = 1;

delete from bairro where id_Cidade = 1;

delete from endereco where id_Bairro in (1, 2, 3); 

-- fazer emrestimo
select * from emprestimo;

select * from pagamento;

select * from livro_emprestimo;

select * from livro;

select * from aluno;
-- emprstimo de livro
insert into emprestimo (data_Emprestimo, id_Aluno, id_Funcionario) values ('2019-08-15', 2, 1);

insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega) values (2, 12, '2019-06-12');
insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega) values (3, 12, '2019-06-12');

-- devolucao livro
update livro_emprestimo set data_Devolucao = '2018-11-15' where id_Livro = 2;
update livro_emprestimo set data_Devolucao = '2018-11-25' where id_Livro = 3;

-- gerar multa por atração
insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) 
                      values (3, 12, '2019-01-10', 2.00, 10.00, '16:00:00');

-- listar livros com editora                      
select * from livro;
select * from editora;
select * from autor;

select * from autor_livro;

select titulo, nome from livro inner join editora on livro.id_Editora = editora.id_Editora where editora.id_Editora = 3;

select titulo, nome from livro inner join autor_livro on livro.id_Livro = autor_livro.id_Livro
                       inner join autor on autor.id_Autor = autor_livro.id_Autor where autor.nome = 'maria';

-- incluir um novo para um autor   
insert into autor_livro (id_livro, id_autor) values (9, 1);
                    
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('C##', 742, '2020-10-19', 150, 1);
update livro set titulo = 'livro c##' where id_Livro = 9;
delete from livro where id_Livro = 9;

delete from autor_livro where id_Livro = 9;