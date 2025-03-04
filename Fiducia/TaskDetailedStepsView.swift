//
//  TaskDetailedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//
import SwiftUI

struct TaskDetailedStepsView: View {
    
    @Binding var task: Task
    @State var showSummarised = false
    @State var stepCount = 0
    
    var body: some View {
        NavigationLink(destination: TaskSummarisedStepsView(task: $task), isActive: $showSummarised) {
        }
        .buttonStyle(PlainButtonStyle())
        .navigationTitle(task.name)
        .navigationBarItems(
            trailing: Button(action: {
                showSummarised = true
            }, label: {
                Image(systemName: "list.bullet.rectangle")
            }
                             )
            )
        
        if stepCount + 1 <= task.steps.count {
            Spacer()
            Text(task.steps[stepCount])
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.blue.opacity(0.1))
            Spacer()
            if stepCount + 1 < task.steps.count {
                Button(action: {
                    stepCount += 1
                }, label: {
                    Text("next")
                    
                })
            } else {
                Button(action: {
                    stepCount += 1
                }, label: {
                    Text("complete")
                })
        }
        
        } else {
            Text("congrats")
            }
    }
}



struct TaskDetailedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailedStepsView(task: .constant(Task(name: "Make a call", difficulty: 1, steps: ["hi"])))
    }
}
