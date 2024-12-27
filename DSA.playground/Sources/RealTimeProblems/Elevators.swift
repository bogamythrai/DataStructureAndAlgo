import Foundation

public enum ElevatorStatus {
    case idle
    case movingUp
    case movingDown
}

public class Elevator {
    let id: Int
    var currentFloor: Int
    var targetFloors: [Int]
    var status: ElevatorStatus

    init(id: Int, currentFloor: Int = 0) {
        self.id = id
        self.currentFloor = currentFloor
        self.targetFloors = []
        self.status = .idle
    }

    func move() {
        guard !targetFloors.isEmpty else {
            status = .idle
            return
        }
        let targetFloor = targetFloors[0]
        if nextFloor > currentFloor {
            currentFloor += 1
            status = .movingUp
        } else {
            currentFloor -= 1
            status = .movingDown
        }
        if currentFloor == targetFloor {
            status = .idle
            targetFloor.removeFirst()
        }
    }
}

class ElevatorSystem {
    let elevators: [Elevator]
    let noOfFloors: [Int]

    init(elevators: [Elevator], floors: [Int]) {
        self.elevators = elevators
        self.noOfFloors = floors
    }

    func requestElevator(_ floor: Int, _ direction: ElevatorStatus) {
        guard floor >= 0 && floor <= noOfFloors else {
            return
        }

        if let bestElevator = findBestElevator(floor, direction) {
            bestElevator.targetFloors.append(floor)
            bestElevator.targetFloors.sorted {
                abs($0 - bestElevator.currentFloor) < abs($1 - bestElevator.currentFloor)
            }
        }
    }

    func findBestElevator(_ floor: Int, _ direction: ElevatorStatus) -> Elevator? {
        var bestElevator: Elevator?
        var minDist = Int.max

        for elevator in elevators {
            if elevator.status == .idle {
                let dist = abs(elevator.currentFloor - floor)
                if dist < minDist {
                    minDist = dist
                    bestElevator = elevator
                }
            } else if elevator.status == direction {
                if elevator.status == .movingUp && floor >= elevator.currentFloor ||
                    elevator.status == .movingDown && floor <= elevator.currentFloor {
                    let dist = abs(elevator.currentFloor - floor)
                    if dist < minDist {
                        minDist = dist
                        bestElevator = elevator
                    }
                }
            }
        }

        return bestElevator
    }

    func step() {
        for elevator in elevators {
            elevator.move()
        }
    }
}


let system = ElevatorSystem(numberOfElevators: 3, numberOfFloors: 10)

system.requestElevator(from: 3, direction: .movingUp)
system.requestElevator(from: 7, direction: .movingDown)
system.requestElevator(from: 1, direction: .movingUp)
