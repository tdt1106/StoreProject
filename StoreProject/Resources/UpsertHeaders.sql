USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[UpsertHeaders]    Script Date: 19/12/2024 11:08:58 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertHeaders]
    @ID INT = NULL,                 -- ID của Header (NULL nếu Insert)
    @Column1 NVARCHAR(50),           
    @Column2 NVARCHAR(50),           
    @Column3 NVARCHAR(50),          
    @Column4 NVARCHAR(50),
    @Column5 NVARCHAR(50),
    @Column6 NVARCHAR(50),
    @Column7 NVARCHAR(50),
    @Column8 NVARCHAR(50),
    @Column9 NVARCHAR(50),
    @Column10 NVARCHAR(50),
    @Column11 NVARCHAR(50),
    @Column12 NVARCHAR(50),
    @Column13 NVARCHAR(50),
    @CreatedBy NVARCHAR(50),        
    @UpdatedBy NVARCHAR(50) = NULL  
AS
BEGIN
    SET NOCOUNT ON;

    IF @ID IS NOT NULL
    BEGIN
        -- Kiểm tra nếu Header đã tồn tại
        IF EXISTS (SELECT 1 FROM Header WHERE ID = @ID)
        BEGIN
            -- Update Header
            UPDATE Header
            SET 
                Column1 = @Column1,
                Column2 = @Column2,
                Column3 = @Column3,
                Column4 = @Column4,
                Column5 = @Column5,
                Column6 = @Column6,
                Column7 = @Column7,
                Column8 = @Column8,
                Column9 = @Column9,
                Column10 = @Column10,
                Column11 = @Column11,
                Column12 = @Column12,
                Column13 = @Column13,
                UpdatedBy = @UpdatedBy,
                UpdatedDate = GETDATE()
            WHERE ID = @ID;

            RETURN; -- Kết thúc sau khi update
        END
    END

    -- Insert Header mới
    INSERT INTO Header (Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, Column10, Column11, Column12, Column13, CreatedBy, CreatedDate)
    VALUES (@Column1, @Column2, @Column3, @Column4, @Column5, @Column6, @Column7, @Column8, @Column9, @Column10, @Column11, @Column12, @Column13, @CreatedBy, GETDATE());
END;
GO

