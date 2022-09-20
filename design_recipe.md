# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

## 2. Design the Class System

Diary <- entrees
^
|
TodoList
_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌─────────────────────────────────────────────────────┐   ┌──────────────────────────────────────┐
│                                                     │   │                                      │
│  Diary                                              │   │  TodoList                            │
│                                                     │   │                                      │
│  - init ~ creates empty array                       │   │  add(string)                         │
│  - add(entry) ~ string (converts to hash)           │   │  view ~ comma separated string       │
│  - list ~ return list of all titles                 │   │                                      │
│                                                     │   │                                      │
│  - view(title) ~ return content                     │   │                                      │
│  - entry_to_read(wpm, minutes)~ title + contents    │   └──────────────────────────────────────┘
│  - get_phone_numbers - return list of phone numbers │
└─────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────┐
│                                                    │
│  PhoneBook                                         │
│                                                    │
│  - add phone numbers(diary)                        │
│                                                    │
│  - view list of all phone numbers                  │
│                                                    │
│                                                    │
│                                                    │
│                                                    │
│                                                    │
└────────────────────────────────────────────────────┘
```

```ruby
class Diary
  def initialize
    @entry_list = []
  end

  def add(entry) # entry is a string
    # Entry gets converted to a hash and first part becomes title with second
    # being contents
    # Returns nothing
  end

  def list
    # Returns a list of titles from entry_list array as a string
  end
  
  def view(title) # title belongs to entry_list
    # Returns corresponding contents when given title.
  end

  def entry_to_read(wpm, minutes)
    # Returns largest entry that isn't larger than what the user
    # can read at the time.
  end
end

class TodoList
  def initialize
    list = []
  end

  def add(todo)
    # Adds a string to the list
  end

  def view
    # returns comma separated string of all todos
  end
end

class PhoneBook
  def initialize
    @list = []
  end

  def scan(diary)
    # Takes diaries as an argument and scans through the contents
    # and saves any instances of phone numbers into the list
  end

  def view
    # lists all phone numbers with commas.
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
diary = Diary.new
phone_book = PhoneBook.new
diary.add('Monday: Did some coding')
diary.add('Tuesday: Text this dude 07777777777')
diary.add('Wednesday: 08888877777')
phone_book.scan(diary)
phone_book.view -> '07777777777, 08888877777'

# I don't see the classes interacting beyond this

# Not an integration test

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a diary and tests available methods

diary = Diary.new
diary.add('Monday: Did some coding')
diary.add('Tuesday: Text this dude 07777777777')
diary.add('Wednesday: 08888877777')
diary.list -> 'Monday, Tuesday, Wednesday'

diary = Diary.new
diary.add('Monday: Did some coding')
diary.add('Tuesday: Text this dude 07777777777')
diary.add('Wednesday: 08888877777')
diary.list -> 'Monday, Tuesday, Wednesday'
diary.view('Tuesday') -> 'Text this dude 07777777777'

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
