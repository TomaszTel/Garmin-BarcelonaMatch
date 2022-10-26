import Toybox.Graphics;
import Toybox.WatchUi;


class MyMenuDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
    }
    function onMenuItem(item) {
        if ( item == :item_1 ) {
           System.println("Item 1");
        } else if ( item == :item_2 ) {
            System.println("Item 2");
        }
    }

}