<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"CodeBehind="ManageUser2.aspx.cs" Inherits="HelpDesk.ManageUser2" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <telerik:radscriptmanager runat="server" ID="RadScriptManager1" />
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
              <telerik:radajaxmanager ID="RadAjaxManager1" runat="server" >
        </telerik:radajaxmanager>
        <telerik:radajaxloadingpanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:radajaxloadingpanel>

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
                            
                                <telerik:gridbuttoncolumn ConfirmText="Delete this Ticket?" ConfirmDialogType="RadWindow"
                                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                     
                                    UniqueName="DeleteColumn">
                                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                                </telerik:gridbuttoncolumn>


                                <telerik:gridbuttoncolumn ButtonType="LinkButton" CommandName="Redirect" 
                                    Text="Update" UniqueName="ButtonColumn"> 
                                    <HeaderStyle Width="50px" /> 
                                </telerik:gridbuttoncolumn> 


                           <%--     <telerik:GridBoundColumn DataField="TicketId" HeaderText="TicketId" SortExpression="TicketId" Visible="false"
                                </telerik:GridBoundColumn>--%>


                               
				            <telerik:gridhyperlinkcolumn 
                                DataNavigateUrlFields="UserId" UniqueName="FirstName" DataNavigateUrlFormatString="~\User\SelectedUser.aspx?Uid={0}" 
                                HeaderText="First Name" DataTextField="FirstName">
                            </telerik:gridhyperlinkcolumn>
                         

				                 <telerik:gridboundcolumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName"
                                    UniqueName="LastName" >
                                </telerik:gridboundcolumn>

                                
				                 <telerik:gridboundcolumn DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress"
                                    UniqueName="EmailAddress">
                                </telerik:gridboundcolumn>
                                  <telerik:gridboundcolumn DataField="Password" HeaderText="Password" 
                                    SortExpression="Password" Visible="false"
                                    UniqueName="Password" >
                                </telerik:gridboundcolumn>

                                
				              <%--   <telerik:gridboundcolumn DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" 
                                    UniqueName="UserRole">
                                </telerik:gridboundcolumn>--%>

				               
                             

               
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


