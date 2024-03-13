--Fun��o Data Hora

-- TIMESTAMPDIFF: diferen�a entre duas datas ou timestamps. *MYSQL
TIMESTAMPDIFF(unit, datetime_expr1, datetime_expr2)
--unit: unidade de tempo, exemplos SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, e YEAR

--CONVERT / STR_TO_DATE/ CAST: Converter string em Data
*SQL 
SELECT CONVERT(DATETIME, '2023-03-15', 101) AS ConvertedDate;

*MYSQL
SELECT STR_TO_DATE(string, format)
SELECT STR_TO_DATE('31/12/2023', '%d/%m/%Y') AS converted_date;
--string: A string que voc� deseja converter para um tipo de data ou hora.
-- Este formato usa especificadores como %d para dia, %m para m�s, %Y para ano com quatro d�gitos, %H para horas (formato 00-23), %i para minutos, etc

-- Contemplando as duas fun��es
SELECT outage_id,
TIMESTAMPDIFF(MINUTE, STR_TO_DATE(Start_Time, '%m/%d/%Y %H:%i'), STR_TO_DATE(End_Time, '%m/%d/%Y %H:%i'))
FROM isp_outages

-- CAST: convers�es de tipos de dados em SQL(Tranforma quase todo tipo de dado)
CAST (express�o AS tipo_de_dados)
SELECT CAST('2024-03-13' AS DATE) AS DataConvertida;


-- DATEDIFF : Calcula o intervalo  entre duas datas/datetime SQL SERVER
DATEDIFF(interval, start_date, end_date)
SELECT DATEDIFF(day, '2024-03-13', '2024-03-20')

--interval: Pode ser 'year', 'quarter', 'month', 'day''hour', 'minute', 'second'. 

-- DATEADD: Fun��o para add ou subtrair unidades de tempo.
-- unidades de tempo: day, month, year...

 Declare @date date
set @date = '2015-01-14'

 SELECT ([DATA])
  FROM [SUCOS_VENDAS].[dbo].[NOTAS FISCAIS]
  WHERE [DATA] > DATEADD(day,-2, @date) and [Data] <= @date
  GROUP BY   [DATA]
  order by [data]

-- DATEDIFF : Calcula o n�mero de dias entre duas datas
DATEDIFF(interval, start_date, end_date)
SELECT DATEDIFF(day, '2024-03-13', '2024-03-20')

--interval: Pode ser 'year', 'quarter', 'month', 'day''hour', 'minute', 'second'. 


-- DATENAME: Retorna uma parte espec�fica de uma data
SELECT DATENAME(datepart, date)
SELECT DATENAME(month, '2024-03-13') AS MonthName;
-- depart por ser: �ear,month, dayofyear, day, weekday, week'
