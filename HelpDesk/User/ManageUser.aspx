<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master" CodeBehind="AssignedTicketsDetail.aspx.cs" Inherits="HelpDesk.User.AssignedTicketsDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
  <telerik:radcodeblock ID="RadCodeBlock1" runat="server">
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
        <table>
          <tr>
              
                    <td>
              <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" >
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>

              </td>
             
                 <td align="center">
                   

                      <telerik:radgrid ID="rg_Users" GridLines="None" runat="server" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                        AutoGenerateColumns="False" OnItemUpdated="rg_ItemUpdated" OnItemCommand = "rg_ItemCommand"
                        OnItemDeleted="rg_ItemDeleted" OnItemInserted="rg_ItemInserted" PageSize="5"
               
                        OnDataBound="rg_DataBound" AllowSorting="True" CellSpacing="0" CssClass="style1" 
                                 Width="609px" AllowFilteringByColumn="true" >

                        

                        <PagerStyle Mode="NextPrevAndNumeric" />

                        <MasterTableView  CommandItemDisplay="Top"  Width="100%" DataKeyNames="UserId"   EditMode="InPlace" 
                            HorizontalAlign="NotSet" AutoGenerateColumns="False"> 
                            <CommandItemSettings ShowAddNewRecordButton="false" />
                            <Columns>
                                <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="Redirect" Text="Update" UniqueName="ButtonColumn"> 
                                    <HeaderStyle Width="50px" /> 
                                </telerik:GridButtonColumn> 


                           <%--     <telerik:GridBoundColumn DataField="TicketId" HeaderText="TicketId" SortExpression="TicketId" Visible="false"
                                </telerik:GridBoundColumn>--%>


                               
				            <telerik:GridHyperLinkColumn 
                                DataNavigateUrlFields="UserId" UniqueName="FirstName" DataNavigateUrlFormatString="~\User\SelectedUser.aspx?Uid={0}" 
                                HeaderText="First Name" DataTextField="FirstName">
                            </telerik:GridHyperLinkColumn>
                         

				                 <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName"
                                    UniqueName="LastName" >
                                </telerik:GridBoundColumn>

                                
				                 <telerik:GridBoundColumn DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress"
                                    UniqueName="EmailAddress">
                                </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn DataField="Password" HeaderText="Password" SortExpression="Password" Visible="false"
                                    UniqueName="Password" >
                                </telerik:GridBoundColumn>

                                
				                 <telerik:GridBoundColumn DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" 
                                    UniqueName="RoleId">
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



       <asp:SqlDataSource ID="sourceRole" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HelpDeskConnectionString %>" 
    SelectCommand="SELECT [RoleId], [UserRole] FROM [tblUserRole]"></asp:SqlDataSource>

</asp:Content>


       
  
