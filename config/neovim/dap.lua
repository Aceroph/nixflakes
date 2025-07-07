local dap = require("dap")

dap.configurations.c = {
  {
    type = "c",
    request = "launch",
    name = "Launch current file",
    program = "${file}"
  }
}
dap.adapters.c = {
  type = 'executable',
  command = 'gdb',
  args = { '--quiet', '--eval-command', 'set print pretty on' },
}
