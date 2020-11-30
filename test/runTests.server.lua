local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestService = game:GetService("TestService")

local TestEz = require(TestService.TestEz)

TestEz.TestBootstrap:run({
    ReplicatedStorage.Structures;
})