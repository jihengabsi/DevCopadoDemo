trigger change on Job_Request1__c (before update) {
if ((trigger.old[0].Application_Status__c == 'Pending') || (trigger.old[0].Application_Status__c =='OK')||(trigger.old[0].Application_Status__c =='Rejected')){
for (Job_Request1__c acc: Trigger.new) {
if (  acc.Job_File__c != trigger.old[0].Job_File__c || acc.LOS__c != trigger.old[0].LOS__c || acc.Number_of_positions_budgeted__c != trigger.old[0].Number_of_positions_budgeted__c|| acc.Name != trigger.old[0].Name || acc.Practice__c != trigger.old[0].Practice__c|| acc.Responsible__c != trigger.old[0].Responsible__c || acc.Seniority__c != trigger.old[0].Seniority__c) 
{trigger.new[0].adderror('you cant update this record');
}
}
}
}