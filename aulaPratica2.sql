select * from livro;

update livro set titulo = 'java básico 2', isbn = 743 where id_Livro = 3;

delete from livro where id_Livro = 2;

delete from area_conhecimento_livro where id_Livro = 2;

delete from autor_livro where id_Livro = 2;

delete from reserva_livro where id_Livro = 2;

delete from livro_emprestimo where id_Livro = 2;

select * from livro_emprestimo where id_Livro = 2;

delete from pagamento where id_Livro = 2 and id_Emprestimo = 1;

select * from editora;

insert into editora (nome) values ('saraiva');

select titulo, numero_Pagina, editora.nome, autor.nome from livro 
                                           inner join editora on livro.id_Editora = editora.id_Editora
                                           inner join autor_livro on autor_livro.id_Livro = livro.id_Livro
                                           inner join autor on autor.id_Autor = autor_livro.id_Autor;