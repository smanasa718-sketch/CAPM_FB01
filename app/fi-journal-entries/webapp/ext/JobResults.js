sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Table",
    "sap/m/Column",
    "sap/m/ColumnListItem",
    "sap/m/Text",
    "sap/m/MessageBox",
    "sap/ui/core/BusyIndicator",
    "sap/ui/model/json/JSONModel"
], function (
    Dialog, Button, Table, Column, ColumnListItem,
    Text, MessageBox, BusyIndicator, JSONModel
) {
    "use strict";

    return {
        onPress: async function () {
            const oModel = this.getModel();
            const oAction = oModel.bindContext(
                "/getLatestJobResult(...)"
            );

            BusyIndicator.show(0);

            try {
                await oAction.execute();

                const oResponse =
                    oAction.getBoundContext().getObject();

                // CAP currently returns the result as a JSON string.
                const oResult = JSON.parse(oResponse.value);

                const aColumns = [
                    { label: "Company Code", field: "CompanyCode" },
                    { label: "Ledger", field: "Ledger" },
                    { label: "Fiscal Year", field: "LedgerFiscalYear" },
                    { label: "G/L Account", field: "GLAccount" },
                    { label: "Account Name", field: "GLAccountName" },
                    {
                        label: "Amount",
                        field: "AmountInCompanyCodeCurrency"
                    },
                    {
                        label: "Currency",
                        field: "CompanyCodeCurrency"
                    }
                ];

                const oTable = new Table({
                    width: "100%",
                    noDataText: "No records found",
                    columns: aColumns.map(function (oColumn) {
                        return new Column({
                            header: new Text({
                                text: oColumn.label
                            })
                        });
                    })
                });

                oTable.setModel(new JSONModel({
                    records: oResult.records || []
                }), "job");

                oTable.bindItems({
                    path: "job>/records",
                    templateShareable: false,
                    template: new ColumnListItem({
                        cells: aColumns.map(function (oColumn) {
                            return new Text({
                                text: "{job>" + oColumn.field + "}"
                            });
                        })
                    })
                });

                const oDialog = new Dialog({
                    title: "Job Result — " +
                        oResult.runState + " — " +
                        (oResult.records || []).length + " records",
                    contentWidth: "75rem",
                    contentHeight: "25rem",
                    resizable: true,
                    draggable: true,
                    content: [oTable],
                    endButton: new Button({
                        text: "Close",
                        press: function () {
                            oDialog.close();
                        }
                    }),
                    afterClose: function () {
                        oDialog.destroy();
                    }
                });

                oDialog.open();
            } catch (oError) {
                MessageBox.error(
                    oError.message || "Unable to retrieve job results"
                );
            } finally {
                BusyIndicator.hide();
                oAction.destroy();
            }
        }
    };
});