for _, player in pairs(game.Players:GetPlayers()) do
    local a = player.Character
    if a then  
        
        Instance.new("SpecialMesh", a["Left Arm"])
        local b = a["Left Arm"].Mesh
        b.Scale = Vector3.new(5, 3, 4)
        b.Offset = Vector3.new(0, 1, 0)
        b.MeshType = Enum.MeshType.Sphere
        wait(0.1)
        
        Instance.new("SpecialMesh", a["Right Arm"])
        b = a["Right Arm"].Mesh
        b.Scale = Vector3.new(5, 3, 4)
        b.Offset = Vector3.new(0, 1, 0)
        b.MeshType = Enum.MeshType.Sphere
        wait(0.1)
        
        Instance.new("SpecialMesh", a["Torso"])
        b = a["Torso"].Mesh
        b.Scale = Vector3.new(1, 10, 25)
        b.Offset = Vector3.new(0, 10, 0)
        b.MeshType = Enum.MeshType.Head
        wait(0.1)
       
        if a:FindFirstChild("Right Leg") then
            a["Right Leg"].Transparency = 1
        end
        if a:FindFirstChild("Left Leg") then
            a["Left Leg"].Transparency = 1
        end
        if a:FindFirstChild("Head") then
            a["Head"].Transparency = 1
        end
    end
end
