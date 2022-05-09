public with sharing class AccController {
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(){
        //string queryParameter= '%' + accountname + '%';
        List<Account> lstAccounts = [select id, name, phone from account limit 10];
        return lstAccounts;
    }
}
