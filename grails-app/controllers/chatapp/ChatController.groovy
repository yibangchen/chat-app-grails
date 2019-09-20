package chatapp

class ChatController {

    def index() {
    }

    def join(String nickname) {
        if ( nickname.trim() == '' ) {
            redirect(action:'index')
        } else {
            User u = User.find{ username==nickname }
            if (!u) {
                new User(username: nickname).save();
            }
            session.nickname = nickname
            render (view: 'chat')
        }
    }

    def retrieveLatestMessages() {
        def messages = Message.listOrderByDate(order: 'desc', max:10)
        [messages:messages.reverse()]
    }

    def submitMessage(String message, String rvr) {
        User sender = User.find{ username== session.nickname }
        User receiver = User.find{ username== rvr}
        new Message(sender: sender.id, receiver: receiver.id, message:message).save()
        render "<script>retrieveLatestMessages()</script>"
    }

    def deleteMessage(int id) {
        Message.find( id == id).delete(flush: true)
    }
}
