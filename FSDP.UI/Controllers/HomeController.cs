using FSDP.UI.Models;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace FSDP.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel contact)
        {
            string body = string.Format("Name: {0}<br/>Email: {1}<br/>Subject: {2}<br/>Message: {3}",
                contact.Name,
                contact.Email,
                contact.Subject,
                contact.Message);

            MailMessage msg = new MailMessage(
                "no-reply@homespundev.com"
                , "mfrey2011@gmail.com",
                contact.Subject,
                body);
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient("mail.homespundev.com");
            client.Credentials = new NetworkCredential("no-reply@homespundev.com", "P@ssw0rd");
            using (client)
            {
                try
                {
                    client.Send(msg);
                }
                catch
                {
                    ViewBag.ErrorMessage = "There was an error sending your email. Please try again.";
                    return View();
                }
            }
            return View("ContactConfirmation", contact);
        }
    }
}
