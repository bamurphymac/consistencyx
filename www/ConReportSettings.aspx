<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConReport.aspx.cs" Inherits="NFLWeb._Default" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html> 
<html class="ui-mobile">
<head runat="server">
  <title>Consistency Report X</title>
  <meta name = "viewport" content = "user-scalable=no, width=device-height">
    <meta http-equiv=expires content=-1>
  <meta http-equiv=Cache-Control CONTENT=no-cache>
  <meta http-equiv=Pragma CONTENT=no-cache>
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0-rc.1/jquery.mobile-1.1.0-rc.1.min.css" />
  <link rel="stylesheet" href="conreportx.css" />
  <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <script src="http://code.jquery.com/mobile/1.1.0-rc.1/jquery.mobile-1.1.0-rc.1.min.js"></script>
</head> 

<body class="ui-mobile-viewport" >




  <div data-role="page" id="app">
    <div data-role="header" data-position="fixed">
      <a data-role="button" data-transition="flip" data-corners="false"  href="conreportapp.aspx" data-theme="b">Back to App</a>
      <h2>ConsistencyX</h2>

    </div>

    <div data-role="content">

    <form id="form1" runat="server">

    <asp:Panel class="ui-body ui-body-a"  ID="PanelScore" runat="server" Visible="True">

      <div data-role="controlgroup">

        
        <asp:Button ID="ButtonRecalculate" runat="server" data-corners="false"
            onclick="ButtonRecalculate_Click" Text="Recalculate Scores" 
            />
        
        <asp:Button ID="ButtonReset" runat="server" Height="26px" data-corners="false"
            onclick="ButtonReset_Click" Text="Reset Defaults" />
        
        <asp:Button ID="ButtonSave" runat="server" Height="26px" data-corners="false"
            onclick="ButtonSave_Click" Text="Save Preferences" 
            ToolTip="Note that setting will be erased if you clear your cookies." />
      </div>

      <ul data-row="listview" class="ui-listview">
        <li data-role="fieldcontain" class="ui-field-contain">
          <fieldset class="ui-grid-a">
            <div class="ui-block-a">
              <asp:TextBox ID="TextPassPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
              &nbsp;points per
            </div>
            <div class="ui-grid-b">
              <asp:TextBox ID="TextPassYards" runat="server" Width="32px" MaxLength="2">20</asp:TextBox>
              &nbsp;passing yards<br />
            </div>
          </fieldset>
        </li>

        <li data-role="fieldcontain" class="ui-field-contain">
          <fieldset class="ui-grid-a">
            <div class="ui-block-a">
            <asp:TextBox ID="TextRushPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
            &nbsp;points per
             </div>
            <div class="ui-grid-b">
            <asp:TextBox ID="TextRushYards" runat="server" Width="32px" MaxLength="2">10</asp:TextBox>
            &nbsp;rushing yards<br />
               </div>
          </fieldset>
        </li>

        <li data-role="fieldcontain" class="ui-field-contain">
          <fieldset class="ui-grid-a">
            <div class="ui-block-a">

              <asp:TextBox ID="TextRecPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
              &nbsp;points per
               </div>
               <div class="ui-grid-b">
              <asp:TextBox ID="TextRecYards" runat="server" Width="32px" MaxLength="2">10</asp:TextBox>
              &nbsp;receiving yards<br />
              </div>
          </fieldset>
        </li>

      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextPassTD" runat="server" Height="22px" Width="32px" 
           MaxLength="2">4</asp:TextBox>
        &nbsp;points per passing touchdown<br />
      </li>
      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextRushTD" runat="server" Width="32px" MaxLength="2">6</asp:TextBox>
        &nbsp;points per rushing touchdown<br />
        </li>
      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextRecTD" runat="server" Width="32px" MaxLength="2">6</asp:TextBox>
        &nbsp;points per receiving touchdown<br />
        </li>
      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextReception" runat="server" Width="32px" MaxLength="2">0</asp:TextBox>
        &nbsp;points per reception<br />
        </li>
      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextIntercept" runat="server" 
            ToolTip="Enter a Negative Number" Width="32px" MaxLength="3">-1</asp:TextBox>
        &nbsp;points lost per interception<br />
        </li>
      <li data-role="fieldcontain" class="ui-field-contain">
        <asp:TextBox ID="TextFumble" runat="server" ToolTip="Enter A Negative Number" 
            Width="32px" MaxLength="3">-1</asp:TextBox>
        &nbsp;points lost per fumble<br />
      </li>
    </ul>

        <asp:Label ID="LabelWarning" runat="server" Font-Size="Large" 
            ForeColor="#FF9900" 
            Text="Warning: a positive value for interceptions or fumbles will result in a point gain." 
            Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Err" runat="server" Font-Size="Large" ForeColor="Red" 
            Text="One or more values were missing or invalid. These were reset to the default values." 
            Visible="False"></asp:Label>
        <br />
      </ul>
        
    </asp:Panel>


    <div data-theme="a" data-content-theme="a">
   
    </form>
    </div>

    
  </div>



</body>
</html>
