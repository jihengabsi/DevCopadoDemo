public class comboboxWithDataTableClass {
    @AuraEnabled
       public static List<Recruitment_Campaign2__c> getRCForCombobox(){
           List<Recruitment_Campaign2__c> rcList = [Select Id,Name,Deadline__c from Recruitment_Campaign2__c];
           return rcList;
       }
    @AuraEnabled
       public static List<Candidate__c> getAllCandidates(){
           List<Candidate__c> candidateList = [Select Id,Name,First_Name__c,Email__c,Recruitment_Campaign__c,Type_of_diploma__c,Speciality__c,University__c,Seniority__c From Candidate__c];
           return candidateList;
       }
      @AuraEnabled
       public static List<Candidate__c> getCandidates(String selectedRcID,Integer Seniority,List<String> type,List<String> level){
           
             List<Candidate__c> candidateList = [Select Id,Name,First_Name__c,Email__c,Recruitment_Campaign__c,Days_after_deadline__c,Type_of_diploma__c,Speciality__c,University__c,Seniority__c,Education_levelNew__c
                                               From Candidate__c
                                               WHERE Recruitment_Campaign__c = :selectedRcID
                                               AND filter__c = true
                                               AND Education_levelNew__c IN :level
                                               AND Type_of_diploma__c IN :type
                                               AND Seniority__c = :Seniority
                                               ];

           return candidateList;
       }

    @AuraEnabled
       public static List<Candidate__c> getLateCandidates(String selectedRcID,Integer Seniority,List<String> type,List<String> level){
            List<Candidate__c> candidateList = [Select Id,Name,First_Name__c,Email__c,Recruitment_Campaign__c,Days_after_deadline__c,Type_of_diploma__c,Speciality__c,University__c,Seniority__c,Education_levelNew__c
                                               From Candidate__c
                                               WHERE Recruitment_Campaign__c = :selectedRcID
                                               AND filter__c = false
                                               AND Education_levelNew__c IN :level
                                               AND Type_of_diploma__c IN :type
                                               AND Seniority__c = :Seniority
                                               ];
           return candidateList;
       }
    
  
   }