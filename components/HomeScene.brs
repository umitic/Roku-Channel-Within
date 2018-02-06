sub init()
    print "HomeScreen " ; "init()"
    m.button = m.top.findNode("button")
    m.layoutTop = m.top.findNode("layoutTop")
    
    m.button.setFocus(true)
    m.startChannelTask = createObject("roSGNode", "StartChannelTask")
    m.button.observeField("buttonSelected","onButtonSelected")
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press 
    if (key = "down") 
        m.button.setFocus(true)
    else if (key = "up")
        m.keyboard.setFocus(true)
    end if
  end if
  return handled
end function

sub onButtonSelected()
    print "HomeScreen " ; "onButtonSelected()"
    
    m.startChannelTask.control = "RUN"
    
end sub