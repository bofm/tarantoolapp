local tnt = require "tests.tnt"

tnt.cfg{
    wal_mode = 'write',
    checkpoint_interval = 0,
}

local code = require "busted.runner" {standalone = false}

-- print(tnt.log())

tnt.finish()

os.exit(code)
