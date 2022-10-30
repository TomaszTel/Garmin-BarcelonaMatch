 using Toybox.WatchUi;

  
 using Toybox.WatchUi;
(:glance)
 class FindAndSubstringClass  {

function FindAndSubstring(DataString,IndexFrom,IndexTo,IndexFromRemove,IndexToRemove)
{
var indexFrom = DataString.find(IndexFrom) ;
var indexTo = DataString.find(IndexTo) ;

return DataString.substring(indexFrom + IndexFromRemove, indexTo - IndexToRemove);
}
function stringReplace(str, oldString, newString)
{
var result = str;

for (var i = 0; i < oldString.size(); ++i) {

while (true)
{
var index = result.find(oldString[i]);

if (index != null)
{
var index2 = index+oldString[i].length();
result = result.substring(0, index) + newString + result.substring(index2, result.length());
}
else
{
break;
}
}
}
return result;
}
}
 
