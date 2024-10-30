
<%@ page import="org.pih.warehouse.core.BudgetCode" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="custom" />
    <g:set var="entityName" value="${g.message(code: 'budgetCodes.label', default: 'Budget Codes')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <style>
        .paginateButtons {
            border: 0;
            border-top: 2px solid lightgrey;
        }
    </style>
</head>
<body>
    <div class="body">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">

            <div class="button-bar">
                <g:link class="button" action="list">
                    <img src="${resource(dir: 'images/icons/silk', file: 'table.png')}" />&nbsp;
                    <g:message code="default.list.label" args="[entityName]"/>
                </g:link>
                <g:isUserAdmin>
                    <g:link class="button" action="create">
                        <img src="${resource(dir: 'images/icons/silk', file: 'add.png')}" />&nbsp;
                        <g:message code="default.add.label" args="[entityName]"/>
                    </g:link>
                </g:isUserAdmin>
            </div>

            <div class="box">
                <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                <g:form action="list" method="get">
                    <div class="filter">
                        <label><g:message code="default.search.label"/></label>
                        <g:textField name="q" size="45" value="${params.q}" class="text"/>
                        <button type="submit" class="button"><img
                                src="${resource(dir:'images/icons/silk',file:'zoom.png')}" style="vertical-align: middle;"
                                alt="Find" /> ${g.message(code: 'default.button.find.label')}
                        </button>
                    </div>
                </g:form>
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="active" title="${g.message(code: 'user.active.label')}" />

                            <g:sortableColumn property="id" title="${g.message(code: 'budgetCode.id.label', default: 'Id')}" />

                            <g:sortableColumn property="code" title="${g.message(code: 'budgetCode.code.label', default: 'Code')}" />

                            <g:sortableColumn property="name" title="${g.message(code: 'budgetCode.name.label', default: 'Name')}" />

                            <g:sortableColumn property="description" title="${g.message(code: 'budgetCode.description.label', default: 'Description')}" />

                            <g:sortableColumn property="dateCreated" title="${g.message(code: 'budgetCode.dateCreated.label', default: 'Date Created')}" />

                            <g:sortableColumn property="lastUpdated" title="${g.message(code: 'budgetCode.lastUpdated.label', default: 'Date Updated')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${budgetCodes}" status="i" var="budgetCode">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>
                                <g:if test="${budgetCode?.active }">
                                    <span class="active">
                                        <g:message code="default.yes.label"/>
                                    </span>
                                </g:if>
                                <g:else>
                                    <span class="inactive">
                                        <g:message code="default.no.label"/>
                                    </span>
                                </g:else>
                            </td>

                            <td><g:link action="edit" id="${budgetCode.id}">${fieldValue(bean: budgetCode, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: budgetCode, field: "code")}</td>

                            <td>${fieldValue(bean: budgetCode, field: "name")}</td>

                            <td>${fieldValue(bean: budgetCode, field: "description")}</td>

                            <td><format:date obj="${budgetCode.dateCreated}" />${budgetCode.dateCreated}</td>

                            <td><format:date obj="${budgetCode.lastUpdated}" />${budgetCode.lastUpdated}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="paginateButtons">
                    <g:paginate total="${budgetCodesTotal}" params="${params}"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
