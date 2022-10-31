import Toybox.Graphics;
import Toybox.WatchUi;
(:glance)
class BarcelonaMatchesView extends WatchUi.View {
hidden var _Home;
hidden var _Away;
hidden var _Date;
hidden var _Competence;
hidden var _Hours;

    function initialize(home,away,date,competence,hours) {
        View.initialize();
            _Home = home;
                _Away = away;
                    _Date = date;
                        _Competence = competence;
                            _Hours = hours;
    }
   



    // Load your resources here
    function onLayout(dc as Dc) as Void {
             
        setLayout(Rez.Layouts.MainLayout(dc));
                View.findDrawableById("messageHome").setText(_Home);
                                View.findDrawableById("messageAway").setText(_Away);
                                    View.findDrawableById("Date").setText(_Date);
                                        View.findDrawableById("competence").setText(_Competence);
                                             View.findDrawableById("Hours").setText(_Hours);
                                             
    }
    
  

    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {

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
 class MyMenuInputDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            System.println("Item 1");
        } else if (item == :item_2) {
            System.println("Item 2");
        }
    }
}

