//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//
 using Toybox.Application;
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
        
        GetFromStorage();
        return true;
    }

    public function onMenu() as Boolean {
        GetFromStorage();
        return true;
    }

   
    public function onSelect() as Boolean {
        GetFromStorage();
        return true;
    }

    
    private function GetFromStorage() as Void {
        _notify.invoke("Executing\nPlease wait");
   
     var GetDate =  Application.Properties.getValue("DateMatch");
    
          var GetGlaneView =  Application.Properties.getValue("GlaneView");
                

  if(GetDate == null or GetGlaneView == null)
      {
            _notify.invoke("Please open app");

      }
      else
      {
            _notify.invoke(GetGlaneView +"\n"+GetDate);

      }
    }

   
    
}