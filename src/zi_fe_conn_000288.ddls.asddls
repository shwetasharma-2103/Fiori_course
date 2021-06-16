@AbapCatalog.sqlViewName: 'zifeconn000288'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection view entity'
@Search.searchable: true
define view ZI_FE_CONN_000288
  as select from zfe_aconn_000288 as Connection
  association [1..1] to zi_fe_carr_000288 as _Airline on $projection.AirlineID = _Airline.AirlineID
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8 
  @ObjectModel.text.association: '_Airline'
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_carr_000288', 
      element: 'AirlineID'
    }
  } ]
  key Connection.carrier_id as AirlineID,
  
  key Connection.connection_id as ConnectionID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Airport', 
      element: 'AirportID'
    }
  } ]
  Connection.airport_from_id as DepartureAirport,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Airport', 
      element: 'AirportID'
    }
  } ]
  Connection.airport_to_id as DestinationAirport,
  
  Connection.departure_time as DepartureTime,
  
  Connection.arrival_time as ArrivalTime,
  
  @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
  Connection.distance as Distance,
  
  @Semantics.unitOfMeasure: true
  Connection.distance_unit as DistanceUnit,
  
  _Airline
}
