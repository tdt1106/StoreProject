using Microsoft.AspNetCore.Mvc;
using StoreProject.Models;
using StoreProject.Services;

namespace StoreProject.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HeaderController : ControllerBase
    {
        private readonly IHeaderService _headerService;

        public HeaderController(IHeaderService headerService)
        {
            _headerService = headerService;
        }

        // GET: api/Header
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var result = await _headerService.GetAllHeadersAsync();
            return Ok(result);
        }

        // GET: api/Header/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var header = await _headerService.GetHeaderByIdAsync(id);
            return header == null ? NotFound() : Ok(header);
        }

        // POST: api/Header
        [HttpPost]
        public async Task<IActionResult> Create(HeaderModel model)
        {
            await _headerService.AddHeaderAsync(model);
            return CreatedAtAction(nameof(GetById), new { id = model.ID }, model);
        }

        // PUT: api/Header/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, HeaderModel model)
        {
            if (id != model.ID) return BadRequest();
            await _headerService.UpdateHeaderAsync(model);
            return NoContent();
        }

        // DELETE: api/Header/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _headerService.DeleteHeaderAsync(id);
            return NoContent();
        }
    }
}
