<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <script>
        setTimeout(function(){
            document.getElementById('er').style.display = 'none';
        }, 2000);
    </script>
    <link rel="stylesheet" href="css/styles.css" />
    <title>Ensiastly</title>
</head>

<body>
<header>
    <nav class="navBar">
        <div class="navbarContainer">
            <a href="#home" id="navBarLogo">Ensiastly</a>
        </div>
    </nav>
</header>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <% if(request.getAttribute("errorMessage")!=null && (!request.getAttribute("errorMessage").equals(""))){%>
            <div class="alert alert-danger" id="er" style="text-align: center ; color: red;" >
                ${errorMessage}
            </div><%}%>
            <form action="Login" method="post" class="sign-in-form">
                <h2 class="title">Sign in</h2>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="Email"  pattern="[A-Za-z]+@um5.ac.ma" title="@um5.ac.ma email!!" placeholder="Email" required/>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="Password" minlength="6" title="min 6" placeholder="Password" required/>
                </div>
                <input type="submit" class="btn solid" value="login"/>

            </form>
            <form action="registre" method="post" class="sign-up-form">
                <h2 class="title">Sign up</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Nom" />
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" pattern="[A-Za-z]+@um5.ac.ma" title="@um5.ac.ma email!!" placeholder="Email" />
                </div>
                <div class="input-field">
                    <i class="fas fa-shapes"></i>
                    <select name="branche" id="filiere" aria-placeholder="" style="color: #aaa;">
                        <option value="">Branch</option>
                        <option value="gl">GL</option>
                        <option value="iwim">IWIM</option>
                        <option value="embi">eMBI</option>
                        <option value="isem">ISEM</option>
                        <option value="iel">IEL</option>
                        <option value="idf">IDF</option>
                        <option value="ai">AI</option>
                    </select>
                </div>
                <div class="input-field">
                    <i class="fas fa-user-graduate"></i>
                    <select name="grade" id="niveau", aria-placeholder="" style="color: #aaa;">
                        <option value="">Grade</option>
                        <option value="1">1 year</option>
                        <option value="2">2 year</option>
                        <option value="3">3 year</option>
                    </select>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" minlength="6" title="min 6" placeholder="Password" />
                </div>
                <input type="submit" class="btn" value="Sign up" />
            </form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>New here ?</h3>
                <p></p>
                <p style="font-family: Poppins,serif;">
                    Hello Ensiast !
                    You're lost ? You need some recommandations?
                </p>
                <p style="font-weight: 500; line-height: 1.5;font-size: 1.3rem;">Ensiastly is here to help you, Ensiasts are here to help you !</p>
                <button class="btn transparent" id="sign-up-btn">Sign up</button>
            </div>
            <img src="pictures/undraw_jogging_re_k28i.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>Welcome back !</h3>
                <p>
                    Sign in now ! Ensiasts are waiting for you !
                </p>
                <button class="btn transparent" id="sign-in-btn">Sign in</button>
            </div>
            <img src="pictures/undraw_road_sign_re_3kc3.svg" class="image" alt="" />
        </div>
    </div>
</div>
<footer>
    <span>Ensiastly Team</span>
</footer>
<script src="js/app.js"></script>
</body>
</html>
