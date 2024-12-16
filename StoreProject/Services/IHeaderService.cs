using StoreProject.Models;

namespace StoreProject.Services
{
    public interface IHeaderService
    {
        Task<IEnumerable<HeaderModel>> GetAllHeadersAsync();
        Task<HeaderModel> GetHeaderByIdAsync(int id);
        Task AddHeaderAsync(HeaderModel header);
        Task UpdateHeaderAsync(HeaderModel header);
        Task DeleteHeaderAsync(int id);
    }

}
