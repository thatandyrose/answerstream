# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  before do
    @question = FactoryGirl.create :question, text: 'hey, whats your name kid?'
  end

  context 'when I vist the home page' do

    before do
      visit root_path
    end

    it 'should show me the new answer page' do
      expect(current_path).to eq new_question_answer_path(@question)
    end

  end

end
