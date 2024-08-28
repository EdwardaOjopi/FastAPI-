# Usar uma imagem base oficial do Python
FROM python:alpine3.19

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da API para o diretório de trabalho
COPY . .

# Expor a porta que o FastAPI usará para rodar
EXPOSE 8000

# Comando para rodar a aplicação com Uvicorn
CMD ["main:app", "--host", "0.0.0.0", "--port", "8000"]