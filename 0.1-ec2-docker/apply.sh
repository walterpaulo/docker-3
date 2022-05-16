#!/bin/bash

#####	NOME:				apply.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Inicia aplicação.
#####	DATA DA CRIAÇÃO:	16/05/2022
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Ubuntu GNU/Linux
#####	LICENÇA:			GPLv3
#####	REPOSITÓRIO:        https://github.com/walterpaulo/		

DIR=terraform/

cd terraform/
terraform init
terraform apply -auto-approve
# cd -

echo "Conectando... 20s"
sleep 20
echo

DNS=$(terraform output aws_instance_e_ssh)
DNS=$(echo $DNS | sed -e "s/\"//g")

echo "
[Jenskins]
$DNS
" > ../ansible/hosts

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/hosts ../ansible/provisionar.yml -u ubuntu --private-key $private_key
ssh -i $private_key ubuntu@$DNS -o ServerAliveInterval=60
