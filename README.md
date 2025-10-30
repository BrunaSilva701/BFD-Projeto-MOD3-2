# Projeto-BFD-MOD3-2-BancoDeDados

## 🥕 Projeto Horta Comunitária: Resumo do Sistema
### 🎯 Objetivo Resumido
O sistema gerencia o ciclo completo de um projeto de horta comunitária: do plantio realizado por voluntários até a doação dos produtos colhidos a instituições de caridade.

### 🏛️ Entidades do Banco de Dados
O banco de dados é estruturado em torno das entidades:
```
+------------------+--------------------------------------+-----------------------------------------+
|     ENTIDADE     |               PROPÓSITO              |             RELAÇÕES CHAVE              |
+==================+======================================+=========================================+
| Voluntario       | Quem realiza as atividades.          | Relaciona-se com Cultivo                |
+------------------+--------------------------------------+-----------------------------------------+
| Instituicao      | Quem recebe os alimentos doados.     | Relaciona-se com Doacao, Telefone e     |
|                  |                                      | Endereco.                               |
+------------------+--------------------------------------+-----------------------------------------+
| Canteiro         | Onde o cultivo é realizado.          | Relaciona-se com Cultivo/Plantio,       |
|                  |                                      | Colheita e Planta.                      |
+------------------+--------------------------------------+-----------------------------------------+
| Planta           | O que está sendo cultivado.          | Relaciona-se com Canteiro.              |
+------------------+--------------------------------------+-----------------------------------------+
| Cultivo          | Quando é cultivado                   | Relaciona-se com Voluntario e Canteiro. |
+------------------+--------------------------------------+-----------------------------------------+
| Colheita         | Quando é colhido                     | Relaciona-se com Canteiro e Doação.     |
+------------------+--------------------------------------+-----------------------------------------+
| Doação           | Quando é doado                       | Relaciona-se com Colheita e instituição |
+------------------+--------------------------------------+-----------------------------------------+
```

### 🔄 Fluxo de Funcionamento (Ações e Dependências)
```
● O funcionamento do sistema segue um ciclo lógico:
► Montagem: O Voluntario usa um Canteiro para o Cultivo/Plantio de uma determinada Planta.

► Rastreamento: A tabela Canteiro_has_Planta rastreia quais plantas estão em quais canteiros.

► Saída de Produtos: O produto é retirado da horta através da ação de Colheita (que depende do Canteiro).

► Distribuição: O produto colhido é registrado como Doacao (que depende da Colheita).

► Destino Final: A tabela Doacao_has_Instituicao distribui a Doacao para uma ou mais Instituicoes cadastradas no sistema.

► Informações Complementares: Os dados de Telefone e Endereco fornecem as informações de contato e localização das Instituicoes.
```

### 📖 Proposito de cada consulta
**1. Liste todos os voluntários cadastrados e suas respectivas funções.**

**Propósito:**
Mostrar quem são os voluntários e o que cada um faz dentro da horta.

---
**2. Mostre as plantas cultivadas em cada canteiro, com o nome do canteiro e a data do plantio.**

**Propósito:**
Exibir quais plantas estão em cada canteiro e quando foram plantadas.

---
**3. Exiba os nomes dos voluntários e as plantas que eles cultivaram.**

**Propósito:**
Relacionar os voluntários diretamente às plantas de que cuidaram.

---
 **4. Liste todas as colheitas realizadas, mostrando o canteiro e a quantidade colhida (em kg).**

**Propósito:**
Apresentar um histórico das colheitas feitas — de onde vieram e quanto foi colhido.

---
**5. Mostre as instituições que receberam doações e as quantidades doadas.**

**Propósito:**
Indicar para quais instituições a horta doou produtos e em que quantidade.

---
**6. Liste o total de quilos doados por instituição (use GROUP BY).**

**Propósito:**
Somar o total de doações feitas para cada instituição.

---
**7. Mostre os canteiros que ainda não tiveram colheitas (use LEFT JOIN).**

**Propósito:**
Verificar quais canteiros ainda não foram colhidos — ou seja, onde ainda há plantações em crescimento.

---
**8. Exiba o voluntário que realizou o maior número de cultivos (use COUNT e ORDER BY).**

**Propósito:**
Identificar o voluntário mais ativo no plantio (quem mais participou de cultivos).

---
**9. Mostre as plantas que ainda não foram colhidas (utilizando subconsulta ou LEFT JOIN).**

**Propósito:**
Descobrir quais plantas estão plantadas, mas ainda não foram colhidas

---
**10. Liste todas as doações realizadas em setembro de 2025, com o nome da instituição e a data da doação.**

**Propósito:**
Exibir um relatório de doações em um mês específico (setembro de 2025).