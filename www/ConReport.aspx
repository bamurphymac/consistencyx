<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConReport.aspx.cs" Inherits="NFLWeb._Default" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Bigguy Fantasy Database</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="PanelSelect" runat="server">
        Position:
        <asp:DropDownList ID="DropPosition" runat="server" 
    AutoPostBack="True" ToolTip="Choose a player position">
           <asp:ListItem Selected="True">QB</asp:ListItem>
           <asp:ListItem>RB</asp:ListItem>
           <asp:ListItem>WR</asp:ListItem>
           <asp:ListItem>TE</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year:
        <asp:DropDownList ID="DropYear" runat="server" AutoPostBack="True" 
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
        <br />
        <hr />
        <asp:Button style="margin-left:5%" ID="ButtonEdit" runat="server" onclick="ButtonEdit_Click" 
            Text="Edit Scoring" ToolTip="Show the editor" Height="26px" />
        <asp:SqlDataSource ID="DataDropYear" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFLConnectionString %>" 
            SelectCommand="SELECT DISTINCT [NFLYear] FROM [tblStandardScoring] ORDER BY [NFLYear] DESC">
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel style="background-image:url(aspImages/football.png); background-repeat:no-repeat; background-position:right" ID="PanelScore" runat="server" Visible="False">
        <asp:GridView ID="GridView3" runat="server" CellPadding="4" 
           DataSourceID="dataQGF" ForeColor="#333333" GridLines="None" Height="64px" 
           HorizontalAlign="Right" Width="28px">
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:TextBox ID="TextPassPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
        &nbsp;points per
        <asp:TextBox ID="TextPassYards" runat="server" Width="32px" MaxLength="2">20</asp:TextBox>
        &nbsp;passing yards<br />
        <asp:TextBox ID="TextRushPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
        &nbsp;points per
        <asp:TextBox ID="TextRushYards" runat="server" Width="32px" MaxLength="2">10</asp:TextBox>
        &nbsp;rushing yards<br />
        <asp:TextBox ID="TextRecPoints" runat="server" Width="32px" MaxLength="2">1</asp:TextBox>
        &nbsp;points per
        <asp:TextBox ID="TextRecYards" runat="server" Width="32px" MaxLength="2">10</asp:TextBox>
        &nbsp;receiving yards<br />
        <asp:TextBox ID="TextPassTD" runat="server" Height="22px" Width="32px" 
           MaxLength="2">4</asp:TextBox>
        &nbsp;points per passing touchdown<br />
        <asp:TextBox ID="TextRushTD" runat="server" Width="32px" MaxLength="2">6</asp:TextBox>
        &nbsp;points per rushing touchdown<br />
        <asp:TextBox ID="TextRecTD" runat="server" Width="32px" MaxLength="2">6</asp:TextBox>
        &nbsp;points per receiving touchdown<br />
        <asp:TextBox ID="TextReception" runat="server" Width="32px" MaxLength="2">0</asp:TextBox>
        &nbsp;points per reception<br />
        <asp:TextBox ID="TextIntercept" runat="server" 
            ToolTip="Enter a Negative Number" Width="32px" MaxLength="3">-1</asp:TextBox>
        &nbsp;points lost per interception<br />
        <asp:TextBox ID="TextFumble" runat="server" ToolTip="Enter A Negative Number" 
            Width="32px" MaxLength="3">-1</asp:TextBox>
        &nbsp;points lost per fumble<br />
        <asp:Label ID="LabelWarning" runat="server" Font-Size="Large" 
            ForeColor="#FF9900" 
            Text="Warning: a positive value for interceptions or fumbles will result in a point gain." 
            Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Err" runat="server" Font-Size="Large" ForeColor="Red" 
            Text="One or more values were missing or invalid. These were reset to the default values." 
            Visible="False"></asp:Label>
        <br />
        <asp:Button ID="ButtonHideScoring" runat="server" 
            onclick="ButtonHideScoring_Click" Text="Hide Scoring Edit" 
            ToolTip="Hide the editor." Height="26px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonRecalculate" runat="server" 
            onclick="ButtonRecalculate_Click" Text="Recalculate Scores" 
            Height="26px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonReset" runat="server" Height="26px" 
            onclick="ButtonReset_Click" Text="Reset Defaults" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonSave" runat="server" Height="26px" 
            onclick="ButtonSave_Click" Text="Save Preferences" 
            ToolTip="Note that setting will be erased if you clear your cookies." />
    </asp:Panel>
    <asp:Panel ID="PanelMain" runat="server">
        <hr />
        <center>
           <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="DataMain" 
            ForeColor="#333333" GridLines="None" DataKeyNames="ID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            
              ToolTip="Click a header to sort. Click &quot;Details&quot; to View the detailed player information." 
              AllowPaging="True" PageSize="25">
            <RowStyle BackColor="#EFF3FB" BorderColor="#003366" />
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="Details" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Player Name" 
                    SortExpression="Name" >
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Score" HeaderText="Total Score" 
                    SortExpression="Rank" DataFormatString="{0:F1}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rank" HeaderText="Score Rank" SortExpression="Rank" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Quality Games" HeaderText="Quality Games" 
                    SortExpression="Quality Games" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Played" HeaderText="Games Played" 
                    SortExpression="Total Played" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Quality Percent" HeaderText="Quality Success Rate" 
                    SortExpression="Quality Percent" DataFormatString="{0:P0}" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="QGFactor" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        </center>
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
    <asp:Panel ID="PanelSummary" runat="server" Visible="False">
        <asp:Button ID="ButtonBack" runat="server" onclick="ButtonBack_Click" 
            Text="Back To Players" ToolTip="Go back to player rankings" 
            Height="26px" />
        <br />
        <hr />
        <br />
        <asp:Label ID="LabelPlayer" runat="server" Font-Size="Large" 
            Text="Player Name:"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropName" runat="server" AutoPostBack="True" 
            DataSourceID="DropPlayer" DataTextField="PlayerName" DataValueField="Id" 
            Font-Bold="False" Font-Names="Times New Roman" Font-Size="Large" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
            ToolTip="View a different player">
        </asp:DropDownList>
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
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" CellPadding="4" 
            DataSourceID="DataIndividual" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" 
            onselectedindexchanged="GridView2_SelectedIndexChanged">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" 
                    Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" 
                    Visible="False" />
                <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Opponent" HeaderText="Opponent" 
                    SortExpression="Opponent">
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="HA" HeaderText="Home/ Away" SortExpression="HA" />
                <asp:BoundField DataField="Defense Category" HeaderText="Def Cat" 
                    SortExpression="Defense Category">
                    <HeaderStyle Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Yards" HeaderText="Pass Yds" 
                    SortExpression="Pass Yards">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass TDs" HeaderText="Pass TDs" 
                    SortExpression="Pass TDs">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Attempts" HeaderText="Pass Att" 
                    SortExpression="Pass Attempts">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Completions" HeaderText="Pass Comp" 
                    SortExpression="Pass Completions">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pass Interceptions" HeaderText="Pass Int" 
                    SortExpression="Pass Interceptions">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush Yards" HeaderText="Rush Yds" 
                    SortExpression="Rush Yards">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush Attempts" HeaderText="Rush Att" 
                    SortExpression="Rush Attempts">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rush TDs" HeaderText="Rush TDs" 
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
                    <HeaderStyle Font-Size="Medium" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Fumbles" HeaderText="Fum" 
                    SortExpression="Fumbles">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total Fantasy Points" DataFormatString="{0:F1}" 
                    HeaderText="Fantasy Points" SortExpression="Total Fantasy Points">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
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
</body>
</html>
