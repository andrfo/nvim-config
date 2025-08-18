package.path = package.path .. ';./lua/?.lua;./lua/?/init.lua'

local modules = {
  'plugins.colorscheme',
  'plugins.comment',
  'plugins.harpoon',
  'plugins.oil',
  'plugins.lazygit',
  'plugins.treesitter',
  'plugins.telescope',
  'plugins.mason',
  'plugins.copilot_chat',
  'plugins.crates',
  'plugins.rustaceanvim',
  'plugins.markview',
  'plugins.cmp',
}

local function check(spec, module)
  if spec[1] then
    assert(type(spec[1]) == 'string', module .. ' should return a plugin spec with string as first element')
  else
    for i, plugin in ipairs(spec) do
      assert(
        type(plugin[1]) == 'string',
        string.format('Entry %d in %s should have a string as the first element', i, module)
      )
    end
  end
end

describe('plugin specs', function()
  for _, module in ipairs(modules) do
    it(module .. ' has string plugin name', function()
      local spec = require(module)
      check(spec, module)
    end)
  end
end)

