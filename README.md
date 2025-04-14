# Chat RAG Azure

Este projeto é um sistema de Recuperação e Geração (RAG) que utiliza técnicas de Processamento de Linguagem Natural e Inteligência Artificial. Ele é alimentado por arquivos PDF que servem como contexto para a IA gerar respostas na interface de bate-papo.



## Estrutura do Projeto

- `context_pdfs/`: Diretório para armazenar arquivos PDF que servem como contexto para as respostas da IA.
- `extract_text.py`: Script para extrair texto dos PDFs.
- `create_embeddings.py`: Script para gerar embeddings a partir do texto extraído.
- `index_embeddings.py`: Script para indexar os embeddings para busca eficiente.
- `search.py`: Script que implementa a lógica de busca.
- `chat_interface.py`: Interface de chat para interação com o sistema.
- `terraform/`: Diretório contendo a configuração do Terraform para implantação na Azure.
- `requirements.txt`: Lista de dependências do projeto.

## Instruções de Uso

1. **Instalação das Dependências:**
   - Crie um ambiente virtual e ative-o:
     ```bash
     python -m venv venv
     source venv/bin/activate  # Para Linux/Mac
     venv\Scripts\activate  # Para Windows
     ```
   - Instale as dependências:
     ```bash
     pip install -r requirements.txt
     ```

2. **Login no Azure:**
   - Antes de implantar os recursos, faça login na sua conta do Azure usando o comando:
     ```bash
     az login
     ```

3. **Adicionar PDFs:**
   - Coloque seus arquivos PDF no diretório `context_pdfs`.

4. **Extrair Texto dos PDFs:**
   - Execute o script para extrair texto:
     ```bash
     python extract_text.py
     ```

5. **Gerar Embeddings:**
   - Execute o script para criar embeddings:
     ```bash
     python create_embeddings.py
     ```

6. **Indexar Embeddings:**
   - Execute o script para indexar os embeddings:
     ```bash
     python index_embeddings.py
     ```

7. **Executar a Interface de Chat:**
   - Execute o script da interface de chat:
     ```bash
     streamlit run chat_interface.py
     ```

## Configuração do Terraform

1. **Configurar o arquivo `.env`:**
   - Preencha suas credenciais do Azure no arquivo `.env`.

2. **Implantar na Azure:**
   - Navegue até o diretório `terraform` e execute:
     ```bash
     terraform init
     terraform plan
     terraform apply -auto-approve
     ```

## Contribuições

Sinta-se à vontade para contribuir com melhorias ou correções!
