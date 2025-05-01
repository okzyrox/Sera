local Sera = require(game.ReplicatedStorage.Sera)

local Schema = Sera.Schema({
	Health = Sera.Int16,
	Position = Sera.Vector3,
	Name = Sera.String8,
	Ids = Sera.Float64Table,
	Names = Sera.String32Table
})

local largeidtable = {}
for i=1, 150 do
	table.insert(largeidtable, i)
end

local serialized, error_message = Sera.Serialize(Schema, {
	Health = 150,
	Position = Vector3.new(1001, 69, 0.1),
	Name = "loleris",
	Ids = largeidtable,
	Names = {"test", "test2", "test3"}
})

if error_message ~= nil then
	error(error_message)
end

local deserialized = Sera.Deserialize(Schema, serialized :: buffer)

print(`Serialized buffer size: {buffer.len(serialized :: buffer)} bytes`)
print(`Serialized: `, serialized)
print(`Deserialized:`, deserialized)
