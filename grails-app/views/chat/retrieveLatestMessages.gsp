<%--
  Created by IntelliJ IDEA.
  User: Yibang Chen
  Date: 9/19/2019
  Time: 10:31 AM
--%>

<g:each in="${messages}" var="message">
    <div class="message-line">
        <span class="delete-cross">x</span>
        <span class="nickname">${message.sender.username}</span> - <span class="nickname">${message.receiver.username}</span>:
        <span class="msg">${message.message}</span>
    </div>
</g:each>
