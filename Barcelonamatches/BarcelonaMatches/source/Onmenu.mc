import Toybox.WatchUi;

class MyBehaviorDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

     function onMenu() {
            WatchUi.pushView( new Rez.Menus.MainMenu(), new MyMenuDelegate(), WatchUi.SLIDE_UP );
           System.println("KEY!!!!");
        return true;
    }
}
