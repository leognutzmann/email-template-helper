/*
 * @author: Leonardo Pereira - TOPi
 */
@isTest
public with sharing class EmailTemplateHelperTest {
    
    @isTest
    public static void givenHtmlBodyAndObjectsThenCheckIfReplaceValues() {

        String htmlBody = 'Hello {!Account.LastName}, how are you? I\'m here to warn you that {!Account.Name} '
                          + 'has an {!Contract.Status} contract term {!Contract.ContractTerm} '
                          + 'with a new case: {!Case.Subject}';
        
        Account acc = new Account(
            LastName = 'Gnutzmann',
            Phone = '123456789',
            Name = 'acc Name'
        );
                
        Contract contract = new Contract(
            ContractTerm = 24,
			StartDate = date.parse('19/04/2001'),
			Status = 'Active'
        );

        Case caze = new Case(
            Subject = 'test case'
        );

        String bodyReturned = EmailTemplateHelper.format( htmlBody, new List<SObject> { acc, contract, caze } );
        
        System.assert( htmlBody != bodyReturned);
    }
}
