trigger checkCVByManager on Candidate__c (before update) {
if ((trigger.old[0].Step__c == 'Check CV by Manager') && (trigger.old[0].created_interview__c == false)  ){
if(trigger.new[0].created_interview__c == false)
{
trigger.new[0].adderror('You have to choose your dates of disponibilty first ');
}
 

}
}