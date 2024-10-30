
<%@ page import="org.pih.warehouse.product.ProductType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'productType.label', default: 'ProductType')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">

				<div class="button-bar">
                    <g:link class="button" action="list">
                        <img src="${resource(dir: 'images/icons/silk', file: 'application_view_list.png')}" />&nbsp;
                        <g:message code="default.list.label" args="[g.message(code:'productType.label')]"/>
                    </g:link>
                    <g:link class="button" action="create">
                        <img src="${resource(dir: 'images/icons/silk', file: 'add.png')}" />&nbsp;
                        <g:message code="default.add.label" args="[g.message(code:'productType.label')]"/>
                    </g:link>
	        	</div>

                <div class="box">
                    <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                    <table>
                        <thead>
                            <tr>

                                <g:sortableColumn property="id" title="${g.message(code: 'productType.id.label', default: 'Id')}" />

                                <g:sortableColumn property="name" title="${g.message(code: 'productType.name.label', default: 'Name')}" />

                                <g:sortableColumn property="productTypeCode" title="${g.message(code: 'productType.productTypeCode.label', default: 'Product Type Code')}" />

                                <g:sortableColumn property="productIdentifierFormat" title="${g.message(code: 'productType.productIdentifierFormat.label', default: 'Product Identifier Format')}" />

                                <g:sortableColumn property="sequenceNumber" title="${g.message(code: 'productType.sequenceNumber.label', default: 'Sequence Number')}" />

                                <g:sortableColumn property="dateCreated" title="${g.message(code: 'productType.dateCreated.label', default: 'Date Created')}" />

                                <g:sortableColumn property="lastUpdated" title="${g.message(code: 'productType.lastUpdated.label', default: 'Last Updated')}" />

                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${productTypeInstanceList}" status="i" var="productTypeInstance">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="edit" id="${productTypeInstance.id}">${fieldValue(bean: productTypeInstance, field: "id")}</g:link></td>

                                <td>${fieldValue(bean: productTypeInstance, field: "name")}</td>

                                <td>${fieldValue(bean: productTypeInstance, field: "productTypeCode")}</td>

                                <td>${fieldValue(bean: productTypeInstance, field: "productIdentifierFormat")}</td>

                                <td>${productTypeInstance.sequenceNumber}</td>

                                <td><format:date obj="${productTypeInstance.dateCreated}" /></td>

                                <td><format:date obj="${productTypeInstance.lastUpdated}" /></td>

                            </tr>
                        </g:each>
                        <g:unless test="${productTypeInstanceList}">
                            <tr>
                                <td colspan="6" class="center fade empty">
                                    <g:message code="default.noResults.label"/>
                                </td>
                            </tr>
                        </g:unless>
                        </tbody>
                    </table>
                </div>
                <div class="paginateButtons">
                    <g:paginate total="${productTypeInstanceTotal}" />
                </div>
            </div>
        </div>
    </body>
</html>
