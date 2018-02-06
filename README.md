# Channel-Within
Launch a Roku channel from within another Roku channel

Launching one application from another on Roku platform sounds pretty cool right?
It also sounds complicated, especially if you are following Roku Documentation.
So I will try to explain it as simple as possible.
In this article I will focus only on part of the code that is responsible for launching another channel.

Let us start:

First thing first, what you are actually doing when You are launching Roku channel from within another channel is basically sending URL request to your Roku device.
Nothing fancy there, right?
To be able to do this we will use Roku External Control API.

Here is the code for launching another app from the Task:

    deviceInfo = CreateObject("roDeviceInfo")
    deviceIP = deviceInfo.GetIPAddrs().eth1

    urlString = "http://" + deviceIP + ":8060/launch/12"     
    
    request = CreateObject("roUrlTransfer")
    request.SetUrl(urlString)
    request.AsyncPostFromString(urlString)

Ok, let me explain this little piece of code:

    deviceInfo = CreateObject("roDeviceInfo")
    deviceIP = deviceInfo.GetIPAddrs().eth1

Here we are creating "roDeviceInfo" object so we could get IP address of Your Roku by calling "deviceInfo.GetIPAddrs().eth1" on it.
GetIPAddrs() - Returns roAssociativeArray. Each key in the Associative Array is the name of a network interface and the value is the IP-address of the interface.
Normally there will be only one interface in the Associative Array and that's why we call it directly with "GetIPAddrs().eth1".

    urlString = "http://" + deviceIP + ":8060/launch/12"

With this string we are creating URL for the launching request. 
What is important here is number "12"!
Number "12" is internal channel ID, in my case it's an ID of the Netflix channel.
You can get internal channel ID from the URL of the channel in the Roku channel Store.
Here is how Netflix one looks like: 
    https://channelstore.roku.com/details/12/netflix
Notice that "12" just after the "/details/" part.
Lets us move on...

    request = CreateObject("roUrlTransfer")
    request.SetUrl(urlString)
    request.AsyncPostFromString(urlString)

This should be straightforward to understand.
We are creating "roUrlTransfer" object, then we have to set URL for the request by passing urlString as argument.
And after that we are calling AsyncPostFromString with urlString as argument.

That is it!
You have just launched Netflix from Your channel! :-)

Just one more thing. Before launching the Netflix channel you will have to have it installed on Your device.
You can do it in "regular/non-developer" way or You can modify urlString variable to instal Netflix from your channel. :-)
You can check Roku Documentation to find more about this: https://sdkdocs.roku.com/display/sdkdoc/External+Control+API#ExternalControlAPI
