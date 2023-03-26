local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.DevPackages.TestEZ)

TestEZ.TestBootstrap:run(
	{
		ReplicatedStorage.Packages.carSeatFrenchFry
	},
	TestEZ.Reporters.TextReporter
)