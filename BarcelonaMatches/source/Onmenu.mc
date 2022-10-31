
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MyBehaviorDelegate extends Ui.BehaviorDelegate {

function initialize() {
Sys.println( "Open Menu" );
BehaviorDelegate.initialize();
}

function onMenu() {
Sys.println( "Open Menu" );
            Ui.pushView( new Rez.Menus.MainMenu(), new MyMenuDelegate(), Ui.SLIDE_UP );

return true;
}

}