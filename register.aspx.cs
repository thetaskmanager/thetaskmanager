using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace thetaskmanager
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btRegister_Click(object sender, EventArgs e)
        {
            User newUser = new User();

            if (newUser.DoesUserExist(tbUsername.Text))
            {
                lblRegistrationMessages.Text = "A user with that username already exists!";
            }
            else
            {
                newUser.username = tbUsername.Text;

                //Generate a "salt" to use to padd the password
                string uniqueSalt = newUser.CreateSalt(8);
                newUser.salt = uniqueSalt;

                //Hash the password
                newUser.password = newUser.CreatePasswordHash(tbPassword.Text, uniqueSalt);

                newUser.fname = tbFName.Text;
                newUser.lname = tbLName.Text;

                /**
                 * Here we use a using() expression so that once the expression is finished
                 * evaluating the new object that was instantiated calls it's Dispose() method
                 * to destroy itself cleanly, without us manually worrying about it.
                 */
                using (var contextObj = new thetaskmanagerEntities())
                {
                    contextObj.Users.Add(newUser);

                    contextObj.SaveChanges();
                }// end using expression

                Response.Redirect("taskHome.aspx");
            }// if-else statement to control duplicate users

        }// end event handler for Register button
    }
}