<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="Responses.aspx.cs" Inherits="HelpDesk.Ticket.Responses" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="height:570px; width:1070px; overflow-x:scroll ; overflow-y: scroll; padding-bottom:10px;">
      <table cellpadding="5"  style ="background-color:#d8d8db; height: 184px;" 
          align="center" width="700"> 
      <tr>
      <td colspan="3" align="center">
      <h3>Ticket Post </h3> 
      </td>
      </tr>
        <tr>
        <td colspan="3" align="left"> 
                    <b>Subject: </b> <asp:Label ID="txtSubject" runat="server" Text=""></asp:Label>
                                <br />
                                </br>
                     <b> Desciption: </b> <asp:Label ID="txtDescription" runat="server" Text=""></asp:Label>
                         <asp:Label ID="lblEmailAssign" Visible="false" runat="server" Text=""></asp:Label>
                         <asp:Label ID="txtFileName" runat="server" Visible="false" Text=""></asp:Label>
                         <asp:Label ID="txtPath" runat="server" Visible="false" Text=""></asp:Label>
                         <asp:Label ID="txtdlFileName" runat="server" Visible="false" Text=""></asp:Label>
                         <asp:Label ID="txtdlPath" runat="server" Visible="false" Text=""></asp:Label>
                         <asp:Label ID="txtPFName" runat="server" Visible="false" Text=""></asp:Label>
                         <asp:Label ID="txtPFPath" runat="server" Visible="false" Text=""></asp:Label>  <br />
                                </br>
          </td> 
        </tr>
      
        <tr> 
                <td align="center"> 
                <b>Requester: </b><asp:Label ID="lblRequester" runat="server" Text=""></asp:Label>  
                </td> 
                <td align="center"> 
                  <b>Assignee: </b><asp:Label ID="lblAssignee" runat="server" Text=""></asp:Label>       
                </td> 
                <td align="center"> 
                 <b>Project: </b><asp:Label ID="lblProject" runat="server" Text=""></asp:Label>          
                </td> 
        </tr> 
         <tr> 
                <td align="center"> 
                   <b>Type: </b><asp:Label ID="lblType" runat="server" Text=""></asp:Label>    
                </td> 
                <td align="center"> 
               <b>Priority: </b><asp:Label ID="lblPriority" runat="server" Text=""></asp:Label>  
                </td> 
                <td align="center"> 
                     <b>Status: </b><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label> 
                     <br />
                </td> 
        </tr> 
</table>
<br />
            <%--                  
                <asp:GridView ID="gvFileAttach" runat="server" AutoGenerateColumns="false" EmptyDataText = "No files uploaded">
                                <Columns>
                                    <asp:BoundField DataField="Text" HeaderText="File Name" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "TicketDownloadFile_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
     
                                </Columns>
                            </asp:GridView>--%>
							
							                    
      
         
<%--<div class="main">--%>
<br />


    <table >
<tr>
            <td>
                   
             <asp:Button ID="btnSubmit"  onclick="btnSubmit_Click" runat="server" Text="Submit" OnClientClick="window.location.reload();" />
             <asp:Button ID="btnCancel"  onclick="btnCancel_Click" runat="server" Text="Cancel" /> </td>
          
        </tr>
         <tr>
               
                <td>
                <asp:TextBox ID="txtTicketPost" runat="server" CssClass="style3" Height="105px" 
                     TextMode="MultiLine" Width="523px"></asp:TextBox>
                </td>
               
                <td>
                       <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                             <telerik:RadUpload ID="RadUpload" runat="server" MaxFileInputsCount="5" 
                           TargetFolder="~/MyFiles" OnFileExists = "RadUpload_FileExists"
                        OverwriteExistingFiles="false" CssClass="style14" Width="309px">
                    </telerik:RadUpload>
             <asp:Button ID="btnSubmitAttach" runat="server" OnClick="btnSubmitAttach_Click" Text="Attach"></asp:Button>
                </td>
                  <td>
               <asp:Repeater ID="repeaterResults" runat="server" Visible="False">
                                        <HeaderTemplate>
                                             <b> Uploaded files in the target folder:</b>  
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                <%#DataBinder.Eval(Container.DataItem, "FileName")%>
                                                </td>
                                            </tr>
                                            <tr>
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

<%--
</table>
    <telerik:RadProgressManager ID="Radprogressmanager" runat="server"  
             CssClass="style16" Height="44px"></telerik:RadProgressManager>

                   
         <telerik:RadProgressArea ID="progressArea" runat="server">
                    </telerik:RadProgressArea>--%>






<table cellpadding="3" style = "background-color:#f0f0f1" width="600" >
 
    <tr>
    <td>
 
       
            <asp:Label ID="txtPost" runat="server" Text=""></asp:Label>
            <font color="blue"><asp:Label ID="txtPersonPost" runat="server" Visible="false" Text=""></asp:Label></font>
            <asp:GridView ID="gvPostFile" runat="server" AutoGenerateColumns="false" EmptyDataText = "No files uploaded">
                                <Columns>
                                    <asp:BoundField DataField="Text" HeaderText="File Name" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "PostDownloadFile_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID = "lnkDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
     
                                </Columns>
                            </asp:GridView>
        </td>
        </tr>
        
   
  
</table>
    </div>
</asp:Content>