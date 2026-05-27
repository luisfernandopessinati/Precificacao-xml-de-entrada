
📦 Sistema de Precificação com Importação de NF-e

Sistema desktop desenvolvido em Delphi (Object Pascal) para importação de XML de NF-e, análise de itens e formação de preço baseada em custos, impostos e markup.

🚀 Visão Geral

Este projeto tem como objetivo automatizar o processo de precificação de produtos a partir de notas fiscais eletrônicas, permitindo:

Importação de XML de NF-e
Leitura automática de produtos e impostos
Rateio de custos (frete, despesas, custos fixos e variáveis)
Cálculo de preço baseado em markup
Geração de relatórios em CSV
Visualização detalhada por item


🧠 Conceito de Precificação

O sistema trabalha com estrutura de custo completo:

Custo do produto (NF-e)
ICMS, IPI, PIS, COFINS, ST, DIFAL
Frete e despesas adicionais
Custos fixos e variáveis
Markup aplicado para formação de preço


📊 Fórmula de lucro utilizada (markup)

O lucro é calculado com base no custo total e markup desejado:

Lucro = (CustoTotal × (Markup / (1 - Markup)))  



⚙️ Funcionalidades

📥 Importação de XML
Leitura de NF-e diretamente do arquivo XML
Extração de:
Produtos
Quantidades
Valores unitários
Impostos
Totais da nota

📊 Cálculo de Precificação
Rateio de frete por valor da nota
Rateio de despesas gerais
Aplicação de custos fixos e variáveis
Cálculo de impostos por item
Aplicação de markup para preço final

🧾 Exportação
Exportação dos dados para CSV
Compatível com Excel e sistemas externos

🎨 Interface
Grid com destaque por cores:
🟡 Custos básicos
🔴 Encargos e custos adicionais
🟢 Preço final e total
🧩 Campos do Sistema

O dataset de itens contém:

📦 Dados do produto
Código
Descrição
Unidade de medida
NCM
Quantidade
Valor unitário

💰 Custos e impostos
ICMS
IPI
PIS
COFINS
ST
DIFAL

📊 Formação de preço
Frete
Despesas
Custos fixos
Custos variáveis
Lucro
Total
Preço final

📂 Exportação CSV

Permite exportar todos os dados do dataset para análise externa:

Separador: ;
Compatível com Excel
Inclui todos os campos visíveis

🛠️ Tecnologias
Delphi (Object Pascal)
VCL (Visual Component Library)
XML DOM (NF-e)
TDataSet / ClientDataSet
CSV export manual

📌 Fluxo do Sistema
1. Carregar XML da NF-e
2. Extrair produtos e impostos
3. Calcular custo por item
4. Ratear despesas e frete



5. Aplicar markup
6. Gerar preço final
7. Exportar dados (opcional)
