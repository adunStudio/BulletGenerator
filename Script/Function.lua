function GetImageScaleForNewDimensions(image, newWidth, newHeight)
    local currentWidth, currentHeight = image:getDimensions()

    return (newWidth / currentWidth), (newHeight / currentHeight)
end

function GetAngle(x1, y1, x2, y2)
    return math.deg(math.atan2(y1 - y2, x1 - x2))
end
