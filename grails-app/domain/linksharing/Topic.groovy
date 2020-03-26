package linksharing

class Topic {
    String name
    Users createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    enum Visibility{
        Private(0),
        Public(1)
        final int id
        private Visibility(int id){
            this.id=id
        }
    }
    static hasMany = [subscriptions:Subscription,resources:Resource]


}
