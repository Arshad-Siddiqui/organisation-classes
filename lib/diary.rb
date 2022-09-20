class Diary
  def initialize
    @entry_list = []
  end

  def add(entry)
    title, contents = entry.split(': ')[0], entry.split(': ')[1]
    @entry_list.push ({
      :title => title,
      :contents => contents
    })
  end

  def list
    @entry_list.map { |entry|
      entry[:title]
    }.join(', ')
  end

  def view(title)
    @entry_list.each do |entry|
      if entry[:title] == title
        return entry[:contents]
      end
    end
  end

  def entry_to_read(wpm, minutes) # e.g. 2 and 2
    words_to_read = wpm * minutes # e.g. 4
    entries_readable = @entry_list.select {|entry|
      p entry[:contents].split.length
      entry[:contents].split.length <= words_to_read
    } # Filters array for things less than what user can read

    entries_readable.sort_by {|entry|
      entry[:contents].split.length
    }[-1][:title] #Returns title of longest string that didn't get
    # filtered
  end

  def see_everything
    @entry_list.map {|entry|
      entry[:contents]
    }.join(', ')
  end
end
