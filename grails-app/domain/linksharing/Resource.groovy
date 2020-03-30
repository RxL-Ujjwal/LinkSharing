package linksharing

class Resource {
    String description
    Users createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItem:ReadingItem,resourceRating:ResourceRating,linkResource:LinkResource,documentResource:DocumentResource]
    static mapping = {
        table name:"Rsr"
    }
}
