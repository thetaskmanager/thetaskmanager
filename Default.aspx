<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="thetaskmanager.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Header">
        <h1>The Task Manager</h1>
        <div id="LoginRegister">
            <a href="login.aspx">Login</a> / <a href="register.aspx">Register</a>
        </div>
    </div>
    
    <div id="body">
        <p>Welcome to "The Task Manager", the single most amazing and majestic task manager you'll ever use! :)</p>
    </div>
</asp:Content>
