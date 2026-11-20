using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SchoolAppCore.Models;

namespace SchoolAppCore.Pages.Departments
{
    public class IndexModel : PageModel
    {
        private readonly SchoolContext _context;
        public IndexModel(SchoolContext context) => _context = context;

        public IList<Department> Departments { get; set; } = default!;

        public async Task OnGetAsync()
        {
            Departments = await _context.Departments.AsNoTracking().ToListAsync();
        }
    }
}
