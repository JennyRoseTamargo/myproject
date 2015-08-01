<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="SelectedUser.aspx.cs" Inherits="HelpDesk.User.SelectedUser" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
    .style1
    {
        width: 305px;
    }
    .style2
    {
        width: 145px;
    }
</style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
         <telerik:radcodeblock ID="RadCodeBlock1" runat="server">
         <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <script type="text/javascript">

            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function gridCreated(sender, args) {
                if (sender.get_editIndexes && sender.get_editIndexes().length > 0) {
                    document.getElementById("OutPut").innerHTML = sender.get_editIndexes().join();
                }
                else {
                    document.getElementById("OutPut").innerHTML = "";
                }
            }
           
        </script>
    </telerik:radcodeblock>
   
        <br />
        <br />
          <table style = "background-color:#d8d8db" cellpadding="5" width="650px" align="center">

          <tr>

          <td colspan="2" align ="center">
            <h3>User Information</h3>
          </td>
          </tr>
          <tr>
          <td class="style2">
             &nbsp;&nbsp;
                     <font size="3">Role:</font>     
        
          </td>
          <td>
               <b> <asp:Label ID="txtRole" runat="server" Text=""></asp:Label></b>  
          </td>
          </tr>
          <tr>
          <td class="style2">
            
              &nbsp;&nbsp;
            <font size="3">First Name:</font> 
              
             
          </td>
          <td>
                 <b><asp:Label ID="txtFName" runat="server" Text=""></asp:Label></b> 
          </td>
          </tr>
          <tr>
          <td class="style2">
         &nbsp;&nbsp;
         <font size="3">  Last Name:</font> 
       
            
          </td>
          <td>
                 <b><asp:Label ID="txtLName" runat="server" Text=""></asp:Label></b> 
          </td>
          </tr>
          <tr>
          <td class="style2">
            &nbsp;&nbsp;
            <font size="3"> Email Address:</font> 
           
          </td>
          <td>
              <b><asp:Label ID="txtEmailAdd" runat="server" Text=""></asp:Label></b>    
          </td>
          </tr>
          
  </table>

  <br />
  <br />

      <table align = "center" >
      
   <tr>
            
            <td>
                    <telerik:radajaxmanager ID="RadAjaxManager" runat="server">
      
                    </telerik:radajaxmanager>
                      <telerik:radajaxloadingpanel ID="RadAjaxLoadingPanel" runat="server" />

                       <telerik:radgrid ID="rg_AssignedTickets" GridLines="None" runat="server" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                        AutoGenerateColumns="False" OnItemUpdated="rg_ItemUpdated" 
                        OnItemDeleted="rg_ItemDeleted" PageSize="5"
               
                        OnDataBound="rg_DataBound" AllowSorting="True" CellSpacing="0" CssClass="style1" 
                                 Width="609px">


                        <PagerStyle Mode="NextPrevAndNumeric" />

                        <MasterTableView CommandItemDisplay="Top" Width="100%"  DataKeyNames="TicketId"   EditMode="InPlace" 
                            HorizontalAlign="NotSet" AutoGenerateColumns="False"> 
                              <CommandItemSettings ShowAddNewRecordButton="false" />
                            <Columns>
                         <%--       <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="Redirect" Text="Update" UniqueName="ButtonColumn"> 
                                    <HeaderStyle Width="50px" /> 
                                </telerik:GridButtonColumn> --%>

                                 <telerik:GridBoundColumn DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="false"
                                    UniqueName="UserId">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TicketId" HeaderText="TicketId" SortExpression="TicketId" 
                                    UniqueName="TicketId">
                                </telerik:GridBoundColumn>


                               
				            <telerik:GridHyperLinkColumn 
                                DataNavigateUrlFields="TicketId" UniqueName="Subject" DataNavigateUrlFormatString="~\User\AssignedTicketsDetail.aspx?UATid={0}" 
                                HeaderText="Subject" DataTextField="Subject">
                            </telerik:GridHyperLinkColumn>
                         
				                 <telerik:GridBoundColumn DataField="Requester" HeaderText="Requester" SortExpression="Requester"
                                    UniqueName="Requester" >
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="DateAndTime" HeaderText="Requested date" SortExpression="DateAndTime"
                                    UniqueName="DateAndTime" >
                                </telerik:GridBoundColumn>
				                 
				                

               
                                <telerik:GridButtonColumn ConfirmText="Delete this Ticket?" ConfirmDialogType="RadWindow" 
                                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                </telerik:GridButtonColumn>
                            </Columns>
                    
                        </MasterTableView>
                        <ClientSettings>
                             <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                    </telerik:radgrid>


                  
                           <telerik:radwindowmanager ID="RadWindowManager" runat="server">
                    </telerik:radwindowmanager> 
        </td>
    </tr>
   
  </table>

        <table>
       
         <tr>
       
        <td align="right">
         <asp:Button ID="btnBack"  onclick="btnBack_Click" runat="server" Text="Back" 
                CssClass="style4" Width="71px" Height="33px" />
        </td>
    </tr>
       
        </table>
         
</asp:Content>