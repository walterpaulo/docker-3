#!/bin/bash

#####	NOME:				destroy.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Destruir aplicação.
#####	DATA DA CRIAÇÃO:	16/05/2022
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Ubuntu GNU/Linux
#####	LICENÇA:			GPLv3
#####	REPOSITÓRIO:        https://github.com/walterpaulo/		

DIR=terraform/

cd terraform/
terraform destroy -auto-approve && echo -e "\033[01;32mAplicação destruida!\033[01;37m"

cd -
