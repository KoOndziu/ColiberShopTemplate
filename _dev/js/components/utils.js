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

export default class Utils {
  static createSpin(spinnerSelector = 'input[type="number"]')
  {
    $.each($(spinnerSelector), function (index, spinner) {
       $(spinner).TouchSpin({
          buttondown_class: 'js-touchspin icon-minus icon-only',
          buttonup_class: 'js-touchspin icon-plus icon-only',
          buttondown_txt: '',
          buttonup_txt: '',
          min: parseInt($(spinner).attr('min'), 10),
          max: 1000000
      });
    });
  };
  
  static camelize(subject) {
    let actionTypeParts = subject.split('-');
    let i;
    let part;
    let camelizedSubject = '';

    for (i = 0; i < actionTypeParts.length; i++) {
      part = actionTypeParts[i];
      if (0 !== i) {
        part = part.substring(0, 1).toUpperCase() + part.substring(1);
      }
      camelizedSubject = camelizedSubject + part;
    }
    return camelizedSubject;
  }
  
  static isLoad(selector) {
    $(selector).addClass('is--loading');
  }
  static isLoaded(selector) {
    $(selector + '.is--loading').removeClass('is--loading');
  }
}