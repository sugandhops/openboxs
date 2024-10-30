
<%@ page import="org.pih.warehouse.shipping.ShipmentItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'shipmentItem.label', default: 'ShipmentItem')}" />
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
                            <td valign="top" class="name"><g:message code="shipmentItem.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.container.label" default="Container" /></td>

                            <td valign="top" class="value"><g:link controller="container" action="show" id="${shipmentItemInstance?.container?.id}">${shipmentItemInstance?.container}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.product.label" default="Product" /></td>

                            <td valign="top" class="value"><g:link controller="product" action="show" id="${shipmentItemInstance?.product?.id}">${shipmentItemInstance?.product}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.lotNumber.label" default="Lot Number" /></td>

                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "lotNumber")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.expirationDate.label" default="Expiration Date" /></td>

                            <td valign="top" class="value"><format:datetime obj="${shipmentItemInstance?.expirationDate}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.quantity.label" default="Quantity" /></td>

                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "quantity")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.recipient.label" default="Recipient" /></td>

                            <td valign="top" class="value"><g:link controller="person" action="show" id="${shipmentItemInstance?.recipient?.id}">${shipmentItemInstance?.recipient}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.inventoryItem.label" default="Inventory Item" /></td>

                            <td valign="top" class="value"><g:link controller="inventoryItem" action="show" id="${shipmentItemInstance?.inventoryItem?.id}">${shipmentItemInstance?.inventoryItem}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.donor.label" default="Donor" /></td>

                            <td valign="top" class="value"><g:link controller="donor" action="show" id="${shipmentItemInstance?.donor?.id}">${shipmentItemInstance?.donor}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.dateCreated.label" default="Date Created" /></td>

                            <td valign="top" class="value"><format:datetime obj="${shipmentItemInstance?.dateCreated}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.lastUpdated.label" default="Last Updated" /></td>

                            <td valign="top" class="value"><format:datetime obj="${shipmentItemInstance?.lastUpdated}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.orderItems.label" default="Order Items" /></td>

                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                    <g:each in="${shipmentItemInstance.orderItems}" var="o">
                                        <li><g:link controller="orderItem" action="show" id="${o.id}">${o}</g:link></li>
                                    </g:each>
                                </ul>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.shipment.label" default="Shipment" /></td>

                            <td valign="top" class="value"><g:link controller="shipment" action="show" id="${shipmentItemInstance?.shipment?.id}">${shipmentItemInstance?.shipment}</g:link></td>

                        </tr>


						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${shipmentItemInstance?.id}" />
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
