trigger linkedinR on Recruitment_Campaign2__c (after insert) {
System.debug('body ligne 2');

 for (Recruitment_Campaign2__c opp: Trigger.new) {
 String recordUrl = opp.Id;

   // Build the request body as needed
String requestBody = '{"author": "urn:li:person:4Actk8WwCw","commentary": "PWC TAC Tunisia is hiring a '+opp.Poste__c+' you can apply from here: https://resourceful-impala-vb4srp-dev-ed.trailblaze.my.site.com/s/candidate?id='+recordUrl+'&type=Linkedin Here is a quick description of the job: '+opp.Description__c+'","visibility": "CONNECTIONS", "distribution": {"feedDistribution": "MAIN_FEED","targetEntities": [],"thirdPartyDistributionChannels": [] },"lifecycleState": "PUBLISHED","isReshareDisabledByAuthor": false }'  ;

System.debug('req:'+requestBody);
   // Call the future method to perform the HTTP POST request
   MyFutureClass.makeHttpPostRequest('callout:Linkedin_API_Credential/'+'rest/posts', requestBody);
   System.debug('after future');
 

    }
       
}