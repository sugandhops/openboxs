<%@ page contentType="text/html"%>
<g:applyLayout name="email">
    <div class="box">
        <h2>${g.message(code:'default.summary.label', default:'Summary') }</h2>
        <div style="margin: 10px;">

            ${g.message(code: 'email.userAccountConfirmed.message', args: [userInstance.username])}

            <g:link controller="user" action="show" id="${userInstance?.id }" absolute="true">
                ${g.message(code: 'email.link.label', args: [userInstance?.username])}
            </g:link>

        </div>
    </div>
</g:applyLayout>
