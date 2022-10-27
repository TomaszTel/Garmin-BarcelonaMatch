using Toybox.WatchUi;
using Toybox.Graphics as Gfx;

(:glance)
class GlanceView extends WatchUi.GlanceView {

  var _workoutText;
    hidden var width;
    hidden var height;
    hidden var textHeight;
    hidden var started = false;
      hidden var mainview;



  function initialize() {
    GlanceView.initialize();
  }
function onShow()
{

}
function onHide() {
    }
  function onLayout(dc) {
            started = true;

    // FIXME - adjust formatting to merge lines 2 & 3 for glance view
    _workoutText = "TEXT";
    // Application.getApp().log("workoutText(" + _workoutText + ")");
  }

  function onUpdate(dc) {
        width = dc.getWidth();
        height = dc.getHeight();

 if (textHeight == null) {
            var dim = dc.getTextDimensions("Dummy", Gfx.FONT_SYSTEM_XTINY);
            textHeight = dim[1];
        }
         System.println("Glance onUpdate(): width:" + dc.getWidth() + " height:" + dc.getHeight());
        dc.setColor(0xffecb8, Gfx.COLOR_TRANSPARENT);
   var text = "Loading...";

    if (!started) {
            dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Gfx.FONT_XTINY, text, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        }
    dc.drawText(dc.getWidth()/3, dc.getHeight() /3, Graphics.FONT_XTINY,  "TEXT", Graphics.TEXT_JUSTIFY_LEFT);
  }

}