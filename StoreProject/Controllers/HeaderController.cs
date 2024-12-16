using Microsoft.AspNetCore.Mvc;
using StoreProject.Models;
using StoreProject.Data;
using HeaderManagement.Data;
using StoreProject.Repositories;

namespace StoreProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HeaderController : ControllerBase
    {
        private readonly IHeaderRepository _repository;

        public HeaderController(IHeaderRepository repository)
        {
            _repository = repository;
        }


        [HttpGet("Get")]
        public async Task<IActionResult> GetHeaders(int? id = null, Guid? rowPointer = null)
        {
            var result = await _repository.GetAllAsync();
            return Ok(result);
        }

        [HttpPost("Insert")]
        public async Task<IActionResult> InsertHeader([FromBody] HeaderModel model)
        {
            await _repository.AddAsync(model); 
            return Ok("Inserted successfully");
        }

        [HttpPut("Update")]
        public IActionResult UpdateHeader([FromBody] HeaderModel model)
        {
            _repository.Update(model); 
            return Ok("Updated successfully");
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> DeleteHeader(int? id = null, Guid? rowPointer = null)
        {
            await _repository.DeleteAsync(id ?? 0); 
            return Ok("Deleted successfully");
        }
    }

}
