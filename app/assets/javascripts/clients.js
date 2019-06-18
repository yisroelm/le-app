    $(() => {
        addEventListener()
    })
    
    const addEventListener = () => {
    $('.all_clients').on('click', event => {
        event.preventDefault()
        history.pushState(null, null, "clients")
        getClients()

        })

        $(document).on('click', ".show_link", function(event) {
            
            event.preventDefault()
            $('#app-container').html('')
            let id = $(this).attr('data-id')
            fetch(`/clients/${id}/products.json`)
            // return client with their products
            .then(resp => resp.json())
            .then(client => {
                // debugger
            let newClient = new Client(client)
        
            let clientHtml = newClient.formatShow()
        
            $('#app-container').append(clientHtml)
        })
        })
    }
        
    const getClients = () => {
    fetch(`/clients.json`)
        .then(resp => resp.json())
        .then(clients => {
            $('#app-container').html('')
            clients.forEach(client => {
            let newClient = new Client(client)

            let clientHtml = newClient.formatIndex()

            $('#app-container').append(clientHtml)
            })
        })
    }

    function Client(client) {
        this.id = client.id
        this.name = client.name
        this.products = client.products

    }

    Client.prototype.formatIndex = function() {
        console.log(this)
        let clientHtml =  `
        <a href="//clients/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>   
        `
    return clientHtml 
    }

    Client.prototype.formatShow = function() {
        let clientHtml = `
            <h3>${this.name}</h3>
    `
        return clientHtml
    }

