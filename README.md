# Projeto LaTeX para Dissertação de Mestrado (UFSC)

Este projeto foi configurado para seguir o layout da sua dissertação de mestrado, utilizando a classe `abntex2` para garantir a conformidade com as normas da ABNT.

## Como usar no Overleaf

1.  Crie um novo projeto no Overleaf (New Project -> Blank Project).
2.  Faça o upload de todos os arquivos e pastas deste diretório para o Overleaf.
    *   Você pode zipar tudo (`zip -r projeto.zip .`) e fazer o upload do arquivo ZIP.
3.  Defina o arquivo `main.tex` como o arquivo principal (Main Document), se o Overleaf não o fizer automaticamente.
4.  Clique em "Recompile".

## Estrutura do Projeto

*   `main.tex`: Arquivo principal que une todos os componentes.
*   `setup.tex`: Configurações de pacotes e layout.
*   `references.bib`: Arquivo de bibliografia.
*   `pretextual/`: Contém capa, folha de rosto, aprovação, resumo, etc.
*   `chapters/`: Contém os capítulos do trabalho.

## Personalização

*   **Dados do Trabalho**: Edite o arquivo `setup.tex` para alterar título, autor, orientador, etc.
*   **Capítulos**: Adicione novos capítulos na pasta `chapters/` e inclua-os no `main.tex` usando `\input{chapters/nome_do_arquivo}`.
*   **Bibliografia**: Adicione suas referências no arquivo `references.bib`.
