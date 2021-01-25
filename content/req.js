"use strict"

if (APPUTIL == undefined) {
   let APPUTIL = {};
}

APPUTIL.Requester = class {
   constructor() {}

   GET(path) {
      return this.request('GET', path);
   }

   POST(path, data) {
      return this.request('POST', path, data);
   }

   PUT(path, data) {
      return this.request('PUT', path, data);
   }

   DELETE(path) {
      return this.request('DELETE', path);
   }

   request(method_name, path, data = null) {
      let fetch_object;
      if (data != null) {
         let header = new Headers();
         header.append('Content-Type', 'application/json');
         fetch_object = fetch(path, {
            method: method_name,
            headers: header,
            cache: 'no-cache',
            body: JSON.stringify(data)
         });
      } else {
         fetch_object = fetch(path, {
            method: method_name,
            cache: 'no-cache'
         });
         return fetch_object.then(response => {
            if (response.headers.get('Content-Type') == 'application/json') {
               return response.json();
            } else {
               if (response.ok) {
                  return response.text();
               } else {
                  return Promise.resolve({
                     status: response.status
                  });
               }
            }
         })
         .catch(err => {
            console.log('[Requester] fetch-Problem: ', err.message);
            return Promise.reject({
               status: 500,
               error: err
            });
         });
      }
   }
}