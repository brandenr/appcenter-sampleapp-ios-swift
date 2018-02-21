
import XCTest
import AppCenterXCUITestExtensions

class sampleapp_ios_swiftUITests: XCTestCase {
    
    let app = ACTLaunch.launch()!
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSwipeUntilCrashesPage() {
        // Assert that the crash button exists
        XCUIApplication().otherElements.containing(.pageIndicator, identifier:"page 1 of 7").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCUIApplication().otherElements.containing(.pageIndicator, identifier:"page 2 of 7").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCUIApplication().otherElements.containing(.pageIndicator, identifier:"page 3 of 7").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCUIApplication().otherElements.containing(.pageIndicator, identifier:"page 4 of 7").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        
        app/*@START_MENU_TOKEN@*/.buttons["fatalErrorButton"]/*[[".buttons[\"Send a sample crash\"]",".buttons[\"fatalErrorButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["The app will close"].buttons["Cancel"].tap()
    }
    
}
