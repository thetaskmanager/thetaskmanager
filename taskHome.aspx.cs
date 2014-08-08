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
                //Set the user's name label
                lblName.Text = (String)Session["FName"];

                if (!IsPostBack && String.IsNullOrEmpty(Request.QueryString["TaskID"]))
                {
                    refreshGrid();
                    populateGroups();
                    populateTypes();
                }// if statement (IsPostBack)
            }// if-else statement (IsLoggedIn)
        }// Page_Load event handler

        /**
         * Get a list of the Task Types
         */
        private void populateTypes()
        {
            using (var dbContextObj = new thetaskmanagerEntities())
            {
                byte uid = (byte)Session["UID"];

                List<TaskType> typesList = new List<TaskType>();

                var groupsQueryResult = from taskType in dbContextObj.TaskTypes
                                        where taskType.userID == uid
                                        select taskType;

                //bind the list of types to the dropdown list
                typesList = groupsQueryResult.ToList<TaskType>();
                ddlTaskTypes.DataSource = typesList;
                ddlTaskTypes.DataTextField = "name";
                ddlTaskTypes.DataValueField = "id";
                ddlTaskTypes.DataBind();
            }// using construct
        }// populateTypes method

        /**
         * Get a list of the Task Groups
         */
        private void populateGroups()
        {
            using (var dbContextObj = new thetaskmanagerEntities()) {
                byte uid = (byte)Session["UID"];

                List<TaskGroup> groupsList = new List<TaskGroup>();

                var groupsQueryResult = from taskGroup in dbContextObj.TaskGroups
                                       select taskGroup;

                //bind the list of types to the dropdown list
                groupsList = groupsQueryResult.ToList<TaskGroup>();
                ddlTaskGroups.DataSource = groupsList;
                ddlTaskGroups.DataTextField = "name";
                ddlTaskGroups.DataValueField = "id";
                ddlTaskGroups.DataBind();
            }// using construct
        }// populateGroups method

        /**
         * Get all the user's tasks from the database
         */
        private void refreshGrid()
        {
            using (var dbContextObj = new thetaskmanagerEntities())
            {
                byte uid = (byte)Session["UID"];

                var taskQueryResult = from task in dbContextObj.Tasks
                                      select task;

                //hook the results to the gridView
                grdTasks.DataSource = taskQueryResult.ToList();
                grdTasks.DataBind();
            }// using construct
        }// refreshGrid method

        protected void btAddTask_Click(object sender, EventArgs e)
        {
            //Create a new task object
            Task taskObject;

            using( var dbContextObj = new thetaskmanagerEntities()) {
                if (!String.IsNullOrEmpty(Request.QueryString["TaskID"])) {
                    taskObject = dbContextObj.Tasks.Where(t => t.id == int.Parse(Request.QueryString["TaskID"].ToString())).FirstOrDefault();
                    taskObject.name = tbTaskName.Text;
                    taskObject.description = tbTaskDescription.Text;
                    taskObject.date = clndTaskDate.SelectedDate;
                    taskObject.groupID = Byte.Parse(ddlTaskGroups.SelectedValue);
                    taskObject.typeID = Byte.Parse(ddlTaskTypes.SelectedValue);
                } else {
                    taskObject = new Task();
                    taskObject.name = tbTaskName.Text;
                    taskObject.description = tbTaskDescription.Text;
                    taskObject.date = clndTaskDate.SelectedDate;
                    taskObject.groupID = Byte.Parse(ddlTaskGroups.SelectedValue.ToString());
                    taskObject.typeID = Byte.Parse(ddlTaskTypes.SelectedValue.ToString());
                    dbContextObj.Tasks.Add(taskObject);
                }
                dbContextObj.SaveChanges();
            }// end using construct

            //Refresh the task grid
            refreshGrid();
        }

        protected void clndTaskDate_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void grdTasks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //get the task's id
            int TaskID = int.Parse(grdTasks.DataKeys[e.RowIndex].Values["TaskID"].ToString());

            using (var dbContextObj = new thetaskmanagerEntities())
            {
                Task taskObj = dbContextObj.Tasks.Where(t => t.id == TaskID).FirstOrDefault();

                taskObj.id = TaskID;
                dbContextObj.Tasks.Remove(taskObj);
                dbContextObj.SaveChanges();

                //refresh the task grid
                refreshGrid();
            }
        }
    }
}