# Serverless Framework ではじめる Serverless ハンズオン

- _2020-03-12 Takatoshi KURIYAMA_

Serverless Framework を使った AWS Lambda に関数を作成するサンプルです。

以下の言語を想定しています。

- aws-python3

## aws-python3

Create function with python3 template.

```powershell
PS> serverless create --template aws-python3 --path aws-python3 --name serverless-python
```

Change `serverless.yml`.

- to deploy to Tokyo region.
- set instance size.
- set timeout.
- output logs.
- define http path and method.

`serverless` commands tell us if we have yaml error like below.

```powershell
PS> serverless info --verbose

  Y A M L Exception --------------------------------------

  bad indentation of a mapping entry in "C:\Users\takatoshi\dev\github.com\krymtkts\serverless-handson\aws-python3\serverless.yml" at line 71, column 4:
         events:
         ^
```

Check your deploy configuration with dry-run mode. add `--noDeploy` option.

```powershell
PS> serverless deploy --verbose --noDeploy
```

The dry-run mode before first deployment has a bug with 'logs: rest Api' option. reproduce in version 1.60.1.

```powershell
serverless deploy --verbose --noDeploy
Serverless: Packaging service...
Serverless: Excluding development dependencies...
Serverless: Installing dependencies for custom CloudFormation resources...

  Serverless Error ---------------------------------------

  Rest API id could not be resolved.
  This might be caused by a custom API Gateway configuration.

  In given setup stage specific options such as `tracing`, `logs` and `tags` are not supported.

  Please update your configuration (or open up an issue if you feel that there's a way to support your setup).
```

Deploy.

```powershell
PS> serverless deploy --verbose
```

Execute your function.

```powershell
PS> serverless invoke --function hello
```
