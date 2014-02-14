component
	output="false"
	displayName="dateHelper"
	hint="I am a collection of functions for working with dates"
	{

	function canGZIP(){
		local.requestData 	 = getHttpRequestData();
		local.requestHeaders = local.requestData.headers;
		local.acceptEncoding = (structKeyExists(local.requestHeaders,'Accept-Encoding') && listLen(local.requestHeaders['Accept-Encoding']) GT 0)
							   ? local.requestHeaders['Accept-Encoding'] 
							   : "";
		
		if(local.acceptEncoding EQ ""){
			return false;
		}
		else{
			return listFindNoCase(local.acceptEncoding,'gzip');
		}
	}

	function doGZIP(toGZIP){
		var ioOutput = CreateObject("java","java.io.ByteArrayOutputStream");
		var gzOutput = CreateObject("java","java.util.zip.GZIPOutputStream");
		
		ioOutput.init();
		gzOutput.init(ioOutput);
		
		gzOutput.write(arguments.toGZIP.getBytes("UTF-8"), 0, Len(arguments.toGZIP.getBytes()));
		
		gzOutput.finish();
		gzOutput.close();
		ioOutput.flush();
		ioOutput.close();
		
		local.toOutput=ioOutput.toByteArray();
		
		return local.toOutput;
	}
	
	function getRequestHeaders(){
		return local.requestData.headers;
	}
}