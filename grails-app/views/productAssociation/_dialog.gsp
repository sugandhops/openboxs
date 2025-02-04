<g:form controller="productAssociation" method="post">

    <g:hiddenField name="id" value="${productAssociation?.id}"></g:hiddenField>
    <g:hiddenField name="product.id" value="${productAssociation?.product?.id}"></g:hiddenField>
    <g:hiddenField name="dialog" value="true"></g:hiddenField>

    <table>
        <tbody>

            <tr class="prop">
                <td class="name">
                    <label>${g.message(code: 'productAssociation.productAssociationTypeCode.label')}</label>
                </td>
                <td class="value">
                    <g:selectProductAssociationTypeCode name="code" value="${productAssociation.code}" class="chzn-select-deselect"/>
                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label for="product"><g:message code="productAssociation.product.label"/></label>
                </td>
                <td class="value ">
                    <div id="product">
                        <format:displayName product="${productAssociation?.product}" showProductCode="${true}" showTooltip="${true}" />
                    </div>
                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label><g:message code="productAssociation.associatedProduct.label"/></label>
                </td>
                <td class="value">
                    <div id="associatedProduct">
                        <g:autoSuggest id="associatedProduct" name="associatedProduct"
                                       valueId="${productAssociation?.associatedProduct?.id}"
                                       valueName="${productAssociation?.associatedProduct?.name}"
                                       jsonUrl="${request.contextPath }/json/findProductByName" styleClass="text" />
                    </div>

                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label><g:message code="productAssociation.quantity.label"/></label>
                </td>
                <td class="value">
                    <g:textField name="readonly-quantity" size="4" class="medium text" value="1" readonly="readonly" /> :
                    <g:textField name="quantity" size="4" class="medium text" value="${productAssociation?.quantity?:1}" />
                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label for="comments"><g:message code="default.comments.label"/></label>
                </td>
                <td class="value">
                    <g:textArea name="comments" size="80" class="text medium" value="${productAssociation?.comments}" />
                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label><g:message code="productAssociation.mutualAssociation.label" default="Two-way Association"/></label>
                </td>
                <td class="value">
                    <g:checkBox name="hasMutualAssociation" value="${productAssociation?.mutualAssociation}"/>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <td colspan="2">
                <div class="center">
                    <g:if test="${productAssociation.id}">
                        <g:actionSubmit action="update" class="button icon accept" value="Save" id="update">${g.message(code: 'default.button.save.label', default: 'Save')}</g:actionSubmit>
                        <g:if test="${productAssociation?.mutualAssociation}">
                            <button type="button"
                                    class="button"
                                    onclick="$('#product-association-delete-dialog')
                                      .data('productAssociationId', `${productAssociation?.id}`)
                                      .dialog('open')">
                                ${g.message(code: 'default.button.delete.label', default: 'Delete')}
                            </button>
                        </g:if>
                        <g:else>
                            <g:actionSubmit action="delete" class="button icon trash" value="Delete" id="delete">${g.message(code: 'default.button.save.label', default: 'Save')}</g:actionSubmit>
                        </g:else>
                    </g:if>
                    <g:else>
                        <g:actionSubmit action="save" class="button icon approve" value="Save" id="save">${g.message(code: 'default.button.save.label', default: 'Save')}</g:actionSubmit>
                    </g:else>
                    &nbsp;
                    <a href="#" class="btn-close-dialog" data-target="product-association-dialog">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
                </div>
            </td>
        </tfoot>
    </table>
</g:form>
