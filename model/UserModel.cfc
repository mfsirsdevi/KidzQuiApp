component {

  /**
    * Function to create a record of new user.
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains password of the user.
    * @return - Returns boolean value based on whether record created or not.
    */
    
  public boolean function createUser(string name, string email, string password)
  {
    
    var pwd = Hash(password);
    newUser = new Query();
    newUser.setSQL("INSERT into dbo.[User] (userName, userEmail, userPassword, userType, userMedia) VALUES (:name, :email, :password, :usertype, :usermedia)");
    newUser.addParam( name = "name", value = "#arguments.name#", cfsqltype = "cf_sql_varchar" );
    newUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
    newUser.addParam( name = "password", value = "#LOCAL.pwd#", cfsqltype = "cf_sql_varchar" );
    result = newUser.execute();
    return "true";
  }
  
  /**
    * Function to search a user from database.
    * @param string email - contains email of the user.
    * @return - Returns string value based on whether record created or not.
    */
  
  public any function searchUser(string email)
  {
    checkUser = new Query();
    checkUser.setSQL("SELECT * FROM dbo.[User] WHERE userEmail = :email");
    checkUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
    returnValue = checkUser.execute();
      return returnValue;
  }
  
   public boolean function insertToken(string token, string email)
   {
     
     updatetoken = new Query();
     updateToken.setSQL("UPDATE dbo.[User] SET resetToken = :token WHERE userEmail = :email");
     updateToken.addParam( name = "token", value = "#arguments.token#", cfsqltype = "cf_sql_varchar" );
     updateToken.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
     result = updateToken.execute();
     return "true";
 }
 
 /**
    * Function to add update password.
    *
    * @param string $password - contains new password.
    * @param string $email - contains email of the user.
    * @return - Returns boolean value if token updated or not.
    */
 public boolean function updatePassword(string password, string email)
 {
   var hashPassword = HASH(password);
   updatepassword = new Query();
   updatepassword.setSQL("UPDATE dbo.[User] SET userPassword = :password WHERE userEmail = :email");
   updatepassword.addParam( name = "password", value = "#local.hashPassword#", cfsqltype = "cf_sql_varchar" );
   updatepassword.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
   hasUpdated = updatepassword.execute();
     return "true";
 }
}