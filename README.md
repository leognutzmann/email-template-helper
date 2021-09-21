# Email Template Helper

This is a simple email template helper that will replace all tags with object values.
It allows standard/custom objects or fields.

## Template body syntax
All fields need to have the following syntax: {!object.field}

Example:
```
Hello {!Account.LastName}, how are you? 
I'm here to warn you that {!Account.Name} has an {!Contract.Status} contract term 
{!Contract.ContractTerm} with a new case: {!Case.Subject}
```

## Usage

```java
EmailTemplateHelper.format( htmlBody, new List<SObject> { SObject1, SObject2, CustomSObject3 } );
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
