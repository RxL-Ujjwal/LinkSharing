package linksharing

import grails.converters.JSON
import grails.validation.ValidationException

import javax.servlet.http.HttpSession

import static org.springframework.http.HttpStatus.*

class SubscriptionController {

    SubscriptionService subscriptionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {}

    def subscribe() {
        subscriptionService.subscribe(params,session,flash)
        redirect(controller: "user", action: "dashboard")
    }

    def unsubscribe() {
        subscriptionService.unsubscribe(params,session,flash)
        redirect(controller: "user", action: "dashboard")
    }

    def subscribedTopicsList() {
        if (session.getAttribute("firstname")) {
            Map model = subscriptionService.subscribedTopicsList(session)
            render(view: "subscribed", model: model)
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }

    def trendingTopicsList() {
        if (session.getAttribute("firstname")) {
            Map model =  subscriptionService.trendingTopicsList(session)
            render(view: "trendingTopics", model: model)
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }

    def userTopicsList() {
        if (session.getAttribute("firstname")) {
            Map model = subscriptionService.userTopicsList(session)
            render(view: "/topic/userTopic", model: model)
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }
}
