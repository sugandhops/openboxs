
<%@ page import="org.pih.warehouse.core.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
	<content tag="pageTitle"><g:message code="default.create.label" args="[entityName]" /></content>

    </head>
    <body>
      
        <div class="body">
        
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userInstance}" as="list" />
                </div>
            </g:hasErrors>


            <div class="buttonBar">
               <g:link class="button" action="list" controller="user">
                    <img src="${resource(dir:'images/icons/silk',file:'application_view_list.png')}"/>
                    <g:message code="default.list.label" args="[g.message(code: 'users.label')]" />
                </g:link>
                <g:link class="button" action="create" controller="user">
                    <img src="${resource(dir:'images/icons/silk',file:'user_add.png')}"/>
                    <g:message code="default.create.label" args="[g.message(code: 'user.label')]" />
                </g:link>
            </div>
            
            
            <g:form action="save" method="post" > 
            	<fieldset>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username.label" />
                                    
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" class="text"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="user.firstName.label"/>
                                    
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${userInstance?.firstName}" class="text"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="user.lastName.label" />
                                    
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${userInstance?.lastName}" class="text" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label"/>
                                    
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${userInstance?.password}" class="text" />
                                </td>
                            </tr>

                            
			    
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="user.email.label" />
                                  
                                  </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" class="text" />
                                </td>
                            </tr>
                            
                             <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="locale"><g:message code="default.locale.label"/>
                                      
                                      </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'locale', 'errors')}">
	                                    <g:select name="locale" from="${ grailsApplication.config.openboxes.locale.supportedLocales.collect{ new Locale(it) } }" optionValue="displayName" value="${userInstance?.locale}" noSelection="['':'']"/>
	                                </td>
	                         </tr>
	                         <tr class="prop">
	                         	<td valign="top" class="name">
	                         	
	                         	</td>
	                         	<td valign="top" class="value">
		                         	<button name="create" class="positive">${g.message(code: 'default.button.save.label')}
                                     
                                    </button>
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
