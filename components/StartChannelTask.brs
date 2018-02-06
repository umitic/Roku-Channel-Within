Sub Init()
    Print "StartChannelTask " ; "init()"
    m.top.functionName = "executeTask"
    
End Sub

Function executeTask()
    Print "StartChannelTask " ; "StartChannel()"
    
    deviceInfo = CreateObject("roDeviceInfo")
    deviceIP = deviceInfo.GetIPAddrs().eth1

    urlString = "http://" + deviceIP + ":8060/launch/12"     
    
    request = CreateObject("roUrlTransfer")
    request.SetUrl(urlString)
    request.AsyncPostFromString(urlString)
    
End Function