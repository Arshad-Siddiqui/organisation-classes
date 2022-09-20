require 'diary'
require 'phonebook'

RSpec.describe 'Diary integration with Phonebook' do
  describe '#scan' do
    it 'saves all occurances of phone numbers to phonebook array' do
      diary = Diary.new
      phone_book = Phonebook.new
      diary.add('Monday: Did some coding')
      diary.add('Tuesday: Text this dude 07777777777')
      diary.add('Wednesday: 08888877777')
      phone_book.scan(diary)
      expect(phone_book.view).to eq '07777777777, 08888877777'
    end

    context "there are 3 phone numbers" do
      it 'saves all phone numbers to phonebook' do
        diary = Diary.new
        phone_book = Phonebook.new
        diary.add('Monday: Did some coding')
        diary.add('Tuesday: Text this dude 07777777777')
        diary.add('Wednesday: 08888877777')
        diary.add('Thursday: 01113334445')
        phone_book.scan diary
        expect(phone_book.view).to eq '07777777777, 08888877777, 01113334445'
      end
    end
  end
end
