component 
	output="false"
	displayName="listHelper"
	hint="I am a collection of functions for working with lists"
	{
		
	/**
	 * Remove duplicates from a list.
	 * 
	 * @param lst      List to parse. (Required)
	 * @param delim      List delimiter. Defaults to a comma. (Optional)
	 * @return Returns a string. 
	 * @author Keith Gaughan (keith@digital-crew.com) 
	 * @version 1, August 22, 2005 
	 */
	function listRemoveDuplicates(lst) {
	    var i       = 0;
	    var delim   = ",";
	    var asArray = "";
	    var set     = StructNew();
	
	    if (ArrayLen(arguments) gt 1) delim = arguments[2];
	
	    asArray = ListToArray(lst, delim);
	    for (i = 1; i LTE ArrayLen(asArray); i = i + 1) set[asArray[i]] = "";
	
	    return structKeyList(set, delim);
	}

	/**
	Compares one list against another to find the elements in the first list that don't exist in the second list.
	v2 mod by Scott Coldwell
	
	@param List1 	 Full list of delimited values. (Required)
	@param List2 	 Delimited list of values you want to compare to List1. (Required)
	@param Delim1 	 Delimiter used for List1.  Default is the comma. (Optional)
	@param Delim2 	 Delimiter used for List2.  Default is the comma. (Optional)
	@param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. (Optional)
	@return Returns a delimited list of values. 
	@author Rob Brooks-Bilson (&#114;&#98;&#105;&#108;&#115;&#64;&#97;&#109;&#107;&#111;&#114;&#46;&#99;&#111;&#109;) 
	@version 2, June 25, 2009 
	*/
	function listCompare(string list1, string list2, string delim1=",", string delim2=",", string delim3=","){
		var ret = "";		
		var list1Array = ListToArray(arguments.List1,Delim1);
		var list2Array = ListToArray(arguments.List2,Delim2);

       //Remove the subset List2 from List1 to get the diff
       list1Array.removeAll(list2Array);

       //Return in list format
       ret = ArrayToList(list1Array, Delim3);
       
       return ret;
	}
	
	/**
	* I take a list and a string and append a number to it until it is unique to the list.
	* I created this to make sure that a column being added to a query has a unique name
	*/ 
	function makeItemUnique(string list, string item){
		var iterator = 1;
		var uniqueString = arguments.item;
		while(listFindNoCase(arguments.list,uniqueString)){
			uniqueString = arguments.item & "_" & iterator;
			iterator++;
		}
		return uniqueString;
	}
	
	function removeElementFromList(string theList="", string theElement=""){
		var newList = arguments.theList;
		
		while(listFindNoCase(newList, theElement)){
			newList = ListDeleteAt(newList, ListFind(newList, theElement));
		}

		return newList;
	}


}

