
<%@ page import="org.pih.warehouse.inventory.TransactionEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'transactionEntry.label', default: 'TransactionEntry')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transactionEntry.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: transactionEntry, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transactionEntry.inventoryItem.label" default="Inventory Item" /></td>

                            <td valign="top" class="value"><g:link controller="inventoryItem" action="show" id="${transactionEntry?.inventoryItem?.id}">${transactionEntry?.inventoryItem}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transactionEntry.quantity.label" default="Quantity" /></td>

                            <td valign="top" class="value">${fieldValue(bean: transactionEntry, field: "quantity")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transactionEntry.comments.label" default="Comments" /></td>

                            <td valign="top" class="value">${fieldValue(bean: transactionEntry, field: "comments")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transactionEntry.transaction.label" default="Transaction" /></td>

                            <td valign="top" class="value"><g:link controller="transaction" action="show" id="${transactionEntry?.transaction?.id}">${transactionEntry?.transaction}</g:link></td>

                        </tr>


						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${transactionEntry?.id}" />
					                    <g:actionSubmit class="edit" action="edit" value="${g.message(code: 'default.button.edit.label', default: 'Edit')}" />
					                    <g:actionSubmit class="delete" action="delete" value="${g.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					                </g:form>
					            </div>
							</td>
						</tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
