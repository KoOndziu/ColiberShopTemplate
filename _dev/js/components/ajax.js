/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

export default class Ajax {
  constructor(promises = []){ 
    if(Ajax.exists){ 
      return Ajax.instance 
    } 
    this.promises = promises;
    Ajax.exists = true; 
    Ajax.instance = this; 
    return this 
  }
  
  abortPreviousRequests() {
    this.promises.forEach( (promise) => {
      promise.abort();
    });
  };
  
  sendRequest(action, data)
  {
    this.abortPreviousRequests();
    return $.ajax({
      url: action.url,
      method: 'POST',
      data: data,
      dataType: 'json',
      beforeSend: (jqXHR) => { this.promises.push(jqXHR); }
    }).then((resp) => {
      if (typeof action.type == 'function') {
        window[action.type](resp);
      }
    }).fail((resp) => {
      prestashop.emit('handleError', {eventType: action.type, resp: resp});
    });
  }
}