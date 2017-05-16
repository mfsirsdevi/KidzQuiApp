<!DOCTYPE html>
<!-- 
  * File: index.cfm
  * Author: R S Devi Prasad
  * Purpose: Login page for all the users
  * Date: 11-05-2017
-->
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>KidzQui </title>

    <!-- Bootstrap -->
    <link href="assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="assets/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="assets/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="assets/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
  <cfif SESSION.isLogged EQ "true">
      <cflocation url="views/dashboard.cfm" addToken="false"></cflocation>
    </cfif>
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <a class="hiddenanchor" id="resetpassword"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <cfform>
              <h1>Login Form</h1>
              <cfset controllerObject = CreateObject("component", "controller.UserController")/>
                <cfif StructKeyExists(form, "loginbtn")>
                  <cfset message = controllerObject.loginUser(email = "#form.email#", password = "#form.password#")/>
                </cfif>
                <cfif IsDefined("message")>
                  <div class="text-center">
                    <cfoutput> #message# </cfoutput>
                  </div>
                </cfif>
              <div>
                <input name="email" type="text" class="form-control" placeholder="name" required="" />
              </div>
              <div>
                <input name="password" type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <button type="submit" name="loginbtn" class="btn btn-default submit">Log in</button>
                <a class="reset_pass" href="views/forgotpassword.cfm">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <!--
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>
                -->

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
        
        

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <cfset controllerObject = CreateObject("component","controller.UserController")/>
            <cfif StructKeyExists(form, "registerbtn")>
                <cfset message = controllerObject.registerUser(name = "#form.name#", email = "#form.email#", password = "#form.password#", cPassword = "#form.cpassword#")/>
            </cfif>
            <cfform>
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" name = "name" placeholder="Name" required="" />
              </div>
              <div>
                <input type="email" class="form-control" name = "email" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name = "password" placeholder="Password" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name = "cpassword" placeholder="Retype Password" required="" />
              </div>
              <div>
                <button type="submit" name = "registerbtn" class="btn btn-default submit">Submit</a>
              </div>
              <cfif IsDefined("message")>
                  <div class="text-center">
                      <cfoutput> #message# </cfoutput>
                  </div>
              </cfif>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> KidzQui!</h1>
                  <p>©2016 All Rights Reserved. KidzQui is a mathematical application by MindFire. Privacy and Terms</p>
                </div>
              </div>
            </cfform>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
