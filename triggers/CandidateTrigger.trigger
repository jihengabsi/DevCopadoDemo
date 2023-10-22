trigger CandidateTrigger on Candidate__c (after update) {
 List<Candidate_update_event__e> eventList = new List<Candidate_update_event__e>();
    
    for (Candidate__c acc : Trigger.new) {
        Candidate_update_event__e event = new Candidate_update_event__e();
        // Set necessary field values in the event based on the updated Account record
        event.CandidateId__c = acc.Id;
        eventList.add(event);
    }
    
    if (!eventList.isEmpty()) {
        EventBus.publish(eventList);
    }
}