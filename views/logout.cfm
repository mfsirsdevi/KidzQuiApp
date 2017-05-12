<cfset controllerObject = CreateObject("component", "controller.UserController") />
<cfset VARIABLES.logout = controllerObject.logoutUser() />