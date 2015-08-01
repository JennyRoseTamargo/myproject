<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProjects.aspx.cs" Inherits="HelpDesk.ProjectName.AddProjects" %>

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
                        <asp:MenuItem NavigateUrl="~/User/ManageUser.aspx" Text="Users" Value="Users">
                            <asp:MenuItem NavigateUrl="~/User/AddUser.aspx" Text="Add User" 
                                Value="Add User"></asp:MenuItem>
                            <asp:MenuItem Text="My Account" Value="My Account" 
                                NavigateUrl="~/User/MyAccount.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ProjectName/Projects.aspx" Text="Projects" 
                            Value="Projects"> 
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </div>

        
                  <fieldset class="register">
                            <legend>New Project</legend>
                            <table>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                            <td>
                            Project Name:
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddProjectName" runat="server" CssClass="style1" 
                                    Width="181px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ForeColor="red" ErrorMessage="*" ControlToValidate="txtAddProjectName"></asp:RequiredFieldValidator>
                            </td>
                            </tr>
                            </table>
                            <table>
                            <tr>
                            <td>
                                <asp:Button ID="btnAddProject" runat="server" Text="Add" 
            onclick="btnAddProject_Click" Width="59px" CssClass="style2" Height="29px" />
                            </td>
                            <td>
                            


            <asp:Button ID="btnCancel" runat="server" Text="Clear" 
                 onclick="btnCancel_Click" CssClass="style3" Height="29px" Width="59px" />
                            </td>
                            </tr>
                            </table>
                        


                             </fieldset>
                             <table align="left">
                                <tr>
                                <td>
                                <font color="red"> <asp:Label ID="lblMsg" runat="server" ></asp:Label></font><br/>
                                </td>
                                </tr>
                             </table>
                              

    </div>


    </form>
</body>
</html>
