
sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/core/Component"
], function (MessageToast, MessageBox, Component) {
    "use strict";

    return {
        scheduleJob: async function (oContext, aSelectedContexts, oExtensionAPI) {
            let oModel =
                oContext?.getModel?.() ||
                aSelectedContexts?.[0]?.getModel?.();

            if (!oModel) {
                const oComponent = Component.getOwnerComponentFor(
                    oExtensionAPI?.getView?.()
                );
                oModel = oComponent?.getModel?.();
            }

            if (!oModel) {
                MessageBox.error("Could not access the OData model.");
                return;
            }

            const oAction = oModel.bindContext(
                "/scheduleJournalEntryJob(...)"
            );

            try {
                await oAction.execute();

                const oResult = oAction.getBoundContext()?.getObject();

                // CAP OData V4 actions returning a string commonly
                // expose the result in an object with a value property.
                const sMessage =
                    typeof oResult === "string"
                        ? oResult
                        : oResult?.value ||
                          "Schedule Job request completed.";

                MessageToast.show(sMessage);
            } catch (error) {
                console.error("Schedule Job failed:", error);
                MessageBox.error(
                    error.message || "Failed to schedule the job."
                );
            } finally {
                oAction.destroy();
            }
        }
    };
});
