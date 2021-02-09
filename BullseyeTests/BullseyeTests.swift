//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Diana  on 12/25/20.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive() {
        // given
        // assert inital conditionds hold true
        let expectedScore = 95
        let _guess = game.target + 5
        
        // when
        let _score = game.points(sliderValue: _guess)
        
        // then
        XCTAssertEqual(_score, expectedScore)
        
        //
        
        // given
        let guess = game.target + 5
        
        // when
        let score = game.points(sliderValue: guess)
        
        // then
        
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact() {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    
    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderBoardEntries.count, 1)
        XCTAssertEqual(game.leaderBoardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderBoardEntries.count, 2)
        XCTAssertEqual(game.leaderBoardEntries[0].score, 200)
        XCTAssertEqual(game.leaderBoardEntries[1].score, 100)
        
    }
    
}

