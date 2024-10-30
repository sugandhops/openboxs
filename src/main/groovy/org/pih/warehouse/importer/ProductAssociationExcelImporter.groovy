/**
 * Copyright (c) 2012 Partners In Health.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 **/
package org.pih.warehouse.importer

import grails.gorm.transactions.Transactional
import grails.util.Holders
import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExpectedPropertyType

@Transactional
class ProductAssociationExcelImporter extends AbstractExcelImporter {

    static Map columnMap = [
            sheet    : 'Sheet1',
            startRow : 1,
            columnMap: [
                    'A': 'id',
                    'B': 'code',
                    'C': 'product.productCode',
                    'D': 'product.name',
                    'E': 'associatedProduct.productCode',
                    'F': 'associatedProduct.name',
                    'G': 'conversion',
                    'H': 'comments',
                    'I': 'hasMutualAssociation',
            ]
    ]

    static Map propertyMap = [
            "id"                            : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "code"                          : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "product.productCode"           : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "product.name"                  : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "associatedProduct.productCode" : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "associatedProduct.name"        : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "conversion"                      : ([expectedType: ExpectedPropertyType.IntType, defaultValue: null]),
            "comments"                      : ([expectedType: ExpectedPropertyType.StringType, defaultValue: null]),
            "hasMutualAssociation"          : ([expectedType: ExpectedPropertyType.StringType, defaultValue: "no"]),
    ]


    ProductAssociationExcelImporter(String fileName) {
        super(fileName)
    }

    def getDataService() {
        return Holders.grailsApplication.mainContext.getBean("productAssociationDataService")
    }


    List<Map> getData() {
        return Holders.grailsApplication.mainContext.getBean("excelImportService")
                .convertColumnMapConfigManyRows(workbook, columnMap, null, null, propertyMap)
    }

    void validateData(ImportDataCommand command) {
        dataService.validateData(command)
    }

    void importData(ImportDataCommand command) {
        dataService.importData(command)
    }

}
