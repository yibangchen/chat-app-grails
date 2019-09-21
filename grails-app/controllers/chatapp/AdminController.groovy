package chatapp

class AdminController {

    def index() {

    }

    def retrieveUsers() {
        def users = User.listOrderById()
        [users:users]
    }
}
