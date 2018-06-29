-----------------------------------
-- Almost equal
-----------------------------------

-- You may want to compare float like this

-- assert.are.almost_equal(<a>, <b>, <diff>)
-- assert.are.almost_equal(0.0001, 0.0002, 0.001) -- true
-- assert.are.almost_equal(0.0001, 0.0002, 0.0001) -- false

-- In this case uncomment the following lines

-- local say = require("say")
-- local function almost_equal(state, arguments)
--     local has_key = false
--     a, b, diff = unpack(arguments)
--     if diff == nil then
--         error("almost_equal required 3 args: a, b, max_difference")
--     end
--     return math.abs(a - b) < diff
-- end

-- say:set("assertion.almost_equal.positive", [[Expected
--     %s to be almost equal to
--     %s
--     with max difference = %s"]])
-- say:set("assertion.almost_equal.negative", [[Expected
--     %s to not be almost equal to
--     %s
--     with max difference = %s]])
-- assert:register(
--     "assertion",
--     "almost_equal",
--     almost_equal,
--     "assertion.almost_equal.positive",
--     "assertion.almost_equal.negative"
-- )

--------------------------------------

-----------------------------------
-- A test case example
-----------------------------------

describe("a test example", function()
    before_each(function()
        -- box.space.my_space:truncate()
    end)

    it("a test", function()
        assert.is_true(true)
        assert.are.equal(1, 1)
    end)
end)
