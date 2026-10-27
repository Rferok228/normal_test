import './App.css'
import { useState } from 'react'
import { get_data_fetch } from './data/script.js'

function App() {
  const [data, setData] = useState([]) // Теперь храним просто массив, а не объект

  const getData = async () => {
    const datafetch = await get_data_fetch()
    setData(datafetch) // Просто сохраняем массив как есть
  }

  return (
    <>
      <table border="1" style={{ borderCollapse: 'collapse', marginBottom: '20px' }}>
        <thead>
          <tr>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Показатель</th>
            <th>Значение</th>
            <th>Единица</th>
            <th>Дата и время</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.first_name}</td>
              <td>{item.last_name}</td>
              <td>{item.measurement_type}</td>
              <td>{item.measurement_value}</td>
              <td>{item.unit}</td>
              <td>{new Date(item.measured_at).toLocaleString('ru-RU')}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <button onClick={getData} className="btt">
        Получить данные
      </button>
    </>
  )
}

export default App