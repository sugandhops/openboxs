<%@ page import="org.pih.warehouse.inventory.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <title><g:message code="inventory.expiredStock.label"/></title>
    </head>

	<body>
		<div class="body">

			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>

           	<div class="summary">
				<h3 class="title"><g:message code="inventory.expiredStock.label"/></h3>
			</div>

            <div class="buttons" style="text-align: left">
                <g:link controller="dashboard" action="index" class="button">
                    <img src="${resource(dir:'images/icons/silk',file:'house.png')}" alt="${g.message(code: 'dashboard.label') }" />
                    &nbsp;<g:message code="dashboard.label"/>
                </g:link>

                <g:link controller="inventory" action="browse" class="button">
                    <img src="${resource(dir:'images/icons/silk',file:'application_form_magnify.png')}" alt="${g.message(code: 'inventory.browse.label') }" />
                    &nbsp;<g:message code="inventory.browse.label"/>
                </g:link>

				<div class="right">
					<div class="button-container">
						<div class="button-group">
							<a href="javascript:void(0);" class="button button-action" data-action="${g.createLink(controller: "inventory", action: "createOutboundTransfer")}">
								<img src="${resource(dir:'images/icons/silk',file:'package_go.png')}"/>
								&nbsp;<g:message code="inventory.outgoingTransfer.label" default="Transfer out" />
							</a>

							<a href="javascript:void(0);" class="button button-action" data-action="${g.createLink(controller: "inventory", action: "createExpired")}">
								<img src="${resource(dir:'images/icons/silk',file:'hourglass.png')}"/>
								&nbsp;<g:message code="inventory.inventoryExpired.label" default="Mark as expired"/>
							</a>

							<a href="javascript:void(0);" class="button button-action" data-action="${g.createLink(controller: "inventory", action: "createConsumed")}">
								<img src="${resource(dir:'images/icons/silk',file:'package_white.png')}" />
								&nbsp;<g:message code="inventory.inventoryConsumed.label" default="Mark as consumed"/>
							</a>
						</div>

						<g:link params="[format:'csv',category:params.category]" controller="${controllerName}" action="${actionName}" class="button">
							<img src="${resource(dir:'images/icons/silk',file:'disk.png')}" alt="${g.message(code: 'default.button.download.label') }" style="vertical-align: middle"/>
							&nbsp; <g:message code="default.button.downloadAsCSV.label" default="Download as CSV"/>
						</g:link>
					</div>
				</div>


            </div>

            <div class="yui-gf">

				<div class="yui-u first">

                    <g:form action="listExpiredStock" method="get">
						<div class="box">

                            <div class="right middle">
                            </div>
                            <h2>
                                <g:message code="default.filters.label" default="Filters"/>
                            </h2>
		          			<div class="filter-list-item">
		           				<label><g:message code="category.label"/></label>
		           				%{-- not sure what the ${{...}} in optionValue means: it may need to be de-escaped. OBPIH-5506 --}%
				           		<g:select name="category" class="chzn-select-deselect"
												from="${categories}"
												optionKey="id" optionValue="${{format.category(category:it)}}" value="${categorySelected?.id}"
												noSelection="['': g.message(code:'default.all.label')]" />
							</div>
							<div class="filter-list-item">
								<button name="filter" class="button icon search">
                                    <g:message code="default.button.filter.label"/>
								</button>
							</div>
                            <div class="clear"></div>
						</div>


		            </g:form>
				</div>
				<div class="yui-u">

		            <div class="box">
                        <h2>
                            <g:message code="inventoryItem.expired.label" default="Expired inventory items"/> (${inventoryItems.size()} <g:message code="default.results.label" default="Results"/>)
                        </h2>


                        <div class="dialog">
							<form id="inventoryActionForm" name="inventoryActionForm" action="createTransaction" method="POST">
                                <table>
									<thead>
										<tr class="odd">
											<th class="center">
												<input type="checkbox" class="toggleCheckbox"/>
											</th>
                                            <th><g:message code="product.productCode.label"/></th>
											<th><g:message code="product.label"/></th>
											<th><g:message code="category.label"/></th>
											<th><g:message code="inventory.lotNumber.label"/></th>
											<th class="center"><g:message code="inventory.expires.label"/></th>
											<th class="center"><g:message code="default.quantity.label"/></th>
											<th class="center"><g:message code="product.uom.label"/></th>
										</tr>
									</thead>
									<tbody>
										<g:set var="counter" value="${0 }" />
										<g:set var="anyExpiredStock" value="${false }"/>
										<g:each var="inventoryItem" in="${inventoryItems}" status="i">
											<g:set var="quantity" value="${quantityMap[inventoryItem] }"/>
											<g:set var="anyExpiredStock" value="${true }"/>
											<tr class="${(counter++ % 2) == 0 ? 'even' : 'odd'}">
												<td class="center">
													<g:checkBox id="${inventoryItem?.id }" name="inventoryItem.id"
														class="checkbox" checked="${false }"
															value="${inventoryItem?.id }" />

												</td>
												<td class="checkable">
													<g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]">
														${inventoryItem?.product?.productCode}
													</g:link>

												</td>
												<td class="checkable">
                                                    <g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]">
														<format:displayName product="${inventoryItem?.product}" showTooltip="${true}" />
                                                    </g:link>
												</td>
												<td class="checkable">
													<span class="fade dont-break-out"><format:category category="${inventoryItem?.product?.category}"/> </span>
												</td>
												<td class="checkable">
													<span class="lotNumber">
														${inventoryItem?.lotNumber }
													</span>
												</td>
												<td class="checkable center">
                                                    <g:expirationDate date="${inventoryItem?.expirationDate}"/>
												</td>
												<td class="right checkable">
													${quantity }
												</td>
												<td class="left checkable">
													${inventoryItem?.product?.unitOfMeasure?:"EA" }

												</td>
											</tr>
										</g:each>
										<g:unless test="${inventoryItems}">
											<tr>
												<td colspan="8">
													<div class="padded center fade">
														<g:message code="inventory.noExpiredStock.label" />
													</div>
												</td>
											</tr>
										</g:unless>
									</tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="8">

                                            </td>
                                        </tr>
                                    </tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$(".checkable a").click(function(event) {
					event.stopPropagation();
				});
				$('.checkable').toggle(
					function(event) {
						$(this).parent().find('input').click();
						return false;
					},
					function(event) {
						$(this).parent().find('input').click();
						return false;
					}
				);

				$(".toggleCheckbox").click(function(event) {
                    $(':checkbox').not(this).prop('checked', this.checked);
				});

				$(".button-action").click(function(event) {
					var numChecked = $("input.checkbox:checked").length;
					if (numChecked <= 0) {
						event.stopImmediatePropagation();
						alert("${g.message(code: 'inventory.selectAtLeastOneProduct.label')}");
					}
					else {
						var form = $("#inventoryActionForm");
						form.attr("action", $(this).data("action"));
						form.submit();
					}
				});
			});


		</script>


	</body>
</html>
