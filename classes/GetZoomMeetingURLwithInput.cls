global class GetZoomMeetingURLwithInput {

   @InvocableMethod(callout=true label='Get Zoom Meeting URL with Input' description='Returns a meeting URL For Zoom')
   global static List<String>  makeApiCalloutwithInput()
   {

       HttpRequest req = new HttpRequest();

       Http http = new Http();

       //Setup the Endpoint and append the name of the file

       req.setEndpoint('callout:zoom');

       req.setMethod('POST');

       req.setHeader('Content-Type','application/json');

       req.setHeader('Accept','*/*');

       req.setHeader('Accept-Encoding','gzip, deflate, br');

        /* Setup the Parameters for Meetings, subject, etc. */

       // Note: The initial demo only utilized the title, further development can use other inputs.


       String inTitle = '"Technical intervie"';

       system.debug('inTitle =' + inTitle);   

      // String inAgenda = '"' + inputZoomsParms.get(0) + '"';

       //system.debug('inAgenda =' + inAgenda);              

       //String inPwd = '"' + inputZoomsParms.get(1) + '"';

       //system.debug('inPwd =' + inPwd);               

       //String inStart = '"' + inputZoomsParms.get(2) + '"';

       //system.debug('inStart =' + inStart);               

       //String inEnd = '"' + inputZoomsParms.get(3) + '"';

       //system.debug('inEnd =' + inEnd);

       //Setup the JSON Body – in the test just set a subject, can add more through Postman or other tests

       // req.setBody('{“topic":' + inTitle + ,"type": “1"}');       

       req.setBody('{"topic": "test create meeting","type": "1"}');       

       //req.setBody('{}');

       System.debug('Body: ' + req.getBody());

       System.debug('Endpoint Value: '+ req.getEndpoint());

       System.debug('Request: ' + req);

       HTTPResponse res = http.send(req);

       System.debug('Response Body: '+res.getBody());

       /* Parse Response */

       JSONParser parser = JSON.createParser(res.getBody());

       String webLink;

       webLink = 'ZoomNotSetup';

       while (parser.nextToken() != null) {

       if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&

       (parser.getText() == 'join_url')) {

           parser.nextToken();

           webLink = parser.getText();

           System.debug('join_url= ' + webLink);

           }

       }

   // Apex Actions Return. The method signature for an invocable method requires a List of Strings to be returned.

   return new List<String>{webLink};
}
   }