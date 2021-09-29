//
//  GetCallsData.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation
import CoreData
import SwiftUI


struct GetCallsResponse: Codable {
	var spacecrafts: [GetCallsData]
}

struct GetCallsData: Codable {
	var id: String?
}

//public class SpaceCraft: NSManagedObject {
//	convenience init(
//		context: NSManagedObjectContext,
//		id: String = "loading ..."
//	) {
//		// CoreData stuff
//		let entity = NSEntityDescription.entity(forEntityName: "SpaceCraft", in: context)!
//		self.init(entity: entity, insertInto: context)
//		// Object data
//		self.id = id
//	}
//
//	convenience init(
//		context: NSManagedObjectContext
//	) {
//		self.init(
//			context: context,
//			id: "loading ..."
//		)
//	}
//}
//
//
extension SpaceCraft {
	enum Request: RawRepresentable {
		case all
		case withid(id: String)

		typealias RawValue = NSFetchRequest<SpaceCraft>

		init?(rawValue: NSFetchRequest<SpaceCraft>) {
			return nil
		}

		var rawValue: NSFetchRequest<SpaceCraft> {
			switch self {
			case .all:
				let request: NSFetchRequest<SpaceCraft> = SpaceCraft.fetchRequest()
				request.sortDescriptors = []
				return request
			case .withid(id: let id):
				let request: NSFetchRequest<SpaceCraft> = SpaceCraft.fetchRequestWithId(id: id)
				request.sortDescriptors = []
				return request
			}
		}
	}
}
//

extension SpaceCraft {
//	@NSManaged public var id: String
//
//	/// Fetches all courses
//	public class func fetchRequest() -> NSFetchRequest<SpaceCraft> {
//		NSFetchRequest<SpaceCraft>(entityName: "SpaceCraft")
//	}

	/// Fetches courses with given UUID value
	public class func fetchRequestWithId(id: String) -> NSFetchRequest<SpaceCraft> {
		let fetchSpaceCraft: NSFetchRequest<SpaceCraft> = self.fetchRequest()
		fetchSpaceCraft.predicate = NSPredicate(format: "%K == %@", "id", id as CVarArg)

		return fetchSpaceCraft
	}
//
//	/// Fetches courses with the given mark result
//	public class func fetchPassedCourses(withMark mark: Int) -> NSFetchRequest<Course> {
//		let fetchCourses: NSFetchRequest<Course> = self.fetchRequest()
//		fetchCourses.predicate = NSPredicate(format: "mark == %i", mark)
//		return fetchCourses
//	}
}
