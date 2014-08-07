<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="thetaskmanager.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_header" runat="server">
    <div class="Header">
        <h1 id="title"><u>The Task Manager</u></h1>
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
            <asp:TextBox runat="server" ID="tbName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="tbName"></asp:RequiredFieldValidator><br />
            <asp:Label runat="server" Text="Username" ID="lblUsername"></asp:Label>
            <asp:TextBox runat="server" ID="tbUsername"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="tbUsername"></asp:RequiredFieldValidator><br />
            <asp:Label runat="server" Text="Password" ID="lblPassword"></asp:Label>
            <asp:TextBox runat="server" ID="tbPassword"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="tbPassword"></asp:RequiredFieldValidator><br />
            <asp:Label runat="server" Text="Confirm Password" ID="lblConfirmPassword"></asp:Label>
            <asp:TextBox runat="server" ID="tbConfirmPassword"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="tbConfirmPassword"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="The passwords did not match" ControlToCompare="tbPassword" ControlToValidate="tbConfirmPassword" Display="Dynamic"></asp:CompareValidator><br /><br />
            <asp:Button runat="server" Text="Register" ID="btRegister" OnClick="btRegister_Click" />
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_footer" runat="server">
     Copyright: Micheal Walls and Timothy Radder<br />
        2014
</asp:Content>
