using System.Reflection.PortableExecutable;
using StoreProject.Data;
using StoreProject.Models;

namespace StoreProject.Services
{
    public class HeaderService : IHeaderService
    {
        private readonly IUnitOfWork _unitOfWork;

        public HeaderService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<HeaderModel>> GetAllHeadersAsync()
        {
            return await _unitOfWork.HeaderRepository.GetAllAsync();
        }

        public async Task<HeaderModel> GetHeaderByIdAsync(int id)
        {
            return await _unitOfWork.HeaderRepository.GetByIdAsync(id);
        }

        public async Task AddHeaderAsync(HeaderModel header)
        {
            await _unitOfWork.HeaderRepository.AddAsync(header);
            await _unitOfWork.CommitAsync();
        }

        public async Task UpdateHeaderAsync(HeaderModel header)
        {
            _unitOfWork.HeaderRepository.Update(header);
            await _unitOfWork.CommitAsync();
        }

        public async Task DeleteHeaderAsync(int id)
        {
            await _unitOfWork.HeaderRepository.DeleteAsync(id);
            await _unitOfWork.CommitAsync();
        }
    }

}
