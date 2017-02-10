@isTest
public class PrimaryContactOnContact_Test {

    public static testmethod void PrimaryContactTest()
    {
        Agent__c aAgent = new Agent__c();
        aAgent.Name = 'TestForAgentInsert';
        aAgent.Agent_Role_Name__c = 'Trigger';        
        aAgent.Start_Date__c = Date.valueOf('2017-01-01');
        aAgent.End_Date__c = Date.valueOf('2017-01-08');  
        insert aAgent;
        Test.startTest();
        Task[] aTasks = new List<Task>();
        Task newTask = new Task();
            newTask.Subject ='Agent Trigger Test';           
            newTask.status = 'In progress';
            newTask.Priority = 'Normal';
            aTasks.add(newTask);
        insert aTasks;
        Test.stopTest();
    }
}