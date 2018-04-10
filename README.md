# ILSJsonParser
ILSJsonParser helps you parse your response data as NSDictionary,NSArray,String,Number,Boolean which your response key it is just initials the ILSJsonParser with your required response data or any other json data and also added the subscripts to further extend your sub dictionaries or sub arrays.ILSJsonParser also has a error variable which gives you the error if your expected key doesn't return any value

## Installation

### Compatibility

-  iOS 9.0+

- Xcode 9.0+, Swift 4+

#### Manual installation
1. Download and drop the 'ILSJsonParser.framework' into your Xcode project.
2. Make Sure you add it by Embedded Binaries
3. Please Set Enable Bitcode as NO during app submission
4. Import ILSJsonParser to your respective Classes

## Note
- Use the ILSJsonParser.framework in the folder 'AppStore Submission Framework' when you are submitting your application to the appstore

## Usage

1. Create a variable of ILSJsonParser
```swift
var parser:ILSJsonParser?
```

2. Initialialize your parser whenever you recieve your response(json) data
```swift
let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
if error == nil
{
let result : AnyObject?
do
{

self.parser = ILSJsonParser(parsedData: data!)[0]["title"]

```

3. Just get the kind of data you need from your respective response data
```swift
self.getdatawithtoken(servicename:"https://jsonplaceholder.typicode.com/todos"
) { (status, result, error) in

//if it is dictionary
print(self.parser?.parsedDictionary ?? "No Dictionary")
//if it is Array
print(self.parser?.parsedArray ?? "No Array")
//if it is String
print(self.parser?.parsedString ?? "No String")
//if it is NSNumber
print(self.parser?.parsedNumber ?? "No Number")
//if it is Boolean
print(self.parser?.parsedBool ?? "No Boolean")

print(self.parser?.parsedError ?? "No Error")
}
```
