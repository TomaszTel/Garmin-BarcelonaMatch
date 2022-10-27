import Toybox.Application;
import Toybox.Lang ;
import Toybox.WatchUi;

(:glance)
class BarcelonaMatchesApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }
    // function getGlanceView() {
   //  return [ new GlanceView() ];
 //  }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
                var Make =    new MakeRequestClass();

     Make.makeRequest("https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1");

           

    }


    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
       
                  
        return [ new BarcelonaMatchesView("Loading","Please wait","") ] as Array<Views or InputDelegates> ;
      
  
        

    }
    
    

   
}