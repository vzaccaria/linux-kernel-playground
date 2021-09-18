cmd_/demos/modules/Module.symvers := sed 's/\.ko$$/\.o/' /demos/modules/modules.order | scripts/mod/modpost    -o /demos/modules/Module.symvers -e    -w -T -
