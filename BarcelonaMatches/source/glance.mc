using Toybox.WatchUi;
using Toybox.Graphics as Gfx;
using Toybox.Timer;
(:glance)
class GlanceView extends WatchUi.GlanceView {


   private var _message as String = "Press menu or\nselect button";

    
    public function initialize() {
        WatchUi.GlanceView.initialize();
    }

   
    public function onLayout(dc as Dc) as Void {
    }

    public function onShow() as Void {
    }

 
    public function onUpdate(dc as Dc) as Void {
   


        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2, Graphics.FONT_TINY, _message, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        //dc.drawRectangle(0, 0, dc.getWidth(), dc.getHeight());
    }

  
    public function onHide() as Void {
    }

 
    public function onReceive(args as Dictionary or String or Null) as Void {
        if (args instanceof String) {
            _message = args;
        } else if (args instanceof Dictionary) {
            var keys = args.keys();
            _message = "";
            for (var i = 0; i < keys.size(); i++) {
                _message += Lang.format("$1$: $2$\n", [keys[i], args[keys[i]]]);
            }
        }
       
    }

}