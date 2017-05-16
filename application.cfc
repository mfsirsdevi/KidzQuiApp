component {

    this.name = "KidzQui";
    this.sessionmanagement = "yes";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "kidzqui";
    

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {
      var SESSION.isLogged = "false";
      var SESSION.email = "";
      var SESSION.name = "";
    }

    // the target page is passed in for reference, 
    // but you are not required to include it
    function onRequestStart( string template ) {
      var local = {};
      local.basePath = getDirectoryFromPath(getCurrentTemplatePath());
            
      local.targetPath = getDirectoryFromPath(expandPath( arguments.template ));

      local.requestDepth = (listLen( local.targetPath, "\/" ) - listLen( local.basePath, "\/" ));
      request.webRoot = repeatString("../", local.requestDepth);

      request.siteUrl = ("http://" & cgi.server_name & reReplace(getDirectoryFromPath( arguments.template ), "([^\\/]+[\\/]){#local.requestDepth#}$", "", "one"));
      return true;
    }

    function onRequest( string targetPage ) {
        include arguments.targetPage;
        return;
    }

    //function onRequestEnd() {}

    //function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    //function onApplicationEnd( struct ApplicationScope ) {}

    //function onError( any Exception, string EventName ) {}

}