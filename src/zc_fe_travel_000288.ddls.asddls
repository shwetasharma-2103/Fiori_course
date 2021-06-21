@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']

define root view entity ZC_FE_TRAVEL_000288
  as projection on ZI_FE_TRAVEL_000288
{
  key TravelUUID,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  @EndUserText.label: 'Travel ID'
  @ObjectModel.text.element: ['Description']
  TravelID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Agency', 
      element: 'AgencyID'
    }
  } ]
  @EndUserText.label: 'Agency'
  @ObjectModel.text.element: ['AgencyName']
  AgencyID,
  _Agency.Name as AgencyName,
  
  @EndUserText.label: 'Customer'
  @ObjectModel.text.element: ['CustomerName']
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Customer', 
      element: 'CustomerID'
    }
  } ]
  CustomerID,
  _Customer.LastName as CustomerName,
  
  @EndUserText.label: 'Start Date'
  BeginDate,
  
  @EndUserText.label: 'End Date'
  EndDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  @EndUserText.label: 'Total Price'
  TotalPrice,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  
  Description,
  
  @EndUserText.label: 'Status'
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'ZI_FE_STAT_000288', 
      element: 'TravelStatusId'
    }
  } ]
  @ObjectModel.text.element: ['StatusText']
  OverallStatus,
  _TravelStatus.TravelStatusText as StatusText,
  
  OverallStatusCriticality,
  
  CreatedBy,
  
  CreatedAt,
  
  LastChangedBy,
  
  @EndUserText.label: 'Last Changed At'
  LastChangedAt,
  
  LocalLastChangedAt,
  
  _Booking : redirected to composition child ZC_FE_BOOKING_000288,
  
  _Agency,
  
  _Currency,
  
  _Customer,
  
  _TravelStatus
}
