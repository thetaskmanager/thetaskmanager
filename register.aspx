<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="thetaskmanager.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_header" runat="server">
    <div class="Header">
        <h1 id="title"><u><a href="Default.aspx">The Task Manager</a></u></h1>
        <div id="LoginRegister">
            <a href="login.aspx">Login</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="server">

    <div>
        <p>Welcome to "The Task Manager", the best and most useful task manager you'll ever use! Thank you for choosing us as
            your primary manager, and please, enjoy your stay, and help yourself to the complimentary cookies.
        </p>
        <form id="registerForm" runat="server">
            <asp:Label runat="server" Text="Name" ID="lblName"></asp:Label>
            <asp:TextBox runat="server" ID="tbName"></asp:TextBox><br />
            <asp:Label runat="server" Text="Username" ID="lblUsername"></asp:Label>
            <asp:TextBox runat="server" ID="tbUsername"></asp:TextBox><br />
            <asp:Label runat="server" Text="Password" ID="lblPassword"></asp:Label>
            <asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox><br />
            <asp:Label runat="server" Text="Confirm Password" ID="lblConfirmPassword"></asp:Label>
            <asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password"></asp:TextBox><br /><br />
            <asp:Button runat="server" Text="Register" ID="btRegister" />
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
     Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
