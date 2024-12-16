using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using StoreProject.Models;
using HeaderManagement.Data;
using StoreProject.Repositories;
using Microsoft.EntityFrameworkCore;

public class HeaderRepository : IHeaderRepository
{
    private readonly AppDbContext _context;
    private readonly string _connectionString;

    public HeaderRepository(AppDbContext context, IConfiguration configuration)
    {
        _context = context;
        _connectionString = configuration.GetConnectionString("DefaultConnection");
    }
    public async Task<IEnumerable<HeaderModel>> GetAllAsync()
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "GET_ALL");

            return await db.QueryAsync<HeaderModel>("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task<HeaderModel> GetByIdAsync(int id)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "GET_BY_ID");
            parameters.Add("@ID", id);

            return await db.QueryFirstOrDefaultAsync<HeaderModel>("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task AddAsync(HeaderModel header)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "INSERT");
            parameters.Add("@ID", header.ID);
            parameters.Add("@Column1", header.Column1);
            parameters.Add("@CreatedBy", header.CreatedBy);

            await db.ExecuteAsync("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public void Update(HeaderModel header)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "UPDATE");
            parameters.Add("@ID", header.ID);
            parameters.Add("@RowPointer", header.RowPointer);
            parameters.Add("@Column1", header.Column1);
            parameters.Add("@UpdatedBy", header.UpdatedBy);

            db.Execute("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task DeleteAsync(int id)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "DELETE");
            parameters.Add("@ID", id);

            await db.ExecuteAsync("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }
    public async Task<HeaderModel> GetByIdOrRowPointer(int? id, Guid? rowPointer)
    {
        if (id.HasValue)
        {
            return await _context.Headers.FirstOrDefaultAsync(h => h.ID == id.Value);
        }

        if (rowPointer.HasValue)
        {
            return await _context.Headers.FirstOrDefaultAsync(h => h.RowPointer == rowPointer.Value);
        }

        return null;
    }
}

 