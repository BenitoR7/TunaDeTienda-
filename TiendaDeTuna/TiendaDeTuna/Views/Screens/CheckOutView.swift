import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: OrderViewModel
    @ObservedObject private var viewModel = FirebaseViewModel()
    @ObservedObject var navigationManager = NavigationManager.shared
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    @State var dest: AnyView? = nil
    @State private var opacity: Double = 0
    @State private var phoneNumber: String = ""
    @State private var additionalNotes: String = ""
    @State private var selected = false
    @State private var showAlert = false
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                }
                Spacer()
                Text("Por favor ingrese su información para completar el pedido.")
                    .fontWeight(.bold)
                    .padding()
                Form {
                    CustomTextField(
                        placeholder: Text("Su nombre").foregroundColor(.blue),
                        text: $authenticationViewModel.customerName )
                    .padding(.leading, 12)
                    .foregroundColor(.blue)
                    .frame(height: 35)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1))
                    CustomTextField(
                        placeholder: Text("Su Número")
                            .foregroundColor(.blue),
                        text: $authenticationViewModel.phoneNumber
                    )
                    .padding(.leading, 12)
                    .foregroundColor(.blue)
                    .frame(height: 35)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1))
                    Text("¿Instrucciones adicionales?")
                        .fontWeight(.bold)
                    TextEditor(text: $additionalNotes)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1))
                    Toggle("Marque la casilla si es para entregar.", isOn: $selected)
                        .toggleStyle(CheckboxToggleStyle(style: .circle))
                        .foregroundColor(.blue)
                    if selected == true {
                        CustomTextField(
                            placeholder: Text("Direcciones").foregroundColor(.blue),
                            text: $phoneNumber)
                        .padding(.leading, 12)
                        .foregroundColor(.blue)
                        .frame(height: 35)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1))}
                    Button(action:
                            {self.showAlert = true
                        print("additionalNotes\(additionalNotes)")
                        //self.viewModel.addNewData(checkOutField: authenticationViewModel.customerName)
                        self.viewModel.addNewData(name: authenticationViewModel.customerName, phoneNum: authenticationViewModel.phoneNumber)
                    })
                    {Text("pedido")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: 280)
                            .background(Color.blue)
                            .cornerRadius(15)
                        .padding()}
                    .opacity(authenticationViewModel.isValidForm() && authenticationViewModel.isValid1
                             && authenticationViewModel.isValid2 ? 1.0 : 0.0 )
                    .disabled( !authenticationViewModel.isValidForm() || !authenticationViewModel.isValid1
                               || !authenticationViewModel.isValid2)
                    .alert(isPresented: $showAlert)
                    {  Alert( title: Text("Alerta:"),
                              message: Text("¡Tu pedido ha sido enviado!"),
                              dismissButton: Alert.Button.default(
                                Text("Presiona ok aquí!"),
                                action:
                                    { self.dest = AnyView(OrderCompleted())
                                        if let dest = self.dest {
                                            self.navigationManager.move(to: dest)
                                            self.isPresented = false
                                            order.reset()}}  )) }}
                Spacer()}
            .navigationBarItems(
                leading:
                    Text("🍣 terminar orden")
                    .foregroundColor(.blue)
                    .font(.custom("GillSans", size: 20)),
                trailing:
                    Button
                { isPresented.toggle()} label:
                    {Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                            .frame(width: 34, height: 34)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 1))}
                    .padding(.horizontal, 25)  )} }}

//
//func checkout() {
//    // Checkout = empty cart item
//    for item in cart.items {
//        bookAvailable(id: item.item.id)
//    }
//    cart = Cart(items: [], numberOfItems: 0, total: 0)
//}



//struct CheckOutView_Previews: PreviewProvider
//{
//
//    @State static var isPresented = true
//
//    static var previews: some View {
//        CheckOutView( isPresented: $isPresented)
//    }
//}
