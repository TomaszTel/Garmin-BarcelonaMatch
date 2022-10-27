 using Toybox.WatchUi;

  
 using Toybox.WatchUi;

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

while (true)
{
var index = result.find(oldString);

if (index != null)
{
var index2 = index+oldString.length();
result = result.substring(0, index) + newString + result.substring(index2, result.length());
}
else
{
return result;
}
}

return null;
}
}
 
