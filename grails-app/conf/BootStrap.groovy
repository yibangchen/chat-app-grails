import chatapp.User
import chatapp.Role
import chatapp.UserRole
import chatapp.Requestmap

class BootStrap {

    def init = { servletContext ->
        User admin = new User(username:'admin', password:'test', enabled:true).save()
        User john = new User(username:'john', password:'test', enabled:true).save()
        User jane = new User(username:'jane', password:'test', enabled:true).save()
        Role adminR = new Role(authority: 'ROLE_ADMIN').save()
        Role commonR = new Role(authority: 'ROLE_USER').save()
        UserRole.create(admin, adminR)
        UserRole.create(admin, commonR)
        UserRole.create(john, commonR)

        new Requestmap(
                url: '/chat',
                configAttribute: 'IS_AUTHENTICATED_FULLY'
        ).save()

        new Requestmap(
                url: '/admin',
                configAttribute: 'ROLE_ADMIN'
        ).save()

        new Requestmap(
                url: '/login/auth',
                configAttribute: 'permitAll'
        ).save()

        new Requestmap(
                url: '/**',
                configAttribute: 'permitAll'
        ).save()
    }
    def destroy = {
    }
}
