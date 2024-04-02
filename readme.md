# ccc 2024 well-archtechitected framework azure

## Introduction
azure の well-architected framework にできるだけ従った構成で作られたリソースを作成するためのテンプレートです。

## architecture
![architecture](./docs/architecture.png)

## deploy
```bash
cd terraform
vi variables.tf # 必要な部分を編集
terraform init
terraform plan
terraform apply
```