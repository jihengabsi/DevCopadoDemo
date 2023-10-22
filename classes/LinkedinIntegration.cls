global class LinkedinIntegration {

    @future(callout=true)
        public static void execute() {
            try{
Map<String,Object> mainMap = new Map<String, Object>{
'author'=>'urn:li:person:4Actk8WwCw',
'lifecycleState'=> 'PUBLISHED',
'specificContent' => new Map<String,Object>{
'com.linkedin.ugc.ShareContent' => new Map<String,Object>{
'shareCommentary' => new Map<String,Object>{
'text' => 'hello'
},
'shareMediaCategory' => 'NONE'
}
},
'visibility'=>new Map<String,Object>{
'com.linkedin.ugc.MemberNetworkVisibility' => 'PUBLIC'
}
};

       HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setEndpoint('callout:Linkedin_API_Credential/'+'v2/ugcPosts');
        req.setMethod('POST');
        req.setHeader('Authorization','Bearer AQVcVX3mdrjv7Y6WqXTqI8TECf89McY-S3YUbB0xxMn-kdzkliGNYQOCN3dAXF_ESikIi3DQPkyu1hJxlgtuIoV6ck_uh5rMVL-Zks6Bzhigz4iNdbf_d4S2zbMlQoC8JDSkcOYsjfKBpK7ik0rX2rGaHiuRnedlHk2PkFUrAADOV6q3ijFllYloggeu3dCKtxWXgzcdzX3oPTNiDQcHZRUpx1oXOumWv9qFb_bsa_Ey-yOb-MxpPZU-BYvFWUDaicXZ40DgpVrPpfSWnfi6hR_RGRqs5oXi7xsWgB4rxaAQt_AFynDSaPBRIuVCGBbsgbIVNWAqSazIwfQKM326BCiMkLDrBg');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Accept','application/json'); 
        System.debug('body :::' + JSON.serializePretty(mainMap));
        req.setBody(JSON.serializePretty(mainMap));
    
  HttpResponse response = http.send(req);
  
       System.debug('Statuscode>>'+response.getStatusCode());
       System.debug('Statuscode>>'+response.getBody());
       //process the successful response
       if (response.getStatusCode() == 200){
            //initializing a Map<String,Object> to get Callout response
            Map<String, Object> serializeResponseBody = new Map<String, Object>();
            serializeResponseBody = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('serializeResponseBody>>'+JSON.serializePretty(serializeResponseBody));
        }

 } catch(Exception error){
 Job_Request1__c tsk = new Job_Request1__c();
 tsk.Form_url__c='hello';
 }
      
     }
    
 }