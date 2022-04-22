import SwiftUI
class OrderViewModel: ObservableObject{
    @Published var showMenu = false
    @Published var items = [TunaModel]()
    
    var total: Double {
        if items.count > 0
        {return items.reduce(0) { $0 + (Double($1.price) * Double($1.quantity)) }}
        else
        {return 0 } }
    
    func add(item: TunaModel)
    { var fl = false
        for index in 0..<items.count
        { if items[index].name == item.name
            {items[index].quantity += 1
            fl = true
            break } }
        
        if !fl
        { items.append(item)
            for index in 0..<items.count
            {  if items[index].name == item.name
                { items[index].quantity += 1
                break }}  } }
    
    func remove(item: TunaModel)
    { var em = true
        for index in 0..<items.count
        {if items[index].name == item.name
            {if items[index].quantity == 1
            { items.remove(at: index)
                em = false
                break}
            else {if items[index].quantity == 0
                {items.remove(at: index)
                em = false
                break }
                else {items[index].quantity -= 1
                    em = false
                    break }  }  }  }
        if em
        { print("empty") }}
    
    func reset() {
        for i in 0..<items.count {
            items[i].quantity = 0 }
        items.removeAll() }}
