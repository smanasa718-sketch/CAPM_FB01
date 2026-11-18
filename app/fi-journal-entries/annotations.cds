using ZFI_ODATAService as service from '../../srv/service';

annotate service.A_JournalEntryItemBasic with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
       {
        $Type: 'UI.DataField',
        Label: 'Company Code',
        Value: CompanyCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Ledger',
        Value: Ledger,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Ledger Fiscal Year',
        Value: FiscalYear,
      },
      {
        $Type: 'UI.DataField',
        Label: 'G/L Account',
        Value: GLAccount,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Account Name',
        Value: GLAccountName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Amount',
        Value: AmountInCompanyCodeCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Currency',
        Value: CompanyCodeCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FinancialTransactionType',
        Value: FinancialTransactionType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BusinessTransactionCategory',
        Value: BusinessTransactionCategory,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BusinessTransactionType',
        Value: BusinessTransactionType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SourceReferenceDocumentType',
        Value: SourceReferenceDocumentType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JrnlEntryItemObsoleteReason',
        Value: JrnlEntryItemObsoleteReason,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Cost Center',
        Value: CostCenter,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CostCenterName',
        Value: CostCenterName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Profit Center',
        Value: ProfitCenter,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ProfitCenterName',
        Value: ProfitCenterName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FunctionalArea',
        Value: FunctionalArea,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FunctionalAreaName',
        Value: FunctionalAreaName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BusinessArea',
        Value: BusinessArea,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BusinessAreaName',
        Value: BusinessAreaName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Segment',
        Value: Segment,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SegmentName',
        Value: SegmentName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCostCenter',
        Value: PartnerCostCenter,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCostCenterName',
        Value: PartnerCostCenterName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerProfitCenter',
        Value: PartnerProfitCenter,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerProfitCenterName',
        Value: PartnerProfitCenterName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerFunctionalArea',
        Value: PartnerFunctionalArea,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerFunctionalAreaName',
        Value: PartnerFunctionalAreaName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerBusinessArea',
        Value: PartnerBusinessArea,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerBusinessAreaName',
        Value: PartnerBusinessAreaName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCompany',
        Value: PartnerCompany,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCompanyName',
        Value: PartnerCompanyName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerSegment',
        Value: PartnerSegment,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerSegmentName',
        Value: PartnerSegmentName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'TransactionCurrency',
        Value: TransactionCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInTransactionCurrency',
        Value: AmountInTransactionCurrency,
      },
      
      
      {
        $Type: 'UI.DataField',
        Label: 'GlobalCurrency',
        Value: GlobalCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInGlobalCurrency',
        Value: AmountInGlobalCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FixedAmountInGlobalCrcy',
        Value: FixedAmountInGlobalCrcy,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FunctionalCurrency',
        Value: FunctionalCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFunctionalCurrency',
        Value: AmountInFunctionalCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ControllingObjectCurrency',
        Value: ControllingObjectCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInObjectCurrency',
        Value: AmountInObjectCurrency,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CostSourceUnit',
        Value: CostSourceUnit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ValuationQuantity',
        Value: ValuationQuantity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ValuationFixedQuantity',
        Value: ValuationFixedQuantity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ReferenceQuantityUnit',
        Value: ReferenceQuantityUnit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ReferenceQuantity',
        Value: ReferenceQuantity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency1',
        Value: FreeDefinedCurrency1,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency1',
        Value: AmountInFreeDefinedCurrency1,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency2',
        Value: FreeDefinedCurrency2,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency2',
        Value: AmountInFreeDefinedCurrency2,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency3',
        Value: FreeDefinedCurrency3,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency3',
        Value: AmountInFreeDefinedCurrency3,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency4',
        Value: FreeDefinedCurrency4,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency4',
        Value: AmountInFreeDefinedCurrency4,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency5',
        Value: FreeDefinedCurrency5,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency5',
        Value: AmountInFreeDefinedCurrency5,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency6',
        Value: FreeDefinedCurrency6,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency6',
        Value: AmountInFreeDefinedCurrency6,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency7',
        Value: FreeDefinedCurrency7,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency7',
        Value: AmountInFreeDefinedCurrency7,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FreeDefinedCurrency8',
        Value: FreeDefinedCurrency8,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AmountInFreeDefinedCurrency8',
        Value: AmountInFreeDefinedCurrency8,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BaseUnit',
        Value: BaseUnit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Quantity',
        Value: Quantity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity1Unit',
        Value: AdditionalQuantity1Unit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity1',
        Value: AdditionalQuantity1,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity2Unit',
        Value: AdditionalQuantity2Unit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity2',
        Value: AdditionalQuantity2,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity3Unit',
        Value: AdditionalQuantity3Unit,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AdditionalQuantity3',
        Value: AdditionalQuantity3,
      },
      {
        $Type: 'UI.DataField',
        Label: 'AccountingDocumentCategory',
        Value: AccountingDocumentCategory,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FiscalPeriod',
        Value: FiscalPeriod,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FiscalYearVariant',
        Value: FiscalYearVariant,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FiscalYearPeriod',
        Value: FiscalYearPeriod,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ChartOfAccounts',
        Value: ChartOfAccounts,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Plant',
        Value: Plant,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PlantName',
        Value: PlantName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Customer',
        Value: Customer,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerName',
        Value: CustomerName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ControllingDebitCreditCode',
        Value: ControllingDebitCreditCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ProjectExternalID',
        Value: ProjectExternalID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Project',
        Value: Project,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ProjectDescription',
        Value: ProjectDescription,
      },
      {
        $Type: 'UI.DataField',
        Label: 'WBSElementExternalID',
        Value: WBSElementExternalID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'WBSElement',
        Value: WBSElement,
      },
      {
        $Type: 'UI.DataField',
        Label: 'WBSElementDescription',
        Value: WBSElementDescription,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCompanyCode',
        Value: PartnerCompanyCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCompanyCodeName',
        Value: PartnerCompanyCodeName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CostCtrActivityType',
        Value: CostCtrActivityType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CostCtrActivityTypeName',
        Value: CostCtrActivityTypeName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'OrderID',
        Value: OrderID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerOrder',
        Value: PartnerOrder,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCostCtrActivityType',
        Value: PartnerCostCtrActivityType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerCostCtrActivityTypeName',
        Value: PartnerCostCtrActivityTypeName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerProject',
        Value: PartnerProject,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerProjectDescription',
        Value: PartnerProjectDescription,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerWBSElement',
        Value: PartnerWBSElement,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerWBSElementDescription',
        Value: PartnerWBSElementDescription,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SalesOrganization',
        Value: SalesOrganization,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SalesOrganizationName',
        Value: SalesOrganizationName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'DistributionChannel',
        Value: DistributionChannel,
      },
      {
        $Type: 'UI.DataField',
        Label: 'DistributionChannelName',
        Value: DistributionChannelName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'OrganizationDivision',
        Value: OrganizationDivision,
      },
      {
        $Type: 'UI.DataField',
        Label: 'DivisionName',
        Value: DivisionName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Product',
        Value: Product,
      },
      {
        $Type: 'UI.DataField',
        Label: 'ProductName',
        Value: ProductName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SoldMaterial',
        Value: SoldMaterial,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SoldMaterialName',
        Value: SoldMaterialName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'MaterialGroup',
        Value: MaterialGroup,
      },
      {
        $Type: 'UI.DataField',
        Label: 'MaterialGroupName',
        Value: MaterialGroupName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerGroup',
        Value: CustomerGroup,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerGroupName',
        Value: CustomerGroupName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerSupplierCountry',
        Value: CustomerSupplierCountry,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerSupplierCountryName',
        Value: CustomerSupplierCountryName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerSupplierIndustry',
        Value: CustomerSupplierIndustry,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CustomerSupplierIndustryName',
        Value: CustomerSupplierIndustryName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SalesDistrict',
        Value: SalesDistrict,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SalesDistrictName',
        Value: SalesDistrictName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'FinancialManagementArea',
        Value: FinancialManagementArea,
      },
      {
        $Type: 'UI.DataField',
        Label: 'Fund',
        Value: Fund,
      },
      {
        $Type: 'UI.DataField',
        Label: 'GrantID',
        Value: GrantID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'BudgetPeriod',
        Value: BudgetPeriod,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SponsoredProgram',
        Value: SponsoredProgram,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SponsoredClass',
        Value: SponsoredClass,
      },
      {
        $Type: 'UI.DataField',
        Label: 'GteeMBudgetValidityNumber',
        Value: GteeMBudgetValidityNumber,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVenture',
        Value: JointVenture,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureEquityGroup',
        Value: JointVentureEquityGroup,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureCostRecoveryCode',
        Value: JointVentureCostRecoveryCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVenturePartner',
        Value: JointVenturePartner,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureBillingType',
        Value: JointVentureBillingType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureEquityType',
        Value: JointVentureEquityType,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureProductionDate',
        Value: JointVentureProductionDate,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureBillingDate',
        Value: JointVentureBillingDate,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureOperationalDate',
        Value: JointVentureOperationalDate,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CutbackRun',
        Value: CutbackRun,
      },
      {
        $Type: 'UI.DataField',
        Label: 'JointVentureAccountingActivity',
        Value: JointVentureAccountingActivity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerVenture',
        Value: PartnerVenture,
      },
      {
        $Type: 'UI.DataField',
        Label: 'PartnerEquityGroup',
        Value: PartnerEquityGroup,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SenderCostRecoveryCode',
        Value: SenderCostRecoveryCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CutbackAccount',
        Value: CutbackAccount,
      },
      {
        $Type: 'UI.DataField',
        Label: 'CutbackCostObject',
        Value: CutbackCostObject,
      },
      {
        $Type: 'UI.DataField',
        Label: 'REBusinessEntity',
        Value: REBusinessEntity,
      },
      {
        $Type: 'UI.DataField',
        Label: 'RealEstateBuilding',
        Value: RealEstateBuilding,
      },
      {
        $Type: 'UI.DataField',
        Label: 'RealEstateProperty',
        Value: RealEstateProperty,
      },
      {
        $Type: 'UI.DataField',
        Label: 'RERentalObject',
        Value: RERentalObject,
      },
      {
        $Type: 'UI.DataField',
        Label: 'RealEstateContract',
        Value: RealEstateContract,
      },
      {
        $Type: 'UI.DataField',
        Label: 'REServiceChargeKey',
        Value: REServiceChargeKey,
      },
      {
        $Type: 'UI.DataField',
        Label: 'RESettlementUnitID',
        Value: RESettlementUnitID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'SettlementReferenceDate',
        Value: SettlementReferenceDate,
      },
    ],
  },
  UI.Facets                    : [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'GeneratedFacet1',
    Label : 'General Information',
    Target: '@UI.FieldGroup#GeneratedGroup',
  }, ],
  UI.LineItem                  : [
    
    {
      $Type: 'UI.DataField',
      Label: 'Ledger',
      Value: Ledger,
    },
    {
      $Type: 'UI.DataField',
      Label: 'Ledger Name',
      Value: LedgerName,
    },
   
    {
      $Type: 'UI.DataField',
      Label: 'Fiscal Year',
      Value: LedgerFiscalYear,
    },
    {
      $Type: 'UI.DataField',
      Label: 'G/L Account',
      Value: GLAccount,
    },
    {
      $Type: 'UI.DataField',
      Label: 'Account Name',
      Value: GLAccountName,
    },
    {
      $Type: 'UI.DataField',
      Label: 'Amount',
      Value: AmountInCompanyCodeCurrency,
    },
    {
      $Type: 'UI.DataField',
      Label: 'Currency',
      Value: CompanyCodeCurrency,
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'ZFI_ODATAService.EntityContainer/postJournalEntry',
      Label : 'Post Journal Entry',
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'ZFI_ODATAService.EntityContainer/scheduleJournalEntryJob',
      Label : 'Schedule Job',
    },


  ],
  UI.SelectionFields           : [
    CompanyCode,
    Ledger,
    FiscalYearPeriod,
    FiscalPeriod,
    GLAccount,
    CostCenter,
    ProfitCenter,
    Customer,

  ],
);

annotate service.A_JournalEntryItemBasic with {
  CompanyCode @Common.Label: 'Company Code'
};

annotate service.A_JournalEntryItemBasic with {
  Ledger @Common.Label: 'Ledger'
};

annotate service.A_JournalEntryItemBasic with {
  FiscalYearPeriod @Common.Label: 'Fiscal Year Period'
};

annotate service.A_JournalEntryItemBasic with {
  FiscalPeriod @Common.Label: 'Fiscal Period'
};

annotate service.A_JournalEntryItemBasic with {
  GLAccount @Common.Label: 'G/L Account'
};

annotate service.A_JournalEntryItemBasic with {
  CostCenter @Common.Label: 'Cost Center'
};

annotate service.A_JournalEntryItemBasic with {
  ProfitCenter @Common.Label: 'Profit Center'
};

annotate service.A_JournalEntryItemBasic with {
  BusinessArea @Common.Label: 'BusinessArea'
};

annotate service.A_JournalEntryItemBasic with {
  FunctionalArea @Common.Label: 'FunctionalArea'
};

annotate service.A_JournalEntryItemBasic with {
  Customer @Common.Label: 'Customer'
};

annotate service.A_JournalEntryItemBasic with {
  WBSElement @Common.Label: 'WBSElement'
};
