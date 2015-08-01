<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="AddTicket.aspx.cs" Inherits="HelpDesk.Ticket.AddTicket" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
         .style1
         {
             width: 1014px;
         }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 <div style="height:570px; width:1070px; overflow-x:scroll ; overflow-y: scroll; padding-bottom:10px;">
   
      
                         <table align="center" style = "background-color:#d8d8db">
                         <tr>
                                <td colspan = "4" align ="center">
                                <h2>Add New Ticket</h2>
                                </td>
                         </tr>
                                 <tr>
                                       <td>
                                              Requester:
                                         </td>
                                         <td>
                                               <b><asp:Label ID="lblRequester" runat="server" Text=""></asp:Label></b> 
                                                <asp:Label ID="lblUserId" Visible="False" runat="server" Text=""></asp:Label>
                                      </td>
                                       <td>
                                                 Subject:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSubject" runat="server" CssClass="style2" Width="656px"></asp:TextBox>
                                            </td>
                                           <%-- <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red"
                                                        ErrorMessage="*" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                                            </td>--%>
                                </tr>
                                <tr>
                                         <td>
                                               <asp:Label ID="lblTicketid" runat="server" Text="" Visible="false"></asp:Label>
                                         </td>
                                </tr>
                                <tr>
                                            <td>
                                                Assignee:
                                            </td>
                                             <td>
                                                <asp:DropDownList ID="ddlAssignee" runat="server" CssClass="style17" 
                                                     Width="145px">
                                                                  <asp:ListItem></asp:ListItem>
                                                                </asp:DropDownList>
                
                                            </td>
                                             <td>
                                                    CCs:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCCs" runat="server" CssClass="style3" Width="656px"></asp:TextBox>
                                                </td>
                                                                              <%--  <td>
                                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ForeColor="Red"
                                                                                            ErrorMessage="*" ControlToValidate="ddlAssignee"></asp:RequiredFieldValidator>
                                                                                </td>--%>
                                </tr>
                                <tr>
                                            <td>
                                            <asp:Label ID="txtAssigneeEmailSend" runat="server" Visible="false" Text=""></asp:Label>
                                            </td>
                                </tr>

                                <tr>
                                            <td>
                                                Type:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="style17" 
                                                    Width="145px" >
                                                                      <asp:ListItem> </asp:ListItem>
                                                                      <asp:ListItem Value="1">Question</asp:ListItem>
                                                                       <asp:ListItem Value="2">Incident</asp:ListItem>
                                                                        <asp:ListItem Value="3">Problem </asp:ListItem>
                                                                        <asp:ListItem Value="4">Task </asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td >
                                                        Description:
                
                                             </td >
                                                    <td rowspan="6">
                                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="style4" Height="200px" 
                                                            Width="656px" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
        
  
                                                </tr>
                                                <tr>
                                                    <td>
                                                    <asp:Label ID="txtFileName" runat="server" Visible="false" Text=""></asp:Label>
            
                                                    </td>
                                                
            <%-- <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red"
                            ErrorMessage="*" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
            </td>--%>
                                            <%-- <td>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                                        ErrorMessage="*" ControlToValidate="ddlType"></asp:RequiredFieldValidator>
                                            </td>--%>

                                </tr>
                                
                                <tr>
                                        <td >
                                             Priority:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPriority" runat="server" CssClass="style17" 
                                                    Width="145px">
                                                              <asp:ListItem></asp:ListItem>
                                                              <asp:ListItem Value="1">Low</asp:ListItem>
                                                               <asp:ListItem Value="2">Normal</asp:ListItem>
                                                                <asp:ListItem Value="3">High </asp:ListItem>
                                                                <asp:ListItem Value="4">Urgent </asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                       <%-- <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                        ErrorMessage="*" ControlToValidate="ddlPriority"></asp:RequiredFieldValidator>
                                        </td>--%>
               
                                </tr>
                                 <tr>
                                    <td>
                                               <asp:Label ID="txtPath" runat="server" Visible="false" Text=""></asp:Label></td>
                                </tr>
        
                                <tr>
                                    <td>
                                       Status:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="style17" 
                                                    Width="145px">
                                                          <asp:ListItem></asp:ListItem>
                                                          <asp:ListItem Value="1">New</asp:ListItem>
                                                           <asp:ListItem Value="2">Open</asp:ListItem>
                                                            <asp:ListItem Value="3">Pending </asp:ListItem>
                                                            <asp:ListItem Value="4">Solved </asp:ListItem>
                                         </asp:DropDownList>

                                    </td>
                                  <%--   <td> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                                        ErrorMessage="*" ControlToValidate="ddlStatus"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td>
            
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         Project:
                                    </td>
                                    <td>
                                            <asp:DropDownList ID="ddlProject" runat="server" CssClass="style17" 
                                                    Width="145px">
                                            </asp:DropDownList>
                                    </td>
                                     <%--  <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red"
                                                        ErrorMessage="*" ControlToValidate="ddlProject"></asp:RequiredFieldValidator>
                                    </td>--%>
                                <td></td>
                                    <td>
                                     <asp:Button ID="btnSubmitAttach" runat="server" OnClick="btnSubmitAttach_Click" Text="Attach"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                      
                              </td>
                                    <td> 
                                             
                                    </td>
                                     <td></td>
        <td>
          <telerik:RadUpload ID="RadUpload" runat="server" MaxFileInputsCount="5" TargetFolder="~/MyFiles" OnFileExists = "RadUpload_FileExists"
                        OverwriteExistingFiles="false" CssClass="style14" Width="312px">
                    </telerik:RadUpload>
       
          
      </td>
    </tr>
                     </table>
            

      


    
    <table>
<tr>
<td align="right" class="style1">
         <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
           <asp:Button ID="btnAddTicket" runat="server" Text="Submit" 
                                        onclick="btnAddTicket_Click" Width="86px" CssClass="style16" 
                                        Height="40px" />

                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="style7" 
                                             Width="86px" Height="40px" onclick="btnCancel_Click" />
        </td>
     
</tr>
    <tr>
       
            
        
        <td class="style1">
          
           
                    
  <%--       <telerik:RadProgressArea ID="progressArea" runat="server">
                    </telerik:RadProgressArea>--%>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager" />

    
<telerik:RadProgressManager ID="Radprogressmanager" runat="server"  
             Height="10px"></telerik:RadProgressManager>

                                    
                                    <asp:Repeater ID="repeaterResults" runat="server" Visible="False">
                                        <HeaderTemplate>
                                             <b> Uploaded files in the target folder:</b>  
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                        <table border="2">
                                            <tr>
                                                <td>
                                                <%#DataBinder.Eval(Container.DataItem, "FileName")%>
                                                </td>
                                    
                                        
                                                <td>
                                                    <%#DataBinder.Eval(Container.DataItem, "ContentLength").ToString() + " bytes"%>
                                                </td>
                                            </tr>
                                        </table>
                                            
                                      
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
        </td>
       
    </tr>
 

</table>
</asp:Content>