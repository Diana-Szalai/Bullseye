import UIKit

var str = "Hello, playground"

struct LeaderBoardEntry {
    let points: Int
    let date: Date
}

var leaderboardEntry: [LeaderBoardEntry] = []
leaderboardEntry.append(LeaderBoardEntry(points: 99, date: Date()))
leaderboardEntry.append(LeaderBoardEntry(points: 45, date: Date()))
leaderboardEntry.sort{ $0.points > $1.points }
print(leaderboardEntry)
