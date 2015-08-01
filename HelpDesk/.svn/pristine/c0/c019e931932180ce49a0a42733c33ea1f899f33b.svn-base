<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="UpdateTicket.aspx.cs" Inherits="HelpDesk.Ticket.UpdateTicket" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <table>
            <tr>
                <td>
                </td>
            </tr>
        </table>

      <table style="background-color:#d8d8db" align ="center">
      <tr>
        <td colspan="4" align="center">
        <h2>Update Ticket</h2>
        </td>
      </tr>
            <tr>
         
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Requester:" Font-Size="11"></asp:Label>
            
                </td>
                <td class="style6">
                    <asp:DropDownList ID="ddlRequester" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                    </asp:DropDownList>
                </td>
                 <td>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Label ID="Label6" runat="server" Text="Subject:" Font-Size="11"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="style4" Width="522px"></asp:TextBox>
            </td>
            </tr>
            <tr>
          
                <td class="style1">
                </td>
           </tr>
           
        <tr>

        <td class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label2" runat="server" Text=" Assignee:" Font-Size="11"></asp:Label>
       
        </td>
        <td class="style6">
                <asp:DropDownList ID="ddlAssignee" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                </asp:DropDownList>
        </td>
        <td>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label7" runat="server" Text="Cc's:" Font-Size="11"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCCEmails" runat="server" CssClass="style4" Width="522px"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td class="style1">
        </td>
        </tr>

           <tr>
        <td class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="   Project:" Font-Size="11"></asp:Label>
      
        </td>
        <td>
                <asp:DropDownList ID="ddlProject" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                </asp:DropDownList>
        </td>
         <td>
               
               <asp:Label ID="Label8" runat="server" Text="Description:" Font-Size="11"></asp:Label>
            </td>
             <td  rowspan="6">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="style3" Height="120px" 
                     TextMode="MultiLine" Width="522px"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td class="style1">
        </td>
        </tr>

        <tr>
        <td class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="Label4" runat="server" Text="   Type:" Font-Size="11"></asp:Label> 
        </td>
                <td class="style6">
                <asp:DropDownList ID="ddlType" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                                <asp:ListItem Value="1">Question</asp:ListItem>
                                <asp:ListItem Value="2">Incident</asp:ListItem>
                                <asp:ListItem Value="3">Problem </asp:ListItem>
                                <asp:ListItem Value="4">Task </asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
         <tr>
        <td class="style1">
        </td>
        </tr>
        <tr>
        <td class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label5" runat="server" Text="Priority:" Font-Size="11"></asp:Label>   
        </td>
                <td class="style6">
                <asp:DropDownList ID="ddlPriority" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                                <asp:ListItem Value="1">Low</asp:ListItem>
                                <asp:ListItem Value="2">Normal</asp:ListItem>
                                <asp:ListItem Value="3">High </asp:ListItem>
                                <asp:ListItem Value="4">Urgent </asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
         <tr>
        <td class="style1">
            &nbsp;</td>
        </tr>
        
        <tr>
        <td class="style1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           Status:
        </td>
                <td class="style6">

                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="style5" 
                        Height="22px" Width="102px">
                                <asp:ListItem Value="1">New</asp:ListItem>
                                <asp:ListItem Value="2">Open</asp:ListItem>
                                <asp:ListItem Value="3">Pending </asp:ListItem>
                                <asp:ListItem Value="4">Solved </asp:ListItem>
                </asp:DropDownList>
               </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="txtdlFileName" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="txtdlPath" runat="server" Text="" Visible="false"></asp:Label>
            </td>
             <td>
            </td>
             <td>
            </td>
            
            <td align = "right">
            
               
            </td>
           
        </tr>
        <tr>
                <td>
                
                         <asp:GridView ID="gvAttachFile" runat="server" AutoGenerateColumns="false" EmptyDataText = "No files uploaded">
                                <Columns>
                                    <asp:BoundField DataField="Text" HeaderText="File Name" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "TicketDownloadFile_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID = "lbDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile_Click" />
                                            </ItemTemplate>
                                     </asp:TemplateField>
     
                                </Columns>
                            </asp:GridView>
                
                </td>
                <td>
                </td>
                 <td>
                </td>
                <td>
                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>

            
              
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td></td>
        <td align= "right">
         <asp:Button ID="btnUpdate"  onclick="btnUpdate_Click" runat="server" Text="Update" 
                    CssClass="style8" Height="32px" Width="75px" />
                <asp:Button ID="btnCancel"  onclick="btnCancel_Click" runat="server" 
                    Text="Cancel" CssClass="style8" Height="32px" Width="75px" />
        </td>
        </tr>

      </table>
</asp:Content>