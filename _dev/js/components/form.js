/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-26 sie 2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

import $ from 'jquery';

export default class Form {
  init(){
    this.parentFocus();
    this.togglePasswordVisibility();
      this.formValidation();

  }

  parentFocus() {
    $('.js-child-focus').focus(function () {
      $(this).closest('.js-parent-focus').addClass('focus');
    });
    $('.js-child-focus').focusout(function () {
      $(this).closest('.js-parent-focus').removeClass('focus');
    });
  }

  togglePasswordVisibility() {
    $('button[data-action="show-password"]').on('click', function () {
      var elm = $(this).closest('.input-group').children('input.js-visible-password');
      if (elm.attr('type') === 'password') {
        elm.attr('type', 'text');
        $(this).attr('title', ($(this).data('textHide')) );
      } else {
        elm.attr('type', 'password');
        $(this).attr('title', ($(this).data('textShow')) );
      }

    });
  }
  formValidation(){
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      let forms = document.getElementsByClassName('needs-validation');

      if(forms.length > 0){
          console.log(supportedValidity());
          if(!supportedValidity()){
              return;
          }
      // Loop over them and prevent submission
          let divToScroll = false;

          let validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                  event.preventDefault();
                  event.stopPropagation();
                  $('input:invalid,select:invalid,textarea:invalid',form).each(function( index ) {
                      var _field = $( this ),
                          _parent = _field.parents('.form-group').first();
                      $('.js-invalid-feedback-browser',_parent).text(_field[0].validationMessage);
                       if(!divToScroll){
                           divToScroll = _parent;
                       }
                  });
              }
              form.classList.add('was-validated');
              if(divToScroll){
                  $('html, body').animate({ scrollTop: divToScroll.offset().top}, 0);
                  divToScroll = false;
              }
          }, false);
      });

      }
  }
}

const supportedValidity = function () {
    var input = document.createElement('input');
    return ('validity' in input && 'badInput' in input.validity && 'patternMismatch' in input.validity && 'rangeOverflow' in input.validity && 'rangeUnderflow' in input.validity && 'tooLong' in input.validity && 'tooShort' in input.validity && 'typeMismatch' in input.validity && 'valid' in input.validity && 'valueMissing' in input.validity);
};


