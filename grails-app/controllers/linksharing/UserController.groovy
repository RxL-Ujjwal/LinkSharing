package linksharing

import grails.converters.JSON

import javax.servlet.http.HttpSession

class UserController {

    UserService userService

    def index() {
        List RecentList = Resource.list(offSet:0,max:5,sort:'dateCreated',order:'desc')
        render(view:"user",model:[RecentList:RecentList])
    }
    def register(){
        Users usr = userService.registerUser(params)
        flash.message = "You have Registered Successfully"
        redirect(controller:"user",action:"index")
    }
    def dashboard(){
        if(session.getAttribute("firstname")) {
            Users usr = Users.findByEmail(session.getAttribute("email"))
            List list = Subscription.createCriteria().list {
                and {
                    inList("user", usr)
                    order("dateCreated", "desc")
                }
            }
            List lst = Topic.createCriteria().list{
                and{
                    inList("createdBy", usr)
                    order("dateCreated", "desc")
                }
            }
            List res = Resource.createCriteria().list{
                and{
                    not{
                        'in'("createdBy",usr)
                    }
                    order("dateCreated", "desc")
                }
            }
            List list1 = Topic.createCriteria().list{
                and{
                    not{
                        'in'("createdBy", usr)
                    }
                    order("dateCreated", "desc")
                }
            }
            println(list.size())
            render(view: "dashboard", model: [subscribedTopics: list,topicList:lst,resourceList:res,topicNotCreator:list1])
        }else{
            flash.message = "Please Login First"
            redirect(controller:"user")
        }
    }

    def login(){
        Users val = userService.loginUser(params)
        if(val!=null && val.active==true) {
            HttpSession session = request.getSession();
            session.setAttribute("active",val.active)
            session.setAttribute("usr",val)
            session.setAttribute("firstname", val.firstName)
            session.setAttribute("lastname", val.lastName)
            session.setAttribute("username", val.username)
            session.setAttribute("email", val.email)

            if (val.photo != null) {
                String encode = Base64.getEncoder().encodeToString(val.photo)
                session.setAttribute("photo", encode)
            }else{
                session.setAttribute("photo", null)
            }

            redirect(controller: "user", action: "dashboard")

        }else{
            flash.message = "Wrong Email Id or Password"
            redirect(controller:"user")
        }
    }

    def fetchUserImage(){
        Users uemail = Users.findByEmail(params.emailId)
        byte[] imageInByte = uemail.photo
        response.contentType = 'image/*' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

    def userLists(){
        render(view: "userList",model: [list: Users.list(offSet: 0)])
    }

    def changeActiveStatus(){
        Users usr = Users.get(params.userId)
        if(usr.active==true){
            usr.active=false
        }else{
            usr.active=true
        }
        usr.save(flush:true,failOnError:true)
        redirect(controller: "user",action:"userLists")
    }

    def postShow(){
        Resource resource = Resource.get(params.resourceId)
        Users usr = Users.findByEmail(session.email)
        List list1 = Topic.createCriteria().list{
            and{
                not{
                    'in'("createdBy", usr)
                }
                order("dateCreated", "desc")
            }
        }
        render(view: "post",model: [resource:resource,topicNotCreator:list1])
    }
}


