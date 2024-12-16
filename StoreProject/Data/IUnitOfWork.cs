using StoreProject.Repositories;

namespace StoreProject.Data
{
    public interface IUnitOfWork : IDisposable
    {
        IHeaderRepository HeaderRepository { get; }
        Task<int> CommitAsync();
    }

}
