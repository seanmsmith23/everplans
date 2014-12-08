// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  var formContainer = $('#form-container');

  $('.add-question').click(function(e){
    e.preventDefault();
    $('.questions').append(newQuestion());
  });

  var newQuestion = function(){
    var currentQuestions = formContainer.attr('data-questions');
    var questionNum = parseInt(currentQuestions) + 1;
    updateQuestionCount(questionNum);

    return '<p>Question</p><input id="questionnaire_questions_attributes_' + questionNum + '_name" name="questionnaire[questions_attributes][' + questionNum + '][name]" type="text">';
  };

  var updateQuestionCount = function(newCount){
    formContainer.attr('data-questions', newCount);
  }
});
