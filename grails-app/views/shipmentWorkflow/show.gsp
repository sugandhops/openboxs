
<%@ page import="org.pih.warehouse.shipping.ShipmentWorkflow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'shipmentWorkflow.label', default: 'ShipmentWorkflow')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>

            <div class="button-bar">
                <g:link class="button" action="create"><g:message code="default.list.label" args="['Shipment Workflow']"/></g:link>
                <g:link class="button" action="create"><g:message code="default.add.label" args="['Shipment Workflow']"/></g:link>
            </div>


            <div class="box">
                <h2><g:message code="default.show.label" args="[entityName]" /></h2>
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentWorkflowInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentWorkflowInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.shipmentType.label" default="Shipment Type" /></td>

                            <td valign="top" class="value"><g:link controller="shipmentType" action="show" id="${shipmentWorkflowInstance?.shipmentType?.id}">${shipmentWorkflowInstance?.shipmentType}</g:link></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.excludedFields.label" default="Excluded Fields" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentWorkflowInstance, field: "excludedFields")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.documentTemplate.label" default="Document Template" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentWorkflowInstance, field: "documentTemplate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${shipmentWorkflowInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${shipmentWorkflowInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.referenceNumberTypes.label" default="Reference Number Types" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${shipmentWorkflowInstance.referenceNumberTypes}" var="r">
                                    <li><g:link controller="referenceNumberType" action="show" id="${r.id}">${r}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.containerTypes.label" default="Container Types" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${shipmentWorkflowInstance.containerTypes}" var="c">
                                    <li><g:link controller="containerType" action="show" id="${c.id}">${c}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentWorkflow.documentTemplates.label" default="Document Templates" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${shipmentWorkflowInstance.documentTemplates}" var="d">
                                    <li><g:link controller="document" action="show" id="${d.id}">${d}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${shipmentWorkflowInstance?.id}" />
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
