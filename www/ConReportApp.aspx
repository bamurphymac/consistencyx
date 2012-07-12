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
      <a data-role="button" data-transition="flip" data-corners="false" data-theme="b" href="conreporthelp.aspx">Help</a>
      <h2>ConsistencyX</h2>
      <a data-role="button" data-transition="flip" data-corners="false" rel="external" target="_blank" href="conreportsplash.aspx" data-theme="b">About</a>
    </div>

    <div data-role="content">


    <form id="form1" runat="server">
    <asp:Panel ID="PanelSelect" runat="server" class="ui-body ui-body-a" >

    <div data-role="controlgroup" class="ui-bar">
            <a data-role="button" data-transition="flip" data-corners="false" href="conreportsettings.aspx" data-theme="a">Edit Scoring</a>
        <asp:DropDownList ID="DropPosition" data-corners="false" runat="server" 
    AutoPostBack="True" ToolTip="Choose a player position">
           <asp:ListItem Selected="True">QB</asp:ListItem>
           <asp:ListItem>RB</asp:ListItem>
           <asp:ListItem>WR</asp:ListItem>
           <asp:ListItem>TE</asp:ListItem>
        </asp:DropDownList>
        
        <asp:DropDownList ID="DropYear" runat="server" data-corners="false" AutoPostBack="True" 
            DataSourceID="DataDropYear" DataTextField="NFLYear" 
            DataValueField="NFLYear" ToolTip="Choose a season to display">
        </asp:DropDownList>
    


        <asp:SqlDataSource ID="dataQGF" runat="server" 
           ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" 
           SelectCommand="QGF" SelectCommandType="StoredProcedure">
           <SelectParameters>
              <asp:ControlParameter ControlID="DropYear" Name="year" 
                 PropertyName="SelectedValue" Type="Int16" />
              <asp:ControlParameter ControlID="DropPosition" Name="pos" 
                 PropertyName="SelectedValue" Type="String" />
              <asp:ControlParameter ControlID="TextPassPoints" Name="ptsPassYards" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextPassTD" Name="ptsPassTD" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextRushPoints" Name="ptsRushYards" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextRecPoints" Name="ptsRecYards" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextRushTD" Name="ptsRushTD" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextRecTD" Name="ptsRecTD" PropertyName="Text" 
                 Type="Double" />
              <asp:ControlParameter ControlID="TextReception" Name="ptsRecept" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextIntercept" Name="ptsInter" 
                 PropertyName="Text" Type="Double" />
              <asp:ControlParameter ControlID="TextFumble" Name="ptsFumb" PropertyName="Text" 
                 Type="Double" />
              <asp:ControlParameter ControlID="TextPassYards" Name="yards1" 
                 PropertyName="Text" Type="Int16" />
              <asp:ControlParameter ControlID="TextRushYards" Name="yards2" 
                 PropertyName="Text" Type="Int16" />
              <asp:ControlParameter ControlID="TextRecYards" Name="yards3" 
                 PropertyName="Text" Type="Int16" />
           </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="DataDropYear" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" 
            SelectCommand="SELECT DISTINCT [NFLYear] FROM [tblStandardScoring] ORDER BY [NFLYear] DESC">
        </asp:SqlDataSource>
        </div>
    </asp:Panel>
    <asp:Panel class="ui-body ui-body-a"  ID="PanelScore" runat="server" Visible="False">

      <div data-role="controlgroup">
        <asp:Button ID="ButtonHideScoring" runat="server" data-corners="false"
            onclick="ButtonHideScoring_Click" Text="Hide Scoring Edit" 
            ToolTip="Hide the editor." />
        
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
    <asp:Panel ID="PanelMain" runat="server" class="ui-body ui-body-a">

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False"  DataSourceID="DataMain" 
            ForeColor="#333333" GridLines="None" DataKeyNames="ID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            width="100%" font-size="10"
              ToolTip="Click a header to sort. Click &quot;Details&quot; to View the detailed player information." 
              AllowPaging="True" PageSize="15">
            <RowStyle ForeColor="White" wrap="false" />
            <Columns>
                <asp:CommandField ButtonType="Button"    SelectText="View" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name" >
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Score" HeaderText="Total" 
                    SortExpression="Rank" DataFormatString="{0:F1}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Quality Games" HeaderText="QG" 
                    SortExpression="Quality Games" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Played" HeaderText="GP" 
                    SortExpression="Total Played" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Quality Percent" HeaderText="QSR" 
                    SortExpression="Quality Percent" DataFormatString="{0:P0}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="QGFactor" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#507CD1"  ForeColor="White" font-size="15"/>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" font-size="15" />
            <SelectedRowStyle  ForeColor="#333333" />
            <HeaderStyle ForeColor="White" BackColor="#2461BF"  HorizontalAlign="Left"/>
            <EditRowStyle />

            <AlternatingRowStyle BackColor="#222222" />
        </asp:GridView>

        <asp:SqlDataSource ID="DataMain" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" 
            SelectCommand="totalScores" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropYear" DefaultValue="" Name="year" 
                    PropertyName="SelectedValue" Type="Int16" />
                <asp:ControlParameter ControlID="DropPosition" DefaultValue="" Name="pos" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="TextPassPoints" DefaultValue="0" 
                    Name="ptsPassYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextPassTD" DefaultValue="0" Name="ptsPassTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRushPoints" DefaultValue="0" 
                    Name="ptsRushYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRecPoints" DefaultValue="0" 
                    Name="ptsRecYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRushTD" DefaultValue="0" Name="ptsRushTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRecTD" DefaultValue="0" Name="ptsRecTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextReception" DefaultValue="0" 
                    Name="ptsRecept" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextIntercept" DefaultValue="0" 
                    Name="ptsInter" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextFumble" DefaultValue="0" Name="ptsFumb" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextPassYards" DefaultValue="1" Name="yards1" 
                    PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="TextRushYards" DefaultValue="1" Name="yards2" 
                    PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="TextRecYards" DefaultValue="1" Name="yards3" 
                    PropertyName="Text" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>

  <br/>
    <div data-role="controlgroup"  class="ui-body ui-body-b" > 
        

        <asp:Panel ID="PanelSummary" runat="server" Visible="False" >
            <asp:Button ID="ButtonBack" runat="server" onclick="ButtonBack_Click" 
                Text="Back To Players" ToolTip="Go back to player rankings" 
                Height="26px" />
    
            
           <asp:DropDownList ID="DropName" runat="server" AutoPostBack="True" 
                DataSourceID="DropPlayer" DataTextField="PlayerName" DataValueField="Id" 
                
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                ToolTip="View a different player">
            </asp:DropDownList>
            <br/>
    
        <asp:SqlDataSource ID="DropPlayer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" SelectCommand="SELECT DISTINCT a.[Id], a.[PlayerName] 
