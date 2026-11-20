using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SchoolAppCore.Models;

namespace SchoolAppCore.Pages.Enrollments
{
    public class IndexModel : PageModel
    {
        private readonly SchoolContext _context;
        public IndexModel(SchoolContext context) => _context = context;

        public IList<Enrollment> Enrollments { get; set; } = default!;

        public async Task OnGetAsync()
        {
            Enrollments = await _context.Enrollments
                .Include(e => e.Course)
                .Include(e => e.Student)
                .AsNoTracking()
                .ToListAsync();
        }
    }
}
