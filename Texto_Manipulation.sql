-- Função texto

--LENGHT: Conta caracteres
LENGTH(string)
SELECT LENGTH('Hello, world!') AS LengthOfString;
--Isso retornaria 13, que é o comprimento da string fornecida.Isso retornaria 13, que é o comprimento da string fornecida.

--SUBSTRING: Retorna uma parte do texto
SUBSTRING(string, posição_inicial, comprimento)
SELECT SUBSTRING('Hello, world!', 1, 3) AS SubstringResult;
-- resultado'Hel'
** caso não seja especificado o segundo critério,a função inicia no terceiro critério e pega tudo que vier depois.


--SUBSTRINGINDEX: Retorna uma parte do texto a partir de um delimitador, funciona apenas no MYSQL
SUBSTRING_INDEX(string, delimitador, ocorrencia)
--string é a string da qual você deseja extrair a parte.
--delimitador é o delimitador que separa a parte da string que você deseja extrair.
-- ocorrencia é um número inteiro que especifica qual ocorrência do delimitador você deseja usar como ponto de extração. 
--Use um número positivo para extrair a parte da esquerda do delimitador e um número negativo para extrair a parte da direita do delimitador.
SELECT SUBSTRING_INDEX('usuario@dominio.com', '@', 1) AS NomeUsuario;
-- retorno: usuario
SELECT SUBSTRING_INDEX('usuario@dominio.com', '@', -1) AS Dominio;
-- retorno: dominio.com 

SELECT  SUBSTRING_INDEX(SUBSTRING_INDEX('$100000 - $115000', ' ', 1), '$', -1) 
-- retorno: 100000

--CHARINDEX: Retorna uma parte espefífica da string a partir de um delimitador., funciona no SQL Server].
CHARINDEX(substring, string [, start_location])
-- substring: A substring que você deseja encontrar dentro da string.
-- string: A string onde você deseja procurar a substring.
-- start_location (opcional): A posição inicial na string a partir da qual a pesquisa deve começar. Se não for especificado,
--a pesquisa começará no início da string.

-- PARSENAME(REPLACE): Funciona bem para exprair um parte do texto com limitador. 
SELECT PARSENAME(REPLACE('Version-1-2-3', '-', '.'), 1) AS SecondPart
-- retorno 3. 
-- A função substitui o limitador informado por ponto,  e extrai o campo iformado a partir da dirieta para esquerda.