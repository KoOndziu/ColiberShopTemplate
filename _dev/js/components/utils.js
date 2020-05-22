/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
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