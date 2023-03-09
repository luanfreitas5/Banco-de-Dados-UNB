select * from livro;
select * from editora;
select * from livro_emprestimo where id_Livro = 5;

insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora)
			values ('python', 140, '2018-08-02', 430, 1);
            
update livro set titulo = 'linguagem', isbn = 333 where id_Livro = 3;

delete from autor_livro where id_Livro = 5;

delete from area_conhecimento_livro where id_Livro = 5;

delete from reserva_livro where id_Livro = 5;

delete from livro_emprestimo where id_Livro = 5;

select * from livro_emprestimo where id_Livro = 5;

delete from pagamento where id_Livro = 5 and id_Emprestimo = 2;

delete from livro where id_Livro = 5;

select titulo, isbn, editora.nome, autor.nome from livro inner join editora 
				    on livro.id_Editora = editora.id_Editora
                    inner join autor_livro 
                    on livro.id_Livro = autor_livro.id_Livro
                    inner join autor
                    on autor_livro.id_Autor = autor.id_Autor;
                    
select * from editora;

update editora set nome = 'campus 1' where id_Editora = 3;