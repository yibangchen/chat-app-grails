<%--
  Created by IntelliJ IDEA.
  User: Yibang Chen
  Date: 9/20/2019
  Time: 4:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
    <div class="chat-container">
        <h3>All registered users: </h3>
        <div id="users"></div>
    </div>

    <script>
        function retrieveUsers() {
            $.ajax( {
                url:'${g.createLink( action:'retrieveUsers' )}',
                success: function(data) {
                    $('#users').html(data);
                }
            });
        }
        function pollUsers() {
            retrieveUsers();
            setTimeout('pollUsers()', 5000);
        }
        pollUsers();
    </script>
</body>
</html>