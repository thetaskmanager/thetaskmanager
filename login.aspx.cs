using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thetaskmanager
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            User userObj = new User();
            Boolean loginResult;
            
            loginResult = userObj.Login(tbUsername.Text, tbPassword.Text);

            if( !loginResult ) {
                lblLoginMessages.Text = "Login failed!";
            } else {
                //Store object properties in the session
                Session["UID"] = userObj.id;
                Session["Username"] = userObj.username;
                Session["FName"] = userObj.fname;
                Session["LName"] = userObj.lname;

                Response.Redirect("taskHome.aspx");
            }// if-else statement
        }// event handler for login button
    }// login class
}