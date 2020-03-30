package linksharing

class DocumentResource{
    String filepath
    String description
    Date dateCreated
    Date lastUpdated
    static mapping = {

    }
    static belongsTo = [resources:Resource]
}
