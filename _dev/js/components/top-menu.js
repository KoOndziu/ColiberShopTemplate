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

export default class TopMenu {
    constructor(el) {
        this.el = el;
    }
    init() {
    let self = this;
      self.el.hoverIntent({
          over: self.toggleClassSubMenu,
          out: self.toggleClassSubMenu,
          selector: ' > li',
          timeout:100
      });
    }

    toggleClassSubMenu(){
        let _item = $(this);
        let expanded = _item.attr('aria-expanded');
        if(typeof expanded !=="undefined"){
         expanded = (expanded.toLowerCase() === 'true');
        _item.toggleClass('menu__item--active').attr('aria-expanded',!expanded);
        $('.menu-sub',_item).attr('aria-expanded',!expanded).attr('aria-hidden',expanded);
        }

    }
}
