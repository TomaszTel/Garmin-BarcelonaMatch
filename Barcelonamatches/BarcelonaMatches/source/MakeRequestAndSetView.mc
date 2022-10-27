 
 using Toybox.WatchUi;

 class MakeRequestClass  {

const URL = "https://api.football-data.org/v4/teams/81/matches?status=SCHEDULED&limit=1";

 var ParsingStringClass = new FindAndSubstringClass();
                

  function makeRequest(URL) {
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
            :headers => {"X-Auth-Token" => "d241fae71038458d9815e08ec3f62937"}
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(URL, null, options, method(:onReceive));
  }


  
  function onReceive(responseCode, data) {
     var DataString = data.toString();
     

var TrimmerHome = ParsingStringClass.FindAndSubstring(DataString,"awayTeam=>","tla=>",69,2);
var ReplaceFunctionHome = ParsingStringClass.stringReplace(TrimmerHome,">","");
var TrimmerAway = ParsingStringClass.FindAndSubstring(DataString,"homeTeam=>","group=>",93,11);
var ReplaceFunctionAway = ParsingStringClass.stringReplace(TrimmerAway,"e=>","");
var TrimmerDate = ParsingStringClass.FindAndSubstring(DataString,"utcDate=>","season=>",9,12);


System.println(ReplaceFunctionAway);
System.println("!----------------!");

System.println(ReplaceFunctionHome);
System.println("!----------------!");

System.println(DataString);
System.println("!----------------!");

        if (responseCode == 200)
        {
               WatchUi.switchToView(new BarcelonaMatchesView(ReplaceFunctionHome,ReplaceFunctionAway,TrimmerDate), new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);
       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error:",responseCode,""),"", new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);

       }
   }
   


}
 
