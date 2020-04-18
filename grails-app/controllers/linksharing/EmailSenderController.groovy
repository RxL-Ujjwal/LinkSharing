package linksharing

import grails.converters.JSON

class EmailSenderController {

    def index() { }

    def send() {
        sendMail {
            to params.address
            subject params.subject
            text params.body
        }

        flash.message = "Message sent at "+new Date()
        redirect controller:"user",action:"dashboard"
    }


    def sendInvite() {
        Topic topic = Topic.findByName(params.topicName)
        sendMail {
            to params.address
            subject "Topic Invite"
            text "http://localhost:9090/topic/topicPage?topicId="+topic.id
        }
        render([success:true] as JSON)
    }
}
