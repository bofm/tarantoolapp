local fio = require('fio')
local luarocks_util = require('luarocks.util')

local function merge_tables(t, ...)
	for _, tt in ipairs({...}) do
		for _, v in ipairs(tt) do
			table.insert(t, v)
		end
	end
	return t
end


local function isroot(s)
	if s == nil or s == '' then
		return false
	else
		return string.sub(s, 1, 1) == '/'
	end
end


local function slashends(s)
	return string.sub(s, -1, -1) == '/'
end


local function abspath(p,b)
	if p == nil then return nil end
	if isroot(p) then
		return p
	end
	return fio.abspath(fio.pathjoin(b, p))
end


local function get_workdir(def)
	local workdir
	if #arg > 1 then
		error('Either 0 or 1 argument is expected')
	elseif #arg == 1 then
		workdir = arg[1]
	else
		workdir = def
	end
	
	if isroot(workdir) then
		return workdir
	end
	
	local cur = fio.cwd()
	
	if workdir == '.' then
		return cur
	end
	
	return fio.abspath(fio.pathjoin(cur, workdir))
end

return {
	merge_tables = merge_tables,
	isroot = isroot,
	slashends = slashends,
	abspath = abspath,
	get_workdir = get_workdir
}