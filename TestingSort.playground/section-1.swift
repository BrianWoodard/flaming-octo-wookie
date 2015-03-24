// BFW Code Answer for Ryan Wenger / Brickell
// Written for Swift's playground on Tuesday March 24 2015
import UIKit

//Time values are distributed between 1-100, with a size of 1-10
let TIME : Int = 90;
let NUMBER_OF_ITEMS : Int = 100;

//setup some tuples to store the individual data objects
typealias dataObject = (data: String, start: Int, end: Int);
var dataSet:Array<dataObject>! = [], result:Array<dataObject>! = [];

print("\n\nGenerated random data...");
dataSet = generateRandomData(dataSet);
print("\nSorting data based on start time...");
dataSet = sortData(dataSet);
print("\nFinding values that include target time (\(TIME))\n");
result = findTime(dataSet,TIME);
print("\nFinal result:\n");
//print result
for element in result {
    print("\(element)\n ")
}
print("Finished!");

//generate some random data, put them into tuples,
//then put the tuples in a 50 element array
func generateRandomData(var data:Array<dataObject>) -> Array<dataObject>{
    var arrayOfRandomData:Array<String> = ["i've", "got", "a", "lovely","bunch","of","cocoanuts"];
    for var i = 0; i<NUMBER_OF_ITEMS; i+=1{
        var startTime = Int(arc4random_uniform(100));
        var windowOfTime = Int(arc4random_uniform(20))+1;
        var tempTupe: dataObject = (arrayOfRandomData[Int(arc4random_uniform(6))],startTime,startTime+windowOfTime);
        data.append(tempTupe);
    }
    return data;
}

//sort the array based on the second value (start time) of each tuple
func sortData(var dataSet:Array<dataObject>) -> Array<dataObject>{
    dataSet.sort { $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 };
    return dataSet;
}
// you could do a search using a pivot value, then selecting the half above and below, 
// but writting the logic to detect the various cases sounded like a pain, this 
// is nearly as good (stop searching once you pass all valid items)
func findTime(var dataSet:Array<dataObject>, var time:Int) -> Array<dataObject>{
    for element in dataSet {
        if((element.start<=TIME)&&(element.end>=TIME)){
            result.append(element);
        }
        
        if(element.start<TIME)&&(element.end<TIME){
            break;//we have passed the sorted list
        }
    }
    return result
}
