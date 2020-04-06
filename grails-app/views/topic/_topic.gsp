
<div class="row">
    <div class="column">
        <g:if test="${topic.createdBy.photo}">
            <img style="width: 80px;height: 100px;margin-left: 10px;margin-top: 10px"
                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':topic.createdBy.email])}"/>
        %{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
        </g:if>
        <g:else>
            <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>
        </g:else>
    </div>

    <div class="column" style="margin-left: 20px">
        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>${topic.name}</u></a></label><br>
        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${topic.createdBy.username}</label>
        <label style="font-size: 14px;margin: 0px 0px 5px 60px;color: gray;">Subscriptions</label>
        <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

        <label style="margin: 0px 30px 5px 5px;font-size: 13px;"><u><ls:showSubscribe userId="${userId}" topicId="${topic.id}"></ls:showSubscribe></u></label>

        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 110px"><ls:subscriptionCount userId="${topic.createdBy.id}"></ls:subscriptionCount></label>
        <label style="font-size: 14px;position: relative;float:right;color: blue;right: 15px"><ls:postCount topicId="${topic.id}">   </ls:postCount> </label><br>
        <select id="seri" name="seriousness" style="margin-left: 5px">
            <option value="Serious">Serious</option>
            <option value="Casual">Casual</option>
            <option value="VerySerious">VerySerious</option>
        </select><br>
    </div>
</div>