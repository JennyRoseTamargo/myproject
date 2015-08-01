<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master" CodeBehind="AddUser.aspx.cs" Inherits="HelpDesk.User.AddUser" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <table  cellpadding="5" style="background-color:#d8d8db" align="center"> 
            <tr>
                    <td colspan="3" align="center"> 
                     <h3>User Information </h3> </td> 
             </tr>
               
 
                    <tr>
                            <td class="style8">
                                <asp:Label ID="lblFname" runat="server" Text="First Name:" Font-Size="12" ></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstname" runat="server" CssClass="style5" Height="28px" 
                                    Width="291px"></asp:TextBox>
                            </td>
                           <%-- <td class="style2">
                                <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtFirstname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>--%>
                    
                        </tr>
                        <tr>
                                     <td class="style8">
                                <asp:Label ID="lblLname" runat="server" Text="Last Name:"  Font-Size="12" ></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="style5" Height="28px" 
                                    Width="291px"></asp:TextBox>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                       
                         <tr>
                            <td class="style8">
                                <asp:Label ID="lblEmail" runat="server" Font-Size="12" Text="Email Address:" ></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailAdd" runat="server" CssClass="style5" Height="28px" 
                                    Width="291px"></asp:TextBox>
                            </td>
                            <%--<td class="style2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtEmailAdd" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>--%>
                         </tr>
                             
                         <tr>
                            <td class="style8">
                                <asp:Label ID="lblRole" runat="server" Text="Role:" Font-Size="12"></asp:Label>
                            </td>
                            <td>
                              <asp:DropDownList ID="ddlRole" runat="server" CssClass="style6" Height="26px" 
                                    Width="140px">
                              <asp:ListItem></asp:ListItem>
                              <asp:ListItem Value="1">Administrator</asp:ListItem>
                               <asp:ListItem Value="2">Agent</asp:ListItem>
                                <asp:ListItem Value="3">User </asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <%-- <td class="style2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="*" ControlToValidate="ddlRole" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>--%>
                         </tr>
        
         <tr>
         <td class="style8"></td>
               <td align="right">
               <asp:Button ID="btnAddUser" runat="server" Text="Add" 
                        onclick="btnAddUser_Click" Width="86px" CssClass="style7" Height="30px" />
               </td>
               <td >
               
                      
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                         onclick="btnCancel_Click"  Width="86px" Height="30px" CssClass="style7" />
                </td>
        
         </tr>
                            </table>
                             <table align="left">
                                <tr>
                                    <td>
                                     <font color="red"> <asp:Label ID="lblMsg" runat="server" ></asp:Label></font><br/>
                                    </td>
                                </tr>
                            </table>
</asp:Content>