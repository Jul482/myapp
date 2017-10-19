class ZCL_ZS4H276_SALESORDERITEM_995 definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZS4H276_SALESORDERITEM_995 IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZS4H276_SALESORDERITEM_995| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20171018140324.
  endmethod.
ENDCLASS.
