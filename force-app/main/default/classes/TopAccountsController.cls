public with sharing class TopAccountsController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts() {
        return [
            SELECT Id, Name, AnnualRevenue
            FROM Account
            ORDER BY AnnualRevenue DESC NULLS LAST
            LIMIT 10
        ];
    }
}
