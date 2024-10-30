
<%@ page import="org.pih.warehouse.product.ProductGroup"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="custom" />
<g:set var="entityName"
	value="${g.message(code: 'productGroup.label', default: 'ProductGroup')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle">
<g:message code="default.create.label" args="[entityName]" /></content>
<style type="text/css">
.CheckBoxList {
	height: 300px;
	overflow: auto;
	overflow-x: hidden;
	border: 0px solid #000;
	list-style-type: none;
	margin: 0;
	padding: 0px
}

.CheckBoxList li {
	padding: 2px;
}

.CheckBoxList input {
	padding-right: 5px;
}
</style>

</head>
<body>
	<div class="body">

		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${productGroupInstance}">
			<div class="errors">
				<g:renderErrors bean="${productGroupInstance}" as="list" />
			</div>
		</g:hasErrors>

		<div class="summary">
			<h1 class="title"><g:message code="default.create.label" args="[g.message(code: 'productGroup.label')]"/></h1>
		</div>

		<div class="buttonBar">
			<g:link class="button" action="list">
				<img src="${resource(dir:'images/icons/silk',file:'application_view_list.png')}"/>&nbsp;
				<g:message code="default.list.label" args="[g.message(code:'productGroups.label')]"/>
			</g:link>
			<g:link class="button" action="create">
				<img src="${resource(dir:'images/icons/silk',file:'add.png')}"/>&nbsp;
				<g:message code="default.add.label" args="[g.message(code:'productGroup.label')]"/>
			</g:link>
		</div>

		<g:form action="save" method="post">

				<div class="box">

				    <h2><g:message code="productGroup.label"/></h2>

					<table>
						<tbody>


							<tr class="prop">
								<td valign="middle" class="name"><label for="name"><g:message
											code="productGroup.name.label" default="Generic product" /></label>
								</td>
								<td valign="middle"
									class="value ${hasErrors(bean: productGroupInstance, field: 'name', 'errors')}">

									<g:if test="${productGroups }">
										<div>
											<g:select name="id" from="${productGroups }"
												optionKey="id" optionValue="name" value="${productGroupInstance?.id }" noSelection="['null':'']"/>
										</div>
									</g:if>
									<g:else>
										<div>
											<g:textField name="name" class="text large"
												value="${productGroupInstance?.name}" />
										</div>
									</g:else>


								</td>
							</tr>
                            <tr class="prop">
                                <td valign="middle" class="name"><label for="category"><g:message
                                        code="productGroup.category.label" default="Category" /></label></td>
                                <td valign="middle" class="value ${hasErrors(bean: productGroupInstance, field: 'category', 'errors')}">
                                    <%-- Show category if coming from Inventory Browser --%>
                                    <g:if test="${productGroupInstance?.category }">
                                        <format:category category="${productGroupInstance?.category }"/>
                                        <g:hiddenField id="category" name="category.id"
                                                       value="${productGroupInstance?.category?.id }" />
                                    </g:if>
                                    <g:else>
                                        <g:selectCategory name="category.id" class="chzn-select" noSelection="['null':'']"
                                                          value="${productGroupInstance?.category?.id}" />
                                    </g:else>

                                </td>
                            </tr>
							<tr class="prop">
								<td valign="top" class="name"><label for="description"><g:message
										code="productGroup.description.label" default="Description" /></label>
								</td>
								<td valign="top"
									class="value ${hasErrors(bean: productGroupInstance, field: 'description', 'errors')}">
									<g:textArea name="description" class="text" style="width: 100%" rows="5">${productGroupInstance?.description}</g:textArea>
								</td>
							</tr>


							<g:if test="${productGroupInstance?.products }">
								<tr class="prop">
									<td valign="top" class="name">
										<label for="products"><g:message
												code="productGroup.products.label" default="Products" /></label>
									</td>
									<td class="value ${hasErrors(bean: productGroupInstance, field: 'products', 'errors')}">
										<table>
											<g:each var="product" in="${productGroupInstance?.products }" status="status">
												<tr class="${status%2?'even':'odd' }">
													<td class="middle" width="1%">
														<g:checkBox id="productId" name="product.id" value="${product?.id }"/>
													</td>
													<td class="checkable middle">
														<span class="fade">${product?.productCode }</span>
													</td>
													<td class="checkable middle">
														<g:link name="productLink" controller="inventoryItem" action="showStockCard" params="['product.id':product?.id]" fragment="inventory" style="z-index: 999">
															<span title="${product?.name }">
																<g:if test="${product?.name?.trim()}">
																	${product?.name}
																</g:if>
																<g:else>
																	<g:message code="product.untitled.label"/>
																</g:else>
															</span>
														</g:link>
													</td>
													<td class="checkable middle left">
														<span class="fade">${product?.manufacturer }</span>
													</td>
													<td class="checkable middle left">
														<span class="fade">${product?.brandName}</span>
													</td>
													<td class="checkable middle left">
														<span class="fade">${product?.manufacturerCode }</span>
													</td>


												</tr>
											</g:each>
										</table>
									</td>
								</tr>
							</g:if>

							<tr class="prop">
								<td valign="top center" colspan="2">
									<div class="buttons">
										<g:submitButton name="create" class="button"
											value="${g.message(code: 'default.button.create.label', default: 'Create')}" />

										<g:link action="list" class="button">
											${g.message(code: 'default.button.cancel.label', default: 'Cancel')}
										</g:link>

									</div>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

		</g:form>
	</div>

</body>
</html>
