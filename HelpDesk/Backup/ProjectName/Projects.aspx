<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="Projects.aspx.cs" Inherits="HelpDesk.ProjectName.Projects" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <telerik:RadScriptManager ID="RadScriptManager" runat="server" />
   
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
    <telerik:radajaxmanager ID="RadAjaxManager" runat="server">
     
    </telerik:radajaxmanager>
    <telerik:radajaxloadingpanel ID="RadAjaxLoadingPanel" runat="server" />

        <table>
            <tr>
                    <td>
                        
    <telerik:radgrid ID="rg_Projects" GridLines="None" runat="server" AllowAutomaticDeletes="True"
        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
        AutoGenerateColumns="False" OnItemUpdated="rg_ItemUpdated" 
        OnItemDeleted="rg_ItemDeleted" OnItemInserted="rg_ItemInserted" 
                AllowMultiRowEdit="True" AllowFilteringByColumn="True" 
        OnDataBound="rg_DataBound" AllowSorting="True" CellSpacing="0" CssClass="style1" 
                Width="499px">


        <PagerStyle Mode="NextPrevAndNumeric" />

          <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="ProjectId"  EditMode="InPlace"
            HorizontalAlign="NotSet" AutoGenerateColumns="False">
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton" />
                </telerik:GridEditCommandColumn>

                 <telerik:GridBoundColumn DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName"
                    UniqueName="ProjectName" ColumnEditorID="GridTextBoxColumnEditor1">
                </telerik:GridBoundColumn>
				
                                <telerik:GridButtonColumn ConfirmText="Delete this Project?" ConfirmDialogType="RadWindow"
                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                    UniqueName="DeleteColumn">
                    <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                </telerik:GridButtonColumn>
                </Columns>

                         <EditFormSettings ColumnNumber="2" CaptionDataField="ProjectName" CaptionFormatString="Edit properties of Project {0}"
                InsertCaption="New Project">
                <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                <FormCaptionStyle CssClass="EditFormHeader"></FormCaptionStyle>
                <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="3" BackColor="White"
                    Width="100%" />
                <FormTableStyle CellSpacing="0" CellPadding="2" Height="110px" BackColor="White" />
                <FormTableAlternatingItemStyle Wrap="False"></FormTableAlternatingItemStyle>
                <EditColumn ButtonType="ImageButton" InsertText="Insert Order" UpdateText="Update record"
                    UniqueName="EditCommandColumn1" CancelText="Cancel edit">
                </EditColumn>
                <FormTableButtonRowStyle HorizontalAlign="Right" CssClass="EditFormButtonRow"></FormTableButtonRowStyle>
            </EditFormSettings>
				 </MasterTableView>
        <ClientSettings>
            <ClientEvents OnRowDblClick="RowDblClick" OnGridCreated="gridCreated" />
        </ClientSettings>
          </telerik:radgrid>
                        
                    </td>
            </tr>
    </table >
         <telerik:gridtextboxcolumneditor ID="GridTextBoxColumnEditor1" runat="server" 
        TextBoxStyle-Width="200px" />

           
    <telerik:radwindowmanager ID="RadWindowManager" runat="server">
    </telerik:radwindowmanager>
       
</asp:Content>