
<!DOCTYPE html> 
<html class="ui-mobile">
<head runat="server">
  <title>ConsistencyX Help</title>
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
      <a data-role="button" data-transition="flip" data-corners="false" href="conreportapp.aspx" data-theme="b">Back</a>
      <h2>ConsistencyX Help</h2>
      <a data-role="button" data-transition="flip" data-corners="false" rel="external" target="_blank" href="conreportsplash.aspx" data-theme="b">About</a>
    </div>

    <div data-role="content" class="ui-content">
      <H1>Definitions and Terminology</h1>
      <h2>The definitions for the Ranking pages are as follows:</h2>
      <dl>
        <dt>VIEW Button</dt>
        <dd>Click on this button to see the player’s weekly stats for the selected year.</dd>

        <dt>Total</dt>
        <dd>The total Fantasy points scored based on the selected scoring method.</dd>

        <dt>Rank</dt>
        <dd>The player’s rank based on the total Fantasy points scored for the selected scoring method and selected year.</dd>

        <dt>QG</dt>
        <dd>Total number of Quality Games earned under the selected scoring method and year.</dd>

        <dt>GP</dt>
        <dd>Total number of Games Played during the selected year.</dd>
        
        <dt>QSR</dt>
        <dd>Quality Success Rate – This is the number of Quality Games earned divided by the number of Games Played. The higher the percentage means the more consistent that player is.</dd>

      <h2>The definitions for the Player’s View page are as follows:</h2>

        <dt>Wk</dt>
        <dd>The week during the selected year.</dd>

        <dt>Opp</dt>
        <dd>The opponent that player played during that week during the selected year.</dd>

        <dt>H/A</dt>
        <dd>Whether the game that week was played at home or away.</dd>

        <dt>Def Cat</dt>
        <dd>The defensive category of the opponent played that week. (Good = Defenses ranked 1 – 10; Avg. = Defenses ranked 11 – 22 and Bad = Defenses ranked 23-32)</dd>

        <dt>Yds</dt>
        <dd>Total passing yards</dd>

        <dt>TDs</dt>
        <dd>Total passing touchdowns</dd>

        <dt>Att</dt>
        <dd>Number of passing attempts</dd>

        <dt>Cmp</dt>
        <dd>Number of passing completions</dd>

        <dt>Int</dt>
        <dd>Number of interceptions thrown</dd>

        <dt>Rus Yds</dt>
        <dd>Total Rushing Yards</dd>

        <dt>Rus Att</dt>
        <dd>Total Rushing Attempts</dd>

        <dt>Rus TD</dt>
        <dd>Total rushing touchdowns</dd>

        <dt>Rec Yds</dt>
        <dd>Total receiving yards</dd>

        <dt>Rec TDs</dt>
        <dd>Total receiving touchdowns</dd>

        <dt>Rec</dt>
        <dd>Number of Receptions</dd>

        <dt>Fan Pts</dt>
        <dd>Total fantasy points earned</dd>


    </div>

    
  </div>



</body>
</html>
