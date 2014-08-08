<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="taskHome.aspx.cs" Inherits="thetaskmanager.taskHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_header" runat="server">
    <div class="Header">
        <h1 id="title"><u><a href="Default.aspx">The Task Manager</a></u></h1>
        <div id="LoginRegister">
            <a href="login.aspx">Login</a> / <a href="register.aspx">Register</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="server">
    <p>Thank you for registering with us <asp:Label ID="lblName" runat="server" Text=""></asp:Label>! You're going to love it here!</p>
    <h3>Task List</h3>
    <p>In the table below, you will find all of your tasks.</p>
    <form id="frmGridView" runat="server">
        <asp:GridView ID="grdTasks" runat="server">
            <Columns>
                <asp:CommandField HeaderText="Edit" DeleteText="Edit" />
                <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>

        <p>&nbsp;&nbsp;</p>
        <h3>Add a new Task</h3>
        <asp:Label runat="server" Text="Task Name" ID="lblTaskName"></asp:Label>
        <asp:TextBox runat="server" ID="tbTaskName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="tbTaskName"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" Text="Task Description" ID="lblTaskDescription"></asp:Label>
        <asp:TextBox runat="server" ID="tbTaskDescription"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="tbTaskDescription"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" Text="Task Date" ID="lblTaskDate"></asp:Label>
        <asp:Calendar ID="clndTaskDate" runat="server" OnSelectionChanged="clndTaskDate_SelectionChanged"></asp:Calendar><br />
        <asp:Label runat="server" Text="Task Type" ID="lblTaskType"></asp:Label>
        <asp:DropDownList ID="ddlTaskTypes" runat="server"></asp:DropDownList><br />
        <asp:Label runat="server" Text="Task Group" ID="lblTaskGroup"></asp:Label>
        <asp:DropDownList ID="ddlTaskGroups" runat="server"></asp:DropDownList><br /><br />
        <asp:Button runat="server" ID="btAddTask" Text="Add" OnClick="btAddTask_Click"/><asp:Label ID="lblAddTaskMessages" runat="server" Text=""></asp:Label>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
    Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
