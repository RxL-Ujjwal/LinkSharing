package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {

    TopicService topicService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        Topic topic = Topic.findByName(params.name)
        Users user = Users.findByEmail(session.getAttribute("email"))
        if(topic!=null){
            if(topic.createdBy==user){
                flash.message = "Already Created"
                redirect(controller:"user",action: "dashboard")
            }
        }else{
            Topic t = new Topic(name: params.name,visibility: params.visibility,createdBy: user)
            t.save(flush:true,failOnError:true)
            flash.message = "Topic Created"
            redirect(controller:"user",action: "dashboard")
        }
    }

    def show(Long id) {
        respond topicService.get(id)
    }

    def create() {
        respond new Topic(params)
    }

    def save(Topic topic) {
        if (topic == null) {
            notFound()
            return
        }

        try {
            topicService.save(topic)
        } catch (ValidationException e) {
            respond topic.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topic.id])
                redirect topic
            }
            '*' { respond topic, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond topicService.get(id)
    }

    def update(Topic topic) {
        if (topic == null) {
            notFound()
            return
        }

        try {
            topicService.save(topic)
        } catch (ValidationException e) {
            respond topic.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'topic.label', default: 'Topic'), topic.id])
                redirect topic
            }
            '*'{ respond topic, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        topicService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
