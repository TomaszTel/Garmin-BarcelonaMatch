//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;

(:glance)
class WebRequestDelegate extends WatchUi.BehaviorDelegate {
    private var _notify as Method(args as Dictionary or String or Null) as Void;
var ParsingStringClass = new FindAndSubstringClass();

    public function initialize(handler as Method(args as Dictionary or String or Null) as Void) {
        WatchUi.BehaviorDelegate.initialize();
        _notify = handler;
        
        makeRequest();
        return true;
    }

    public function onMenu() as Boolean {
        makeRequest();
        return true;
    }

   
    public function onSelect() as Boolean {
        makeRequest();
        return true;
    }

    
    private function makeRequest() as Void {
        _notify.invoke("Executing\nRequest");

        var options = {
             :headers => {"X-Auth-Token" => "d241fae71038458d9815e08ec3f62937"}
           // :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON,
          
        };

        Communications.makeWebRequest(
            "https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1",
            {},
            options,
            method(:onReceive)
        );
    }

   
    public function onReceive(responseCode, data) as Void {
        if (responseCode == 200) {
                var DateToString  = data.toString();
            var TrimmerDate = FindAndSubstringClass.FindAndSubstring(DateToString,"utcDate=>","season=>",9,12);
var TrimmerGetHour = FindAndSubstringClass.FindAndSubstring(DateToString,"utcDate=>","season=>",20,9);
var HoursPlusUtc = TrimmerGetHour.toNumber() + 2;
var TrimmerGetMinute = FindAndSubstringClass.FindAndSubstring(DateToString,"utcDate=>","season=>",22,6);
var PrintHours = HoursPlusUtc.toString() + TrimmerGetMinute;

            _notify.invoke(TrimmerDate+" "+PrintHours);
        } else {
            _notify.invoke("Failed to load\nError: " + responseCode.toString());
        }
    }
}