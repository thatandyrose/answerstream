feature 'List Answers' do

  before do
    @question = FactoryGirl.create :question, text: 'hey, whats your name kid?'
    @answer = FactoryGirl.create :answer, text: 'whatever'  
  end

  context 'when I visit the listing page' do
    before do
      visit question_answers_path(@question)
    end

    it 'should show me the answer' do
      expect(page).to have_content 'whatever'
    end

    it 'should have a link to create a new answer' do
      expect(page).to have_selector "a[href='#{new_question_answer_path(@question)}']"
    end
  end

end