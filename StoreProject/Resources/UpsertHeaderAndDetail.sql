USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[UpsertHeaderAndDetail]    Script Date: 20/12/2024 6:07:18 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpsertHeaderAndDetail]
    -- Thông tin Header
    @HeaderID INT = NULL,                 
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
    @HeaderCreatedBy NVARCHAR(50),        
    @HeaderUpdatedBy NVARCHAR(50) = NULL,  
    -- Thông tin Detail
    @DetailID INT = NULL,                  
    @HeaderRowFunding UNIQUEIDENTIFIER = NULL,  
    @DetailColumn1 NVARCHAR(50),              
    @DetailColumn2 NVARCHAR(50),               
    @DetailColumn3 NVARCHAR(50),            
    @DetailCreatedBy NVARCHAR(50),            
    @DetailUpdatedBy NVARCHAR(50) = NULL     
AS
BEGIN
    SET NOCOUNT ON;

    -- Bắt đầu transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Upsert Header
        IF @HeaderID IS NOT NULL
        BEGIN
            -- Kiểm tra nếu Header đã tồn tại
            IF EXISTS (SELECT 1 FROM Header WHERE ID = @HeaderID)
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
                    UpdatedBy = @HeaderUpdatedBy,
                    UpdatedDate = GETDATE()
                WHERE ID = @HeaderID;
            END
            ELSE
            BEGIN
                -- Insert Header mới
                INSERT INTO Header (Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, Column10, Column11, Column12, Column13, CreatedBy, CreatedDate)
                VALUES (@Column1, @Column2, @Column3, @Column4, @Column5, @Column6, @Column7, @Column8, @Column9, @Column10, @Column11, @Column12, @Column13, @HeaderCreatedBy, GETDATE());

                -- Lấy giá trị RowPointer (giả sử RowPointer là UNIQUEIDENTIFIER được tự động tạo trong bảng)
                SELECT @HeaderRowFunding = RowPointer
                FROM Header
                WHERE ID = SCOPE_IDENTITY();
            END
        END
        ELSE
        BEGIN
            -- Insert Header mới nếu không có ID
            INSERT INTO Header (Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, Column10, Column11, Column12, Column13, CreatedBy, CreatedDate)
            VALUES (@Column1, @Column2, @Column3, @Column4, @Column5, @Column6, @Column7, @Column8, @Column9, @Column10, @Column11, @Column12, @Column13, @HeaderCreatedBy, GETDATE());

            -- Lấy giá trị RowPointer
            SELECT @HeaderRowFunding = RowPointer
            FROM Header
            WHERE ID = SCOPE_IDENTITY();
        END

        -- Upsert Detail
        IF @DetailID IS NOT NULL
        BEGIN
            -- Kiểm tra nếu Detail đã tồn tại
            IF EXISTS (SELECT 1 FROM Detail WHERE ID = @DetailID)
            BEGIN
                -- Update Detail
                UPDATE Detail
                SET 
                    HeaderRowFunding = @HeaderRowFunding,
                    Column1 = @DetailColumn1,
                    Column2 = @DetailColumn2,
                    Column3 = @DetailColumn3,
                    UpdatedBy = @DetailUpdatedBy,
                    UpdatedDate = GETDATE()
                WHERE ID = @DetailID;
            END
            ELSE
            BEGIN
                -- Insert Detail mới
                INSERT INTO Detail (HeaderRowFunding, Column1, Column2, Column3, CreatedBy, CreatedDate)
                VALUES (@HeaderRowFunding, @DetailColumn1, @DetailColumn2, @DetailColumn3, @DetailCreatedBy, GETDATE());
            END
        END
        ELSE
        BEGIN
            -- Insert Detail mới nếu không có ID
            INSERT INTO Detail (HeaderRowFunding, Column1, Column2, Column3, CreatedBy, CreatedDate)
            VALUES (@HeaderRowFunding, @DetailColumn1, @DetailColumn2, @DetailColumn3, @DetailCreatedBy, GETDATE());
        END

        -- Commit transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction nếu có lỗi
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

