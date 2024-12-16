using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;

public class HeaderRepository
{
    private readonly string _connectionString;

    public HeaderRepository(string connectionString)
    {
        _connectionString = connectionString;
    }

    public IEnumerable<dynamic> GetHeaders(int? id = null, Guid? rowPointer = null)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "GET_ALL");
            parameters.Add("@ID", id);
            parameters.Add("@RowPointer", rowPointer);

            return db.Query("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public void InsertHeader(HeaderModel model)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "INSERT");
            parameters.Add("@ID", model.ID);
            parameters.Add("@Column1", model.Column1);
            parameters.Add("@CreatedBy", model.CreatedBy);

            db.Execute("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public void UpdateHeader(HeaderModel model)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "UPDATE");
            parameters.Add("@ID", model.ID);
            parameters.Add("@RowPointer", model.RowPointer);
            parameters.Add("@Column1", model.Column1);
            parameters.Add("@UpdatedBy", model.UpdatedBy);

            db.Execute("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public void DeleteHeader(int? id = null, Guid? rowPointer = null)
    {
        using (IDbConnection db = new SqlConnection(_connectionString))
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Action", "DELETE");
            parameters.Add("@ID", id);
            parameters.Add("@RowPointer", rowPointer);

            db.Execute("ManageHeader", parameters, commandType: CommandType.StoredProcedure);
        }
    }
}

public class HeaderModel
{
    public int? ID { get; set; }
    public Guid? RowPointer { get; set; }
    public string Column1 { get; set; }
    public string CreatedBy { get; set; }
    public string UpdatedBy { get; set; }
}
