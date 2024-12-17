USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_CreateDetail]    Script Date: 17/12/2024 6:38:26 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Stored Procedure: SP_CreateDetail
CREATE PROCEDURE [dbo].[SP_CreateDetail]
    @ID INT,
    @HeaderRowFunding UNIQUEIDENTIFIER,
    @Column1 NVARCHAR(100),
    @Column2 NVARCHAR(100),
    @Column3 NVARCHAR(100),
    @CreatedBy NVARCHAR(100)
AS
BEGIN
    INSERT INTO Detail (
        RowPointer, ID, HeaderRowFunding, Column1, Column2, Column3, 
        CreatedBy, CreatedDate
    )
    VALUES (
        NEWID(), @ID, @HeaderRowFunding, @Column1, @Column2, @Column3, 
        @CreatedBy, GETDATE()
    );
END;
GO

