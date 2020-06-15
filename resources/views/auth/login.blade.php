<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->  
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
    <link href="css/plantilla.css" rel="stylesheet">
    <link href="fontawesome/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/loginutil.css">
    <link rel="stylesheet" type="text/css" href="css/loginmain.css">

</head>
<body>
    
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form" method="POST" action="{{ route('login') }}">
                    @csrf
                    <span class="login100-form-title p-b-26">
                        Welcome
                    </span>
                    <span class="login100-form-title p-b-48">
                        <i class="fas fa-store"></i>
                    </span>

                    <div class="wrap-input100 validate-input" data-validate = "Usuario No valido">
                        <input class="input100" type="text" id="usuario" name="usuario" value="{{ old('usuario') }}" autofocus>
                        <span class="focus-input100" data-placeholder="Usuario"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Ingresa password">
                        <span class="btn-show-pass">
                            <i class="zmdi zmdi-eye"></i>
                        </span>
                        <input class="input100" type="password" name="password" id="password">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>
                    @error('usuario')
                        <div>
                            <span class="invalid-feedback" role="alert" style="color: #ff0000b5">
                                <strong>{{ $message }}</strong>
                            </span>
                        </div>
                    
                    @enderror 

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn" type="submit">
                                Login
                            </button>
                        </div>
                    </div>

                    <div class="text-center p-t-115">
                        <span class="txt1">
                            Bienvendio de nuevo
                        </span>

                       <!--  <a class="txt2" href="#">
                            Sign Up
                        </a> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <div id="dropDownSelect1"></div>
    
<!--===============================================================================================-->
    <script src="js/plantilla.js"></script>
    <!-- App Js -->
    <script src="assets/js/jquery.app.js"></script>
    <script src="js/loginmain.js"></script>

</body>
</html>