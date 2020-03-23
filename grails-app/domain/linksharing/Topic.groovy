package linksharing

class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    enum Visibility{
        Public,Private
    }
    static hasMany = [subscriptions:Subscription,resources:Resource]
}
