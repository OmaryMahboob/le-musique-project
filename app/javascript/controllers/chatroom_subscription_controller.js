import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    const currentUserId = this.currentUserIdValue
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => {
        const position = data.user_id == currentUserId ? "right" : "left"
        // const color = data.user_id == currentUserId ? "speech-bubble-sender" : "speech-bubble-receiver"
        const message = `<div style="text-align: ${position};" >
                           ${data.data}
                         </div>`
        this.messagesTarget.insertAdjacentHTML("beforeend", message)
      } }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
