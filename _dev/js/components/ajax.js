/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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