<%@ page import="org.pih.warehouse.CommandUtils" %>
<%@ page import="org.pih.warehouse.product.Product" %>
<%@ page import="org.pih.warehouse.core.Constants" %>
<style>
.chosen-container-multi .chosen-choices li.search-field input[type="text"] {
    height: 26px;
    line-height: 26px;
}

.location-container {
    height: 120px;
}

.location-container .chosen-container-multi .chosen-choices {
    height: 120px !important;
    overflow-y: auto;
}
</style>
<div class="filters">
	<g:form method="get" controller="consumption" action="show">

        <g:hiddenField name="parametersHash" value="${command?.generateParametersHash()}"/>

        <div class="box">
            <h2><g:message code="consumption.parameters.label" default="Parameters"/></h2>

            <div class="parameters">

                <div class="filter-list-item">
                    <label>
                        <g:message code="consumption.fromLocations.label" default="Origin(s)"/>
                    </label>
                    <g:selectLocation name="fromLocations" value="${command?.fromLocations?.id?:session?.warehouse?.id}"
                                      multiple="true" class="chzn-select-deselect"
                                      activityCode="${org.pih.warehouse.core.ActivityCode.MANAGE_INVENTORY}"
                                      data-placeholder="${g.message(code:'consumption.fromLocations.label', default:'Origins(s)')}"/>

                    <div class="fade">
                        <g:message code="consumption.origin.note.label" default="NOTE: Using multiple Origin locations may provide inaccurate results" />
                    </div>
                </div>
                <div class="filter-list-item">
                    <label>
                        <g:message code="consumption.afterDate.label" default="Consumed on or after"/>
                    </label>
                    <div>
                        <g:jqueryDatePicker id="fromDate" name="fromDate" value="${command?.fromDate}" format="MM/dd/yyyy" cssClass="large" autocomplete="off"/>
                    </div>
                </div>
                <div class="filter-list-item">
                    <label>
                        <g:message code="consumption.beforeDate.label" default="Consumed on or before"/>
                    </label>
                    <div>
                        <g:jqueryDatePicker id="toDate" name="toDate" value="${command?.toDate}" format="MM/dd/yyyy" cssClass="large" autocomplete="off"/>
                    </div>
                </div>
            </div>

            <h2><g:message code="default.filters.label" default="Filters"/></h2>
            <div class="filters">

                <div class="filter-list">

                    <div class="filter-list-item">
                        <label>
                            <g:message code="categories.label" default="Categories"/>
                        </label>
                        <g:selectCategory
                            name="selectedCategories"
                            multiple="true"
                            value="${command?.selectedCategories?.id}"
                            class="chzn-select-deselect"
                            data-placeholder="${g.message(code: 'default.selectOptions.label', default: 'Select Options')}"
                        />
                    </div>
                    <div class="filter-list-item">
                        <label>
                            <g:message code="tags.label" default="Tags"/>
                        </label>
                        <g:selectTags
                            name="selectedTags"
                            value="${command?.selectedTags?.id}"
                            multiple="true"
                            class="chzn-select-deselect"
                            data-placeholder="${g.message(code: 'default.selectOptions.label', default: 'Select Options')}"
                        />
                    </div>
                    <g:if test="${!command?.toLocations}">
                        <div class="filter-list-item">
                            <label>
                                <g:message code="consumption.toLocations.label" default="Destinations(s)"/>
                            </label>
                            <div class="location-container">
                                <g:selectLocation
                                    name="selectedLocations"
                                    value="${command?.selectedLocations?.id}"
                                    multiple="true"
                                    class="chzn-select-deselect"
                                    data-placeholder="${g.message(code: 'default.selectOptions.label', default: 'Select Options')}"
                                />
                            </div>

                            <span class="fade"><g:message code="consumption.destinations.optional.message"/></span>
                        </div>
                    </g:if>
                    <g:elseif test="${command?.toLocations}">
                        <div class="filter-list-item">
                            <label>
                                <g:message code="consumption.toLocations.label" default="Destination(s)"/>
                            </label>
                            <div class="location-container">
                                <g:selectLocationWithOptGroup name="selectedLocations" from="${command?.toLocations}"
                                                              value="${command.selectedLocations*.id}"
                                                              class="chzn-select-deselect" multiple="multiple"/>
                            </div>
                        </div>
                    </g:elseif>
                </div>
            </div>
            <h2><g:message code="consumption.renderOptions.label" default="Render Options"/></h2>
            <div class="options">

                <div class="filter-list-item">
                    <label><g:message code="consumption.additionalColumns.label" default="Additional columns (CSV only)"/></label>
                    <select
                        name="selectedProperties"
                        multiple="true"
                        class="chzn-select-deselect"
                        data-placeholder="${g.message(code: 'default.selectOptions.label', default: 'Select Options')}"
                    >

                        <g:hasRoleFinance>
                            <g:set var="hasRoleFinance" value="${true}"/>
                        </g:hasRoleFinance>
                        <g:each var="property" in="${CommandUtils.getAvailableProperties(Product.class.name)}">
                            <g:set var="disabled" value="${'pricePerUnit'.equals(property.name) && !hasRoleFinance}"/>
                            <option value="${property.name}"
                                ${command.selectedProperties?.toList()?.contains(property.name)?'selected':''}
                                ${disabled?'disabled':''}>
                                ${property.naturalName} (${property.typePropertyName})
                            </option>
                        </g:each>
                    </select>
                </div>
                <div class="filter-list-item">
                    <label>
                        <g:message code="consumption.format.label" default="Format"/>
                    </label>
                    <div>
                        <label>
                            <g:radio name="format" value="html" checked="${params.format=='html'||!params.format}"/>
                            <g:message code="default.html.label" default="HTML" />
                        </label>
                        <label>
                            <g:radio name="format" value="csv" checked="${false}" />
                            <g:message code="default.csv.label" default="CSV" />
                        </label>
                    </div>
                </div>
                <div class="filter-list-item">
                    <label>
                        <g:message code="default.options.label" default="Options"/>
                    </label>
                    <div class="checkbox">
                        <g:checkBox name="includeQuantityOnHand" value="${command.includeQuantityOnHand}"/>
                        <label for="includeQuantityOnHand">
                            <g:message code="consumption.includeQuantityOnHand.label" default="Include quantity on hand"/>
                        </label>
                    </div>
                    <div class="checkbox">
                        <g:checkBox name="includeLocationBreakdown" value="${command.includeLocationBreakdown}"/>
                        <label for="includeLocationBreakdown">
                            <g:message code="consumption.includeLocationBreakdown.label" default="Include location breakdown in CSV"/>
                        </label>
                    </div>
                    <div class="checkbox">
                        <g:checkBox name="includeMonthlyBreakdown" value="${command.includeMonthlyBreakdown}"/>
                        <label for="includeMonthlyBreakdown">
                            <g:message code="consumption.includeMonthlyBreakdown.label" default="Include monthly breakdown in CSV"/>
                        </label>
                    </div>
                </div>
            </div>
            <div class="filter-list-item">
                <div class="buttons">
                    <button class="button">
                        <img src="${resource(dir:'images/icons/silk',file:'cog_go.png')}" />
                        <g:message code="report.runReport.label" default="Run Report"/>
                    </button>

                    <g:link controller="consumption" action="show" class="button">
                        <img src="${resource(dir:'images/icons/silk',file: 'arrow_refresh.png')}" />
                        ${g.message(code:'default.button.reset.label', default: 'Reset')}
                    </g:link>
                </div>
            </div>
        </div>
    </g:form>

</div>

