<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="MyAccount.aspx.cs" Inherits="HelpDesk.User.MyAccount" %>

   <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">                       

 <table style=" background-color:#d8d8db"  align="center">
          
            <tr>
                <td>
                </td>
           </tr>
             <tr>
                <td colspan="4"  align="center">
                <h3>Account Information</h3>
                </td>
           </tr>
              
        <tr>
        <td>
        FirstName:
        </td>
        <td>
          <asp:TextBox ID="txtFname" runat="server" CssClass="style5" Width="264px"></asp:TextBox>
        </td>
         <td>
        LastName:
        </td>
        <td>
                 <asp:TextBox ID="txtLName" runat="server" CssClass="style5" Width="264px"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
        </td>
        </tr>

        <tr>
        <td>
        Email Address:
        </td>
                <td>
                  <asp:TextBox ID="txtEmailAdd" runat="server" CssClass="style5" Width="264px"></asp:TextBox>
                </td>
               <td>
               </td>
        </tr>
         <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
        <tr>
             <td>
                Password
                </td>
                <td>
                 <asp:TextBox ID="txtPassword" runat="server"  CssClass="style5" Width="264px" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td>
                </td>
                <td>
                    <asp:LinkButton ID="lbChangePassword" runat="server" 
                        onclick="lbChangePassword_Click">Change Password</asp:LinkButton>
                </td>
        
        </tr>
          <tr>
                <td>
                Role:
                </td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem> </asp:ListItem>
                                  <asp:ListItem Value="1">Administrator</asp:ListItem>
                                   <asp:ListItem Value="2">Agent</asp:ListItem>
                                    <asp:ListItem Value="3">User</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
        <td>
        </td>
        </tr>

       <%-- <tr>
        <td>
        Project Assign:
        </td>
                <td>
                <asp:DropDownList ID="ddlProject" runat="server">
                               
                </asp:DropDownList>
                </td>
        </tr>--%>
         <tr>
        <td>
            &nbsp;</td>
        </tr>
        
       

        <tr>
            <td>
               
            </td>
             <td>
               
            </td>
             <td>
               
            </td>
             <td align="right">
              <asp:Button ID="btnUpdate"   runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                     onclick="btnCancel_Click" />
            </td>
        </tr>
    </table>
     <table class="style1">
        <tr>
            <td>
                  <font color="red"> <asp:Label ID="lblMsg" runat="server" ></asp:Label></font><br/>
                   <asp:Label ID="txtUserId" runat="server" Visible="false" ></asp:Label>
            </td>
        </tr>
    </table>
           
</asp:Content>