@isTest
private class TopAccountsControllerTest {

    @isTest
    static void testTopAccountsPositiveScenario() {
        List<Account> testAccounts = new List<Account>();
        // Create 12 accounts
        for (Integer i = 0; i < 12; i++) {
            testAccounts.add(new Account(
                Name = 'Test Account ' + i,
                AnnualRevenue = (i % 3 == 0) ? null : (10000 * (12 - i)) // Vary revenue, some null
            ));
        }
        insert testAccounts;

        Test.startTest();
        List<Account> resultAccounts = TopAccountsController.getTopAccounts();
        Test.stopTest();

        System.assertEquals(10, resultAccounts.size(), 'Should return 10 accounts when more than 10 exist.');

        // Verify sorting: highest non-null revenue should be first
        Decimal maxRevenue = 0;
        for(Account acc : testAccounts){
            if(acc.AnnualRevenue != null && acc.AnnualRevenue > maxRevenue){
                maxRevenue = acc.AnnualRevenue;
            }
        }
        System.assertEquals(maxRevenue, resultAccounts[0].AnnualRevenue, 'First account should have the highest revenue.');

        // Verify descending order
        for (Integer i = 0; i < resultAccounts.size() - 1; i++) {
            Decimal currentRevenue = resultAccounts[i].AnnualRevenue == null ? -1 : resultAccounts[i].AnnualRevenue; // Treat nulls as very low for comparison
            Decimal nextRevenue = resultAccounts[i+1].AnnualRevenue == null ? -1 : resultAccounts[i+1].AnnualRevenue;
            System.assert(currentRevenue >= nextRevenue, 'Accounts should be sorted by AnnualRevenue descending, nulls last.');
        }
    }

    @isTest
    static void testTopAccountsLessThanTen() {
        List<Account> testAccounts = new List<Account>();
        // Create 5 accounts
        for (Integer i = 0; i < 5; i++) {
            testAccounts.add(new Account(
                Name = 'Test Account LT ' + i,
                AnnualRevenue = 5000 * (i + 1)
            ));
        }
        insert testAccounts;

        Test.startTest();
        List<Account> resultAccounts = TopAccountsController.getTopAccounts();
        Test.stopTest();

        System.assertEquals(5, resultAccounts.size(), 'Should return 5 accounts when 5 exist.');
        System.assertEquals(testAccounts[4].AnnualRevenue, resultAccounts[0].AnnualRevenue, 'First account should have the highest revenue.');
         // Verify descending order
        for (Integer i = 0; i < resultAccounts.size() - 1; i++) {
            Decimal currentRevenue = resultAccounts[i].AnnualRevenue == null ? -1 : resultAccounts[i].AnnualRevenue;
            Decimal nextRevenue = resultAccounts[i+1].AnnualRevenue == null ? -1 : resultAccounts[i+1].AnnualRevenue;
            System.assert(currentRevenue >= nextRevenue, 'Accounts should be sorted by AnnualRevenue descending.');
        }
    }

    @isTest
    static void testTopAccountsNoAccounts() {
        Test.startTest();
        List<Account> resultAccounts = TopAccountsController.getTopAccounts();
        Test.stopTest();

        System.assertEquals(0, resultAccounts.size(), 'Should return 0 accounts when none exist.');
    }
}
