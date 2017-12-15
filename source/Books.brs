  function init()
    m.top.setFocus(true)
    m.myLabel = m.top.findNode("myLabel")
    m.myVerses = m.top.findNode("myVerses")
    m.myLabel.setFocus(true)
    m.books = m.top.findNode("books")
    m.verses = m.top.findNode("verses")
    m.theWord = m.top.findNode("theWord")
    addBooks()
  end function
  
  sub bookList() as Object
    text=ReadAsciiFile("pkg:/data/books.json")
    return ParseJSON(text)  
  end sub
  
  sub addBooks()
    books = bookList()
    for each book in books
        addItem(book)
    end for   
  end sub
  
  sub addItem(itemtext as string)
      item = m.books.createChild("ContentNode")
      item.title = itemtext
  end sub
  
  function onKeyEvent(key as String, press as Boolean) as Boolean
    books = bookList()
    if (press = true) then
        if (key = "OK") then 
            if (m.myLabel.visible = true) then
                print books[m.myLabel.focusedChild.itemFocused]
                m.myLabel.visible = "false"
                addVerses()
                m.myVerses.visible = "true"
                m.myVerses.setFocus(true)
            else if (m.myVerses.visible = true) then
                print m.myVerses.focusedChild.itemFocused + 1
                m.myVerses.visible = "false"
                m.theWord.visible = "true"
                displayText()
            end if
            
        end if
    end if
  end function

  sub addVerses()
     verses=["1", "2", "3", "4"]
     for each verse in verses
        item = m.verses.createChild("ContentNode")
        item.title = verse
     end for
  end sub
  
  sub displayText()
    'm.theWord.text = "Matthew"
    print "Matthew"
  end sub