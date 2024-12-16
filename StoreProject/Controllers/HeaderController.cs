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
            try
            {
                await _repository.AddAsync(model); 
                return Ok("Inserted successfully");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);  
            }
        }

        [HttpPut("Update")]
        public IActionResult UpdateHeader([FromBody] HeaderModel model)
        {
            if (model.ID == null && model.RowPointer == null)
            {
                return BadRequest("ID or RowPointer must be provided for updating.");
            }

            try
            {
                _repository.Update(model);
                return Ok("Updated successfully");
            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }
            
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> DeleteHeader(int? id = null, Guid? rowPointer = null)
        {
            if (id == null && rowPointer == null)
            {
                return BadRequest("ID or RowPointer must be provided for deletion.");
            }

            try
            {
                await _repository.DeleteAsync(id ?? 0);
                return Ok("Deleted successfully");
            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }
            
        }
    }

}
