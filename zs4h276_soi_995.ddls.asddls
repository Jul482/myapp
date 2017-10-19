@AbapCatalog.sqlViewName: 'ZVS4H276_SOI_995'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'S4H276 - SO Line Item - Group 995'

@Metadata.allowExtensions: true
@OData.publish: true

@Search.searchable: true

define view ZS4H276_SalesOrderItem_995 as select from ZS4H276_BusinessPartner_995 {
    
      //ZS4H276_BusinessPartner_995
  key BusinessPartner,
  key _SalesOrder.SalesOrder,
  key _SalesOrder._Item.SalesOrderItem,

      City,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      CompanyName,

      @ObjectModel.foreignKey.association: '_Country'
      Country,

      @Semantics.currencyCode: true
      CurrencyCode,
      SalesOrderCount,

      case
        when SalesOrderCount < 500 then 'S'
        when SalesOrderCount < 2000 then 'M'
        else 'L'
      end  as Classification,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
        amount => _SalesOrder._Item.GrossAmountInTransacCurrency,
        source_currency => _SalesOrder._Item.TransactionCurrency,
        target_currency => CurrencyCode,
        exchange_rate_date => cast('20170714' as abap.dats),
        error_handling => 'SET_TO_NULL'
         ) as ConvertedAmount,

      /* Associations */
      //ZS4H276_BusinessPartner_995
      _SalesOrder,
      _Country


} 
 