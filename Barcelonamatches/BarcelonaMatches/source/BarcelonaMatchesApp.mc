import Toybox.Application;
import Toybox.Lang ;
import Toybox.WatchUi;


class BarcelonaMatchesApp extends Application.AppBase {
var name ;
var load;

const URL = "https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1";
    function initialize() {
        AppBase.initialize();
               
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
       makeRequest(); 
        
    }



    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
       
        
        return [ new BarcelonaMatchesView("Starting ","Please wait","") ] as Array<Views or InputDelegates>;
    }
     function onReceive(responseCode, data) {
     var DataString = data.toString();
     
var indexFromHome = DataString.find("awayTeam=>") ;
var indexFromHome1 = DataString.find("tla=>") ;
    var TrimmerHome = DataString.substring(indexFromHome + 69, indexFromHome1 - 2);

var indexFromAway = DataString.find("homeTeam=>");
var indexToAway = DataString.find("group=>");
var TrimmerAway = DataString.substring(indexFromAway + 93, indexToAway - 11);

    var indexDate = DataString.find("utcDate=>");
var indexDateTo = DataString.find("season=>");
var TrimmerDate= DataString.substring(indexDate +9 , indexDateTo );

System.println(TrimmerAway);
System.println("!----------------!");

    System.println(TrimmerHome);
    System.println("!----------------!");

System.println(DataString);
System.println("!----------------!");

        if (responseCode == 200)
        {
          
       WatchUi.switchToView(new BarcelonaMatchesView(TrimmerHome,TrimmerAway,TrimmerDate), null, WatchUi.SLIDE_IMMEDIATE);
       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error:",responseCode,""),"", null, WatchUi.SLIDE_IMMEDIATE);

       }
   }
     function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_TEXT_PLAIN,
            :headers => {"X-Auth-Token" => "d241fae71038458d9815e08ec3f62937"}
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, null, options, method(:onReceive));
  }



}