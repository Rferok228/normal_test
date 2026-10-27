const get_data_fetch = async () => {
    const url = `http://localhost:3000/data/allData`
    const respons = await fetch(url, {
        
    })
    const jsonParse = await respons.json()

    return jsonParse
}

export {get_data_fetch}