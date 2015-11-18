component extends="framework.one"
{	
	THIS.name = "CentralTorontoVolleyball";
	THIS.datasource = "CentralTorontoVolleyball";
	THIS.applicationTimeout = createTimeSpan(2, 0, 0, 0);
	THIS.sessionManagement = true;
	THIS.setClientCookies = true;
	THIS.clientManagement = false;
	THIS.sessionTimeout = createTimeSpan(0, 8, 0, 0);
	THIS.setDomainCookies = true;
	THIS.enableRobustException  = true;

	function setupApplication()
	{
		APPLICATION.environment = structNew();
		APPLICATION.lib = structNew();
		APPLICATION.lib.xmlToStruct = createObject("component","lib.xml2struct");
		APPLICATION.services = structNew();
		var envConfigPath = "C:\Inetpub\wwwroot\envConfig.xml";
		var appConfigPath = "#getDirectoryFromPath (getCurrentTemplatePath())#appConfig.xml";

		if (fileExists(envConfigPath))
		{
			var envXml = fileRead(envConfigPath);
		}
		else
		{
			writeOutput("Could not find environment configuration file at #envConfigPath#");
			abort;
		}

		if (fileExists(appConfigPath))
		{
			var appXml = fileRead(appConfigPath);
		}
		else
		{
			writeOutput("Could not find application configuration file at #appConfigPath#");
			abort;
		}

		var envConfig = APPLICATION.lib.xmlToStruct.convertXmlToStruct(envXml,structNew());
		var appConfig = APPLICATION.lib.xmlToStruct.convertXmlToStruct(appXml,structNew());
		structAppend(APPLICATION.environment, envConfig);
		structAppend(APPLICATION.environment, appConfig.common);
		structAppend(APPLICATION.environment, appConfig[APPLICATION.environment.envName]);
		structDelete(APPLICATION.environment, "empty");

		var allServices = directoryList("#getDirectoryFromPath(getCurrentTemplatePath())#model\services", false, "query", "*.cfc","");
		for (intRow = 1; intRow LTE allServices.recordCount; intRow = (intRow + 1))
		{
			APPLICATION.services["#listGetAt(allServices.name[intRow],1,'.')#"] = createObject("component", "model.services.#listGetAt(allServices.name[intRow],1,'.')#");
		}
		// Specific method invocations go here

	}

	function setupRequest()
	{
		// use setupRequest to do initialization per request
		request.context.startTime = getTickCount();
		
		if (structKeyExists(URL, "forceInit"))
		{
			setupApplication();
		}

		httpRequest = GetHttpRequestData();
		if (structKeyExists(httpRequest, "headers") && structKeyExists(httpRequest.headers, "X-Forwarded-For"))
		{
			REQUEST.remoteIPAddress = getToken(httpRequest.headers['X-Forwarded-For'],1,',');
		}
		else
		{
			REQUEST.remoteIPAddress = CGI.remote_addr;
		}

		if (APPLICATION.environment.useAllowedIPs EQ "Yes")
		{
			if (listFindNoCase(APPLICATION.environment.allowedIPs, REQUEST.remoteIPAddress) EQ 0 AND left(REQUEST.remoteIPAddress, 10) NEQ APPLICATION.environment.serverSubnet)
			{
				writeOutput("#REQUEST.remoteIPAddress# Not Allowed!");
				abort;
			}
		}
	}
}