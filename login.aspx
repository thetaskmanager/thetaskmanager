<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="thetaskmanager.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_header" runat="server">
    <div class="Header">
        <h1 id="title"><u>The Task Manager</u></h1>
        <div id="LoginRegister">
            <a href="register.aspx">Register</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="server">
    <div>
        <p>Please login here using your information. If you still have to register, click <a href="register.aspx">here</a>, 
            up above.
        </p>
        <form id="loginForm" runat="server">
            <asp:Label runat="server" Text="Username" ID="lblUsername"></asp:Label>
            <asp:TextBox runat="server" ID="tbUsername"></asp:TextBox><br />
            <asp:Label runat="server" Text="Password" ID="lblPassword"></asp:Label>
            <asp:TextBox runat="server" ID="tbPassword"></asp:TextBox><br /><br />
            <asp:Button runat="server" ID="btLogin" Text="Login" />
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
    Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
