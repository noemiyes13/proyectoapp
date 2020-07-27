<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%!
            // Variables globales (Página)
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idestudiante;
            String s_nombre;
            String s_apellidos;
            String s_dni;
            String s_codigo;
            String s_estado;

        %>
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
                opacity: 0.3;
                z-index: -1;  
            }
            *{
                margin: 0;
                padding: 0;
                font-family: arial;
                box-sizing: border-box;
            }
            .menu ul a{
                text-decoration: none;
                color: white;
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
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idestudiante = request.getParameter("f_idestudiante");
                // Primera parte del modificar
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select nombre, apellidos, dni, codigo, estado  "
                                + " from estudiante  "
                                + " where  "
                                + " idestudiante =  " + s_idestudiante;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                            
                        
                    %>    

                    
                    <form name="EditarEstudianteForm" action="datosestudiante.jsp" method="GET">
                        <br><br><br><br><br>
                    <table border="0" align="center">
                        <thead>
                            <tr>
                                <th colspan="2">Editar Estudiante</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nombres:</td>
                                <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                            </tr>
                            <tr>
                                <td>Apellidos:</td>
                                <td><input type="text" name="f_apellidos" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="25"/></td>
                            </tr>
                            <tr>
                                <td>DNI: </td>
                                <td><input type="text" name="f_dni" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8" /></td>
                            </tr>
                            <tr>
                                <td>Código: </td>
                                <td><input type="text" name="f_codigo" value="<% out.print(rs.getString(4)); %>" maxlength="12" size="15" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td><input type="text" name="f_estado" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idestudiante" value="<%out.print(s_idestudiante);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                 
                    
                    <%
                        }
                }else{
                // Si no se hace la primera parte del modidicar debe mostrar el 
                // formulario de agregar estudiante

        %>
        <form name="AgregarEstudianteForm" action="datosestudiante.jsp" method="GET">
            <br><br><br><br><br><br>
            <table border="0" align="center" class="ecologico" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Estudiante</th>     
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombres:</td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td>Apellidos:</td>
                        <td><input type="text" name="f_apellidos" value="" maxlength="40" size="25"/></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value=""maxlength="8" size="8" /></td>
                    </tr>
                    <tr>
                        <td>Código: </td>
                        <td><input type="text" name="f_codigo" value="" maxlength="12" size="15" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                            
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
            }
        %>
        <br><br><br><br>
        <table border="1" cellpadding ="2" align = "center" class="ecologico" style="margin: auto; display: table" >
            <thead>
                <tr>
                    <th colspan="9">
                        Datos Estudiante
                    </th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código</th>
                    <th>Estado</th>
                    <th colspan="3">Acciones</th>

                </tr>
            </thead>

        
        <%        
                
                
                if (s_accion !=null) {
                    
                    // Ejecutar la eliminación de estudiantes
                    if (s_accion.equals("E")) {
                            consulta =    " delete from estudiante "
                                        + " where  "
                                        + " idestudiante = " + s_idestudiante +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    // Sino se elimina registros de estudiantes, 
                    // Pregunta si se va a REGISTRAR UN NUEVO ESTUDIANTE
                    }else if(s_accion.equals("C")){
                            s_nombre = request.getParameter("f_nombre");
                            s_apellidos = request.getParameter("f_apellidos");
                            s_dni = request.getParameter("f_dni");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =    " insert into "
                                        + " estudiante (nombre, apellidos, dni, codigo, estado)"
                                        + " values('"+ s_nombre +"','"+ s_apellidos +"','"+ s_dni +"','"+ s_codigo +"','"+s_estado+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    // Si no se está creando o eliminando registro de estudiante
                    // Pregunta si va a hacer la MODIFICACIÓN DE ESTUDIANTES - Parte 2
                    }else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_apellidos = request.getParameter("f_apellidos");
                            s_dni = request.getParameter("f_dni");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            consulta =  "   update estudiante  "
                                        + " set  "
                                        + " nombre = '"+ s_nombre +"', "
                                        + " apellidos = '" + s_apellidos + "', "
                                        + " dni = '" + s_dni + "', "
                                        + " codigo = '" + s_codigo + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idestudiante = " + s_idestudiante + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                    
                }
                
                // Listar los estudiantes de la TABLA ESTUDIANTE
                consulta= " Select idestudiante, nombre, apellidos, dni, codigo, estado "
                        + " from estudiante ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {    
                    ide = rs.getString(1);
                    num++;
                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="datosestudiante.jsp"><img src="ic.png"></a></td>
                        <td><a href="datosestudiante.jsp?f_accion=E&f_idestudiante=<%out.print(ide);%>"><img src="t.png"></a></td>
                        <td><a href="datosestudiante.jsp?f_accion=M1&f_idestudiante=<%out.print(ide);%>"><img src="la.png"></a></td>   
                    </tr>                    
                    <%
                    }
                    // Se cierra todas las conexiones
                    rs.close();
                    pst.close();
                    cn.close();
            }catch(Exception e){
                out.print("Error SQL" +e);
            }
        
        %>
        </table>
    </body>
</html>
