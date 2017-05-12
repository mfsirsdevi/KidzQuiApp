<!DOCTYPE html>
<!DOCTYPE html>
<!-- 
  * File: resetPassword.cfm
  * Author: R S Devi Prasad
  * Purpose: page for password reset
  * Date: 12-05-2017
-->

<cfinclude template="includes/header.cfm">

<body class="login">
  
    <div>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <cfform>
              <h1>Reset Password</h1>
              <cfset controllerObject = CreateObject("component", "controller.UserController")/>
              <cfset email = url.email />
              <cfset token = url.token />
              <cfset VARIABLES.emailCheck = controllerObject.userDetails( email = "#email#")>
              <cfif (VARIABLES.emailCheck.getResult().recordCount EQ 0) OR (VARIABLES.emailCheck.getResult().resetToken NEQ token)>
                <cflocation url="../index.cfm" addToken="false"></cflocation>
              </cfif>
                <cfif StructKeyExists(form, "submitbtn")>
                  <cfset message = controllerObject.resetPassword(password = "#form.password#", cpassword = "#form.cpassword#", email = "#email#")/>
                </cfif>
                <cfif IsDefined("message")>
                  <div class="text-center">
                    <cfoutput> #message# </cfoutput>
                  </div>
                </cfif>
              <div>
                <input name="password" type="password" class="form-control" placeholder="password" required="" />
              </div>
              <div>
                <input name="cpassword" type="password" class="form-control" placeholder="re type password" required="" />
              </div>
              <div>
                <button type="submit" name="submitbtn" class="btn btn-default submit">Reset</button>
                
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                
                <p class="change_link">New to site?
                  <a href="../index.cfm#signup" class="to_register"> Create Account </a>
                </p>
                

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> KidzQui</h1>
                  <p> ©2016 All Rights Reserved. KidzQui is a mathematics teaching tool. Privacy and Terms</p>
                </div>
              </div>
            </cfform>
          </section>
        </div>
      </div>
    </div>
  </body>