-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Noah Singer
-- Create date: 06.09.2011
-- Description:	procedure to calculate the distance between two lat/lng pairs
-- =============================================
CREATE PROCEDURE [dbo].[distance] 
	-- Add the parameters for the stored procedure here
	 xxx@xxx.xxx DECIMAL(8,5),
   xxx@xxx.xxx   DECIMAL(8,5),
   xxx@xxx.xxx  DECIMAL(8,5),
   xxx@xxx.xxx   DECIMAL(8,5)
AS
BEGIN
    xxx@xxx.xxx FLOAT
 
    SET @Temp = SIN(@Latitude1/57.2957795130823) * SIN(@Latitude2/57.2957795130823) + COS(@Latitude1/57.2957795130823) * COS(@Latitude2/57.2957795130823) * COS(@Longitude2/57.2957795130823 xxx@xxx.xxx
 
    xxx@xxx.xxx > 1
        xxx@xxx.xxx = 1
    ELSE xxx@xxx.xxx < -1
        xxx@xxx.xxx = -1
 
    RETURN (3958.75586574 * xxx@xxx.xxx )
END
GO
