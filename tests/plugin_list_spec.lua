package.path = package.path .. ';./lua/?.lua;./lua/?/init.lua'

local plugin_list = require('plugins.plugin_list')

describe('plugin list', function()
  it('has string plugin names', function()
    for i, plugin in ipairs(plugin_list) do
      assert(
        type(plugin[1]) == 'string',
        string.format('Plugin entry %d should have a string as the first element', i)
      )
    end
  end)
end)

