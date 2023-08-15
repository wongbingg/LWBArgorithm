//
//  Class3.swift
//  LWBArgorithm
//
//  Created by 이원빈 on 2023/08/13.
//

import Foundation

struct Class3 {
    
    //https://www.acmicpc.net/problem/2606
    static func p2606() {
        
        let comNum = Int(readLine()!)!
        let numberOfComputerPair = Int(readLine()!)!
        
        var pairDic = [Int: [Int]]()
        
        for num in 1...comNum {
            pairDic[num] = []
        }
        
        for _ in 0..<numberOfComputerPair { // 이 부분에서 문제발생
            // TODO: numberOfComputerPair 가 0 일 경우를 생각하지 못해서 발생한 문제..!!
            let twoNumber = readLine()!.split(separator: " ").map { Int($0)! }
            pairDic[twoNumber[0]]?.append(twoNumber[1])
            pairDic[twoNumber[1]]?.append(twoNumber[0])
        }
        
        var stack = [1]
        var visited: [Int] = []
        
        while stack.count != 0 {
            guard let num = stack.popLast() else { fatalError() }
            
            if !visited.contains(num){
                visited.append(num)
                guard let temp2 = pairDic[num] else { fatalError() }
                stack += temp2
            }
        }

        print(visited.count - 1)
    }
    
    
    // 아래코드가 통과되는 블로그 코드고 위 코드가 내가 작성한 실패 코드이다.
    // 두 코드 차이가 없어보이는데 어디서 차이점이 있는 것일까
    static func answer() {
        
            
        let comNum = Int(readLine()!)!
        let networkNum = Int(readLine()!)!
        
        var network = [Int:[Int]]()
        
        for num in 1...comNum{
            network[num] = []
        }
        
        for _ in 0..<networkNum{
            let temp = readLine()!.split(separator: " ").map({Int($0)!})
            network[temp[0]]?.append(temp[1])
            network[temp[1]]?.append(temp[0])
        }
        
        var visited: [Int] = []
        // 1번 컴퓨터와 연결된 컴퓨터를 찾아야 하기 때문에 시작점을 1로 정의한다.
        var stack: [Int] = [1]
        
        while stack.count != 0 {
            guard let temp = stack.popLast() else { fatalError() }
            if !visited.contains(temp){
                visited.append(temp)
                guard let temp2 = network[temp] else { fatalError() }
                stack += temp2
            }
            
        }
        // 1번 컴퓨터도 감염이 된 것으로 세기 때문에 1번 컴퓨터의 카운팅은 빼준다
        print(visited.count - 1)
    }
}

