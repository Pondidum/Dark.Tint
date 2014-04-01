local addon, ns = ...

ns.features.mapping.add(function(model, config)

  model.map:SetMaskTexture(ns.lib.textures.normal)

  function GetMinimapShape()
    return "SQUARE"
  end

end)
