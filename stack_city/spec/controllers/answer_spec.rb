require 'rails_helper'

describe AnswersController do
  let!(:user)  {FactoryGirl.create(:user)}
  let!(:question) {FactoryGirl.create(:question)}
  describe "GET #index" do
    context "when on users page" do

      it "assigns all the question's answers to @answers" do
        FactoryGirl.create(:answer, user: user )
        get :index, {user_id: user.id}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has user_id
      end #it end
    end #context end
  end #GET index end

  describe "POST #create" do
    context "when attributes are valid" do
      it 'sucessfully creates an answer' do
        expect{post :create, { question_id: question.id , content: "blah"}}.to change{Answer.all.size}
      end #it end
    end #context end

    context "when attributes are invalid" do
      it 'assigns a newly created but unsaved answer as @answer' do
        expect{ post :create, {question_id: question.id , user: user }}.to change{Answer.all.size}
      end #it end
    end #context end

    context "when user is not logged in" do
      it 'assigns a newly created but unsaved answer as @answer' do
        expect{post :create, {question_id: question.id , content: "blah"}}.to_not change{Answer.all.size}
      end #it end
    end #context end
  end #POST create end

  describe "PUT #update" do
  end #PUT update end

  describe "PATCH #update" do
  end #PATCH update end

  describe "DELETE #destroy" do

    it "assigns the resquested answer as @answer" do
      delete :destroy, { id: answer.id }
      expect(assigns(:answer)).to_eq(answer)
    end #it end

    it "destroys the requested game" do
      expect {delete :destroy, {id: answer.id}}.to change(Answer, :count).by(-1)
    end #it end
    context "when user is not logged in" do
    it "does not assign the resquested answer as @answer" do
      delete :destroy, {id: answer.id }
      expect(assigns(:answer)).to be(nil)
    end #it end
  end
  end #context end
  
end