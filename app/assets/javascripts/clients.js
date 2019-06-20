    $(() => {
        clickOnLink()
    })
    
    const clickOnLink = () => {
    $('.all_clients').on('click', event => {
        event.preventDefault()
        // history.pushState(null, null, "clients")
        getClients()

        })

        $(document).on('click', ".show_link", function(event) {
            
            event.preventDefault()
            $('#app-container').html('')
            let id = $(this).attr('data-id')
            fetch(`/clients/${id}.json`)
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

    const newForm = () => {
        $("#new_client").on("submit", function(event) {
        event.preventDefault()

        const values = $(this).serialize()

        $.post("/clients", values).done(function(data) {
            $('#app-container').html(' ')
            const newClient = new Client(data)
            const addHtml = newClient.formatShow()
               
            $('#app-container').html(addHtml)

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
        this.age = client.age
        this.products = client.products

    }

    Client.prototype.formatIndex = function() {
        let clientHtml = `
        <a href="//clients/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>   
        `
    return(clientHtml) 
    }

    Client.prototype.formatShow = function() {
        let clientHtml = `
            Name: <h3>${this.name}</h3>
            Age: <h3>${this.age}</h3>
            `
        
        let productHtml = this.products.map(product => {
            return (` 
           <h3> Product ID: ${product.id}</h3>
            <h3>Product Name: ${product.name}</h3>
                `)
        }).join("")

        return(clientHtml + productHtml)
    }
