<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="main.css"/>
        <asset:stylesheet src="mobile.css"/>
    </head>
    <body>
        <div class="button-bar">
            <g:link class="button" action="index">
                <img src="${resource(dir: 'images/icons/silk', file: 'application_view_list.png')}" />&nbsp;
                <g:message code="default.list.label" args="[entityName]"/>
            </g:link>
            <g:link class="button" action="create">
                <img src="${resource(dir: 'images/icons/silk', file: 'add.png')}" />&nbsp;
                <g:message code="default.add.label" args="[entityName]"/>
            </g:link>
        </div>
        <div id="list-role" class="box content scaffold-create" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${roleList}" properties="['id','name','roleType','description']" />
            <g:set var="totalCount" value="${roleCount ?: 0}"/>
            <g:if test="${totalCount > params.max}">
                <div class="pagination">
                    <g:paginate total="${roleCount ?: 0}" />
                </div>
            </g:if>
        </div>
    </body>
</html>
