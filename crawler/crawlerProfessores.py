#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Universidade de Brasília - Departamento de Ciência da Computação
# Aluno: Felipe Cordeiro P. Magalhães
# Data: 11 de dezembro de 2016
# Objetivo: Crawler para extrair do MatriculaWeb lista de todos os professores da disciplina ofertadas por um departamento no semestre corrente.
# Parametros: Url do departamento no MatriculaWeb, arquivo com lista de links de disciplinas do departamento.
# Retorno: Arquivo com nomes de todos os professores do departamento.

import requests
import re
from bs4 import BeautifulSoup


try:
	arquivo_leitura = open("lista_professores.txt", "r")
except Exception as e:
	arquivo_cria = open("lista_professores.txt", "w")
	arquivo_cria.close()
	arquivo_leitura = open("lista_professores.txt", "r")

lista_arquivo = arquivo_leitura.readlines()
arquivo_leitura.close()

lista_professores_geral = []

url = "https://matriculaweb.unb.br/graduacao/oferta_dados.aspx?cod=113476&dep=116"  #url de cada disciplina

r = requests.get(url)
soup = BeautifulSoup(r.content)
tabela = soup.find_all("td", {"class": "padraomenor"})
lista_professores_disciplina = []
for item in tabela: 		#manipula retirada de cada professor da disciplina
	item = item.find_all("center")
	item = str(item)
	item = item.encode('utf8', 'replace')
	item = item.split("<br>")
	item = str(item)
	expressao_reg = re.compile(r"<center>(.*?)<br/>")
	nome = re.findall(expressao_reg, item)
	nome = str(nome)
	nome = nome.replace("'","")
	nome = nome.replace('"',"")
	nome = nome.replace("[","")
	nome = nome.replace("]","")
	if nome:
		lista_professores_disciplina.append(nome) 		#adiciona professor à lista de professores
	lista_professores_disciplina = list(set(lista_professores_disciplina))		#retira elementos repetidos da lista

arquivo_gravacao = open("lista_professores.txt", "a")

for nome in lista_professores_disciplina: #verifica se nome já se encontra na lista e só grava no arquivo nomes novos
	if not (nome in lista_arquivo):
		nome = nome.encode('utf8', 'replace')
		arquivo_gravacao.write("%s\n" %nome)

arquivo_gravacao.close()

arquivo_leitura = open("lista_professores.txt", "r") #refaz leitura do arquivo com os nomes gravados
lista_arquivo = arquivo_leitura.readlines()
arquivo_leitura.close()

lista_arquivo = list(set(lista_arquivo)) #verifica novamente duplicidade de nomes no arquivo
lista_arquivo.sort()

lista_arquivo2 = []
for nome in lista_arquivo: 
	nome = nome.replace(",", " e")
	lista_arquivo2.append(nome)

arq = open("lista_professores.txt", "w")
arq.writelines(lista_arquivo2)	#regrava lista com nomes retirados se houver algum 
arq.close()

print "\t\tFIM DA EXECUÇÃO!"