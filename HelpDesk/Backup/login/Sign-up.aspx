<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign-up.aspx.cs" Inherits="HelpDesk.login.Sign_up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
      <style type="text/css">
          .style3
          {}
          .style4
          {
              width: 110px;
          }
          .style5
          {}
    </style>
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
                                    [ <a href="~/login/Sign-in.aspx" ID="HeadLoginStatus" runat="server">Log In </a> ]
                                </AnonymousTemplate>
                                 
                   
                            </asp:LoginView>
                             <asp:LoginView ID="SignInView" runat="server" EnableViewState="false">
                            <AnonymousTemplate>
                                    [ <a href="~/login/Sign-up.aspx" ID="HeadLoginStatus" runat="server">Sign Up </a> ]
                                </AnonymousTemplate>
                                  </asp:LoginView>
                        </div>
            
                    </div>
                    <div class="main">
                   
   <table cellpadding="5" style="background-color:#d8d8db" align="center">
   <tr>
        <td colspan="2">
         <h2>Sign up to Jimitron</h2>
        </td>
   </tr>
   <tr>
               <td class="style4">
                    <asp:Label ID="lblFname" runat="server" Text=" First Name: " Font-Size="12" ></asp:Label>
             
               </td>
               <td>
                <asp:TextBox ID="txtFName" TextMode="Password" runat="server" CssClass="style3" Height="34px" 
                       Width="242px"></asp:TextBox>
               </td>
               </tr>
               <tr>
               <td class="style4">
                    <asp:Label ID="Label1" runat="server" Text="Last Name:" Font-Size="12" ></asp:Label>
             
               </td>
               <td>
                <asp:TextBox ID="txtLName" TextMode="Password" runat="server" CssClass="style3" Height="34px" 
                       Width="242px"></asp:TextBox>
               </td>
               </tr>
     <tr>
       <td class="style4">
            <asp:Label ID="Label2" runat="server" Text="Email:" Font-Size="12" ></asp:Label>
              
        </td>
               <td>
                   <asp:TextBox ID="txtEmail" runat="server" CssClass="style3" Height="34px" 
                       Width="242px"></asp:TextBox>
               </td>
               </tr>
               <tr>
               <td class="style4">
               
                   <br />
               
               </td>
               <td align ="right">
               
                   <b> <asp:Button ID="btnSignup" runat="server" Text="Sign Up" 
                        onclick="Login_Click" CssClass="style5" Height="32px" Width="117px" /></b>
               
               </td>
               </tr>
               
               <tr>
               <td>
                
               </td>
               
               
                <td<>
           
                
                </td>
               </tr>
               <tr>
               <td></td>
               <td align="right"> <b> <br/></b></td>
               </tr>
               </table>
              
                
                 
                    </div>
                </div>
    </form>
</body>
</html>
