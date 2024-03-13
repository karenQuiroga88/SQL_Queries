--Função Data Hora

-- TIMESTAMPDIFF: diferença entre duas datas ou timestamps. *MYSQL
TIMESTAMPDIFF(unit, datetime_expr1, datetime_expr2)
--unit: unidade de tempo, exemplos SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, e YEAR

--CONVERT / STR_TO_DATE/ CAST: Converter string em Data
*SQL 
SELECT CONVERT(DATETIME, '2023-03-15', 101) AS ConvertedDate;

*MYSQL
SELECT STR_TO_DATE(string, format)
SELECT STR_TO_DATE('31/12/2023', '%d/%m/%Y') AS converted_date;
--string: A string que você deseja converter para um tipo de data ou hora.
-- Este formato usa especificadores como %d para dia, %m para mês, %Y para ano com quatro dígitos, %H para horas (formato 00-23), %i para minutos, etc

-- Contemplando as duas funções
SELECT outage_id,
TIMESTAMPDIFF(MINUTE, STR_TO_DATE(Start_Time, '%m/%d/%Y %H:%i'), STR_TO_DATE(End_Time, '%m/%d/%Y %H:%i'))
FROM isp_outages

-- CAST: conversões de tipos de dados em SQL(Tranforma quase todo tipo de dado)
CAST (expressão AS tipo_de_dados)
SELECT CAST('2024-03-13' AS DATE) AS DataConvertida;


-- DATEDIFF : Calcula o intervalo  entre duas datas/datetime SQL SERVER
DATEDIFF(interval, start_date, end_date)
SELECT DATEDIFF(day, '2024-03-13', '2024-03-20')

--interval: Pode ser 'year', 'quarter', 'month', 'day''hour', 'minute', 'second'. 

-- DATEADD: Função para add ou subtrair unidades de tempo.
-- unidades de tempo: day, month, year...

 Declare @date date
set @date = '2015-01-14'

 SELECT ([DATA])
  FROM [SUCOS_VENDAS].[dbo].[NOTAS FISCAIS]
  WHERE [DATA] > DATEADD(day,-2, @date) and [Data] <= @date
  GROUP BY   [DATA]
  order by [data]

-- DATEDIFF : Calcula o número de dias entre duas datas
DATEDIFF(interval, start_date, end_date)
SELECT DATEDIFF(day, '2024-03-13', '2024-03-20')

--interval: Pode ser 'year', 'quarter', 'month', 'day''hour', 'minute', 'second'. 


-- DATENAME: Retorna uma parte específica de uma data
SELECT DATENAME(datepart, date)
SELECT DATENAME(month, '2024-03-13') AS MonthName;
-- depart por ser: ýear,month, dayofyear, day, weekday, week'

-- DATEPART: Retorna uma parte específica de uma data SQL SERVER
SELECT DATEPART(interval, data)
--interval é a parte da data que você deseja extrair (por exemplo, "year" para o ano, "month" para o mês, "day" para o dia, etc.).
SELECT DATEPART(year, [data_venda]) AS Ano
FROM [dbo].[NOTAS_FISCAIS];

-- DATEFORMAT: Retorna uma data parte esecífica de uma data MYSQL 
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y') AS DataFormatada;
-- Isso retornará a data atual formatada como uma string no formato "dd/MM/yyyy".

%Y: Ano com quatro dígitos.
%m: Mês (01 a 12).
%d: Dia do mês (01 a 31).
%H: Hora no formato 24 horas (00 a 23).
%i: Minutos (00 a 59).
%s: Segundos (00 a 59).