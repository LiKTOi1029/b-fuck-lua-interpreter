__BFFILE = arg[#arg]
__BFCOMMANDS = {
	["+"] = BFAdder,
	["-"] = BFSubtractor,
	["<"] = BFRight,
	[">"] = BFLeft,
	["."] = io.write,
	[","] = io.read,
	["["] = BFLooper,
	["]"] = 0,
}
__POINTER = 1
__BFSTACK = {0}
__BFTABLE = BFFileToTable()

function BFFileToTable()
	local ProcessedFile = io.open(__BFFILE, "r")
	ProcessedFile:read("*all")
	local ParsingTable = {}
	for Position = 1, string.len(ProcessedFile) do
		table.insert(ParsingTable, ProcessedFile:sub(Position,Position))
	end
	return ParsingTable
end

function BFAdder(Cell)
	Cell = Cell + 1
	if Cell > 255 then
		Cell = 0
	end
	return Cell
end

function BFSubtractor(Cell)
	Cell = Cell - 1
	if Cell < 0 then
		Cell = 255
	end
	return Cell
end

function BFRight(Cell)
	__POINTER = __POINTER + 1
	if not __BFSTACK[__POINTER] then
		table.insert(__BFSTACK, __POINTER, 0)
	end
end

function BFLeft(Cell)
	__POINTER = __POINTER - 1
	if not __BFSTACK[__POINTER] then
		table.insert(__BFSTACK, __POINTER, 0)
	end
end

function BFLooper(Cell)
	while Cell > __BFCOMMANDS["]"] do
		
	end
end

function BFReader(Cell)
	Cell = io.read(1)
	return Cell
end

function BFWriter(Cell)
	io.write(Cell)
end

function BFMain()
	local Cell = __BFSTACK[__POINTER]
	for Position, Type in ipairs(__BFTABLE) do
		__BFCOMMANDS[Type](Cell)
	end
end

if #arg ~= 1 then
	error("Expected 1 file input, instead got "..#arg)
end

BFMain()