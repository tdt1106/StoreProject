using Microsoft.AspNetCore.Mvc;

namespace StoreProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HeaderController : ControllerBase
    {
        private readonly HeaderRepository _repository;

        public HeaderController(IConfiguration configuration)
        {
            _repository = new HeaderRepository(configuration.GetConnectionString("DefaultConnection"));
        }

        [HttpGet("Get")]
        public IActionResult GetHeaders(int? id = null, Guid? rowPointer = null)
        {
            var result = _repository.GetHeaders(id, rowPointer);
            return Ok(result);
        }

        [HttpPost("Insert")]
        public IActionResult InsertHeader([FromBody] HeaderModel model)
        {
            _repository.InsertHeader(model);
            return Ok("Inserted successfully");
        }

        [HttpPut("Update")]
        public IActionResult UpdateHeader([FromBody] HeaderModel model)
        {
            _repository.UpdateHeader(model);
            return Ok("Updated successfully");
        }

        [HttpDelete("Delete")]
        public IActionResult DeleteHeader(int? id = null, Guid? rowPointer = null)
        {
            _repository.DeleteHeader(id, rowPointer);
            return Ok("Deleted successfully");
        }
    }

}
