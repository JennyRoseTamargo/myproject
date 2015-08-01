


 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

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
    <br /><telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <table>
          <tr>
              <td>
 
                <asp:LinkButton ID="lbAllTickets" OnClick="Tickets_Click"  runat="server" Font-Size="12" > All Tickets</asp:LinkButton><br />
                   <asp:LinkButton ID="lbOpen" runat="server" OnClick="Tickets_Click" Font-Size="12"  >Unsolved Tickets</asp:LinkButton><br />
				       <asp:LinkButton ID="lbPending" runat="server" OnClick="Tickets_Click"  Font-Size="12" >Pending Tickets</asp:LinkButton><br />
					       <asp:LinkButton ID="lbSolved" runat="server" OnClick="Tickets_Click" Font-Size="12" >Solved Tickets</asp:LinkButton>
              </td>
                    <td rowspan="4">
              <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" >
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>

              </td>
             
                 <td>
                   

                       <telerik:radgrid ID="rg_Tickets" GridLines="None" runat="server" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
                        AutoGenerateColumns="False" OnItemUpdated="rg_ItemUpdated" OnItemCommand = "rg_ItemCommand"
                        OnItemDeleted="rg_ItemDeleted" OnItemInserted="rg_ItemInserted" PageSize="5"
               
                        OnDataBound="rg_DataBound" AllowSorting="True" CellSpacing="0" CssClass="style1" 
                                 Width="609px" AllowFilteringByColumn="true" >

                        

                        <PagerStyle Mode="NextPrevAndNumeric" />

                        <MasterTableView  CommandItemDisplay="Top"  Width="100%" DataKeyNames="TicketId"   EditMode="InPlace" 
                            HorizontalAlign="NotSet" AutoGenerateColumns="False"> 
                            <CommandItemSettings ShowAddNewRecordButton="false" />
                            <Columns>
                                <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="Redirect" Text="Update" UniqueName="ButtonColumn"> 
                                    <HeaderStyle Width="50px" /> 
                                </telerik:GridButtonColumn> 


                           <%--     <telerik:GridBoundColumn DataField="TicketId" HeaderText="TicketId" SortExpression="TicketId" Visible="false"
                                </telerik:GridBoundColumn>--%>


                               
				            <telerik:GridHyperLinkColumn 
                                DataNavigateUrlFields="TicketId" UniqueName="Subject" DataNavigateUrlFormatString="~\Ticket\Responses.aspx?Tid={0}" 
                                HeaderText="Subject" DataTextField="Subject">
                            </telerik:GridHyperLinkColumn>
                         

				                 <telerik:GridBoundColumn DataField="Requester" HeaderText="Requester" SortExpression="Requester"
                                    UniqueName="Requester" >
                                </telerik:GridBoundColumn>

                                
				                 <telerik:GridBoundColumn DataField="DateAndTime" HeaderText="Requested Date" SortExpression="DateAndTime"
                                    UniqueName="DateAndTime">
                                </telerik:GridBoundColumn>

				                 <telerik:GridBoundColumn DataField="Status" HeaderText="Status" SortExpression="Status"
                                    UniqueName="Status">
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn DataField="Priority" HeaderText=" Priority" SortExpression="Priority"
                                    UniqueName="Priority">
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
          
          
<%--        <telerik:RadComboBox ID="rcb_SubjectTitle" runat="server" AutoPostBack="True" 
            DataTextField="Subject" DataValueField="TicketId" Width="250px" Height="150px"
           EnableLoadOnDemand = "true" MarkFirstMatch="true" Filter="Contains"
                         HighlightTemplatedItems="true">
            <Items>
                <telerik:RadComboBoxItem Text="All" Value="0" Selected="true"></telerik:RadComboBoxItem>
            </Items>
        </telerik:RadComboBox>--%>
     

       <%--
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="rcb_SubjectTitle">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rg_Tickets" LoadingPanelID="AjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rcb_SubjectTitle">
                    </telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
   --%>

      
</asp:Content>