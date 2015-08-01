<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="ChangePassword.aspx.cs" Inherits="HelpDesk.User.ChangePassword" %>


 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


                            <table align="center" style="background-color:#d8d8db" width="550">
          
            <tr>
                <td>
                </td>
           </tr>
            <tr>
                <td> <h3>Change Your Password</h3>
                </td>
           </tr>

        <tr>

       
        <td>
          
       Current Password:<br />
&nbsp;<asp:TextBox ID="txtCurrpass" runat="server" CssClass="style5" Width="264px" TextMode="Password"></asp:TextBox>
        </td>
       <%-- <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtCurrpass" 
                ErrorMessage="Please enter Current password"></asp:RequiredFieldValidator>
        </td>--%>
        
        </tr>
        <tr>
        <td>
        </td>
        </tr>

        <tr>
      
                <td>
                       New Password: 
                       <br />
                       <asp:TextBox ID="txtNewPass" runat="server" CssClass="style5" Width="264px" TextMode="Password"></asp:TextBox>
                </td>
               <%-- <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtNewPass" ErrorMessage="Please enter New password"></asp:RequiredFieldValidator>
                </td>--%>
              
        </tr>
         <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
        <tr>
           
                <td>
                   Confirm Password: 
                    <br />
                    <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="style5" Width="264px" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td>
                   <%--      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtConfirmPass" 
                    ErrorMessage="Please enter Confirm  password"></asp:RequiredFieldValidator>--%>

                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" 
                    ErrorMessage="Password Not Match!"></asp:CompareValidator>    
                </td>
        </tr>




    <tr>
        <td align="right">
            <asp:Button ID="btnChangePass"   runat="server" Text="Change Password" 
                onclick="btnChangePass_Click" />
                     <asp:Button ID="btnCancel"  onclick = "btnCancel_Click" runat="server" Text="Cancel" />
        </td>
        
       
       
        </tr>

</table>
            <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>




 </asp:Content>
