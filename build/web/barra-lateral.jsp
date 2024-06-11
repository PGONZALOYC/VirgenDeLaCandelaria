<%@ page import="model.Usuario" %>
<%
    String modulo = request.getSession().getAttribute("modulo").toString();
    String usuario_email = request.getSession().getAttribute("usuario_email").toString();
%>
<input type="checkbox" id="checkbox">
<nav class="side-bar">
    <ul>
        <li>
            <label for="checkbox">
                <div class="navbtn1">
                    <i id="navbtn" class="fa-solid fa-arrow-right"></i>
                </div>
                <div class="navbtn2">
                    <i id="navbtn" class="fa-solid fa-arrow-left"></i>
                </div>
            </label>
        </li>
        <li>
            <div class="user-p">
                <h4>
                    <%= usuario_email %>
                </h4>
            </div>
        </li>
        <li>
            <a 
                <%
                    if ("menu_principal".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="NavController?modulo=menu_principal" <%
                    }
                %>>
                <i class="fa-solid fa-house-chimney"></i>

                <span>&nbsp;
                    Menú Principal</span>
            </a>

        </li>
        <li>
            <a 
                <%
                    if ("vacantes".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="NavController?modulo=vacantes"<%
                    }
                %>>
                <i class="fa-solid fa-file"></i>
                <span>&nbsp;
                    &nbsp;
                    &nbsp;Vacantes</span>
            </a>
        </li>
        <li>
            <a 
                <%
                    if ("estudiantes".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="NavController?modulo=estudiantes"<%
                    }
                %>>
                <i class="fa-solid fa-users"></i>
                <span>&nbsp;
                    Estudiantes / Apoderados</span>
            </a>
        </li>
        <li>
            <a 
                <%
                    if ("matriculas".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="NavController?modulo=matriculas"<%
                    }
                %>>
                <i class="fa-solid fa-user-plus"></i>
                <span>&nbsp;
                    Matrículas</span>
            </a>
        </li>
        <li>
            <a 
                <%
                    if ("pagos".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="NavController?modulo=pagos"<%
                    }
                %>>
                <i class="fa-solid fa-money-check-dollar"></i>
                <span>&nbsp;
                    &nbsp;Pagos</span>
            </a>
        </li>
        <li>
            <a 
                <%
                    if ("utiles".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="lista-utiles.jsp"<%
                    }
                %>>
                <i class="fa-solid fa-scissors"></i>
                <span>&nbsp;
                    &nbsp;
                    Útiles escolares</span>
            </a>
        </li>
        <li>
            <a 
                <%
                    if ("reportes".equals(modulo)) {
                %>style="color: #3B5EC4;" href="#" onclick="return false;"<%
                    } else {
                %>href="reportes.jsp"<%
                    }
                %>>
                <i class="fa-solid fa-chart-simple"></i>
                <span>&nbsp;
                    &nbsp;
                    &nbsp;Reportes</span>
            </a>
        </li>
        <li>
            <a href="NavController?modulo=logout">
                <i class="fa fa-power-off" aria-hidden="true"></i>
                <span>&nbsp;
                    &nbsp;
                    &nbsp;Logout</span>
            </a>
        </li>
    </ul>
</nav>