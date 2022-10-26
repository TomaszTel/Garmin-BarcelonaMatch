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

function onMenu() {
  

          var menu = new WatchUi.Menu();
        var delegate;
        menu.setTitle("My Menu");
        menu.addItem("Item One", :one);
        menu.addItem("Item Two", :two);
        delegate = new MyMenuDelegate(); // a WatchUi.MenuInputDelegate
        WatchUi.pushView(menu, delegate, WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
       
        
        return [ new BarcelonaMatchesView("Starting ",URL) ] as Array<Views or InputDelegates>;
    }
     function onReceive(responseCode, data) {
     var DataString = data.toString();
     
var indexFromHome = DataString.find("homeTeam");
var indexToHome = DataString.find("shortName");
var mySubStringHome = DataString.substring(indexFromHome, indexToHome);

    var TrimmerHome = mySubStringHome.substring(27, mySubStringHome.length() - 3);

var indexFromAway = DataString.find("awayTeam");
var indexToAway = DataString.find("score");
var mySubStringAway = DataString.substring(indexFromAway, indexToAway);
var TrimmerAway=  mySubStringAway.substring(26, mySubStringAway.length() - 86);

    
System.println(TrimmerAway);
System.println("!----------------!");

    System.println(TrimmerHome);
    System.println("!----------------!");

System.println(DataString);
System.println("!----------------!");

        if (responseCode == 200)
        {
          
       WatchUi.switchToView(new BarcelonaMatchesView(TrimmerHome,TrimmerAway), null, WatchUi.SLIDE_IMMEDIATE);
       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error:",responseCode), null, WatchUi.SLIDE_IMMEDIATE);

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

       Communications.makeWebRequest(url, params, options, method(:onReceive));
  }



}