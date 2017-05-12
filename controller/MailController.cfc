component {
  userModel = CreateObject("component", "model.UserModel");
  public function passwordReset(string email)
  {
    var LOCAL.isUser = userModel.searchUser(email);
    if(isUser.getResult().recordCount EQ 0)
      return "Email does not exist";
    var LOCAL.randomString = "";
    var i = 0;
    for (i = 0; i <= 20; i++) {
      LOCAL.randomString = LOCAL.randomString&Chr(RandRange(65, 90));
    }
    
    var LOCAL.insertToken = userModel.insertToken(randomString, email);
       savecontent variable="mailBody" {
         writeOutput( "To reset your password please visit this link: http://www.kidzqui.com/views/resetPassword.cfm?token=#LOCAL.randomString#&email=#ARGUMENTS.email#");
   };
   
    mailService = new mail(
      to = "#ARGUMENTS.email#",
      from = "kidzqui@gmail.com",
      subject = "Reset Password",
      body = mailBody
    );
    mailService.send();
   return "Reset password link sent to your mail";
  }
}