trigger AgentInsertTrigger on Agent__c (after insert) {
   Task[] aTasks = new List<Task>();
    for (Agent__c aAgent : trigger.new ) { 
        Date endDate = Date.valueOf(aAgent.Start_Date__c);
        if ( endDate.format() < date.today().format()){
            Task newTask = new Task();
            newTask.Subject ='Agent End Date is Over';           
            newTask.status = 'In progress';
            newTask.Priority = 'Normal';
            aTasks.add(newTask);
            //aTasks.add(new Task(Subject='Agent End Date is Over', ActivityDate=Date.today()));
        }
    }
    if (aTasks.size()>0) insert aTasks;
}