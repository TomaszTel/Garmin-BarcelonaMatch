import Toybox.Application;
import Toybox.Lang ;
import Toybox.WatchUi;

(:glance)
class BarcelonaMatchesApp extends Application.AppBase {
var deviceSettings = System.getDeviceSettings();
    function initialize() {
        AppBase.initialize();
    }
 
     function getGlanceView() {

         var view = new $.GlanceView();
         var delegate = new $.WebRequestDelegate(view.method(:onReceive));
   return [ view ];
   }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
       
        

     
    }


    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
         var Token =  Storage.getValue("ApiToken");
             if(Token == null)
             {
                return [ new BarcelonaMatchesView("Please set \ntoken\n in settings ","","","","") ] as Array<Views or InputDelegates> ;
             }
             else
             {
  var Make = new MakeRequestModule.MakeRequestClass();
           
                       
                           
         if (deviceSettings.phoneConnected) {
    Make.makeRequest("https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1");
            }

    if (!deviceSettings.phoneConnected) {
        return [ new BarcelonaMatchesView("Connect Phone ","","Try again","","") ] as Array<Views or InputDelegates> ;

}
    else
{
        return [ new BarcelonaMatchesView("    Loading...","","","","") ] as Array<Views or InputDelegates> ;

}
      
  
             }
         
        

    }
    
    

   
}