using Microsoft.EntityFrameworkCore;
using StoreProject.Models;

namespace HeaderManagement.Data
{
    public class AppDbContext : DbContext
    {
        public DbSet<HeaderModel> Headers { get; set; }
        public DbSet<DetailModel> Details { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HeaderModel>().HasNoKey();
            modelBuilder.Entity<DetailModel>().HasNoKey();
        }
    }
}
