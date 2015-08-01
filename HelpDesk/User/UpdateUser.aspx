<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="UpdateUser.aspx.cs" Inherits="HelpDesk.User.UpdateUser" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
       <div id="sidebar">
    <fieldset class="register">
          <legend>User Information</legend>
      <table >
          
            <tr>
                <td>
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
        </tr>
         <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
          <tr>
                <td>
                Role:
                </td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server">
                     <asp:ListItem Value="1">Administrator</asp:ListItem>
                               <asp:ListItem Value="2">Agent</asp:ListItem>
                                <asp:ListItem Value="3">User </asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
        <td>
        </td>
        </tr>

        <%--<tr>
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
        
       

      </table>


    </fieldset>
    <table>
        <tr>
            <td>
                <asp:Button ID="btnUpdate" onclick="btnUpdate_Click"  runat="server" Text="Update" />
            </td>
             <td>
                <asp:Button ID="btnCancel" onclick="btnCancel_Click"  runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>
     <table>
        <tr>
            <td>
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
        
       </div>
</asp:Content>