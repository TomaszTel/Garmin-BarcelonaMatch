 
 using Toybox.WatchUi;
(:glance)
module MakeRequestModule
{
     var Date ;
     (:glance)
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
var ReplaceFunctionHome2 = ParsingStringClass.stringReplace(ReplaceFunctionHome,"=","");

var TrimmerAway = ParsingStringClass.FindAndSubstring(DataString,"homeTeam=>","group=>",93,11);
var ReplaceFunctionAway = ParsingStringClass.stringReplace(TrimmerAway,"e=>","");
var ReplaceFunctionAway2 = ParsingStringClass.stringReplace(ReplaceFunctionAway,",","");
var ReplaceFunctionAway3 = ParsingStringClass.stringReplace(ReplaceFunctionAway2,"nam","");
var ReplaceFunctionAway4 = null;


if(ReplaceFunctionAway3.equals("mCádiz CF"))
{
        
         ReplaceFunctionAway4 = ParsingStringClass.stringReplace(ReplaceFunctionAway3,"m","");

}
var TrimmerDate = ParsingStringClass.FindAndSubstring(DataString,"utcDate=>","season=>",9,12);


//System.println(ReplaceFunctionAway2);
//System.println("!----------------!");

//System.println(ReplaceFunctionHome2);
//System.println("!----------------!");

//System.println(DataString);
//System.println("!----------------!");

        if (responseCode == 200)
        {
                Date = TrimmerDate;
              
                        if(ReplaceFunctionAway3.equals("mCádiz CF"))
{
                           WatchUi.switchToView(new BarcelonaMatchesView(ReplaceFunctionHome2,ReplaceFunctionAway4,TrimmerDate), new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);

}
else
{
                       WatchUi.switchToView(new BarcelonaMatchesView(ReplaceFunctionHome2,ReplaceFunctionAway3,TrimmerDate), new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);

}


       }
       else
       {
               WatchUi.switchToView(new BarcelonaMatchesView("Error:",responseCode,""),"", new MyBehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);

       }
   }
   


}
 
}