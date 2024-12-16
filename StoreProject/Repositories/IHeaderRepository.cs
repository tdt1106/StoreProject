using StoreProject.Models;

namespace StoreProject.Repositories
{
    public interface IHeaderRepository
    {
        Task<IEnumerable<HeaderModel>> GetAllAsync();
        Task<HeaderModel> GetByIdAsync(int id);
        Task<HeaderModel> GetByIdOrRowPointer(int? id, Guid? rowPointer);
        Task AddAsync(HeaderModel header);
        void Update(HeaderModel header);
        Task DeleteAsync(int id);
    }
}
