using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplicationExample.Models;

namespace WebApplicationExample.Controllers
{
    public class UserProjectsController : Controller
    {
        private CodeChallenge db = new CodeChallenge();

        // GET: UserProjects/Details/5
        public ActionResult ViewProjects(int? UserId)
        {
            var userProjects  = db.UserProjects.Include(u => u.Project);
            if (UserId != null)
            {
                 userProjects = db.UserProjects.Where(p => p.UserId == UserId).Include(u => u.Project); 
            }
            var users = db.Users.ToList();

            if (userProjects == null)
            {
                return HttpNotFound();
            }

            ViewBag.Users = users;
            return View(userProjects.ToList());
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
