<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HelpDesk.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    &nbsp;</h1>
            </div>

                      
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In </a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
          
                     
                        <asp:MenuItem NavigateUrl="~/Ticket/Tickets.aspx" Text="Tickets" Value="Ticket">
                            <asp:MenuItem NavigateUrl="~/Ticket/AddTicket.aspx" Text="Add Ticket" 
                                Value="Add Ticket"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/User/ManageUser2.aspx" Text="Users" Value="Users">
                            <asp:MenuItem NavigateUrl="~/User/AddUser.aspx" Text="Add User" 
                                Value="Add User"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/User/MyAccount.aspx" Text="My Account" 
                                Value="My Account"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ProjectName/Projects.aspx" Text="Projects" 
                            Value="Projects">
                            <asp:MenuItem NavigateUrl="~/ProjectName/AddProjects.aspx" Text="Add Project" 
                                Value="Add Project"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </div>
    </form>
</body>
</html>
