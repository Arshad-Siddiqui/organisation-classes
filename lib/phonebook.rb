class Phonebook
  def initialize
    @list = []
  end

  def scan(diary)
    # Saves all occurances of phone numbers to @list
    @list = diary.see_everything.scan(/\d{11}/)
  end

  def view
    # Returns list of all phone numbers separated by commas
    @list.join(', ')
  end
end