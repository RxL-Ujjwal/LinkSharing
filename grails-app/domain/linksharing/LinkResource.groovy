package linksharing

class LinkResource{
    String url
    String description
    Date dateCreated
    Date lastUpdated
    static mapping = {

    }
    static belongsTo = [resources:Resource]
}
