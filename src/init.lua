local TweenService = game:GetService("TweenService")

local t = require(script.Parent.t)

local typeCheck = t.tuple(t.instanceOf("Model"), t.TweenInfo, t.CFrame)

local cache = {}

local function carSeatFrenchFry(model, tweenInfo, target)
	assert(typeCheck(model, tweenInfo, target))

	if cache[model] then
		cache[model]:Cancel()
	end

	local propertyTable = {
		Value = target;
	}

	local fakeTarget = Instance.new("CFrameValue")
	fakeTarget.Value = model:GetPivot()
	local tween = TweenService:Create(fakeTarget, tweenInfo, propertyTable)

	local connection = fakeTarget:GetPropertyChangedSignal("Value"):Connect(function()
		model:PivotTo(fakeTarget.Value)
	end)

	tween:Play()
	cache[model] = tween

	local completedConnection
	completedConnection = tween.Completed:Connect(function()
		connection:Disconnect()
		completedConnection:Disconnect()
		fakeTarget:Destroy()
	end)

	return tween
end

return carSeatFrenchFry