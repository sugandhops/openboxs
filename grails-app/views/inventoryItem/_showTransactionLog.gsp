<%@ page import="org.pih.warehouse.product.Product"%>
<%@ page import="org.pih.warehouse.inventory.InventoryStatus" %>
<div>
	<div>
		<g:form method="GET" action="showTransactionLog">
			<g:hiddenField name="product.id" value="${commandInstance?.product?.id }"/>

				<!--  Filter -->

				<table style="border: 1px solid lightgrey">
					<tr class="odd">
						<td>
							<label><g:message code="transactionLog.from.label"/></label>
						</td>
					</tr>
					<tr class="even">
						<td class="middle left">
							<g:jqueryDatePicker
								id="startDate"
								name="startDate"
								value="${commandInstance?.startDate }"
								format="MM/dd/yyyy"
								size="8"
								showTrigger="false" />
							<g:message code="transactionLog.to.label"/>
							<g:jqueryDatePicker
								id="endDate"
								name="endDate"
								value="${commandInstance?.endDate }"
								format="MM/dd/yyyy"
								size="8"
								showTrigger="false" />

							<g:select name="transactionType.id"
								from="${org.pih.g.inventory.TransactionType.list()}"
								optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${commandInstance?.transactionType?.id }"
								noSelection="['0': g.message(code:'default.all.label')]" />

							<button  class="" name="filter">
								<img src="${resource(dir: 'images/icons/silk', file: 'zoom.png' )}" style="vertical-align:middle"/>
								&nbsp;<g:message code="default.button.filter.label"/>
							</button>
						</td>
					</tr>
					<tr>
						<td style="padding: 0px;">
							<g:set var="enableFilter" value="${!params.disableFilter}"/>
							<table >
								<thead>
									<tr class="odd prop">
										<th>
											${g.message(code: 'default.date.label')}
										</th>
										<th>
											${g.message(code: 'default.type.label')}
										</th>
										<th>
											${g.message(code: 'shipment.label')}
										</th>
										<th>
											${g.message(code: 'transaction.source.label')}
                                        </th>
                                        <th>
											${g.message(code: 'transaction.destination.label')}
										</th>
										<th style="text-align: center">
											${g.message(code: 'transaction.quantityChange.label')}
										</th>
									</tr>

								</thead>
								<!--  Transaction Log -->
								<tbody>

									<g:set var="transactionMap" value="${commandInstance?.getTransactionLogMap(enableFilter.toBoolean())}"/>
									<g:if test="${!transactionMap }">
										<tr>
											<td colspan="6" class="even center">
												<div class="fade padded">
													<g:message code="transaction.noTransactions.label"/>
												</div>
											</td>
										</tr>
									</g:if>
									<g:else>
										<g:set var="totalQuantityChange" value="${0 }"/>
										<g:each var="transaction" in="${transactionMap?.keySet()?.sort {it.transactionDate}.reverse() }" status="status">
											<tr class="transaction ${(status%2==0)?'even':'odd' } prop">
												<td style="width: 10%;" nowrap="nowrap">
													<format:date obj="${transaction?.transactionDate}"/>
												</td>
												<td>
													<span class="${transaction?.transactionType?.transactionCode?.name()?.toLowerCase()}">
														<g:link controller="inventory" action="showTransaction" id="${transaction?.id }" params="['product.id':commandInstance?.product?.id]">
															<format:metadata obj="${transaction?.transactionType}"/>
														</g:link>
													</span>
												</td>
												<td>
													<g:if test="${transaction?.incomingShipment }">
														<g:link controller="shipment" action="showDetails" id="${transaction?.incomingShipment?.id }">
															${transaction.incomingShipment?.name }
														</g:link>
													</g:if>
													<g:elseif test="${transaction?.outgoingShipment }">
														<g:link controller="shipment" action="showDetails" id="${transaction?.outgoingShipment?.id }">
															${transaction.outgoingShipment?.name }
														</g:link>
													</g:elseif>
													<g:else>
														<span class="fade">${g.message(code:'default.none.label') }</span>
													</g:else>
												</td>
												<td>
													<g:if test="${transaction?.source }">
														${transaction?.source?.name }
													</g:if>
                                                </td>
                                                <td>
													<g:if test="${transaction?.destination }">
														${transaction?.destination?.name }
													</g:if>
												</td>
												<td style="text-align: center">
													<g:set var="quantityChange" value="${0 }"/>
													<g:each var="transactionEntry" in="${commandInstance?.getTransactionLogMap(enableFilter.toBoolean())?.get(transaction) }" status="status2">
														<g:set var="quantityChange" value="${transaction?.transactionEntries.findAll{it?.inventoryItem?.product == commandInstance?.product}.quantity?.sum() }"/>
													</g:each>
													<span class="${transaction?.transactionType?.transactionCode?.name()?.toLowerCase()}">
														${quantityChange }
													</span>
												</td>
											</tr>
										</g:each>
									</g:else>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
		</g:form>
	</div>
</div>
<div class="left smpad">
	Showing ${transactionMap?.keySet()?.size() } of ${commandInstance?.allTransactionLogMap?.keySet()?.size() }
	transactions
	<g:if test="${commandInstance?.allTransactionLogMap?.keySet()?.size() > transactionMap?.keySet()?.size()}">
		&nbsp;|&nbsp;
		<g:link controller="inventoryItem" action="showTransactionLog" id="${commandInstance?.product?.id }" params="[disableFilter: true]">
			<g:message code="transactionLog.showAll.label"/>
		</g:link>
	</g:if>
</div>
