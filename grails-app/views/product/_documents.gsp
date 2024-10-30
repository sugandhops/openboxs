<style>
/* add a thin border around document thumbnails */
.nailthumb-document .nailthumb-image {
    border: 1px solid lightgrey;
    margin: 2px;
    padding: 2px !important;
}

/* prevent nailthumb's CSS from truncating document thumbnail borders */
.nailthumb-document .nailthumb-container {
    overflow: visible !important;
}
</style>

<div class="box">
    <h2>
        <g:message code="product.documents.label" default="Documents"/>
    </h2>
    <table id="documents">
        <thead>
        <tr>
            <th>
                <!-- Delete -->
            </th>
            <th width="25%">
                <g:message code="document.name.label"/>
            </th>
            <th width="40%">
                <g:message code="document.filename.label"/>
            </th>
            <th>
                <g:message code="document.contentType.label"/>
            </th>
            <th>
                <g:message code="default.lastUpdated.label"/>
            </th>
            <th>
                <g:message code="default.actions.label"/>
            </th>
        </tr>
        </thead>
        <tbody>
            <g:each var="document" in="${productInstance?.documents.findAll { !it.fileUri } }" status="i">
                <tr class="prop ${i%2?'even':'odd' }" >
                    <td>
                        <div class="nailthumb-document">
                            <g:link controller="product" action="downloadDocument" id="${document?.id}"
                                    params="['product.id': productInstance?.id]" target="_blank">
                                <img src="${createLink(controller: 'product', action: 'viewThumbnail', id: document.id)}"
                                     class="middle" />
                            </g:link>
                        </div>
                    </td>
                    <td>
                        <g:link controller="product" action="downloadDocument" id="${document?.id}" params="['product.id':productInstance?.id]" target="_blank">
                            ${document?.name}
                        </g:link>
                    </td>
                    <td style="word-break:break-all;">
                        ${document.filename }
                    </td>
                    <td>
                        ${document.contentType }
                    </td>
                    <td>
                        <g:formatDate date="${document.lastUpdated }" format="d MMM yyyyy"/>
                    </td>
                    <td class="right">
                        <g:link controller="product" action="downloadDocument" id="${document?.id}" params="['product.id':productInstance?.id]" target="_blank" class="button">
                            <img src="${resource(dir:'images/icons/silk',file:'zoom.png')}" alt="View" />
                            ${g.message(code: 'default.button.view.label')}
                        </g:link>
                        <g:link controller="product" action="deleteDocument" id="${document?.id}" params="['product.id':productInstance?.id]" onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="button">
                            <img src="${resource(dir:'images/icons/silk',file:'delete.png')}" alt="Delete" />
                            ${g.message(code: 'default.button.delete.label')}
                        </g:link>
                    </td>
                </tr>
            </g:each>
            <g:unless test="${productInstance?.documents.find { !it.fileUri } }">
                <tr>
                    <td colspan="6">
                        <div class="padded fade center">
                            <g:message code="product.hasNoDocuments.message"/>
                        </div>
                    </td>
                </tr>
            </g:unless>
            <g:if test="${productInstance.documents.find { it.fileUri } }">
                <g:each var="document" in="${productInstance?.documents.findAll { it.fileUri } }" status="i">
                    <tr class="prop ${i%2?'even':'odd' }" >
                        <td>
                            <div class="nailthumb-document">
                                <img src="${createLink(controller: 'product', action: 'viewThumbnail', id: document.id)}"
                                    class="middle" />
                            </div>
                        </td>
                        <td>
                            <a href="${document.fileUri}" target="_blank">
                                ${document.name}
                            </a>
                        </td>
                        <td style="word-break:break-all;">
                            <a href="${document.fileUri}" target="_blank">
                                ${document.fileUri}
                            </a>
                        </td>
                        <td>
                            ${document.contentType }
                        </td>
                        <td>
                            <g:formatDate date="${document.lastUpdated }" format="d MMM yyyyy"/>
                        </td>
                        <td class="right">
                            <g:link url="${document.fileUri}" target="_blank" class="button">
                                <img src="${resource(dir:'images/icons/silk',file:'zoom.png')}" alt="View" />
                                ${g.message(code: 'default.button.view.label')}
                            </g:link>

                            <g:link controller="product" action="deleteDocument" id="${document?.id}" params="['product.id':productInstance?.id]" onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="button">
                                <img src="${resource(dir:'images/icons/silk',file:'delete.png')}" alt="Delete" />
                                ${g.message(code: 'default.button.delete.label')}
                            </g:link>
                        </td>
                    </tr>
                </g:each>
            </g:if>
        </tbody>
    </table>
</div>
<div class="box">
    <h2><g:message
                    code="product.uploadADocument.label" default="Upload document" /></h2>
    <g:uploadForm controller="document" action="uploadDocument">
        <g:hiddenField name="productId" value="${productInstance?.id}" />
        <g:hiddenField name="documentId" value="${documentInstance?.id}" />
        <table>
            <tbody>
                <tr class="prop">
                    <td class="name">
                        <label><g:message code="default.name.label" /></label>
                    </td>
                    <td class="value ${hasErrors(bean: documentInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${documentInstance?.name}" class="text large" />

                    </td>
                </tr>
                <tr class="prop">
                    <td class="name">
                        <label><g:message code="document.file.label" default="File"/></label>
                    </td>
                    <td class="${hasErrors(bean: documentInstance, field: 'fileContents', 'errors')}">
                        <input name="fileContents" type="file" />
                    </td>
                </tr>
                <tr class="prop">
                    <td class="name">
                        <label><g:message code="document.url.label" default="URL" /></label>
                    </td>
                    <td class="${hasErrors(bean: documentInstance, field: 'fileUri', 'errors')}">
                        <g:textField class="text large" name="fileUri" value="${documentInstance?.fileUri}" />
                    </td>
                </tr>
            </tbody>
            <tfoot>
            <tr>
                <td>

                </td>
                <td>
                    <button type="submit" class="button">
                        <img src="${resource(dir:'images/icons/silk',file:'add.png')}" alt="Delete" />
                        ${g.message(code:'default.button.add.label')}
                    </button>
                </td>
            </tr>
            </tfoot>
        </table>
    </g:uploadForm>
</div>
<script>
  $(function () {
    $('.nailthumb-document img').hide();
    $('.nailthumb-document img').nailthumb({
        width: 100,
        height: 100,
        method: 'resize',
        replaceAnimation: null
    });
  });
</script>
