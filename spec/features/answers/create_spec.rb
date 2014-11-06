feature 'Create Answers' do

  before do
    @question = FactoryGirl.create :question, text: 'hey, whats your name kid?'
  end

  context 'when I vist new answer' do

    before do
      visit new_answer_path
    end

    it 'should show me a question' do
      expect(page).to have_content 'hey, whats your name kid?'
      expect(current_path).to eq new_question_answer_path(@question)
    end

    it 'should allow me to answer the question' do
      fill_in :answer_text, with: 'well Im andy'
      click_on 'Save answer'

      expect(current_path).to eq question_answers_path(@question)
      expect(page).to have_content 'well Im andy'
      expect(page).to have_content 'anonymous'

      expect(Answer.count).to eq 1
      @question.reload

      expect(@question.answers.first.text).to eq 'well Im andy'
    end

    it 'should allow me to answer the question with a name' do
      fill_in :answer_text, with: 'well Im andy'
      fill_in :answer_name, with: 'bob'
      click_on 'Save answer'

      expect(current_path).to eq question_answers_path(@question)
      expect(page).to have_content 'well Im andy'
      expect(page).to have_content 'bob'

      expect(Answer.count).to eq 1
      @question.reload

      expect(@question.answers.first.text).to eq 'well Im andy'
      expect(@question.answers.first.name).to eq 'bob'
    end

    it 'should validate answer text' do
      click_on 'Save answer'

      expect(page).to have_content "You haven't answered the question yet"
      expect(Answer.count).to eq 0

      expect(page).to have_content 'hey, whats your name kid?'
    end

  end

end
