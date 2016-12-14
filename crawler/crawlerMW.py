#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Universidade de Brasília - Departamento de Ciência da Computação
# Aluno: Felipe Cordeiro P. Magalhães
# Data: 11 de dezembro de 2016
# Objetivo: Crawler para extrair do MatriculaWeb uma lista de disciplinas ofertadas por um departamento no semestre corrente.
# Parametros: Url do departamento no MatriculaWeb.
# Retorno: Arquivo com código e nome de cada disciplina ofertada, e arquivo com o link de cada disciplina.

import requests

from bs4 import BeautifulSoup

url = "https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=116"  #URL do departamento a ser retirado a oferta
r = requests.get(url)
soup = BeautifulSoup(r.content)

arquivo = open("oferta_links.txt", "w")

tabela = soup.find_all("tr", {"class": "PadraoMenor"})

lista_dados = []

for item in tabela:			#realizar manipulação para retirada do link de cada disciplina
	link = str(item)
	link = link.split("href=")
	link = link[1].split(">")
	link = link[0].replace("amp;", "")
	link = link.replace('"', "")
	link_completo = "https://matriculaweb.unb.br/graduacao/"+link
	link = link.encode('utf8', 'replace')
	arquivo.write("%s\n" %link_completo)		#grava links em arquivo
	# print link

	for disciplina in item:			#realizamanipulação para retirada do nome e código de cada disciplina
		dados = disciplina.contents[0].text
		dados = dados.encode('utf8', 'replace')
		dados = str(dados)
		if (dados != "\n" and dados != ""):
			dados2 = dados.replace("\n","")
			lista_dados.append(dados2) 

arquivo2 = open("oferta_CIC.txt", "w") 
for indice, valor in enumerate(lista_dados): #verifica se o indice do item na lista é par, se for é um código em seguida grava o 
	if (indice%2 == 0):						 #código e o indice+1 que é correspondente à descrição da disciplina
 		print "%s,%s" %(valor, lista_dados[indice+1])
 		arquivo2.write("%s,%s\n" %(valor, lista_dados[indice+1]))

arquivo2.close()
arquivo.close()

print "\t\tFIM DA EXECUÇÃO!"