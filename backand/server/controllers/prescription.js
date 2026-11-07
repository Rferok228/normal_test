const { insert_prescription, update_prescription } = require('../../DataBase/prescription')

const insert_prescriptionData = async (req, res) => {
    const data = req.body

    if(!data.treatment_plan_id || !data.medication_name || !data.dosage || !data.frequency || !data.start_date || !data.status){
        res.status(400).json({
            info: 'Вы не ввели какие-то данные!'
        })

        return
    }

    try{
        const response = await insert_prescription(data)

        if(response.affectedRows > 0){
            res.json({
                info: "Данные добавились в бд!"
            })
        }
    }catch(err){
        res.status(500).json({
            info: "db query failed",
            cathMassage: err
        })
    }
}

const update_prescriptionData = async (req, res) => {
    const data = req.body

    if(!data.id || (!data.medication_name && !data.dosage && !data.frequency && !data.start_date && !data.end_date && !data.status && !data.instructions)){
        res.status(400).json({
            info: 'Вы не ввели какие-то данные!'
        })

        return
    }

    try{
        const response = await update_prescription(data)

        if(response.affectedRows > 0){
            res.json({
                info: "Данные изменились в бд!"
            })
        }
    }catch(err){
        res.status(500).json({
            info: "db query failed",
            cathMassage: err
        })
    }
}

module.exports = {
    insert_prescriptionData,
    update_prescriptionData
}