FROM [tblPlayers] a INNER JOIN
[tblStandardStats] b ON a.Id = b.PlayerId
WHERE a.[PlayerPosition] = @pos AND b.[NFLYear] = @year
ORDER BY [PlayerName]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropPosition" Name="pos" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropYear" Name="year" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div data-theme="a" data-content-theme="a">
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" CellPadding="4" 
            DataSourceID="DataIndividual" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False"  width="100%" font-size="8"
            onselectedindexchanged="GridView2_SelectedIndexChanged">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" 
                    Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" 
                    Visible="False" />
                <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team" Visible="False">
                    <ItemStyle HorizontalAlign="Center" /> 
                </asp:BoundField>
                <asp:BoundField DataField="Week" HeaderText="Wk" SortExpression="Week">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Opponent" HeaderText="Opp" 
                    SortExpression="Opponent">
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="HA" HeaderText="H/A" SortExpression="HA" />
                <asp:BoundField DataField="Defense Category" HeaderText="Def Cat" 
                    SortExpression="Defense Category">
                    
                </asp:BoundField>
                <asp:BoundField DataField="Pass Yards" HeaderText="Yds" 
                    SortExpression="Pass Yards">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass TDs" HeaderText="TDs" 
                    SortExpression="Pass TDs">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Attempts" HeaderText="Att" 
                    SortExpression="Pass Attempts">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Completions" HeaderText="Cmp" 
                    SortExpression="Pass Completions">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Interceptions" HeaderText="Int" 
                    SortExpression="Pass Interceptions">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush Yards" HeaderText="Rus Yds" 
                    SortExpression="Rush Yards">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush Attempts" HeaderText="Rus Att" 
                    SortExpression="Rush Attempts">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush TDs" HeaderText="Rus TDs" 
                    SortExpression="Rush TDs">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Receiving Yards" HeaderText="Rec Yds" 
                    SortExpression="Receiving Yards">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rec TDs" HeaderText="Rec TDs" 
                    SortExpression="Rec TDs">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Receptions" HeaderText="Rec" 
                    SortExpression="Receptions">
                    
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Fumbles" HeaderText="Fum" 
                    SortExpression="Fumbles" Visible="False">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Fantasy Points" DataFormatString="{0:F1}" 
                    HeaderText="Fan Pts" SortExpression="Total Fantasy Points">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#1C5E55"  ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#99ff99"   />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
      </div>
      </div>

        <asp:HiddenField ID="HiddenSelectedIndex" runat="server" Value="900" />
        <asp:SqlDataSource ID="DataIndividual" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" 
            SelectCommand="IndividualSummary" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropYear" DefaultValue="2009" Name="year" 
                    PropertyName="SelectedValue" Type="Int16" />
                <asp:ControlParameter ControlID="DropName" DefaultValue="-1" 
                    Name="PlayerId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextPassPoints" DefaultValue="0" 
                    Name="ptsPassYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextPassTD" DefaultValue="0" Name="ptsPassTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRushPoints" DefaultValue="0" 
                    Name="ptsRushYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRecPoints" DefaultValue="0" 
                    Name="ptsRecYards" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRushTD" DefaultValue="0" Name="ptsRushTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextRecTD" DefaultValue="0" Name="ptsRecTD" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextReception" DefaultValue="0" 
                    Name="ptsRecept" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextIntercept" DefaultValue="0" 
                    Name="ptsInter" PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextFumble" DefaultValue="0" Name="ptsFumb" 
                    PropertyName="Text" Type="Double" />
                <asp:ControlParameter ControlID="TextPassYards" DefaultValue="1" Name="yards1" 
                    PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="TextRecYards" DefaultValue="1" Name="yards2" 
                    PropertyName="Text" Type="Int16" />
                <asp:ControlParameter ControlID="TextRushYards" DefaultValue="1" Name="yards3" 
                    PropertyName="Text" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    </form>
    </div>

    
  </div>



</body>
</html>
