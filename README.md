# Apex Gherkin Test Utility
A tool used for Salesforce/Apex test units that creates Gherkin language for test self-documentation and generates a valid error message based on same  

Usage:  
1. Create an instance of the Gherkin class in your test class (for example Gherkin g = new Gherkin();)  
1. Use the addGiven, addWhen, or addThen methods to add new requirements  
1. When you assert, the second parameter should be a reference to the Gherkin getErrorMessage with a string argument indicating the nature of the error.  

Example:  
Gherkin g = new Gherkin();  
g.addGiven('there is a valid account');  
  // some test setup code  
g.addWhen('some account value is changed');  
  // some test action code  
g.addWhen('the account is saved');  
  // more test action code  
g.addThen('some other value on the screen should change');  
// expected result  
System.assert(acct.someValue == 'something', g.getErrorMessage('the actual value was ' + someValue);  
  
The assertion above is checking to see if acct.someValue is 'something'. If acct.someValue was actually 'something else', the test assertion will show the following message:  
  
  GIVEN there is a valid account  
  WHEN some account value is changed  
  AND the account is saved  
  THEN some other value on the screen should change  
  BUT the actual value was something else  
