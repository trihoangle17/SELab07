using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SchoolAppCore.Models;

namespace SchoolAppCore.Pages.Students
{
    public class IndexModel : PageModel
    {
        private readonly SchoolContext _context;
        public IndexModel(SchoolContext context) => _context = context;

        public IList<Student> Students { get; set; } = default!;

        public async Task OnGetAsync()
        {
            Students = await _context.Students.AsNoTracking().ToListAsync();
        }
    }
}
