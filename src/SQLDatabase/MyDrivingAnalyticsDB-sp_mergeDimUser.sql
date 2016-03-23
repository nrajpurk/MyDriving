/****** Object:  StoredProcedure [dbo].[sp_mergeDimUser]    Script Date: 3/21/2016 8:40:50 PM ******/
CREATE PROCEDURE [dbo].[sp_mergeDimUser] 
AS
BEGIN
	SET NOCOUNT ON;

DECLARE @vinTable table(
 vin nvarchar(20)
);

INSERT INTO @vinTable
 SELECT distinct x.vin 
		FROM dbo.dimUserTemp x 
		WHERE x.vin IS NOT NULL
		AND x.vin != ''
		AND vin != '-255'
		AND x.vin NOT IN (SELECT 
			                 distinct vinNum 
							 FROM dbo.dimVinLookup);

	DECLARE @vinCount int;
	SELECT @vinCount = COUNT(*) FROM @vinTable;


	IF (@vinCount > 0)
	BEGIN
		INSERT INTO dbo.dimVinLookup 
		SELECT distinct vin, 'Unknown','Unknown',1995,'Unknown' 
		from dbo.dimUserTemp
		WHERE vin IS NOT NULL 
		AND vin != ''
		AND vin != '-255'
		AND vin NOT IN (SELECT distinct vinNum from dbo.dimVinLookup);
	END
	ELSE
		Begin
			SELECT * from dbo.dimVinLookup;
		End

	INSERT into dbo.dimUser (userId, vin)
	SELECT distinct a.userId, a.vin from dbo.dimUserTemp a
		WHERE a.userId IS NOT NULL
		AND a.vin IS NOT NULL
		AND vin != ''
		AND vin != '-255'
		AND userId != ''
		AND userId != '-255'
		AND CONCAT(a.userId,'_',a.vin) NOT IN (SELECT distinct CONCAT(userId,'_',vin) FROM dbo.dimUser)
		AND a.vin in (SELECT distinct vinNum from dbo.dimVinLookup);
END