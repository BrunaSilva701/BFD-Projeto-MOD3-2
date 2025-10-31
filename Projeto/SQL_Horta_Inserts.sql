INSERT INTO Voluntario (Nome, Funcao) VALUES
('Maria Oliveira', 'Plantio'),
('Pedro Rocha', 'Colheita'),
('Juliana Lima', 'Irrigação'),
('Ricardo Souza', 'Adubação'),
('Sofia Mendes', 'Controle de Pragas'),
('Gabriel Ferreira', 'Limpeza'),
('Laura Nogueira', 'Plantio'),
('Mateus Gomes', 'Colheita'),
('Alice Barros', 'Manutenção'),
('Bernardo Pires', 'Distribuição');


INSERT INTO `Instituicao` (`CNPJ`, `Nome`) VALUES
('11223344000101', 'Abrigo Florescer'),
('22334455000102', 'Casa da Esperança'),
('33445566000103', 'ONG Mãos Amigas'),
('44556677000104', 'Hospital Infantil Luz'),
('55667788000105', 'Creche do Saber'),
('66778899000106', 'Asilo Vovô Feliz'),
('77889900000107', 'Banco de Alimentos Central'),
('88990011000108', 'Comunidade Viva'),
('99001122000109', 'Cozinha Solidária'),
('00112233000110', 'Instituto de Apoio Jovem');

INSERT INTO `Canteiro` (`Nome`, `Tamanho(m2)`) VALUES
('Canteiro Principal A', 50),
('Canteiro Suspenso B', 25),
('Canteiro de Ervas C', 10),
('Canteiro de Raízes D', 40),
('Canteiro Experimental E', 15),
('Canteiro Vertical F', 5),
('Canteiro Principal G', 60),
('Canteiro de Frutas H', 30),
('Canteiro das Flores I', 20),
('Canteiro de Teste J', 5);

INSERT INTO `Planta` (`Nome`, `Quantidade`) VALUES
('Alface Crespa', '100 sementes'),
('Tomate Cereja', '50 mudas'),
('Salsinha', '20 gramas'),
('Cenoura', '150 sementes'),
('Couve Manteiga', '30 mudas'),
('Alecrim', '10 pés'),
('Morango', '25 mudas'),
('Quiabo', '80 sementes'),
('Beterraba', '120 sementes'),
('Manjericão', '5 pés');

INSERT INTO `Cultivo_Plantio` (`DataHora`, `Status`, `Voluntario_CPF`, `Canteiro_idCanteiro`, `Planta_idPlanta`) VALUES
('2025-01-10 10:00:00', 'Plantado', 1, 1, 1),
('2025-01-15 11:30:00', 'Crescendo', 2, 2, 2),
('2025-01-20 14:00:00', 'Colhido', 3, 3, 3),
('2025-02-01 09:00:00', 'Crescendo', 4, 4, 4),
('2025-02-10 13:00:00', 'Plantado', 5, 5, 5),
('2025-03-05 10:30:00', 'Colhido', 6, 6, 6),
('2025-03-15 15:00:00', 'Crescendo', 7, 7, 7),
('2025-04-01 08:00:00', 'Plantado', 8, 8, 8),
('2025-04-10 12:00:00', 'Colhido', 9, 9, 9),
('2025-04-20 16:00:00', 'Crescendo', 10, 10, 10);



INSERT INTO `Canteiro_has_Planta` (`Canteiro_idCanteiro`, `Planta_idPlanta`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 1);

