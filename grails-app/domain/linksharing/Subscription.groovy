package linksharing

class Subscription {
    Topic topic
    Users user
    Seriousness seriousness
    enum Seriousness{
        Serious(0),
        Casual(1),
        VerySerious(2)
        final int id
        private Seriousness(int id){
            this.id=id
        }
    }
    Date dateCreated
}
