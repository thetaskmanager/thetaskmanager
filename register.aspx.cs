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

        //Create a random number to use as a "salt" (Padd the password)
        private static string CreateSalt(int size)
        {
            // Generate a pseudo random number
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);

            // Encode the number as a Base64 string and return it
            return Convert.ToBase64String(buff);
        }// end CreateSalt method

        /* Generate a SHA1 hash of the password, using a salt (random string) to padd the password
         * Padding with a salt decreases probability of the same passwords having the same hash
         * Used SHA1 with an apparently deprecated method, but meh. I'm not using ASP.NET Membership for
         * such a simple project. ASP.NET Membership does exactly this anyways, so meh..
         */
        private static string CreatePasswordHash(string pwd, string salt)
        {
            string saltAndPwd = String.Concat(pwd, salt);
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "SHA1");
            hashedPwd = String.Concat(hashedPwd, salt);
            return hashedPwd;
        }// end CreatePasswordHash method

        protected void btRegister_Click(object sender, EventArgs e)
        {
            User newUser = new User();
            newUser.username = tbUsername.Text;

            //hash the password before storing it in the DB
            newUser.password = CreatePasswordHash(tbPassword.Text, CreateSalt(8));

            newUser.fname = tbFName.Text;
            newUser.lname = tbLName.Text;

            /**
             * Here we use a using() expression so that once the expression is finished
             * evaluating the new object that was instantiated calls it's Dispose() method
             * to destroy itself cleanly, without us manually worrying about it.
             */
            using(var contextObj = new thetaskmanagerEntities()) {
                contextObj.Users.Add(newUser);
            }// end using expression

        }// end event handler for Register button
    }
}