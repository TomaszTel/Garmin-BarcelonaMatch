import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.Application;

(:glance)
class MyMenuDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
    }
     var Make = new MakeRequestModule.MakeRequestClass();

    function onMenuItem(item) {
        
      if (item == :RealMadryt) {
     Make.makeRequest("https://api.football-data.org/v4/teams/86/matches?status=SCHEDULED&limit=1");
            Application.Properties.setValue("GlaneView","Real Madryt");

   System.println( "Real Madryt" );
}
else if (item == :Barcelona)
{
       Make.makeRequest("https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1");
       System.println( "Barcelona" );
                   Application.Properties.setValue("GlaneView","Barcelona");

}
else if (item == :AtleticoMadryt)
{
        Make.makeRequest("https://api.football-data.org/v4/teams/78/matches?status=SCHEDULED&limit=1");
       System.println( "AtleticoMadryt" );
                   Application.Properties.setValue("GlaneView","Atletico Madryt");

}
else if (item == :Sevilla)
{
          Make.makeRequest("https://api.football-data.org/v4/teams/559/matches?status=SCHEDULED&limit=1");
         System.println( "Sevilla" );
                     Application.Properties.setValue("GlaneView","Sevilla");


}

else if (item == :ManchesterCity)
{
          Make.makeRequest("https://api.football-data.org/v4/teams/65/matches?status=SCHEDULED&limit=1");
         System.println( "ManchesterCity" );
                     Application.Properties.setValue("GlaneView","Manchester City");


}
else if (item == :Arsenal)
{
          Make.makeRequest("https://api.football-data.org/v4/teams/57/matches?status=SCHEDULED&limit=1");
         System.println( "Arsenal" );
                     Application.Properties.setValue("GlaneView","Arsenal");


}
else if (item == :ManchesterUnited)
{
          Make.makeRequest("https://api.football-data.org/v4/teams/66/matches?status=SCHEDULED&limit=1");
         System.println( "Manchester United" );
                     Application.Properties.setValue("GlaneView","Manchester United");


}
}
    }

