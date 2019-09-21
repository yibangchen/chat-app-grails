<%--
  Created by IntelliJ IDEA.
  User: Yibang Chen
  Date: 9/20/2019
  Time: 4:21 PM
--%>

<g:each in="${users}" var="user">
    <div class="message-line">
        <span class="delete-cross">x</span>
        <span class="nickname">${user.username}</span>
    </div>
</g:each>
