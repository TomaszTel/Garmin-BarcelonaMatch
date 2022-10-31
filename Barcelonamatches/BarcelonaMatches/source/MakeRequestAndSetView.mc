 
 using Toybox.WatchUi;
 using Toybox.Attention;
        using Toybox.Application;

(:glance)
module MakeRequestModule
{
     var Date ;
    var vibeData;
     (:glance)
 class MakeRequestClass  {

const URL = "https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1";

 var ParsingStringClass = new FindAndSubstringClass();
           var Token =  Application.Properties.getValue("ApiToken");
      

  function makeRequest(URL) {
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
            :headers => {"X-Auth-Token" => "d241fae71038458d9815e08ec3f62937"}
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(URL, null, options, method(:onReceive));
  }


  
  function onReceive(responseCode, data) {
      if (responseCode == 200)
        {
     var DataString = data.toString();
     
if (Attention has :vibrate) {
    vibeData =
    [
        new Attention.VibeProfile(50, 400) 
 
    ];

}


 var ReplaceHome = [">","=","CF","FC","PLZ"];
var TrimmerHome = ParsingStringClass.FindAndSubstring(DataString,"awayTeam=>","tla=>",69,2);
var ReplaceFunctionHomeFunction = ParsingStringClass.stringReplace(TrimmerHome,ReplaceHome,"");


var TrimmerAway = ParsingStringClass.FindAndSubstring(DataString,"homeTeam=>","group=>",93,11);
 var ReplaceAway = ["e=>",",","nam","FC","PLZ ",">","=","CF"];
var ReplaceFunctionAway = ParsingStringClass.stringReplace(TrimmerAway,ReplaceAway,"");

var TrimmerDate = ParsingStringClass.FindAndSubstring(DataString,"utcDate=>","season=>",9,12);
var TrimmerCompetence = ParsingStringClass.FindAndSubstring(DataString,"competition=>",", utcDate=>",103,1);
 var ReplaceCompetence = ["A "];

       var  ReplaceCompetenceFunction = ParsingStringClass.stringReplace(TrimmerCompetence,ReplaceCompetence,"");

var TrimmerGetHour = ParsingStringClass.FindAndSubstring(DataString,"utcDate=>","season=>",20,9);
var HoursPlusUtc = TrimmerGetHour.toNumber() + 1;
var TrimmerGetMinute = ParsingStringClass.FindAndSubstring(DataString,"utcDate=>","season=>",22,6);
var PrintHours = HoursPlusUtc.toString() + TrimmerGetMinute;


            Application.Properties.setValue("DateMatch",TrimmerDate +"|"+PrintHours);
                            Application.Properties.setValue("AwayTeam",ReplaceFunctionAway);
                                Application.Properties.setValue("HomeTeam",ReplaceFunctionHomeFunction);
//System.println("Hours: "+TrimmerGetHour);
//System.println("Minutes: "+TrimmerGetMinute);
//System.println("Complete Hours: "+PrintHours);

//System.println("!----------------!");

//System.println(ReplaceFunctionHome2);
//System.println("!----------------!");

//System.println(TrimmerCompetence);
//System.println("!----------------!");

//System.println(DataString);
//System.println("!----------------!");



      
                Date = TrimmerDate;
              

  

        Attention.vibrate(vibeData);

                       WatchUi.switchToView(new BarcelonaMatchesView(ReplaceFunctionHomeFunction,ReplaceFunctionAway,TrimmerDate,ReplaceCompetenceFunction,PrintHours), new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);




       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error:"+responseCode.toString(),"","Please try again","",""), new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);

       }
   }
   


}
 
}