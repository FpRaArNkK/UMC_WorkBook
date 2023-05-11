let input = "one4seveneight"

enum Nums: Int, CaseIterable{
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    
    var description: String {
        return "\(self)"
    }
}


//while input.startIndex < input.endIndex {
    for num in Nums.allCases { //Nums의 모든 case 순회
        let numStr = num.description //Nums case의 case이름 가져오기
        let ranges = input.ranges(of: numStr)
        
        if ranges.count <= 0 { continue }
        
        for i in 0..<ranges.count {
            if ranges[i].upperBound < ranges[i+1].lowerBound {
                print("number : \(input[ranges[i].upperBound..<ranges[i+1].lowerBound])")
            }
            print("result : \(input[ranges[i]])")
        }
            
    }
//
