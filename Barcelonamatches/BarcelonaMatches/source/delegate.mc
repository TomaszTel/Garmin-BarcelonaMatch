import Toybox.Graphics;
import Toybox.WatchUi;

(:glance)
class MyMenuDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
    }
     var Make = new MakeRequestModule.MakeRequestClass();

    function onMenuItem(item) {
        
      if (item == :RealMadryt) {
     Make.makeRequest("https://api.football-data.org/v4/teams/86/matches?status=SCHEDULED&limit=1");

   System.println( "Real Madryt" );
}
else if (item == :Barcelona)
{
       Make.makeRequest("https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1");
       System.println( "Barcelona" );
}
else if (item == :AtleticoMadryt)
{
        Make.makeRequest("https://api.football-data.org/v4/teams/78/matches?status=SCHEDULED&limit=1");
       System.println( "AtleticoMadryt" );
}
}
    }

