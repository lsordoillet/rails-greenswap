import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

// import consumer from "./consumer";

// const messagesContainer = document.getElementById('messages');
// if (messagesContainer) {
//   const id = messagesContainer.dataset.chatroomId;

//   consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//     received(data) {
//       messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
//     }
//   });
// }

export { initChatroomCable };