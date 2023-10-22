public class MyFutureClass{
@future(callout=true)
public static void makeHttpPostRequest(String endpoint, String requestBody) {
System.debug('hey');
   Http http = new Http();
   HttpRequest request = new HttpRequest();
   request.setEndpoint(endpoint);
   request.setMethod('POST');
   request.setHeader('Content-Type', 'application/json');
    request.setHeader('Linkedin-Version', '202304');
   
   request.setHeader('Authorization','Bearer AQXR4VyVjpBL7FZ1uIRMPe9QA3lt8VsJxtJZU02EX2zJS1HCtLJoCa15okfi7lsbcfQ5msyCZxaUhLKySfy87LoM5pEv--tVhi3oKv_QHptqsfjYelMbtVYpLtO8Z8f1-fZOPpH2LXS2S7yXkuzMt4n4DX-ZlVj41wRYxAualenX9TcCezDYHc9U_9MhPYn4HjvQbGFuodcJG7Ghg3hSZ1xhxqgrkp0meHGwK7n8dOy19HTTG9JboZx8eHtyrZd8tl9ffE3jSjoLCCuXg2ecazJVm9MbBrc0nhTKibhkWB6h8BVFm1KyIA-3ueBxLwQXWhUh6QYT5sMJWCLRHqGNAjO6a--cZg');
   
   request.setBody(requestBody);
     request.setTimeout(8000);
     HttpResponse response = http.send(request);
  
           System.debug(response.toString());

}
}