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
    <p>In the table below, you will find all of your tasks</p>
    <form id="frmGridView" runat="server">
        <asp:GridView ID="grdTasks" runat="server"></asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
    Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
