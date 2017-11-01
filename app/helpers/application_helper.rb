module ApplicationHelper
    def showQuestions(subgenre_id)
        question = Question.where(subgenre_id: subgenre_id)
    end
end
    
