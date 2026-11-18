namespace ZFI_ODATA;

using { D4L } from '../srv/external/D4L.cds';

entity Entity1
{
    a_JournalEntryItemBasic : Association to one D4L.A_JournalEntryItemBasic;
}
