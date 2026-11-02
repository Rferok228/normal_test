const insert_ClinicalData = require('../../DataBase/insert_clinicalData')

const insert_Data = async (req, res) => {
    const { id } = req.query
    const body = req.body

    if(!id || !body.measurement_type || !body.measurement_value || !body.unit || !body.source || !body.notes){
        res.json({
            code: 400,
            info: "Вы не ввели какие-то данные, перепроверьте!"
        })
    }

    try {
        const responseDB = await insert_ClinicalData(id, body)

        if(responseDB.affectedRows > 0){
            res.json({
                info: 'Данные успешно добавились в бд!'
            })
        }else{
            res.json({
                code: 500,
                info: 'Данные не добавились'
            })
        }
    }catch(err){
        res.json({
            code: 500, 
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = insert_Data