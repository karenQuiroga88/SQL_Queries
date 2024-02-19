/* 

Limpeza de Dados usando SQL

*/

----------------------------------------------------------------------------------------------------------------

Select * from [dbo].[PortfolioDataCleaning]


-----------------------------------------------------------------------------------------------------------------
--Converter o formato do campo SaleDate de Datetime para Date!

SELECT SaleDate, CONVERT(date,SaleDate)
	FROM [dbo].[PortfolioDataCleaning]

UPDATE [dbo].[PortfolioDataCleaning]
SET SaleDate =  CONVERT(date,SaleDate)    

-----------------------------------------------------------------------------------------------------------------

-- Incluir endereço no campo PropertyAddress onde o campo esteja nulo

Select * from [dbo].[PortfolioDataCleaning]
-- where PropertyAddress IS NULL
order by ParcelID

-- Considerando que o campo PropertyAddress está relacionado ao campo ParcelID, o objetivo é preencher os campos nulos de endereço 
--para registros com o mesmo ParcelID, mas diferentes UniqueID.

Select a.ParcelID, b.ParcelID, a.PropertyAddress, b.PropertyAddress, ISNULL (a.PropertyAddress, b.PropertyAddress)
from [dbo].[PortfolioDataCleaning] a
join [dbo].[PortfolioDataCleaning] b 
	on a.ParcelId = b.ParcelId
	and a.UniqueId <> b.UniqueID
	where  a.PropertyAddress is null


UPDATE a
set PropertyAddress = ISNULL (a.PropertyAddress, b.PropertyAddress)
from [dbo].[PortfolioDataCleaning] a
join [dbo].[PortfolioDataCleaning] b 
	on a.ParcelId = b.ParcelId
	and a.UniqueId <> b.UniqueID
	where  a.PropertyAddress is null


-----------------------------------------------------------------------------------------------------------------------------------------------------

--- Separando o endereço em colunas individuais (Endereço, Rua e Cidade)

Select * from [dbo].[PortfolioDataCleaning]

Select PropertyAddress, SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) as PropertyAddress_Rua,
						SUBSTRING (PropertyAddress,CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress)) as PropertyAddress_Cidade
from [dbo].[PortfolioDataCleaning]


Alter Table [dbo].[PortfolioDataCleaning]
add Rua Nvarchar (255)

UPDATE [dbo].[PortfolioDataCleaning]
set Rua = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1)

Alter Table [dbo].[PortfolioDataCleaning]
add PropertyAddress_Cidade Nvarchar (50)

UPDATE [dbo].[PortfolioDataCleaning]
set PropertyAddress_Cidade = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN (PropertyAddress))

------------------------------------------------------------------------------------------------------------------
--- Separando o OwnerAddress em colunas individuais (Endereço, Rua e Cidade)


Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3) as OwnerAddress_Rua
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2) As OwnerAddress_Cidade
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1) As OwnerAddress_Estado
From [dbo].[PortfolioDataCleaning]

Alter Table [dbo].[PortfolioDataCleaning]
add OwnerAddress_Rua Nvarchar (250)

UPDATE [dbo].[PortfolioDataCleaning]
set OwnerAddress_Rua = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

Alter Table [dbo].[PortfolioDataCleaning]
add OwnerAddress_Cidade Nvarchar (20)

UPDATE [dbo].[PortfolioDataCleaning]
set OwnerAddress_Cidade = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

Alter Table [dbo].[PortfolioDataCleaning]
add OwnerAddress_Estado Nvarchar (5)

UPDATE [dbo].[PortfolioDataCleaning]
set OwnerAddress_Estado = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

-------------------------------------------------------------------------------------------------------------

-- Alterar os valores da coluna SoldAsVacant, substituindo 'Y' por 'Yes', 'N' por 'No' e mantendo os demais
--valores como estão.

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From [dbo].[PortfolioDataCleaning]
Group by SoldAsVacant
order by 2

Select Case 
	When SoldAsVacant = 'Y' Then 'Yes'
	when SoldAsVacant = 'N' Then 'No'
	Else SoldAsVacant End 
from [dbo].[PortfolioDataCleaning]

UPDATE [dbo].[PortfolioDataCleaning]
Set SoldAsVacant = Case When SoldAsVacant = 'Y' Then 'Yes'
	When SoldAsVacant = 'N' Then 'No'
	Else SoldAsVacant
	End
	
-------------------------------------------------------------------------------------------------------------------
--Identificando as duplicatas

With CTE_RowNuber As(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 Order by
					UniqueID
					) row_num 
From [dbo].[PortfolioDataCleaning])

Select * 
From CTE_RowNuber
Where row_num > 1
Order by PropertyAddress
