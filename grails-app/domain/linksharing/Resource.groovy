package linksharing

class Resource {
    String description
    Date createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingitem:ReadingItem,resourcerating:ResourceRating]
    static mapping = {
        table name:"Rsr"
        tablePerHierarchy : false
    }
}
