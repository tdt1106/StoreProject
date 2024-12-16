USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[ManageHeader]    Script Date: 16/12/2024 6:25:51 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManageHeader]
    @Action NVARCHAR(10),                -- 'GET_ALL', 'GET_BY_ID', 'GET_BY_ROWPOINTER', 'INSERT', 'UPDATE', 'DELETE'
    @ID INT = NULL,                      -- ID for specific actions
    @RowPointer UNIQUEIDENTIFIER = NULL, -- RowPointer for specific actions
    @Column1 NVARCHAR(100) = NULL,       -- Dynamic columns for Insert/Update
    @Column2 NVARCHAR(100) = NULL,
    @Column3 NVARCHAR(100) = NULL,
    @Column4 NVARCHAR(100) = NULL,
    @Column5 NVARCHAR(100) = NULL,
    @Column6 NVARCHAR(100) = NULL,
    @Column7 NVARCHAR(100) = NULL,
    @Column8 NVARCHAR(100) = NULL,
    @Column9 NVARCHAR(100) = NULL,
    @Column10 NVARCHAR(100) = NULL,
    @Column11 NVARCHAR(100) = NULL,
    @Column12 NVARCHAR(100) = NULL,
    @Column13 NVARCHAR(100) = NULL,
    @CreatedBy NVARCHAR(100) = NULL,     -- User performing the action
    @UpdatedBy NVARCHAR(100) = NULL      -- User updating the data
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. GET ALL HEADERS
    IF @Action = 'GET_ALL'
    BEGIN
        SELECT *
        FROM Header;
    END

    -- 2. GET HEADER BY ID
    ELSE IF @Action = 'GET_BY_ID'
    BEGIN
        SELECT *
        FROM Header
        WHERE ID = @ID;
    END

    -- 3. GET HEADER BY ROWPOINTER
    ELSE IF @Action = 'GET_BY_ROWPOINTER'
    BEGIN
        SELECT *
        FROM Header
        WHERE RowPointer = @RowPointer;
    END

    -- 4. INSERT NEW HEADER
    ELSE IF @Action = 'INSERT'
    BEGIN
        INSERT INTO Header (
            RowPointer, ID, Column1, Column2, Column3, Column4, Column5, Column6,
            Column7, Column8, Column9, Column10, Column11, Column12, Column13, 
            CreatedBy, CreatedDate
        )
        VALUES (
            NEWID(), @ID, @Column1, @Column2, @Column3, @Column4, @Column5, @Column6,
            @Column7, @Column8, @Column9, @Column10, @Column11, @Column12, @Column13,
            @CreatedBy, GETDATE()
        );
    END

    -- 5. UPDATE HEADER
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE Header
        SET Column1 = @Column1,
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
        WHERE RowPointer = @RowPointer OR ID = @ID;
    END

    -- 6. DELETE HEADER BY ID OR ROWPOINTER
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM Header
        WHERE RowPointer = @RowPointer OR ID = @ID;
    END
END;
GO

