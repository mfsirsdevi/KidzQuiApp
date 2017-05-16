component {

    loginObject = CreateObject("component", "model.UserModel");
   /**
    * Function to create a record of new user registered.
    *
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains passwoed of the user.
    * @return - Returns string value based on whether record created or not.
    */
  public string function registerUser(string name, string email, string password, string cPassword)
  {

    var searchUser = loginObject.searchUser(email);
    if(searchUser.getResult().recordCount EQ 0) {
      var isRegistered = loginObject.createUser(name, email, password);
      if(isRegistered EQ "true")
        location(url="index.cfm", addToken="false");
      else
        return "There are some errors in registration details";
    }
    return "Email Already Exists!";
  }

  /**
    * Function to log the existing user in.
    *
    * @param string email - contains email of the user.
    * @param string password - contains passwoed of the user.
    * @return - Returns string value based on whether user exists or not.
    */

  public string function loginUser(string email, string password)
  {
    var isUser = loginObject.searchUser(email);
    if(isUser.getResult().recordCount NEQ 0) {
      if(isUser.getResult().userPassword EQ HASH(ARGUMENTS.password)) {
        var SESSION.isLogged = "true";
        var SESSION.email = "#ARGUMENTS.email#";
        var SESSION.name = isUser.getResult().userName;
        var SESSION.userType = isUser.getResult().userType;
        var SESSION.media = isUser.getResult().userMedia;
        APPLICATION.currentUsers = "#ARGUMENTS.email#";
        location(url = "views/dashboard.cfm", addToken = "false");
      }
      else {
        return "password didn't match";
      }
    }
    else {
      return "Email does not exist";
    }
  }

  /**
    *
    */

  public string function resetPassword(string password, string cpassword, string email)
  {
    if(password NEQ cpassword)
      return "passwords did not match";
    var isUser = loginObject.updatePassword(password, email);
    if(isUser EQ "true")
      location(url = "../index.cfm" addToken="false");
    return "Failed to update the password";
  }

  public any function userDetails(string email)
  {
    return loginObject.searchUser(email);
  }

  /**
    * Function to logout the user.
    *
    * @param void.
    * @return - void.
    */

  public void function logoutUser()
  {
    if(SESSION.email NEQ "") {
      APPLICATION.currentUsers = listDeleteAt(APPLICATION.currentUsers, listFind(APPLICATION.currentUsers, SESSION.email));
    }
    structClear(SESSION);
    var SESSION.isLogged = "false";
    var SESSION.email = "";
    location( url="../index.cfm", addToken="false");
    sessionInvalidate();
  }
}