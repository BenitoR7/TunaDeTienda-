import SwiftUI
struct ContactInfo: View {
    @Binding var showModal : Bool
    var body: some View {
        VStack {
            HStack
            {Text ("contact informatie")
                    .font(.custom("GillSans", size: 40))
                    .foregroundColor(Color.white)
                    .padding(.trailing,25)
                    .padding(.leading,10)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            Button {showModal.toggle() } label: {Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(Color.blue)
                    .frame(width: 34, height: 34)
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 1))}
            .padding(.horizontal,25)
            .padding(.top,5)}
            MapsUIView().edgesIgnoringSafeArea(.top).frame(height: 150)
            ContactImageView().offset(y: -158).padding(.bottom, -130)
            VStack(spacing:0) {
                VStack (alignment: .leading)
                {Text("Tienda de Tuna")
                        .foregroundColor(.white)
                        .font(.custom("GillSans", size: 40)) }
                List{
                    VStack (alignment: .leading)
                    { HStack {
                        Text("dirección")
                            Spacer()
                            .font(.subheadline)
                        Text("Cl. 2a #69-34 Cali, Colombia")}
                        .padding(.horizontal) }
                VStack{
                  HStack {
                        Text("teléfono")
                            Spacer()
                            .font(.subheadline)
                        Text("+57 323-346-0230")}
                    .padding(.horizontal) }
                VStack{
                    HStack {
                        Text("E-mail")
                            Spacer()
                            .font(.subheadline)
                            .accentColor(.black)
                        Text("info@tienda-de-tuna.xyz")}
                    .padding(.horizontal)} }
                .background(Color.blue)
            VStack{
            HStack (spacing:54){
                Group{
                    Link(destination: URL(string: "https://www.facebook.com/Tienda-De-Tuna-113077381383490")!) {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 50, height: 50)}
                        Link(destination: URL(string: "https://www.instagram.com/tiendadetuna/")!) {
                            Image("instagram")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)}
                            Link(destination: URL(string: "https://twitter.com/TiendaTuna")!) {
                                Image("twitter")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)}}
                         .padding(.top,20) }}
                .padding(.bottom,20)
                Spacer()
                HStack {
                    Text("Desarrollado por:")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("https://site.benrettig.online/")
                        .font(.subheadline)
                        .accentColor(.white)}
                .padding(.horizontal,50)}
            Spacer() }
        .background(Color.blue)}}
//struct ContactInfo_Previews: PreviewProvider {
//    @Binding var showModal : true
//
//    static var previews: some View {
//        ContactInfo(showModal: $showModal)
//    }
//}
