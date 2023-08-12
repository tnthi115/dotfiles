local status_ok, cmp = pcall(require, "cmp")
local plugin_ok, _ = pcall(require, "cmp-conventionalcommits")
if not status_ok or not plugin_ok then
  return
end

cmp.setup.buffer {
  sources = require("cmp").config.sources({ { name = "conventionalcommits" } }, { { name = "buffer" } }),
}
