using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thetaskmanager
{
    public partial class taskHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Make sure the user is logged in
            if (Session["UID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    //Get all the user's tasks from the database
                    using (var dbContextObj = new thetaskmanagerEntities())
                    {
                        byte uid = (byte)Session["UID"];

                        var taskQueryResult = from task in dbContextObj.Tasks
                                              where task.userID == uid
                                              select task;

                        //hook the results to the gridView
                        grdTasks.DataSource = taskQueryResult.ToList();
                    }// using construct
                }// if statement (IsPostBack)
            }// if-else statement (IsLoggedIn)
        }// Page_Load event handler
    }
}