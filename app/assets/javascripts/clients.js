   jQuery(() => {
        


    console.log("clients.js")
    
    const clickOnLink = () => {
    $('.all_clients').on('click', event => {
        event.preventDefault()
        history.pushState(null, null, "clients")
        getClients()

    })

    $(document).on('click', ".show_link", function(event) {
            
            event.preventDefault()
            $('#app-container').html('')
            let id = $(this).attr('data-id')
            fetch(`/clients/${id}.json`)
            .then(resp => resp.json())
            .then(client => {
            let newClient = new Client(client)
            
             newClient.products.sort(function(a, b){
                return a.name.localeCompare(b.name);
                // if(a.name < b.name) { return -1; }
                // if(a.name > b.name) { return 1; }
                // return 0
                // debugger
               });
  
            let clientHtml = newClient.formatShow()
        
            $('#app-container').append(clientHtml)
        })
     })

    }

    clickOnLink()

    $("form#new_client").submit(function(event) {
        event.preventDefault()

        const values = $(this).serialize()

        $.post("/clients", values).done(function(data) {

            $('#app-container').html(' ')
            const newClient = new Client(data)
            const addHtml = newClient.formatShow()
                
            $('#app-container').html(addHtml)

        })
    })

        
    const getClients = () => {
    fetch(`/clients.json`)
        .then(resp => resp.json())
        .then(clients => {
            $('#app-container').html('')
            const sortedClients = clients.sort(function(a, b){
                return a.name.localeCompare(b.name);
                // if(a.name < b.name) { return -1; }
                // if(a.name > b.name) { return 1; }
                // return 0
               });

            sortedClients.forEach(client => {
            let newClient = new Client(client)
            
            
            let clientHtml = newClient.formatIndex()

            $('#app-container').append(clientHtml)

            })

               let indexLinksHtml = `
            <a href="/clients/new">Add New Client</a>
            `
            $('#app-container').append(indexLinksHtml)
        
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
        <a href="/clients/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>   
        `
    return(clientHtml) 
    }

    Client.prototype.formatShow = function() {
        let clientHtml = `
        <h3>Name: ${this.name}</h3><br>
        <h3>Age: ${this.age}</h3><br>
            `

            let showLlinksHtml = `
            <a href="/clients">Back to Client</a><br>
            <a href="/clients/${this.id}/edit">Edit Client</a><br>
            <a href="/clients/${this.id}/products/new">Add New Product</a><br>

            `

            let productHtml = this.products.map(product => {
            return (` 
            <h3> Product ID: ${product.id}</h3>
            <h3>Product Name: ${product.name}</h3><br>
                `)
        }).join("")

        return(clientHtml + productHtml + showLlinksHtml)
    }
})
