////
////  TipListService.swift
////  TipsSwift
////
////  Created by Alexey Olefir on 14.08.2022.
////
//
//import CoreData
//import Foundation
//
//class TipListService {
//
//    private let container: NSPersistentContainer
//    private let containerName: String = "TipsDataModel"
//    private let entityName: String = "TipsEntity"
//
//    static var shared: TipListService = {
//        let instance = TipListService()
//        return instance
//    }()
//
//    private var viewContext: NSManagedObjectContext {
//        return container.viewContext
//    }
//
//    private init() {
//        container = NSPersistentContainer(name: containerName)
//        container.loadPersistentStores { (_, error) in
//            if let error = error {
//                print("Error loading Core Data! \(error)")
//            }
//        }
//    }
//
//    func add(title: String, description: String) {
//        let entity = TipsEntity(context: viewContext)
//        entity.title = title;
//        entity.descr = description;
//        entity.isChecked = false;
//        entity.id = UUID();
//        save()
//    }
//
//    func delete(id: NSManagedObjectID) {
//        do {
//            let objectToDelete = try viewContext.existingObject(with: id)
//            container.viewContext.delete(objectToDelete)
//            save()
//        } catch {
//            fatalError("Object with this id doesn't exist")
//        }
//    }
//
//    func toggle(id: NSManagedObjectID) {
//        do {
//            let objectToToggle = try viewContext.existingObject(with: id) as! TipsEntity
//            objectToToggle.isChecked.toggle()
//            save()
//        } catch {
//            fatalError("Object with this id doesn't exist")
//        }
//    }
//
//
//    func getTipsList() -> [TipModel] {
//        let request = NSFetchRequest<TipsEntity>(entityName: entityName)
//        do {
//            let result = try viewContext.fetch(request)
//            return result.map {
//                TipModel(
//                    id: $0.objectID,
//                    title: $0.title!,
//                    descriprion: $0.descr!,
//                    isDone: $0.isChecked
//                )
//            }
//        } catch let error {
//            fatalError("Error fetching Entities. \(error)")
//        }
//    }
//
//    private func save() {
//        do {
//            try viewContext.save()
//        } catch let error {
//            fatalError("Error saving to Core Data. \(error)")
//        }
//    }
//}
//
//extension TipListService: NSCopying {
//    func copy(with zone: NSZone? = nil) -> Any {
//        return self
//    }
//}
