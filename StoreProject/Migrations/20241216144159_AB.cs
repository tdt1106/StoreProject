using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StoreProject.Migrations
{
    /// <inheritdoc />
    public partial class AB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Details",
                columns: table => new
                {
                    RowPointer = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ID = table.Column<int>(type: "int", nullable: false),
                    HeaderRowFunding = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column1 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column3 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "Headers",
                columns: table => new
                {
                    RowPointer = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ID = table.Column<int>(type: "int", nullable: false),
                    Column1 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column3 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column4 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column5 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column6 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column7 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column8 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column9 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column10 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column11 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column12 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Column13 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Details");

            migrationBuilder.DropTable(
                name: "Headers");
        }
    }
}
