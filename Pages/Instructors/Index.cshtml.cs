using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SchoolAppCore.Models;

namespace SchoolAppCore.Pages.Instructors
{
    public class IndexModel : PageModel
    {
        private readonly SchoolContext _context;
        public IndexModel(SchoolContext context) => _context = context;

        public IList<Instructor> Instructors { get; set; } = default!;

        public async Task OnGetAsync()
        {
            Instructors = await _context.Instructors.AsNoTracking().ToListAsync();
        }
    }
}
