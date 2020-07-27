<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRINCIPAL</title>
        <style>
            body{
                margin:0;
                min-height: 100vh;
                background-image: url(clases.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;    
            }
            body:before {
                content: "";
                width: 100%;
                min-height: 100vh;
                position: absolute;
                top: 0;
                left : 0;
                background: linear-gradient(90deg,#52c4df, black);
                opacity: 0.2;
                z-index: -1;  
            }
            .menu ul a{
                text-decoration: none;
                color: white;
            }
            *{
                margin: 0;
                padding: 0;
                font-family: arial;
                box-sizing: border-box;
            }
            header{
                width: 100%;
                height:50px;
                background: #0178f8;
            }
            .menu{
                width: 100%;
                height:50px;
                display: flex;
                perspective: 200px;
            }
            .menu ul{
                display: flex;
                margin: auto;
            }
            .menu li{
                list-style: none;
                padding: 15px 20px;
            }
            .menu li:hover{
                background: rgba(0,0,0,0.3);
                color: white;
                transition: all 300ms;
                cursor:pointer
      
            }
            .menu ul li ul{
                *display: none;
                flex-direction: column;
                position: absolute;
                background: #58b813;
                margin-top: 15px;
                transform: rotateY(240deg) scale(0);
                transition: all 1s;
                box-shadow: 1px 1px 10px 0px black;
            }
            .menu ul li:hover>ul{
                transform: rotateY(0deg) scale(1);
                transition: all 1s;
            }
            .menu ul li ul:before{
                content: "";
                width: 0;
                height: 0;
                border-right: 10px solid transparent;
                border-left: 10px solid transparent;
                border-bottom: 10px solid black;
                position: absolute;
                margin-top: -8px;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="menu">
                <ul>
                    <li><a href="index.jsp">INICIO</a></li>
                    <li><a href="datosestudiante.jsp">ESTUDIANTES</a></li>
                    <li><a>CURSOS</a></li>
                    <li><a>MATRICULA</a>
                        <ul>
                            <li><a>EDITAR</a></li>
                            <li><a>ELIMINAR</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        
    </body>
</html>
