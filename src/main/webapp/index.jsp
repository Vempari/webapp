<%@ page import="webapp.EJBLogic" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="javax.naming.InitialContext" %>
<html>
<header>
    <title>
        Hi, there!
    </title>
</header>
<body>
    <h2>
        <%
            EJBLogic ejbLogic = new EJBLogic();
            File currentClass = new File(URLDecoder.decode(EJBLogic.class
                    .getProtectionDomain()
                    .getCodeSource()
                    .getLocation()
                    .getPath(), "UTF-8"));
            String classDirectory = currentClass.getParent();


            String result = ejbLogic.doRecursion(classDirectory);
        %>
        <%= result%>
    </h2>
</body>
</html>
