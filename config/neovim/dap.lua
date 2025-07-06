local dap = require("dap")

dap.configurations.c = {
  {
    type = "c",
    request = "launch",
    name = "Launch current file",
    program = "${file}"
  },
  {
    type = "c",
    request = "launch",
    name = "Launch main file",
    program = "${workspaceFolder}/main.c"
  }
}
