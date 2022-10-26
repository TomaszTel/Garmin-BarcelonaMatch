import Toybox.Graphics;
import Toybox.WatchUi;

class BarcelonaMatchesView extends WatchUi.View {
hidden var _Home;
hidden var _Away;
hidden var _Date;
    function initialize(home,away,date) {
        View.initialize();
        _Home = home;
                _Away = away;
_Date = date;
       
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
                View.findDrawableById("messageHome").setText(_Home);
                                View.findDrawableById("messageAway").setText(_Away);
View.findDrawableById("Date").setText(_Date);
    
    }

    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
     
    }

 function onKey(keyEvent) {
            WatchUi.pushView( new Rez.Menus.MainMenu(), new MyMenuDelegate(), WatchUi.SLIDE_UP );
           System.println("KEY!!!!");
        return true;
    }
    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
       
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}

