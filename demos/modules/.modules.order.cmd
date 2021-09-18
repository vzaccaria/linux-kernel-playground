cmd_/demos/modules/modules.order := {   echo /demos/modules/hello.ko; :; } | awk '!x[$$0]++' - > /demos/modules/modules.order
