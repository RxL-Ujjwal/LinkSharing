package linksharing

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SubscriptionController {

    SubscriptionService subscriptionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() { }

    def subscribe(){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)
        Subscription sub = new Subscription(topic:topic,user:usr,seriousness:Subscription.Seriousness.VerySerious.name())
        topic.addToSubscriptions(sub)
        topic.save(failOnError:true,flush:true)
        flash.message="You have subscribed the topic ${sub.topic.name}"
        redirect(controller:"user",action: "dashboard")
    }

    def unsubscribe(){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)
        if(topic.createdBy==usr ){
            flash.message = "You cannot unsubscribe your own topic"
        }else{
            Subscription sub = Subscription.findByUserAndTopic(usr,topic)
            println(sub.properties)
            sub.delete(failOnError: true,flush:true)
            flash.message = "You have successfully unsubscribed the topic ${sub.topic.name}"
        }
        redirect(controller: "user",action: "dashboard")
    }

    def show(Long id) {
        respond subscriptionService.get(id)
    }

    def create() {
        respond new Subscription(params)
    }

    def save(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subscription.label', default: 'linksharing.Subscription'), subscription.id])
                redirect subscription
            }
            '*' { respond subscription, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond subscriptionService.get(id)
    }

    def update(Subscription subscription) {
        if (subscription == null) {
            notFound()
            return
        }

        try {
            subscriptionService.save(subscription)
        } catch (ValidationException e) {
            respond subscription.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'subscription.label', default: 'linksharing.Subscription'), subscription.id])
                redirect subscription
            }
            '*'{ respond subscription, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        subscriptionService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscription.label', default: 'linksharing.Subscription'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'linksharing.Subscription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
