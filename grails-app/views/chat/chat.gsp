<%--
  Created by IntelliJ IDEA.
  User: Yibang Chen
  Date: 9/19/2019
  Time: 10:30 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Chat</title>
    <g:javascript library="jquery"/>

</head>
<body>
<div class="chat-container">
    <h3 class="greeting">Hello, ${session.nickname}!</h3>
    <div id="chatMessages"></div>
    <input type="text" id="messageBox" name="message" />
    <div id="temp"></div>
</div>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
<script>
    $('#messageBox').on('keypress', function(e) {
        if (e.which == 13) {
            var message = $('#messageBox').val();
            $.ajax( {
                url:'${g.createLink( action:'submitMessage' )}',
                data: { message: message, rvr: 'jane'}
            } );
            $('#messageBox').val('');
            return false;
        } else {
            return true;
        }
    });

    function retrieveLatestMessages() {
        $.ajax( {
            url:'${g.createLink( action:'retrieveLatestMessages' )}',
            success: function(data) {
                $('#chatMessages').html(data);
            }
        });
%{--        <g:remoteFunction action="retrieveLatestMessages" update="chatMessages"/>--}%
    }
    function pollMessages() {
        retrieveLatestMessages();
        setTimeout('pollMessages()', 5000);
    }
    pollMessages();
</script>
</body>
</html>