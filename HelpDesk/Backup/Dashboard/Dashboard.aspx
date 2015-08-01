<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HelpDesk.Dashboard.Dashboard" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {}
        .style2
        {}
        .style3
        {
            width: 44px;
        }
        .style4
        {}
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
     <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    &nbsp;</h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In </a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
          
                        <asp:MenuItem NavigateUrl="~/Dashboard/Dashboard.aspx " Text="Dashboard" 
                            Value="Dashboard"/>
                        <asp:MenuItem NavigateUrl="~/Ticket/Tickets.aspx" Text="Tickets" Value="Ticket">
                            <asp:MenuItem NavigateUrl="~/Ticket/AddTicket.aspx" Text="Add Ticket" 
                                Value="Add Ticket"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/User/ManageUser.aspx" Text="Users" Value="Users">
                            <asp:MenuItem NavigateUrl="~/User/AddUser.aspx" Text="Add User" 
                                Value="Add User"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/User/MyAccount.aspx" Text="My Account" 
                                Value="My Account"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ProjectName/Projects.aspx" Text="Projects" 
                            Value="Projects">
                            <asp:MenuItem NavigateUrl="~/ProjectName/AddProjects.aspx" Text="Add Project" 
                                Value="Add Project"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </div>
         <div id="sidebar">
      
     
          <fieldset class="register">
          <legend>Views</legend>
          <table>
          <tr>
          <td>
           <asp:LinkButton ID="lbAllTickets" OnClick="Tickets_Click"  runat="server">All Tickets</asp:LinkButton>
          </td>
          </tr>
          <tr>
          <td>
            
              <asp:LinkButton ID="lbOpen" runat="server" OnClick="Tickets_Click" >Unsolved Tickets</asp:LinkButton>
             
          </td>
          </tr>
          <tr>
          <td>
           <asp:LinkButton ID="lbPending" runat="server" OnClick="Tickets_Click" >Pending Tickets</asp:LinkButton>
            
          </td>
          </tr>
          <tr>
          <td>
            <asp:LinkButton ID="lbSolved" runat="server" OnClick="Tickets_Click" >Solved Tickets</asp:LinkButton>
          </td>
          </tr>
  </table>
  </fieldset>
  </div>

   <div>
   <table>
        <tr>
          <td></td>
           <td><h3>Tickets</h3> </td>
          </tr>
        <tr>
   
            <td class="style3">
            </td>
            <td>

                       <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="rg_tickets">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="rg_tickets"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>

                 <telerik:RadGrid ID="rg_tickets"  runat="server" AllowPaging="True" PageSize="5" 
                 
                    Width="150%" GridLines="None" CssClass="style1">
                    <PagerStyle Mode="NumericPages"></PagerStyle>
                    <ClientSettings EnableRowHoverStyle="true"> 
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SelectedItemStyle CssClass="SelectedItem"></SelectedItemStyle>
                    <MasterTableView DataKeyNames="TicketId">
            <Columns>
       

                <telerik:GridTemplateColumn UniqueName="CheckBoxTemplateColumn">                    
                  
                            <ItemTemplate>
                                <asp:CheckBox id="chkRowSelection" OnCheckedChanged="ToggleRowSelection" AutoPostBack="True" runat="server"></asp:CheckBox>
                            </ItemTemplate>
             </telerik:GridTemplateColumn>
            
            </Columns>
                    </MasterTableView>
                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
    </ClientSettings>
                </telerik:RadGrid>
            </td>

          </tr>
        <tr>
   
            <td class="style3">
                &nbsp;</td>
            <td>

                       &nbsp;</td>

          </tr>
        <tr>
   
            <td class="style3">
                &nbsp;</td>
            <td>
            
            </td>

          </tr>                       
               </table>


<asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
 <ContentTemplate>
  <table>
     <tr>
           <td class="style3">
             </td>
             <td><h3>Ticket Post</h3>
          </td>
          </tr>
          <tr>
                   <td>
                       <asp:Label ID="lblTicket" runat="server" Text="" ></asp:Label>
                   </td>
                </tr>
                <tr>
                        <td>
                        </td>
                       <td>
                           <asp:TextBox ID="txtpost"  runat="server" CssClass="style2" Height="73px" 
                           TextMode="MultiLine" Width="762px"></asp:TextBox>
                       </td>
                 </tr>
                   <tr>
                      <td>
                      </td>
                      <td align = "right">
                          <asp:LinkButton ID="lbPostAttach" runat="server">Attach File</asp:LinkButton>
                      </td>
                   </tr>
                   <tr>
                   <td>
                       &nbsp;</td>
                   <td align="right">
                   <asp:Button ID="btnSubmitPost" onclick="SubmitPostClick" runat="server" Text="Submit" />
                   </td>
                   </tr>

                <%--   For the Old post--%>
              
                    <tr>
                   
                   <td>
                      
                       <asp:Label ID="lblPersonPost" runat="server" Text=""></asp:Label>
                   </td>
                   <td>
                      <asp:Label ID="lblTicketId" runat="server" Text="" ></asp:Label>
                   </td>
                </tr>
                <tr>
                        <td>
                        </td>
                       <td>
                            <asp:Label ID="lblPost" runat="server" Text=""></asp:Label>
                       </td>
                 </tr>
                   <tr>
                      <td>
                      </td>
                      <td>
                          <asp:Label ID="lblAttach" runat="server" Text=""></asp:Label>
                      </td>
                   </tr>
                  

                   </table>
    </ContentTemplate>
</asp:UpdatePanel>

       
            </div>
            <div>
         
            </div>
    
        <div class="clear">
          <asp:HiddenField ID="HiddenField" runat="server" />
        </div>
    </form>
</body>
</html>
