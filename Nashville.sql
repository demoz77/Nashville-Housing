-----------------------------------------------------------------------
-- Standardize date format
--ALTER TABLE Nashville..Houses
--ALTER COLUMN SaleDate DATE



------------------------------------------------------------------------
-- Breaking out Property Address into Individual Columns (street, City)

--ALTER TABLE Nashville..Houses
--ADD PropertyStreet NVARCHAR(255)

--ALTER TABLE Nashville..Houses
--ADD PropertyCity NVARCHAR(255)


--UPDATE Nashville..Houses
--SET PropertyStreet = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress) - 1)

--UPDATE Nashville..Houses
--SET PropertyCity =
--SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) + 1,len(PropertyAddress))


---------------------------------------------------------------------------------
-- Breaking out Owner Address into Individual Columns (Street, City, State)

--ALTER TABLE Nashville..Houses
--ADD OwnerStreet NVARCHAR(255)

--ALTER TABLE Nashville..Houses
--ADD OwnerCity NVARCHAR(255)

--ALTER TABLE Nashville..Houses
--ADD OwnerState NVARCHAR(255)

--Update Nashville..Houses
--SET OwnerStreet = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

--Update Nashville..Houses
--SET OwnerCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

--Update Nashville..Houses
--SET OwnerState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)



-----------------------------------------------------------------------------------
-- Change Y and N to Yes and No in "Sold as Vacant"
--SELECT DISTINCT(SoldAsVacant),COUNT(SoldAsVacant) FROM Nashville..Houses
--GROUP BY SoldAsVacant

--UPDATE Nashville..Houses
--SET SoldAsVacant = CASE
--    WHEN SoldAsVacant = 'Y' THEN 'Yes'
--	WHEN SoldAsVacant = 'N' THEN 'No'
--	ELSE SoldAsVacant
--END


----------------------------------------------------------------------
--Remove Duplicates
--WITH row_nums AS
--(SELECT *,
--ROW_NUMBER() OVER(
--PARTITION BY 
--ParcelID,
--PropertyStreet,
--SaleDate,
--LegalReference,
--OwnerName
--ORDER BY UniqueID
--) row_num
--FROM Nashville..Houses)
--DELETE FROM row_nums
--WHERE row_num > 1




------------------------------------------------------------------------
----Delete Unused Columns

--ALTER TABLE Nashville..Houses
--DROP COLUMN PropertyAddress , OwnerAddress

