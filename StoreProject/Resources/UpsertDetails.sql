USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[UpsertDetails]    Script Date: 19/12/2024 11:08:42 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertDetails]
    @ID INT = NULL,                      
    @HeaderRowFunding UNIQUEIDENTIFIER,               
    @Column1 NVARCHAR(50),              
    @Column2 NVARCHAR(50),               
    @Column3 NVARCHAR(50),            
    @CreatedBy NVARCHAR(50),            
    @UpdatedBy NVARCHAR(50) = NULL     
AS
BEGIN
    SET NOCOUNT ON;

    IF @ID IS NOT NULL
    BEGIN
        -- Kiểm tra nếu Detail đã tồn tại
        IF EXISTS (SELECT 1 FROM Detail WHERE ID = @ID)
        BEGIN
            -- Update Detail
            UPDATE Detail
            SET 
                HeaderRowFunding = @HeaderRowFunding,
                Column1 = @Column1,
                Column2 = @Column2,
                Column3 = @Column3,
                UpdatedBy = @UpdatedBy,
                UpdatedDate = GETDATE()
            WHERE ID = @ID;

            RETURN; 
        END
    END

    -- Insert Detail mới
    INSERT INTO Detail (HeaderRowFunding, Column1, Column2, Column3, CreatedBy, CreatedDate)
    VALUES (@HeaderRowFunding, @Column1, @Column2, @Column3, @CreatedBy, GETDATE());
END;
GO

