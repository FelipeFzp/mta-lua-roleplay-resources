local function handleOnAirdropMakerHit()
    playSFX("script", 20, 1, false)
end
addEvent("onAirdropMarkerHit", true)
addEventHandler("onAirdropMarkerHit", localPlayer, handleOnAirdropMakerHit)