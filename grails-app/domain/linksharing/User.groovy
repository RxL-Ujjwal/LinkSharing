package linksharing

class User {
    String email
    String username
    String password
    String firstName
    String lastName
    Byte photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated

    static hasMany = [topics:Topic]

    static constraints = {
        photo nullable: true
        email unique: true
        username unique: true

    }
    static mapping = {
        table name:"Usr"
    }
}
