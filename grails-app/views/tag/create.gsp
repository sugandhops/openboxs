
<%@ page import="org.pih.warehouse.core.Tag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'tag.label', default: 'Tag')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tagInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${tagInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:render template="summary"/>

            <g:form action="save" method="post" >
                <div class="box">
                    <h2><g:message code="default.create.label" args="[g.message(code:'tag.label')]" /></h2>

                    <div class="dialog">
                        <table>
                            <tbody>

                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="tag"><g:message code="tag.tag.label" default="Tag" /></label>
                                    </td>
                                    <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'tag', 'errors')}">
                                        <g:textField name="tag" size="80" class="text medium" value="${tagInstance?.tag}" />
                                    </td>
                                </tr>

%{--                                <tr class="prop">--}%
%{--                                    <td valign="top" class="name">--}%
%{--                                        <label for="updatedBy"><g:message code="tag.updatedBy.label" default="Updated By" /></label>--}%
%{--                                    </td>--}%
%{--                                    <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'updatedBy', 'errors')}">--}%
%{--                                        <g:select name="updatedBy.id" from="${org.pih.warehouse.core.User.list()}" optionKey="id" value="${tagInstance?.updatedBy?.id}" noSelection="['null': '']" />--}%
%{--                                    </td>--}%
%{--                                </tr>--}%

%{--                                <tr class="prop">--}%
%{--                                    <td valign="top" class="name">--}%
%{--                                        <label for="createdBy"><g:message code="tag.createdBy.label" default="Created By" /></label>--}%
%{--                                    </td>--}%
%{--                                    <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'createdBy', 'errors')}">--}%
%{--                                        <g:select name="createdBy.id" from="${org.pih.warehouse.core.User.list()}" optionKey="id" value="${tagInstance?.createdBy?.id}" noSelection="['null': '']" />--}%
%{--                                    </td>--}%
%{--                                </tr>--}%

%{--                                <tr class="prop">--}%
%{--                                    <td valign="top" class="name">--}%
%{--                                        <label for="dateCreated"><g:message code="tag.dateCreated.label" default="Date Created" /></label>--}%
%{--                                    </td>--}%
%{--                                    <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'dateCreated', 'errors')}">--}%
%{--                                        <g:datePicker name="dateCreated" precision="minute" value="${tagInstance?.dateCreated}"  />--}%
%{--                                    </td>--}%
%{--                                </tr>--}%

%{--                                <tr class="prop">--}%
%{--                                    <td valign="top" class="name">--}%
%{--                                        <label for="lastUpdated"><g:message code="tag.lastUpdated.label" default="Last Updated" /></label>--}%
%{--                                    </td>--}%
%{--                                    <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'lastUpdated', 'errors')}">--}%
%{--                                        <g:datePicker name="lastUpdated" precision="minute" value="${tagInstance?.lastUpdated}"  />--}%
%{--                                    </td>--}%
%{--                                </tr>--}%
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td>
                                        <g:submitButton name="create" class="button" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />
                                        <g:link action="list" class="button">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
