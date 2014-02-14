component
	output="false"
	displayName="dateHelper"
	hint="I am a collection of functions for working with dates"
	{
	
	/**
	* Formats local dates for UTC time
	* 
	* @param localDT      date to convert. (Required)
	* @return Returns a string. 
	* @author Dominic O'Connor (dominic@interfolio.com) 
	* @version 1, August 2, 2011 
	*/
	function localDTtoUTC(localDT){
		var utcDT = DateConvert( "Local2UTC", arguments.localDT );
		return dateFormat(utcDT,'YYYY-MM-DD') & "T"  & timeFormat(utcDT,'HH:MM') & "Z";
	}
}