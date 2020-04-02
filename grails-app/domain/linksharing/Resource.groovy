package linksharing

class Resource {
    String description
    Users createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItem:ReadingItem,resourceRating:ResourceRating]

    static mapping = {
        table name:"Rsr"
    }
}
