@AbapCatalog.sqlViewName: 'ZIFESTAT000288'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Status view entity'
@ObjectModel.resultSet.sizeCategory: #XS
define view ZI_FE_STAT_000288
  as select from zfe_astat_000288 as Status
{
  @UI.textArrangement: #TEXT_ONLY
  @ObjectModel.text.element: [ 'TravelStatusText' ]
  key Status.travel_status_id as TravelStatusId,
  
  @UI.hidden: true
  Status.travel_status_text as TravelStatusText
}
