$(() => {
    addEventListener()
  })
  
  const addEventListener = () => {
    $('.all_clients').on('click', event => {
      event.preventDefault()
        fetch(`/clients.json`)
        .then(resp => resp.json())
        .then(data => console.log(data))
    //   history.pushState(null, null, "clients")
    //   getClients()
  
    })
  
//     $(document).on('click', ".show_link", function(e) {
//       event.preventDefault()
//       $('#app-container').html('')
//       let id = $(this).attr('data-id')
//       fetch(`/clients/${id}.json`)
//       .then(res => res.json())
//       .then(client => {
//         let newclient = new client(client)
  
//         let clientHtml = newclient.formatShow()
  
//         $('#app-container').append(clientHtml)
//       })
//     })
  
//     $(document).on('click', 'next-client', function() {
//       let id = $(this).attr('data-id')
//       fetch(`clients/${id}/next`)
  
//     })
//   }
  
//   const getClients = () => {
//     fetch(`/clients.json`)
//       .then(resp => resp.json())
//       .then(clients => {
//          $('#app-container').html('')
//          clients.forEach(client => {
//            let newClient = new Client(client)
  
//            let clientHtml = newClient.formatIndex()
  
//            $('#app-container').append(clientHtml)
//          })
//       })
//   }
  
//   function Client(client) {
//     this.id = client.id
//     // this.title = client.title
//     // this.content = client.content
//     // this.user = client.user
//     // this.comments = client.comments
  
  
//   }
  
//  Client.prototype.formatIndex = function(){
//     let clientHtml = `
//       <a href="/clients/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.title}</h1></a>
//     `
//     return clientHtml
//   }
  
//   Client.prototype.formatShow = function(){
//     let clientHtml = `
//       <h3>${this.title}</h3>
//     `
//     return clientHtml
  }