###########################################################################
### Routing
###########################################################################

##In the layout window, click on Route -> Core Routing and Optimization

route_opt -effort high

##Save the cel and report timing

save_mw_cel -as fpu_route
report_placement_utilization > reports/fpu_route_util.rpt
report_qor_snapshot > reports/fpu_route_qor_snapshot.rpt
report_qor > reports/fpu_route_qor.rpt

##POST ROUTE OPTIMIZATION STEPS

##Goto Layout Window, Route -> Verify Route
verify_route

