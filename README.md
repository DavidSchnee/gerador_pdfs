# Gerador PDF Lambda

AWS Lambda function para gerar PDFs

## Dependências

- Ruby 2.7.0
- [AWS CLI](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)

## Testando

Utilizando o AWS CLI:

```
aws lambda invoke \
  --function-name GeradorPdfs \
  --payload fileb://./payload.json \
  ./gerador_pdfs.txt
```

## Deploy

É necessário garantir que a pasta vendor contenha todas as dependências:
```
bundle install
bundle config set --local deployment 'true'
bundle install --without development test
```

Para enviar o código fonte enviar o código fonte para a AWS, basta zipar o arquivo e enviar:

```
zip -r ../gerador_pdfs.zip lambda_function.rb lib vendor config

aws lambda update-function-code \
  --function-name GeradorPdfs \
  --zip-file fileb://../gerador_pdfs.zip \
  --profile david_pessoal
