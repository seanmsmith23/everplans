// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  var inputs = [];
  var submit;

  var findInputs = function(){
    $('input').each(function(index, element){
      if ($(element).attr('type') == 'text'){
        inputs.push(element)
      } else if ($(element).attr('type') == 'submit'){
        submit = element;
      }
    })
  };

  var inputsAreFilled = function(){
    valid = true;
    for (var i = 0; i < inputs.length; i++){
      if ($(inputs[i]).val() == ""){
        valid = false
      } else {
        valid = true;
      };
      if (valid == false) {
        break;
      } else {
        valid = true;
      }
    }
    return valid;
  };

  var setButton = function(){
    if (inputsAreFilled()){
      $(submit).attr('disabled', false);
    } else {
      $(submit).attr('disabled', true);
    }
  };

  var formContainer = $('#form-container');

  var newQuestion = function(){
    var currentQuestions = formContainer.attr('data-questions');
    var questionNum = parseInt(currentQuestions) + 1;
    updateQuestionCount(questionNum);

    var label = '<label for="questionnaire_questions_attributes_'+ questionNum + '_name">Question ' + (questionNum + 1) + ' </label>';
    var input = '<input id="questionnaire_questions_attributes_' + questionNum + '_name" name="questionnaire[questions_attributes][' + questionNum + '][name]" type="text">';

    return label + input
  };

  var updateQuestionCount = function(newCount){
    formContainer.attr('data-questions', newCount);
  };

//  ENABLE AND DISABLE BUTTON IF FORM FIELDS ARE FILLED OR UNFILLED

  findInputs();
  setButton();

  $(window).keyup(function(){
    setButton();
    console.log("clicked")
  });

//  ADD A NEW QUESTION INPUT WHEN "ADD QUESTION" IS CLICKED

  $('.add-question').click(function(e){
    e.preventDefault();
    $('.questions').append(newQuestion());
    findInputs();
    setButton();
  });
});
