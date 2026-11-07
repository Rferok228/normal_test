const insert_ClinicalData = require('../../DataBase/insert_clinicalData')

const insert_Data = async (req, res) => {
    const id = req.params.id
    const body = req.body

    if(!id || !body || !body.measurement_type || !body.measurement_value || !body.unit || !body.source || !body.notes){
        res.status(400).json({
            info: "Вы не ввели какие-то данные, перепроверьте!"
        })

        return
    }

    try {
        const responseDB = await insert_ClinicalData(id, body)

        if(responseDB.affectedRows > 0){
            res.json({
                info: 'Данные успешно добавились в бд!'
            })
        }else{
            res.status(500).json({
                info: 'Данные не добавились'
            })
        }
    }catch(err){
        res.status(500).json({
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = insert_Data