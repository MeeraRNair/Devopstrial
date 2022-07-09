public without sharing class  AccountList { //comment new for push new new one
    //Demo - Apexhoues
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name,Type,Rating,Phone FROM Account];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountListByName(String Name) {
    // String searchText = '%'+Name+'%';
       // return [SELECT Id, Name,Type,Rating,Phone,Active__c FROM Account where Name Like :searchText WITH SECURITY_ENFORCED];
       String query = 'SELECT Id, Name,Type,Rating,Phone,Active__c FROM Account where Name Like \'%'+String.escapeSingleQuotes(Name)+'%\' ';
       List<Account> res =  Database.query(query);
       return res;
    }
//function to create contact
    @AuraEnabled
    public static String createContact(Contact con) {
        System.debug(con);
      /* if(Schema.sObjectType.Contact.isCreateable()){
           //check field level security
           SObjectAccessDecision securityDecision = Security.stripInaccessible(
                                         AccessType.CREATABLE, new List<Contact>{con});

            // No exceptions are thrown and no rating is set
            insert securityDecision.getRecords();
            String conid;
            for(sobject conrec : securityDecision.getRecords()){
                conid = (String)conrec.get('id');
            }
            return conid;*/
           insert con;
           return con.Id;
       /* }
        else{
            return 'No Access';
        }*/
        
        
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList(String accID) {
        return [SELECT Id, Name,StageName,CloseDate FROM Opportunity where AccountId = :accID];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, FirstName,LastName,Email FROM Contact];
    }
}
