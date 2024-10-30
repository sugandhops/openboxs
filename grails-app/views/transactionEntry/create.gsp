
<%@ page import="org.pih.warehouse.inventory.TransactionEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'transactionEntry.label', default: 'TransactionEntry')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${transactionEntry}">
	            <div class="errors">
	                <g:renderErrors bean="${transactionEntry}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="inventoryItem"><g:message code="transactionEntry.inventoryItem.label" default="Inventory Item" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntry, field: 'inventoryItem', 'errors')}">
	                                    <g:select name="inventoryItem.id" from="${org.pih.warehouse.inventory.InventoryItem.list()}" optionKey="id" value="${transactionEntry?.inventoryItem?.id}"  />
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="quantity"><g:message code="transactionEntry.quantity.label" default="Quantity" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntry, field: 'quantity', 'errors')}">
	                                    <g:textField name="quantity" value="${transactionEntry?.quantity }" size="10" class="text"/>
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="comments"><g:message code="transactionEntry.comments.label" default="Comments" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntry, field: 'comments', 'errors')}">
	                                    <g:textArea name="comments" cols="40" rows="5" value="${transactionEntry?.comments}" />
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="transaction"><g:message code="transactionEntry.transaction.label" default="Transaction" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: transactionEntry, field: 'transaction', 'errors')}">
	                                    <g:select name="transaction.id" from="${org.pih.warehouse.inventory.Transaction.list()}" optionKey="id" value="${transactionEntry?.transaction?.id}"  />
	                                </td>
	                            </tr>


		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />

						                   <g:link action="list">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>

						                </div>
		                        	</td>
		                        </tr>

	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
