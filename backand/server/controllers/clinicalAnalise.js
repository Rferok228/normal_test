const get_clinicalAnalise = require('../../DataBase/clinicalAnalise')

const get_Analise = async (req, res) => {
    const id = req.params.id
    const first_date = req.query.first_date
    const last_date = req.query.last_date
    const measurement_type = req.query.measurement_type 

    if(!id || !first_date || !last_date || !measurement_type){
        res.status(400).json({
            info: "Вы не ввели какие-то данные, перепроверьте!"
        })

        return
    }

    try{
        const data = await get_clinicalAnalise(id, first_date, last_date, measurement_type)

        res.json(data)
    }catch(err){
        res.status(500).json({
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = get_Analise