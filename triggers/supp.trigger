trigger supp on Job_Request1__c (before delete) {
if ((trigger.old[0].Application_Status__c == 'Pending') || (trigger.old[0].Application_Status__c =='OK')||(trigger.old[0].Application_Status__c =='Rejected')){
trigger.new[0].adderror('you cant delete this record');
}
}