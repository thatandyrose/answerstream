feature 'List Answers' do

  before do
    @question = FactoryGirl.create :question, text: 'hey, whats your name kid?'
    @answer = FactoryGirl.create :answer, text: 'whatever'  
  end

  context 'when I visit the listing page' do
    before do
      visit answers_path
    end

    it 'should show me the answer' do
      expect(page).to have_content 'whatever'
    end

    it 'should have a link to create a new answer' do
      expect(page).to have_selector "a[href='#{new_answer_path}']"
    end
  end

  context 'when I visit the listing page with a display flag' do
    
    before do
      visit answers_path(display:true)
    end

    it 'should show me the answer' do
      expect(page).to have_content 'whatever'
    end

    it 'should not have a link to create a new answer' do
      expect(page).to_not have_selector "a[href='#{new_answer_path}']"
    end

  end

end