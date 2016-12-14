INSTALAÇÃO

1 - Instalação Python 2.7:

       $ sudo apt-get install python2.7

2 - Instalação BeautifulSoup4:

    Download: https://www.crummy.com/software/BeautifulSoup/bs4/download/4.5/beautifulsoup4-4.5.1.tar.gz
    
       $ sudo python setup.py install

3 - Instalação Requests:

    Download: $ git clone git://github.com/kennethreitz/requests.git
     
       $ sudo python setup.py install

4 - Utilize um editor de sua preferência.


EXECUÇÃO:

1 - Execute no terminal: 

	$python crawlerMW.py

Será gerado um arquivo com códigos e disciplinas do departamento e outro arquivo com os links de cada disciplina.

2 - Execute no terminal:

	$python crawlerProfessores.py

Será gerado um arquivo com todos os professores registrados na disciplina.

3 - Converta os arquivos .txt para .csv para serem importados no sistema de monitoria.
