
<div class="row">
    <div class="column">
        <g:if test="${topic.createdBy.photo}">
            <img style="width: 80px;height: 100px;margin-left: 10px;margin-top: 10px"
                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':topic.createdBy.email])}"/>
        %{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
        </g:if>
        <g:else>
            <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="80px" style="margin: 10px 5px 10px 10px;"/>
        </g:else>
    </div>

    <div class="column" style="margin-left: 0px;">
        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="${createLink(controller: "topic",action:"topicPage",params:['topicId':topic.id])}" style="margin-right: 10px;"><u>${topic.name}</u></a></label>

        <g:if test="${topic.createdBy.id == session.userId}">

            <input type="text" class="topicName" hidden style="position:relative;left:10px;margin-top: 5px;width: 139px">
            <input type="button" value="Change" topicId="${topic.id}" class="changeOwner" hidden style="position:relative;left:10px;margin-top: 5px;">

        </g:if>

        <br>
        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${topic.createdBy.username}</label>
        <label style="font-size: 14px;margin: 0px 0px 5px 60px;color: gray;">Subscriptions</label>
        <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

        <label style="margin: 0px 30px 5px 5px;font-size: 13px;"><u><ls:showSubscribe userId="${userId}" topicId="${topic.id}"></ls:showSubscribe></u></label>

        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 110px"><ls:subscriptionCount userId="${topic.createdBy.id}"></ls:subscriptionCount></label>
        <label style="font-size: 14px;position: relative;float:right;color: blue;right: 15px"><ls:postCount topicId="${topic.id}">   </ls:postCount> </label><br>


        <g:select name="seriousness" class="seriousness" from="['Serious','Casual','VerySerious']" topicId="${topic.id}"
                  value="${linksharing.Subscription.findByUserAndTopic(linksharing.Users.get(session.userId),topic)?.seriousness}" style="margin-left: 5px"></g:select>

        <g:if test="${topic.createdBy.id == session.userId}">

            <g:select name="visibility" class="visibility" from="['Public','Private']" topicId="${topic.id}"
                      value="${linksharing.Topic.findByCreatedByAndId(linksharing.Users.get(session.userId),topic.id)?.visibility}" style="margin-left: 5px"></g:select>

            <div class="col" style="display: contents">

                <a href="#my_modal" data-toggle="modal"
                   data-topic-id="http://localhost:9090/topic/topicPage?topicId=${topic.id}"><i
                        class="fa fa-envelope"
                        style="font-size: 20px;color: black;position:relative;left: 100px;"></i>
                </a>

                <div class="modal" id="my_modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title"
                                    id="exampleModalLongTitle2"><b>SEND INVITE</b>

                                    <div class="alert-success">
                                    </div>

                                </h5>
                                <button type="button" class="close"
                                        data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="fieldcontain"
                                     style="margin-bottom: 3px">
                                    <g:textField name="address"
                                                 placeholder="email"
                                                 required="" id="address${topicId}"/>
                                </div>

                                <div>${topicId}</div>

                                <div class="fieldcontain"
                                     style="margin-bottom: 3px">
                                    <g:textField name="subject"
                                                 placeholder="Subject"
                                                 required="" id="subject${topicId}"/>
                                </div>

                                <div class="fieldcontain"
                                     style="margin-bottom: 3px">
                                    <g:textArea name="topicId" rows="5"
                                                cols="50"
                                                required="" id="text${topicId}"/>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit"
                                        class="btn btn-primary">Invite</button>
                                <button type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <i style="cursor: pointer;color: black ;font-size: 20px;position:relative;left:10px"
                   class="fa fa-pencil-square-o fa-lg topicEdit"></i>
                <i class="fa fa-trash fa-lg delete" id="delete" trashId="${topic.id}" aria-hidden="true"
                   style="color:black; position: relative;left: 20px;font-size: 20px;cursor: pointer"
                   ;></i>
            </div>
        </g:if>
    </div>
</div>