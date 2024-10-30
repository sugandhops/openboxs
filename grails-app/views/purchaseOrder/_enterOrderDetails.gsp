<%@ page import="org.pih.warehouse.core.ActivityCode" %>
<%@ page import="org.pih.warehouse.order.OrderType" %>
<%@ page import="org.pih.warehouse.order.OrderTypeCode" %>

<g:applyLayout name="custom">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><g:message code="order.enterOrderDetails.label"/></title>
</head>
<body>
	<div class="nav">
		<span class="linkButton"><a href="${resource(dir:'')}"><g:message code="default.home.label"/></a></span>
	</div>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${order}">
			<div class="errors">
				<g:renderErrors bean="${order}" as="list" />
			</div>
		</g:hasErrors>
		<g:each var="orderItem" in="${orderItems}" status="i">
			<g:hasErrors bean="${orderItem}">
				<div class="errors">
					<g:renderErrors bean="${orderItem}" as="list" />
				</div>
			</g:hasErrors>
		</g:each>
		<g:form action="saveOrderDetails" method="post">
            <g:hiddenField name="orderType.id" value="${OrderType.findByCode(OrderTypeCode.PURCHASE_ORDER.name()).id}"/>
            <g:hiddenField id="orderId" name="order.id" value="${order?.id }"></g:hiddenField>
			<div class="dialog">
                <g:render template="/order/summary" model="[orderInstance:order,currentState:'editOrder']"/>
                <div class="box">
                    <h2><g:message code="order.header.label" default="Order Header"/></h2>
                    <table>
                        <tbody>

                            <tr class='prop'>
                                <td class='name middle'>
                                    <label for='orderNumber'><g:message code="order.orderNumber.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'orderNumber','errors')}'>
                                    <input type="text" id="orderNumber" name='orderNumber'
                                           value="${order?.orderNumber}" class="text large"
                                           placeholder="${g.message(code:'order.orderNumber.placeholder')}"/>
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label for='name'>
                                    <g:message code="order.description.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'name','errors')}'>
                                    <g:textField type="text" id="name" name='name'
                                                 placeholder="${g.message(code:'order.description.placeholder')}" class="text large" value="${order?.name}"/>

                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label for='origin.id'>
                                    <g:message code="order.origin.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'origin','errors')}'>
                                    <g:selectOrderSupplier
                                        name="origin.id"
                                        class="chzn-select-deselect"
                                        optionKey="id"
                                        value="${order?.origin?.id}"
                                        noSelection="['':'']"
                                        data-placeholder="${g.message(code: 'default.selectAnOption.label', default: 'Select an Option')}"
                                    />
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'>
                                    <label for="destination.id"><g:message code="order.destination.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'destination','errors')}'>
                                    <g:if test="${!isCentralPurchasingEnabled}">
                                        ${order?.destination?.name }
                                        <g:hiddenField name="destination.id" value="${order?.destination?.id}"/>
                                    </g:if>
                                    <g:else>
                                        <g:selectLocation class="chzn-select-deselect filter"
                                                          id="destination.id"
                                                          name="destination.id"
                                                          withOrganization="${true}"
                                                          activityCode="${ActivityCode.RECEIVE_STOCK}"
                                                          noSelection="['':'']"
                                                          value="${order?.destination?.id}"/>
                                    </g:else>
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label><g:message code="order.destinationParty.label"/></label></td>
                                <td valign='top' class='value ${hasErrors(bean:order,field:'destinationParty','errors')}'>
                                    ${order.destinationParty.name} (${order.destinationParty?.code})
                                    <g:hiddenField name="destinationParty.id" value="${order?.destinationParty?.id}"/>
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label for='orderedBy.id'><g:message code="order.orderedBy.label"/></label></td>
                                <td valign='top'
                                    class='value ${hasErrors(bean:order,field:'orderedBy','errors')}'>
                                    <g:selectPerson id="orderedBy.id" name="orderedBy.id" value="${order?.orderedBy?.id}"
                                                    noSelection="['null':'']" class="chzn-select-deselect"/>
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label for='dateOrdered'><g:message code="order.dateOrdered.label"/></label></td>
                                <td valign='top'
                                    class='value ${hasErrors(bean:order,field:'dateOrdered','errors')}'>
                                    <g:jqueryDatePicker
                                            id="dateOrdered"
                                            name="dateOrdered"
                                            value="${order?.dateOrdered?:new Date() }"
                                            format="MM/dd/yyyy"
                                            size="30"
                                            showTrigger="false" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="box">
                    <h2><g:message code="order.terms.label" default="Order Terms" /></h2>

                    <table>
                        <tbody>
                            <tr class='prop'>
                                <td class='name middle'>
                                    <label for="paymentMethodType.id"><g:message code="order.paymentMethodType.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'paymentMethodType','errors')}'>
                                    <g:selectPaymentMethodType
                                        name="paymentMethodType.id"
                                        value="${order?.paymentMethodType?.id}"
                                        class="chzn-select-deselect"
                                        noSelection="['':'']"
                                        data-placeholder="${g.message(code: 'default.selectAnOption.label', default: 'Select an Option')}"
                                    />
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'>
                                    <label for="paymentTerm.id"><g:message code="order.paymentTerm.label"/></label>
                                </td>
                                <td class='value ${hasErrors(bean:order,field:'paymentTerm','errors')}'>
                                    <g:selectPaymentTerm
                                        name="paymentTerm.id"
                                        value="${order?.paymentTerm?.id}"
                                        class="chzn-select-deselect"
                                        noSelection="['':'']"
                                        data-placeholder="${g.message(code: 'default.selectAnOption.label', default: 'Select an Option')}"
                                    />
                                </td>
                            </tr>
                            <tr class='prop'>
                                <td class='name middle'><label for='currencyCode'><g:message code="order.currencyCode.label"/></label></td>
                                <td valign='top'
                                    class='value ${hasErrors(bean:order,field:'currency','errors')}'>
                                    <g:selectCurrency
                                        name="currencyCode"
                                        class="chzn-select-deselect"
                                        value="${order?.currencyCode}"
                                        noSelection="['':'']"
                                    />
                                </td>
                            </tr>
                            <g:if test="${order?.currencyCode && order?.currencyCode!=grailsApplication.config.openboxes.locale.defaultCurrencyCode}">
                                <tr class='prop'>
                                    <td class='name middle'><label for='exchangeRate'><g:message code="order.exchangeRate.label"/></label></td>
                                    <td class='value ${hasErrors(bean:order,field:'exchangeRate','errors')}'>
                                        <input type="text" id="exchangeRate" name='exchangeRate' value="${order?.exchangeRate}" class="text large"
                                               placeholder="${g.message(code:'order.exchangeRate.message')}"/>
                                    </td>
                                </tr>
                            </g:if>

                        </tbody>
                    </table>
                </div>
                <div class="buttons right">
                    <button type="submit" class="button">
                        <g:message code="default.button.next.label"/>
                        <img src="${resource(dir:'images/icons/silk', file: 'resultset_next.png')}">
                    </button>
                </div>
            </div>
		</g:form>
	</div>
<script>
    $(document).ready(function() {
      $("#orderNumber").focus();
    });
</script>
</body>
</html>
</g:applyLayout>
