require 'diary'

RSpec.describe Diary do
  describe '#add' do
    it 'adds entries to the array' do
      diary = Diary.new
      diary.add('Monday: Go to sleep')
      expect(diary.list).to eq 'Monday'
    end
  end

  describe '#view' do
    it 'returns contents when given title' do
      diary = Diary.new
      diary.add('Monday: Go to sleep')
      expect(diary.view('Monday')).to eq 'Go to sleep'
    end
  end

  describe '#list' do
    it 'returns multiple contents in a comma separated list' do
      diary = Diary.new
      diary.add('Monday: Go to sleep')
      diary.add('Tuesday: Pair programming')
      expect(diary.list).to eq 'Monday, Tuesday'
    end
  end

  describe '#entry_to_read' do
    it 'returns the largest contents which is not larger than what user can read' do
      diary = Diary.new
      diary.add('Monday: Go to sleep')
      diary.add('Tuesday: Pair programming')
      diary.add('Wednesday: an amount of words that is closer to 10') # 9 words
      diary.add('Thursday: an amount of words')
      expect(diary.entry_to_read(2, 5)).to eq 'Wednesday' # User will have to use view to see this
    end # User can only read 4 words so in this case Wednesday with 4 words
  end

  describe '#see_everything' do
    it 'returns all the contents in a comma separated list' do
      diary = Diary.new
      diary.add('Monday: Go to sleep')
      diary.add('Tuesday: Pair programming')
      diary.add('Wednesday: an amount of words that is closer to 10')
      expect(diary.see_everything).to eq 'Go to sleep, Pair programming, an amount of words that is closer to 10'
    end
  end
end