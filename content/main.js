"use strict"

class View_Detail {
   constructor(element, template_name) {
      this.element = element;
      this.template_name = template_name;
   }

   render(id) {
      let path = "/app/" + id;
      let requester = new APPUTIL.Requester();
      
   }
}