/* ------------ Tratando dados de entrada e consumindo API correios---------------- */

const cepInput = document.querySelector("#user-cep")
const cepData = document.getElementById("user-cep")


cepInput.addEventListener("change", () => {
    let cepResponse = cepData.value
    
    cepFormatVerification(cepResponse)
    })

function cepFormatVerification (cepResponse){

    let dashSearch = cepResponse.search('-')
    
    if (dashSearch != -1) {

    let cepToArray = cepResponse.split('')

    let noDashArray = []

    for(number of cepToArray) {

        if (number=="-"){
            continue
        } else {
            noDashArray.push(number)
        }
    }

    const newCep = noDashArray.join('')

    getAddress(newCep)

    }else {
    
    const newCep = cepResponse
    
    getAddress(newCep)
    }

}


async function getAddress (cep) {
    try {
        let response = await fetch(`https://viacep.com.br/ws/${cep}/json/`)
        let data = await response.json()
        const clientStreet = document.querySelector("#user-street")
        clientStreet.value = data.logradouro
        const clientCity = document.querySelector("#user-city")
        clientCity.value = data.localidade
        const clientDistrict = document.querySelector ("#user-district")
        clientDistrict.value = data.bairro
        const clientState = document.querySelector("#user-state")
        clientState.value = data.uf


    }catch (error) {
        throw new Error ('Houve um erro com a requisição')
    }
}


const submitButon = document.querySelector(".submit")
clientData = document.getElementById("user-name")

submitButon.addEventListener("click", () => {
    clientNome = clientData.value
    alert (`Sr.(a) ${clientNome}, dados salvos com sucesso, em breve entraremos em contato!`)

})









