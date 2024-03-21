1) Создать provider
2) Создать kms_ring & kms_key (активируем перед этим kms api)
3) Cоздаем service_accout c правами для доступа в kms api*
4) Создать bucket для tfstate c service_accout & kms_key
5) Создать backend
6) Создать модудь для сети, бакета, вм
7)* Создать базу и вм с помощью зависимости

Дока по google provider https://registry.terraform.io/providers/hashicorp/google/latest/docs
Дока по терраформу https://developer.hashicorp.com/terraform/language