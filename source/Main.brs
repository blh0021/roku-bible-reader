sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    scene = screen.CreateScene("BibleReader")
    screen.show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msg.isListItemSelected()
            print "selected"
        end if 
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

