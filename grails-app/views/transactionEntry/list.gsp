
<%@ page import="org.pih.warehouse.inventory.TransactionEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'transactionEntry.label', default: 'TransactionEntry')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">

				<div>
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><g:message code="default.add.label" args="['transactionEntry']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${g.message(code: 'transactionEntry.id.label', default: 'Id')}" />

                            <th><g:message code="transactionEntry.inventoryItem.label" default="Inventory Item" /></th>

                            <g:sortableColumn property="quantity" title="${g.message(code: 'transactionEntry.quantity.label', default: 'Quantity')}" />

                            <g:sortableColumn property="comments" title="${g.message(code: 'transactionEntry.comments.label', default: 'Comments')}" />

                            <th><g:message code="transactionEntry.transaction.label" default="Transaction" /></th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${transactionEntryList}" status="i" var="transactionEntry">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="edit" id="${transactionEntry.id}">${fieldValue(bean: transactionEntry, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: transactionEntry, field: "inventoryItem")}</td>

                            <td>${fieldValue(bean: transactionEntry, field: "quantity")}</td>

                            <td>${fieldValue(bean: transactionEntry, field: "comments")}</td>

                            <td>${fieldValue(bean: transactionEntry, field: "transaction")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${transactionEntryTotal}" />
            </div>
        </div>
    </body>
</html>
