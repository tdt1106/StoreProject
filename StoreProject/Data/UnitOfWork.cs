using System;
using HeaderManagement.Data;
using StoreProject.Repositories;

namespace StoreProject.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;

        public UnitOfWork(AppDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public IHeaderRepository HeaderRepository => new HeaderRepository(_context, _configuration);


        public async Task<int> CommitAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }

}
