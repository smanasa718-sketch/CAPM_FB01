sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"fijournalentries/test/integration/pages/A_JournalEntryItemBasicList.gen",
	"fijournalentries/test/integration/pages/A_JournalEntryItemBasicObjectPage.gen"
], function (JourneyRunner, A_JournalEntryItemBasicListGenerated, A_JournalEntryItemBasicObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('fijournalentries') + '/test/flp.html#app-preview',
        pages: {
			onTheA_JournalEntryItemBasicListGenerated: A_JournalEntryItemBasicListGenerated,
			onTheA_JournalEntryItemBasicObjectPageGenerated: A_JournalEntryItemBasicObjectPageGenerated
        },
        async: true
    });

    return runner;
});

