import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;


class BarcelonaMatchesApp extends Application.AppBase {
var name ;
var load;

const URL = "https://api.football-data.org/v4/teams/86/matches?status=SCHEDULED&limit=1";
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
        
        return [ new BarcelonaMatchesView("Starting " + URL) ] as Array<Views or InputDelegates>;
    }
     function onReceive(responseCode, data) {
        if (responseCode == 200)
        {
            onJsonData(data);
       WatchUi.switchToView(new BarcelonaMatchesView("Name: "+ name[0].toString), null, WatchUi.SLIDE_IMMEDIATE);
       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error"), null, WatchUi.SLIDE_IMMEDIATE);

       }
   }
     function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON,
            :headers => {"X-Auth-Token" => "d241fae71038458d9815e08ec3f62937"}
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, params, options, method(:onReceive));
  }
function onJsonData( data) {

// error check using `code' omitted
// error check verifying `data' is not null omitted

// the outer element is an array, iterate over the elements.
for (var i = 0; i < data.size(); ++i) {
var entry = data;

// each entry in the array is a dictionary. lookup fields by name.
 name.put(entry.get("homeTeam")); // or entry.get("Name")
 load.put(entry.get("awayTeam")); // ...

}
}
}