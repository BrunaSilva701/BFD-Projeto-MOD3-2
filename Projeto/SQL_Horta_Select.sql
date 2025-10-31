-- 1. Liste todos os voluntários cadastrados e suas respectivas funções
select v.nome as Voluntario, v.funcao as Função 
from voluntario v 
order by nome asc;

-- 2. Mostre as plantas cultivadas em cada canteiro, com o nome do canteiro e a data de plantio (retirar o / de cultio/plantio.)
select p.Nome as Planta, c.Nome as Canteiro, cp.DataHora as Data
from Cultivo_Plantio cp
join Canteiro c on c.idCanteiro = cp.Canteiro_idCanteiro
join Planta p on p.idPlanta = cp.Planta_idPlanta
order by c.Nome, cp.DataHora;


-- 3. Exiba os nomes dos voluntarios e as plantas que eles cultivaram (fazer um fk de voluntario em planta)
select v.Nome as Voluntario, p.Nome as Planta
from Cultivo_Plantio cp
join Voluntario v on v.CPF = cp.Voluntario_CPF
join Planta p on p.idPlanta = cp.Planta_idPlanta
order by v.Nome;

-- 4. Liste todas as colheitas realizadas, mostrando o canteiro e a quantidade colhida(em kg)
select c.idColheita as Colheita, c.quantidade as Quantidade 
from colheita c 
where status = 'realizada';

-- 5. Mostre as instituições que receberam doações e as quantidades doadas
select i.nome as Instituicao, d.quantidade as Quantidade 
from doacao d 
join doacao_has_instituicao di on d.idDoacao=di.Doacao_IdDoacao
join instituicao i on i.cnpj=di.Instituicao_CNPJ;

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.


