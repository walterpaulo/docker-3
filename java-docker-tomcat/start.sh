
#!/bin/bash
#####	NOME:				start.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Iniicar aplicacao.
#####	DATA DA CRIAÇÃO:	20/01/2023
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Debian GNU/Linux
#####	LICENÇA:			GPLv3
#####	REPOSITÓRIO:        https://github.com/walterpaulo
#####	PORTFOLIO:          https://www.walterpaulo.com.br

mvn clean install
docker build -t walterpaulo/java8teste -f Dockerfile .
sudo docker run -d -p 8080:8080 --name javawar walterpaulo/java8teste