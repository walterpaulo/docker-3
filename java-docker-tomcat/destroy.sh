
#!/bin/bash
#####	NOME:				stop.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Parar aplicacao.
#####	DATA DA CRIAÇÃO:	20/01/2023
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Debian GNU/Linux
#####	LICENÇA:			GPLv3
#####	REPOSITÓRIO:        https://github.com/walterpaulo
#####	PORTFOLIO:          https://www.walterpaulo.com.br

docker rmi walterpaulo/java8teste:latest -f
docker stop javawar
docker rm javawar
mvn clean
