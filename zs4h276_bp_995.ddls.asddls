@AbapCatalog.sqlViewName: 'ZVS4H276_BP_995'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'S4H276 - Business Partner - Group 995'
define view ZS4H276_BusinessPartner_995 as select from snwd_bpa as BuPa 
    
inner join   snwd_ad  as Address on BuPa.address_guid = Address.node_key

  association [0..*] to SEPM_I_SalesOrder_E as _SalesOrder on $projection.BusinessPartner = _SalesOrder.Customer
  association [0..1] to SEPM_I_Country      as _Country    on $projection.Country = _Country.Country
{

  key BuPa.node_key                                           as BusinessPartnerUUID,
      bp_id                                                   as BusinessPartner,
      company_name                                            as CompanyName,
      currency_code                                           as CurrencyCode,

      Address.country                                         as Country,
      concat_with_space(Address.postal_code, Address.city, 1) as City,

      count(distinct _SalesOrder.SalesOrder)                  as SalesOrderCount,

      _SalesOrder,
      _Country
}

where
  bp_role = '01'
group by
  BuPa.node_key,
  bp_id,
  company_name,
  currency_code,
  Address.country,
  Address.postal_code,
  Address.city
    
    
    
    
