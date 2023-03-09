USE Biblioteca;

START TRANSACTION;

insert into editora (nome) values ('unb');
insert into editora (nome) values ('moderna');
insert into editora (nome) values ('campus');
insert into editora (nome) values ('novatec');
insert into editora (nome) values ('pearson');
insert into editora (nome) values ('elsever');

insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('computacao basica', 123, '2018-11-08', 300, 1);
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('computacao experimental', 456, '2018-11-08', 300, 2);
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('java basico', 789, '2018-11-08', 300, 1);
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('linguagem C', 111, '2018-11-08', 300, 4);
insert into livro (titulo, isbn, ano_edicao, numero_pagina, id_editora) values ('linguagem C++', 222, '2018-11-08', 300, 3);

insert into autor (nome) values ('maria');
insert into autor (nome) values ('antonio');
insert into autor (nome) values ('paulo');
insert into autor (nome) values ('marcos');
insert into autor (nome) values ('marcio');

insert into autor_livro (id_autor, id_livro) values (1, 5);
insert into autor_livro (id_autor, id_livro) values (1, 2);
insert into autor_livro (id_autor, id_livro) values (2, 3);
insert into autor_livro (id_autor, id_livro) values (4, 5);
insert into autor_livro (id_autor, id_livro) values (3, 3);
insert into autor_livro (id_autor, id_livro) values (1, 1);

insert into area_conhecimento (nome) values ('informatica');
insert into area_conhecimento (nome) values ('linguagens de programação');
insert into area_conhecimento (nome) values ('sociedade de computação');
insert into area_conhecimento (nome) values ('filosofia');
insert into area_conhecimento (nome) values ('qualidade de software');

insert into area_conhecimento_livro (id_area_conhecimento, id_livro) values (2, 1);
insert into area_conhecimento_livro (id_area_conhecimento, id_livro) values (1, 3);
insert into area_conhecimento_livro (id_area_conhecimento, id_livro) values (4, 2);
insert into area_conhecimento_livro (id_area_conhecimento, id_livro) values (5, 5);
insert into area_conhecimento_livro (id_area_conhecimento, id_livro) values (2, 2);

insert into cor_pele (descricao) values ('amarelo');
insert into cor_pele (descricao) values ('pardo');
insert into cor_pele (descricao) values ('negro');
insert into cor_pele (descricao) values ('branco');
insert into cor_pele (descricao) values ('mulato');

insert into estado_civil (descricao) values ('casado');
insert into estado_civil (descricao) values ('solteiro');
insert into estado_civil (descricao) values ('viuvo');
insert into estado_civil (descricao) values ('divociado');
insert into estado_civil (descricao) values ('outros');

insert into sexo (descricao) values ('masculino');
insert into sexo (descricao) values ('feminino');
insert into sexo (descricao) values ('outros');

insert into pais (nome) values ('Brasil');
insert into pais (nome) values ('Estado Unidos');
insert into pais (nome) values ('Argetina');
insert into pais (nome) values ('Paraguai');
insert into pais (nome) values ('Bolivia');

insert into uf (sigla, descricao, id_pais) values ('df', 'distrito federal', 1);
insert into uf (sigla, descricao, id_pais) values ('sp', 'sao paulo', 1);
insert into uf (sigla, descricao, id_pais) values ('rj', 'rio de janeiro', 1);
insert into uf (sigla, descricao, id_pais) values ('go', 'goias', 1);
insert into uf (sigla, descricao, id_pais) values ('bh', 'belo horihonte', 1);

insert into naturalidade (descricao, id_uf) values ('brasiliense', 1);
insert into naturalidade (descricao, id_uf) values ('paulista', 2);
insert into naturalidade (descricao, id_uf) values ('carioca', 3);
insert into naturalidade (descricao, id_uf) values ('goiano', 4);
insert into naturalidade (descricao, id_uf) values ('mineiro', 5);

