////
////  UpdatesPageList.swift
////  CTA Practice2.0
////
////  Created by 2 GO Participant on 11/6/24.
////
//
//import SwiftUI
//
//struct UpdatesPageList: View {
//        var body: some View {
//            NavigationSplitView {
//                List(Updates) { update in
//                    NavigationLink {
//                        UpdatesDetails(update: update)
//                    } label: {
//                        UpdatesPageRow(updatespage: update)
//                    }
//                }
//                .navigationTitle("Updates")
//            } detail: {
//                Text("Select an update")
//            }
//        }
//    }
//
//    #Preview {
//        UpdatesPageList()
//    }
