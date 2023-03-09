select * from livro;
select * from pagamento;

delete from livro where id_Livro = 1;

delete from area_conhecimento_livro where id_Livro = 1;

delete from autor_livro where id_Livro = 1;

delete from reserva_livro where id_Livro = 1;

delete from livro_emprestimo where id_Livro = 1;

delete from pagamento where id_Livro = 1 and id_Emprestimo = 5;

update livro set titulo = 'java basico 2' where id_Livro = 3;

insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('python 1', 127, '2018-06-13', 800, 2);

select * from livro inner join editora on livro.id_Livro = editora.id_Editora;