insert into aluno (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('luan', 1, '11111111111', 2, 1, 2, 1);
insert into aluno (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('jose',2, '22222222222', 3, 1, 3, 2);
insert into aluno (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('katia', 3, '33333333333', 1, 2, 3, 4);
insert into aluno (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('marcos', 2, '22222222222', 3, 1, 1, 3);
insert into aluno (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('alice', 2, '22222222222', 2, 2, 3, 1);

insert into professor (nome, matricula, cpf, carga_horaria, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('caio', 1, '11111111111', '02:00:00', 2, 1, 2, 1);
insert into professor (nome, matricula, cpf, carga_horaria, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('diego', 2, '22222222222', '04:00:00', 3, 1, 3, 2);
insert into professor (nome, matricula, cpf, carga_horaria, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('maria', 3, '33333333333', '06:00:00', 1, 2, 3, 4);
insert into professor (nome, matricula, cpf, carga_horaria, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('mateus', 2, '22222222222', '08:00:00', 3, 1, 1, 3);
insert into professor (nome, matricula, cpf, carga_horaria, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('larissa', 2, '22222222222', '10:00:00', 2, 2, 3, 1);

insert into funcionario (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('lucas', 1, '11111111111', 2, 1, 2, 1);
insert into funcionario (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('leonado',2, '22222222222', 3, 1, 3, 2);
insert into funcionario (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('julia', 3, '33333333333', 1, 2, 3, 4);
insert into funcionario (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('glauco', 2, '22222222222', 3, 1, 1, 3);
insert into funcionario (nome, matricula, cpf, id_estado_civil, id_sexo, id_cor_pele, id_naturalidade) values ('joana', 2, '22222222222', 2, 2, 3, 1);

insert into tipo_endereco (descricao) values ('quadra');
insert into tipo_endereco (descricao) values ('rua');
insert into tipo_endereco (descricao) values ('avenida');
insert into tipo_endereco (descricao) values ('lote');
insert into tipo_endereco (descricao) values ('outros');

insert into cidade (nome, id_uf) values ('brasilia', 1);
insert into cidade (nome, id_uf) values ('taguatinga', 1);
insert into cidade (nome, id_uf) values ('ceilandia', 1);
insert into cidade (nome, id_uf) values ('sao paulo', 2);
insert into cidade (nome, id_uf) values ('vazante', 5);

insert into bairro (descricao, id_cidade) values ('asa norte', 1);
insert into bairro (descricao, id_cidade) values ('asa sul', 1);
insert into bairro (descricao, id_cidade) values ('p sul', 1);
insert into bairro (descricao, id_cidade) values ('avenida sp', 4);
insert into bairro (descricao, id_cidade) values ('quadra 24', 5);

insert into endereco (rua, complemento, numero, cep, id_aluno, id_bairro, id_tipo_endereco) values ('sqn 306', null, 1, 70000, 1, 1, 1);
insert into endereco (rua, complemento, numero, cep, id_aluno, id_bairro, id_tipo_endereco) values ('sqn 305', null, 3, 70001, 2, 1, 3);
insert into endereco (rua, complemento, numero, cep, id_aluno, id_bairro, id_tipo_endereco) values ('qnp 18', null, 2, 70003, 3, 3, 4);
insert into endereco (rua, complemento, numero, cep, id_aluno, id_bairro, id_tipo_endereco) values ('sqs 10', null, 5, 70005, 2, 4, 2);
insert into endereco (rua, complemento, numero, cep, id_aluno, id_bairro, id_tipo_endereco) values ('sqs 306', null, 1, 70000, 5, 3, 4);

insert into endereco (rua, complemento, numero, cep, id_professor, id_bairro, id_tipo_endereco) values ('sqn 307', null, 1, 70002, 1, 1, 1);
insert into endereco (rua, complemento, numero, cep, id_professor, id_bairro, id_tipo_endereco) values ('sqn 302', null, 3, 70009, 2, 1, 3);
insert into endereco (rua, complemento, numero, cep, id_professor, id_bairro, id_tipo_endereco) values ('qnp 14', null, 2, 70002, 3, 3, 4);
insert into endereco (rua, complemento, numero, cep, id_professor, id_bairro, id_tipo_endereco) values ('sqs 12', null, 5, 70007, 2, 4, 2);
insert into endereco (rua, complemento, numero, cep, id_professor, id_bairro, id_tipo_endereco) values ('sqs 308', null, 1, 70009, 5, 3, 4);

insert into endereco (rua, complemento, numero, cep, id_funcionario, id_bairro, id_tipo_endereco) values ('sqn 300', null, 1, 70010, 1, 1, 1);
insert into endereco (rua, complemento, numero, cep, id_funcionario, id_bairro, id_tipo_endereco) values ('sqn 306', null, 3, 70011, 2, 1, 3);
insert into endereco (rua, complemento, numero, cep, id_funcionario, id_bairro, id_tipo_endereco) values ('qnp 19', null, 2, 70013, 3, 3, 4);
insert into endereco (rua, complemento, numero, cep, id_funcionario, id_bairro, id_tipo_endereco) values ('sqs 14', null, 5, 70016, 2, 4, 2);
insert into endereco (rua, complemento, numero, cep, id_funcionario, id_bairro, id_tipo_endereco) values ('sqs 307', null, 1, 70018, 5, 3, 4);

insert into tipo_telefone (descricao) values ('celular');
insert into tipo_telefone (descricao) values ('fixo');

insert into telefone (ddd, numero, id_tipo_telefone, id_aluno) values (61, 12345, 1, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_aluno) values (61, 67890, 2, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_aluno) values (61, 11111, 1, 3);
insert into telefone (ddd, numero, id_tipo_telefone, id_aluno) values (11, 22222, 2, 4);
insert into telefone (ddd, numero, id_tipo_telefone, id_aluno) values (21, 33333, 1, 5);

insert into telefone (ddd, numero, id_tipo_telefone, id_professor) values (61, 41235, 1, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_professor) values (61, 75634, 2, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_professor) values (61, 88888, 1, 3);
insert into telefone (ddd, numero, id_tipo_telefone, id_professor) values (11, 42568, 2, 4);
insert into telefone (ddd, numero, id_tipo_telefone, id_professor) values (21, 99999, 1, 5);

insert into telefone (ddd, numero, id_tipo_telefone, id_funcionario) values (61, 55555, 1, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_funcionario) values (61, 17987, 2, 1);
insert into telefone (ddd, numero, id_tipo_telefone, id_funcionario) values (61, 32156, 1, 3);
insert into telefone (ddd, numero, id_tipo_telefone, id_funcionario) values (11, 77777, 2, 4);
insert into telefone (ddd, numero, id_tipo_telefone, id_funcionario) values (21, 66666, 1, 5);

insert into tipo_email (descricao) values ('pessoal');
insert into tipo_email (descricao) values ('corporativo');
insert into tipo_email (descricao) values ('webemail');
insert into tipo_email (descricao) values ('serviço');
insert into tipo_email (descricao) values ('domínio próprio');

insert into email (nome, id_aluno, id_tipo_email) values ('luan@gmail.com', 1, 1);
insert into email (nome, id_aluno, id_tipo_email) values ('jose@outlook.com',2, 1);
insert into email (nome, id_aluno, id_tipo_email) values ('katia@hotmail.com', 3, 4);
insert into email (nome, id_aluno, id_tipo_email) values ('marcos@yahoo.com', 4, 5);
insert into email (nome, id_aluno, id_tipo_email) values ('alice@unb.com', 5, 2);

insert into email (nome, id_professor, id_tipo_email) values ('caio@gmail.com', 1, 1);
insert into email (nome, id_professor, id_tipo_email) values ('diego@outlook.com', 2, 1);
insert into email (nome, id_professor, id_tipo_email) values ('maria@hotmail.com', 3, 4);
insert into email (nome, id_professor, id_tipo_email) values ('mateus@yahoo.com', 4, 5);
insert into email (nome, id_professor, id_tipo_email) values ('larissa@unb.com', 5, 2);

insert into email (nome, id_funcionario, id_tipo_email) values ('lucas@gmail.com', 1, 1);
insert into email (nome, id_funcionario, id_tipo_email) values ('leonado@outlook.com', 2, 1);
insert into email (nome, id_funcionario, id_tipo_email) values ('julia@hotmail.com', 3, 4);
insert into email (nome, id_funcionario, id_tipo_email) values ('glauco@yahoo.com', 4, 5);
insert into email (nome, id_funcionario, id_tipo_email) values ('joana@unb.com', 5, 2);

insert into afiliacao (nome_pai, nome_mae, id_aluno) values ('wanderley', 'glaucia', 1);
insert into afiliacao (nome_pai, nome_mae, id_aluno) values ('joao', 'isabela', 2);
insert into afiliacao (nome_pai, nome_mae, id_aluno) values ('vinicius', 'beatriz', 3);
insert into afiliacao (nome_pai, nome_mae, id_aluno) values ('miguel', 'claudia', 4);
insert into afiliacao (nome_pai, nome_mae, id_aluno) values ('bruno', 'carol', 5);

insert into afiliacao (nome_pai, nome_mae, id_professor) values ('gabriel', 'fernanda', 1);
insert into afiliacao (nome_pai, nome_mae, id_professor) values ('pedro', 'clara', 2);
insert into afiliacao (nome_pai, nome_mae, id_professor) values ('luis', 'amanda', 3);
insert into afiliacao (nome_pai, nome_mae, id_professor) values ('alexandre', 'taís', 4);
insert into afiliacao (nome_pai, nome_mae, id_professor) values ('rafael', 'jessica', 5);

insert into emprestimo (data_emprestimo, id_aluno, id_funcionario) values ('2018-11-18', 1, 3);
insert into emprestimo (data_emprestimo, id_aluno, id_funcionario) values ('2018-11-18', 2, 4);
insert into emprestimo (data_emprestimo, id_aluno, id_funcionario) values ('2018-11-18', 3, 1);
insert into emprestimo (data_emprestimo, id_aluno, id_funcionario) values ('2018-11-18', 4, 4);
insert into emprestimo (data_emprestimo, id_aluno, id_funcionario) values ('2018-11-18', 5, 2);

insert into emprestimo (data_emprestimo, id_professor, id_funcionario) values ('2018-10-23', 1, 2);
insert into emprestimo (data_emprestimo, id_professor, id_funcionario) values ('2018-10-23', 2, 1);
insert into emprestimo (data_emprestimo, id_professor, id_funcionario) values ('2018-10-23', 3, 5);
insert into emprestimo (data_emprestimo, id_professor, id_funcionario) values ('2018-10-23', 4, 3);
insert into emprestimo (data_emprestimo, id_professor, id_funcionario) values ('2018-10-23', 5, 4);

insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega, data_devolucao) values (2, 1, '2018-10-23', '2019-01-10');
insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega, data_devolucao) values (1, 3, '2018-11-24', '2019-01-11');
insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega, data_devolucao) values (4, 2, '2018-12-26', '2019-01-12');
insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega, data_devolucao) values (1, 5, '2018-09-22', '2019-01-13');
insert into livro_emprestimo (id_livro, id_emprestimo, data_entrega, data_devolucao) values (5, 2, '2018-10-19', '2019-01-14');

insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) values (2, 1, '2019-03-10', '10.00', '20.00', '16:00:00');
insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) values (1, 3, '2019-02-11', '12.00', '25.00', '13:00:00');
insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) values (4, 2, '2019-02-06', '8.00', '15.00', '15:00:00');
insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) values (1, 5, '2019-01-17', '20.00', '36.00', '10:00:00');
insert into pagamento (id_livro, id_emprestimo, data_pagamento, valor_atraso, valor_pago, hora_pagamento) values (5, 2, '2019-01-19', '13.00', '26.00', '19:00:00');

insert into titulacao (descricao) values ('mestrado');
insert into titulacao (descricao) values ('doutorado');
insert into titulacao (descricao) values ('especialização');
insert into titulacao (descricao) values ('mba');
insert into titulacao (descricao) values ('mestrado profissional');

insert into professor_titulacao (id_titulacao, id_professor, ano) values (2, 1, '2010-01-10');
insert into professor_titulacao (id_titulacao, id_professor, ano) values (1, 3, '2000-03-15');
insert into professor_titulacao (id_titulacao, id_professor, ano) values (5, 4, '2006-01-14');
insert into professor_titulacao (id_titulacao, id_professor, ano) values (3, 5, '2005-02-20');
insert into professor_titulacao (id_titulacao, id_professor, ano) values (1, 2, '2009-02-21');

insert into reserva (data_reserva, id_aluno) values ('2018-08-21', 1);
insert into reserva (data_reserva, id_aluno) values ('2018-08-21', 4);
insert into reserva (data_reserva, id_aluno) values ('2018-08-21', 2);
insert into reserva (data_reserva, id_aluno) values ('2018-08-21', 5);
insert into reserva (data_reserva, id_aluno) values ('2018-08-21', 2);

insert into reserva (data_reserva, id_professor) values ('2018-08-21', 3);
insert into reserva (data_reserva, id_professor) values ('2018-08-21', 1);
insert into reserva (data_reserva, id_professor) values ('2018-08-21', 5);
insert into reserva (data_reserva, id_professor) values ('2018-08-21', 2);
insert into reserva (data_reserva, id_professor) values ('2018-08-21', 2);

insert into reserva_livro (id_livro, id_reserva) values (2, 4);
insert into reserva_livro (id_livro, id_reserva) values (3, 5);
insert into reserva_livro (id_livro, id_reserva) values (1, 4);
insert into reserva_livro (id_livro, id_reserva) values (5, 2);
insert into reserva_livro (id_livro, id_reserva) values (4, 1);

insert into habilidade (descricao) values ('manutenção');
insert into habilidade (descricao) values ('contador');
insert into habilidade (descricao) values ('organização');
insert into habilidade (descricao) values ('comunicação');
insert into habilidade (descricao) values ('descrição');

insert into habilidade_funcionario (id_habilidade, id_funcionario) values (1, 3);
insert into habilidade_funcionario (id_habilidade, id_funcionario) values (1, 1);
insert into habilidade_funcionario (id_habilidade, id_funcionario) values (2, 4);
insert into habilidade_funcionario (id_habilidade, id_funcionario) values (4, 2);
insert into habilidade_funcionario (id_habilidade, id_funcionario) values (3, 5);

insert into dependente (nome, id_professor) values ('flavio', 3);
insert into dependente (nome, id_professor) values ('italo', 2);
insert into dependente (nome, id_professor) values ('barbara', 5);
insert into dependente (nome, id_professor) values ('alexandra', 1);
insert into dependente (nome, id_professor) values ('eduardo', 4);

insert into dependente (nome, id_funcionario) values ('natalia', 3);
insert into dependente (nome, id_funcionario) values ('vitoria', 2);
insert into dependente (nome, id_funcionario) values ('carlos', 5);
insert into dependente (nome, id_funcionario) values ('vitor', 1);
insert into dependente (nome, id_funcionario) values ('guilherme', 4);


COMMIT;