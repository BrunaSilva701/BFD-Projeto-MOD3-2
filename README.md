# Projeto-BFD-MOD3-2-BancoDeDados

##🥕 Projeto Horta Comunitária: Resumo do Sistema
🎯 Objetivo Resumido
O sistema gerencia o ciclo completo de um projeto de horta comunitária: do plantio realizado por voluntários até a doação dos produtos colhidos a instituições de caridade.

🏛️ Entidades Centrais do Banco de Dados
O banco de dados é estruturado em torno de quatro entidades principais:
```text
+------------------+--------------------------------------+-----------------------------------------+
|     ENTIDADE     |               PROPÓSITO              |             RELAÇÕES CHAVE              |
+==================+======================================+=========================================+
| Voluntario       | Quem realiza as atividades.          | Relaciona-se com Cultivo/Plantio.       |
+------------------+--------------------------------------+-----------------------------------------+
| Instituicao      | Quem recebe os alimentos doados.     | Relaciona-se com Doacao, Telefone e     |
|                  |                                      | Endereco.                               |
+------------------+--------------------------------------+-----------------------------------------+
| Canteiro         | Onde o cultivo é realizado.          | Relaciona-se com Cultivo/Plantio,       |
|                  |                                      | Colheita e Planta.                      |
+------------------+--------------------------------------+-----------------------------------------+
| Planta           | O que está sendo cultivado.          | Relaciona-se com Canteiro.              |
+------------------+--------------------------------------+-----------------------------------------+
```

##🔄 Fluxo de Funcionamento (Ações e Dependências)
O funcionamento do sistema segue um ciclo lógico:

Montagem: O Voluntario usa um Canteiro para o Cultivo/Plantio de uma determinada Planta.

Rastreamento: A tabela Canteiro_has_Planta rastreia quais plantas estão em quais canteiros.

Saída de Produtos: O produto é retirado da horta através da ação de Colheita (que depende do Canteiro).

Distribuição: O produto colhido é registrado como Doacao (que depende da Colheita).

Destino Final: A tabela Doacao_has_Instituicao distribui a Doacao para uma ou mais Instituicoes cadastradas no sistema.

Informações Complementares: Os dados de Telefone e Endereco fornecem as informações de contato e localização das Instituicoes.


