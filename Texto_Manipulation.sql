-- Fun��o texto

--LENGHT: Conta caracteres
LENGTH(string)
SELECT LENGTH('Hello, world!') AS LengthOfString;
--Isso retornaria 13, que � o comprimento da string fornecida.Isso retornaria 13, que � o comprimento da string fornecida.

--SUBSTRING: Retorna uma parte do texto
SUBSTRING(string, posi��o_inicial, comprimento)
SELECT SUBSTRING('Hello, world!', 1, 3) AS SubstringResult;
-- resultado'Hel'
** caso n�o seja especificado o segundo crit�rio,a fun��o inicia no terceiro crit�rio e pega tudo que vier depois.


--SUBSTRINGINDEX: Retorna uma parte do texto a partir de um delimitador, funciona apenas no MYSQL
SUBSTRING_INDEX(string, delimitador, ocorrencia)
--string � a string da qual voc� deseja extrair a parte.
--delimitador � o delimitador que separa a parte da string que voc� deseja extrair.
-- ocorrencia � um n�mero inteiro que especifica qual ocorr�ncia do delimitador voc� deseja usar como ponto de extra��o. 
--Use um n�mero positivo para extrair a parte da esquerda do delimitador e um n�mero negativo para extrair a parte da direita do delimitador.
SELECT SUBSTRING_INDEX('usuario@dominio.com', '@', 1) AS NomeUsuario;
-- retorno: usuario
SELECT SUBSTRING_INDEX('usuario@dominio.com', '@', -1) AS Dominio;
-- retorno: dominio.com 

SELECT  SUBSTRING_INDEX(SUBSTRING_INDEX('$100000 - $115000', ' ', 1), '$', -1) 
-- retorno: 100000

--CHARINDEX: Retorna uma parte espef�fica da string a partir de um delimitador., funciona no SQL Server].
CHARINDEX(substring, string [, start_location])
-- substring: A substring que voc� deseja encontrar dentro da string.
-- string: A string onde voc� deseja procurar a substring.
-- start_location (opcional): A posi��o inicial na string a partir da qual a pesquisa deve come�ar. Se n�o for especificado,
--a pesquisa come�ar� no in�cio da string.

-- PARSENAME(REPLACE): Funciona bem para exprair um parte do texto com limitador. 
SELECT PARSENAME(REPLACE('Version-1-2-3', '-', '.'), 1) AS SecondPart
-- retorno 3. 
-- A fun��o substitui o limitador informado por ponto,  e extrai o campo iformado a partir da dirieta para esquerda.