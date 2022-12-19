import React from 'react'
import { Media, Button } from 'reactstrap'

const ListMedicalCenters = ({ medicalCenters, onClick, onDelete }) => {
  const handleGet = (event) => {
    onClick(event.target.id);
  }

  const handleDelete = (event) => {
    onDelete(event.target.id);
  }

  return (
    <ul>
      {medicalCenters.map((item) => {
        return (
          <li className="p-1 card-border shadow-sm p-3 mb-3 bg-white rounded" style={{ "borderRadius": "0.25rem" }} key={item.id}>
            <Media>
              <Media body>
                <Media heading className="m-0">
                  {item.legal_entity}
                </Media>
                <Media right top>
                  <Button color="success" className="mr-3 delete-btn">GO<i id={item.id} onClick={handleGet} className="fas fa-times"></i></Button>
                </Media>
                <Media right top>
                  <Button color="warning" className="mr-3 delete-btn">Delete<i id={item.id} onClick={handleDelete} className="fas fa-times"></i></Button>
                </Media>
                <p><span className="font-weight-bold">Name:</span> {item.legal_entity}</p>
                <p><span className="font-weight-bold">Addess:</span> {item.address}</p>
                <p><span className="font-weight-bold">Email:</span> {item.email}</p>
                <p><span className="font-weight-bold">Schedule:</span> {item.schedule}</p>
              </Media>
            </Media>
          </li>
        )
      })}
    </ul>
  );
}

export default ListMedicalCenters
