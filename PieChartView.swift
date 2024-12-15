

import SwiftUI
import Charts
import Firebase
import FirebaseFirestore

struct PieChartView: View {
    let db = Firestore.firestore()
    @State var lineReports: [LineReport] = []
    var selectedInput: String
    @State var totalReports = 0
   
    var body: some View {
        VStack{
            
            if(lineReports.count < 1){
                Text("Not Enough Data To Analyze...")
                    .frame(height: 300)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
            else{
                Chart(lineReports){ report in
                    SectorMark(
                        angle: .value("Reports", report.totalReports),
                        innerRadius: .ratio(0.618),
                        outerRadius: .ratio(1.0),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(lineColor(line: report.line))
                    
                }
                .chartLegend(.hidden)
                .frame(height: 300)
                .chartBackground{ chartProxy in
                    GeometryReader{ geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack{
                            Text("\(totalReports)")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            Text("Updates Since Creation")
                                .font(.system(size: 16))
                        
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                    
                }
                
            
                chartKey(lineReports: lineReports, selectedInput: selectedInput)
                    .padding(.top, 25)
            }
            
        }
        .padding(.bottom, 200)
        .task{
            if(selectedInput == "All Lines"){
                let reports = await numReportsPerLine()
                print("Reports for all lines: \(reports)")
                lineReports = transformReportsData(reports)
            }
            else{
                let reports = await numReportOneLine(input: selectedInput)
                print("Reports for \(selectedInput): \(reports)")
                lineReports = transformReportsData(reports)
            }
            
            totalReports = await totalReportsAllTime()
        }
        
    }
    
    func colorForReport(report: LineReport) -> Color{
        if(selectedInput == "All Lines"){
            return lineColor(line: report.line)
        }
        else{
            return Color.random
        }
        
    }
}

#Preview {
    PieChartView(selectedInput: "All Lines")
}


struct chartKey: View{
    let lineReports: [LineReport]
    var selectedInput: String
    @State private var totalReports = 0
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            ForEach(lineReports, id: \.line){ report in
                HStack{
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(colorForReport(report: report))
                        .frame(width: 24, height: 24)
                    
                    
                    
                    
                    Text("\(report.line): \(report.totalReports) (\(String(format: "%.2f", (Double(report.totalReports) / Double(totalReports) * 100)))%)")
                        .font(.system(size: 20))
                }
            }
        }
        .task{
//                totalReports = await totalReportsAllTime()
            totalReports = lineReports.reduce(0) { $0 + $1.totalReports }
        }
    }

    func colorForReport(report: LineReport) -> Color{
        if(selectedInput == "All Lines"){
            return lineColor(line: report.line)
        }
        else{
            return Color.random
        }
    }
    
}