INSERT INTO `Colheita` (`DataHora`, `Quantidade`, `Status`, `Canteiro_idCanteiro`) VALUES
('2025-02-05 15:00:00', '5 Kg', 'Realizada', 1),
('2025-02-28 09:00:00', '2 Kg', 'Realizada', 2),
('2025-03-10 11:30:00', '0.5 Kg', 'Realizada', 3),
('2025-04-01 14:00:00', '8 Kg', 'Realizada', 4),
('2025-04-15 10:00:00', '3 Kg', 'Planejada', 5),
('2025-05-01 08:00:00', '1 Kg', 'Realizada', 6),
('2025-05-15 16:00:00', '10 Kg', 'Planejada', 7),
('2025-06-01 12:00:00', '4 Kg', 'Realizada', 8),
('2025-06-15 09:30:00', '6 Kg', 'Planejada', 9),
('2025-07-01 13:00:00', '2.5 Kg', 'Realizada', 10);

INSERT INTO `Doacao` (`DataHora`, `Quantidade`, `Colheita_idColheita`) VALUES
('2025-02-06 10:00:00', '5 Kg', 1),
('2025-03-01 11:30:00', '2 Kg', 2),
('2025-03-11 14:00:00', '0.5 Kg', 3),
('2025-04-02 09:00:00', '8 Kg', 4),
('2025-05-02 13:00:00', '1 Kg', 6),
('2025-06-02 10:30:00', '4 Kg', 8),
('2025-07-02 15:00:00', '2.5 Kg', 10),
('2025-02-06 16:00:00', '1 Kg', 1),
('2025-04-02 11:00:00', '3 Kg', 4),
('2025-06-02 08:00:00', '1 Kg', 8);

INSERT INTO `Doacao_has_Instituicao` (`Doacao_idDoacao`, `Instituicao_CNPJ`) VALUES
(1, '11223344000101'),
(2, '22334455000102'),
(3, '33445566000103'),
(4, '44556677000104'),
(5, '55667788000105'),
(6, '66778899000106'),
(7, '77889900000107'),
(8, '88990011000108'),
(9, '99001122000109'),
(10, '00112233000110');

INSERT INTO `Telefone` (`Numero`, `Instituicao_CNPJ`) VALUES
('3133331111', '11223344000101'),
('3133332222', '22334455000102'),
('3133333333', '33445566000103'),
('3133334444', '44556677000104'),
('3133335555', '55667788000105'),
('3133336666', '66778899000106'),
('3133337777', '77889900000107'),
('3133338888', '88990011000108'),
('3133339999', '99001122000109'),
('3133330000', '00112233000110');

INSERT INTO `Endereco` (`UF`, `Cidade`, `Bairro`, `Rua`, `Numero`, `CEP`, `Complemento`, `Instituicao_CNPJ`) VALUES
('MG', 'Belo Horizonte', 'Savassi', 'Rua dos Inconfidentes', 100, '30110-000', 'Loja 1', '11223344000101'),
('SP', 'São Paulo', 'Pinheiros', 'Rua Cardeal Arcoverde', 550, '05407-000', 'Bloco B', '22334455000102'),
('RJ', 'Rio de Janeiro', 'Botafogo', 'Av. Venceslau', 12, '22261-001', 'Prédio', '33445566000103'),
('BA', 'Salvador', 'Pituba', 'R. Manoel Dias', 800, '41830-000', 'Sala 301', '44556677000104'),
('PR', 'Curitiba', 'Centro', 'Rua XV de Novembro', 950, '80020-000', 'Fundos', '55667788000105'),
('PE', 'Recife', 'Boa Viagem', 'Av. Boa Viagem', 4000, '51021-000', 'Apto 202', '66778899000106'),
('CE', 'Fortaleza', 'Aldeota', 'R. Maria Tomásia', 77, '60150-170', 'Galpão', '77889900000107'),
('DF', 'Brasília', 'Asa Sul', 'SQS 104 Sul', 33, '70343-000', 'NULL', '88990011000108'),
('RS', 'Porto Alegre', 'Moinhos de Vento', 'R. Padre Chagas', 200, '90570-010', 'Cozinha', '99001122000109'),
('AM', 'Manaus', 'Centro', 'Av. Sete de Setembro', 15, '69005-140', '1º Andar', '00112233000110');
