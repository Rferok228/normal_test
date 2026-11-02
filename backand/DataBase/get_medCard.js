const db = require('./connect_DB')

const get_medCardById = async (id) => {
    const clinical_data_all_sql = `SELECT cl.measurement_type, cl.measurement_value, cl.unit, cl.measured_at FROM clinical_data_all as cl
        WHERE cl.patient_id = ?
    `
    const instrumental_issledovaniy_sql = `SELECT i.study_name, i.performed_at, i.conclusion FROM instrumental_issledovaniy as i
        WHERE i.patient_id = ?
    `
    const consultation_sql = `SELECT c.id as consultationID, c.scheduled_at, c.status, c.consultation_notes, c.created_at, d.id as doctorsID, d.first_name, d.last_name, tp.id as treatment_plansID, tp.plan_description, tp.start_date, tp.end_date, tp.status, p.id as prescriptionsID, p.medication_name, p.dosage, p.frequency, p.start_date, p.end_date, tr.id as treatment_recordsID, tr.performed_at, tr.status, tr.notes, r.id as reportsID,  r.title,  r.content,  r.created_at FROM consultations as c
        LEFT JOIN treatment_plans as tp on tp.consultation_id = c.id 
        LEFT JOIN prescriptions as p on p.treatment_plan_id = tp.id
        LEFT JOIN treatment_records as tr on tr.prescription_id = p.id
        LEFT JOIN reports as r ON r.consultation_id = c.id
        LEFT JOIN doctors as d ON c.doctor_id = d.id
        WHERE c.patient_id = ?
    `

    const clinical_data_all = await db.execute(clinical_data_all_sql, [id])
    const instrumental_issledovaniy = await db.execute(instrumental_issledovaniy_sql, [id])
    const consultation = await db.execute(consultation_sql, [id])
    
    return [
        clinical_data_all[0], 
        instrumental_issledovaniy[0],
        consultation[0]
    ]
}   

module.exports = get_medCardById



