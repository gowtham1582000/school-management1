<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="student_teacher_login.aspx.vb" Inherits="MyWebAppDemo1.student_teacher_login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://kit.fontawesome.com/46f4246223.css" crossorigin="anonymous">
    <style>
        
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}
body{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
 background:url("https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
  padding: 30px;
}
.container{
  position: relative;
  max-width: 850px;
  width: 100%;
   background:rgba(255,255,255,0.1);
  box-shadow:0 30px 50px rgba(0,0,0,0.1);
  border:1px solid rgba(255,255,255,0.4);
  padding: 40px 30px;
  box-shadow: 0 5px 10px rgba(0,0,0,.5);
  perspective: 2700px;
    backdrop-filter:blur(10px);

}
.container .cover{
  position: absolute;
  top: 0;
  left: 50%;
  height: 100%;
  width: 50%;
  z-index: 98;
  transition: all 1s ease;
  transform-origin: left;
  transform-style: preserve-3d;
}
.container #flip:checked ~ .cover{
  transform: rotateY(-180deg);
}
 .container .cover .front,
 .container .cover .back{
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
}


.container .cover::before,
.container .cover::after{
  content: '';
  position: absolute;
  height: 100%;
  width: 100%;
  background: #7d2ae8;
  opacity: 0.5;
  z-index: 12;
}
.container .cover::after{
  opacity:0.1;
}
.container .cover img{
  position: absolute;
  height: 100%;
  width: 100%;
  object-fit: cover;
  z-index: 10;
}
.container .cover .back .backImg{
  transform:rotateY(180deg);
}

.container .cover .text{
  position: absolute;
  z-index: 20;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  
}
.cover .text .text-1,
.cover .text .text-2{
  font-size: 26px;
  font-weight: 600;
  color: #fff;
  text-align: center;
  overflow:hidden;
  backface-visibility:hidden;
  
}
.cover .text .text-2{
  font-size: 15px;
  font-weight: 500;
}
.container .forms{
  height: 100%;
  width: 100%;
  
}
.container .form-content{
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.form-content .login-form,
.form-content .signup-form{
  width: calc(100% / 2 - 25px);
}
.forms .form-content .title{
  position: relative;
  font-size: 24px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .title:before{
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 25px;
  background: #7d2ae8;
}
.forms .signup-form  .title:before{
  width: 20px;
}
.forms .form-content .input-boxes{
  margin-top: 50px;
  
}
.forms .form-content .input-box{
  display: flex;
  align-items: center;
  height: 50px;
  width: 100%;
  margin: 10px 0;
  position: relative;
  
 
}
.form-content .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  padding: 0 30px;
  font-size: 16px;
  font-weight: 500;
  border-bottom: 2px solid rgba(0,0,0,0.2);
  border-radius:10px;
  transition: all 0.3s ease;
  background:rgba(255,255,255,0.3);
}

.form-content .input-box input:focus,
.form-content .input-box input:valid{
  border-color:rgba(255,255,255,0.2);
}
.form-content .input-box i{
  position: absolute;
  color: #7d2ae8;
  font-size: 17px;
  left:5px;
}
.forms .form-content .text{
  font-size: 14px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .text a{
  text-decoration: none;
}
.forms .form-content .text a:hover{
  text-decoration: underline;
}
.forms .form-content .button{
  color: #fff;
  margin-top: 40px;
  left:25px;
  width:200px;
}
.forms .form-content .button input{
  color: #fff;
  background: #7d2ae8;
  border-radius: 10px;
  padding: 0;
  cursor: pointer;
  font-size:1.1em;
  transition: all 0.4s ease;
}
.forms .form-content .button input:hover{
  background: #5b13b9;
  transform:scale(1.1);
  
}
.forms .form-content label{
  color: #5b13b9;
  cursor: pointer;
}
.forms .form-content label:hover{
  text-decoration: underline;
}
.forms .form-content .login-text,
.forms .form-content .sign-up-text{
  text-align: center;
  margin-top: 25px;
}
.container #flip{
  display: none;
}

/*RESPONSIVE*/
@media (max-width: 730px) {
  .container .cover{
    display: none;
  }
  .form-content .login-form,
  .form-content .signup-form{
    width: 100%;
  }
  .form-content .signup-form{
    display: none;
  }
  .container #flip:checked ~ .forms .signup-form{
    display:block ;
  }
  .container #flip:checked ~ .forms .login-form{
    display: none;
  }
}

    </style>
</head>
<body>
   
    <form id="form1" runat="server">
        <div class="container">
            <asp:CheckBox ID="flip" runat="server" />
            <div class="cover">
                <div class="front">
                    <img src="https://assets.telegraphindia.com/telegraph/2022/Jul/1657712721_istock-teachers.jpeg" alt="">
                </div>
                <div class="back">
                    <img class="backImg" src="https://assets.telegraphindia.com/telegraph/2022/Jul/1657712721_istock-teachers.jpeg" alt="">
                </div>

            </div>
            <div class="forms">
                <div class="form-content">
                    <div class="login-form">
                        <div class="title">Student Login</div>
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox ID="txtLoginEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                            </div>
                            <div class="text"><a href="#">Forgot password?</a></div>
                            <div class="button input-box">
                                <asp:Button ID="btnLogin" runat="server" Text="Submit" />
                            </div>
                            <div class="text sign-up-text">Are You a Teacher? <asp:Label ID="lblFlipLogin" runat="server" AssociatedControlID="flip" Text="Teacher Login" CssClass="pointer"></asp:Label></div>
                            <div class="text sign-up-text">Are you Student Not Have an Account? <a style="color:#5b13b9;" href="adding_student.aspx"><asp:Label ID="Label3" runat="server"  Text="Signup here" CssClass="pointer"></asp:Label></a></div>
                        </div>
                    </div>
                    <div class="signup-form">
                        <div class="title">Teacher login</div>
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your email"></asp:TextBox>
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                            </div>
                            <div class="text"><a href="#">Forgot password?</a></div>
                            <div class="button input-box">
                                <asp:Button ID="Button1" runat="server" Text="Submit" />
                            </div>
                            <div class="text sign-up-text">Are You a Student? <asp:Label ID="Label1" runat="server" AssociatedControlID="flip" Text="Student Login" CssClass="pointer"></asp:Label></div>
                            <div class="text sign-up-text">Are you Teacher Not Have an Account?  <a style="color:#5b13b9;" href="adding_teacher.aspx"><asp:Label ID="Label2" runat="server" AssociatedControlID="flip" Text="Signup here" CssClass="pointer"></asp:Label></a></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
