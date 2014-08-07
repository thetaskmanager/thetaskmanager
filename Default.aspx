<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="thetaskmanager.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_header" runat="server">
    <div class="Header">
        <h1 id="title"><u>The Task Manager</u></h1>
        <div id="LoginRegister">
            <a href="login.aspx">Login</a> / <a href="register.aspx">Register</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="server">
    <div>
        <p>Welcome to "The Task Manager", the single most amazing and majestic task manager you'll ever use! :)</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
    Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
