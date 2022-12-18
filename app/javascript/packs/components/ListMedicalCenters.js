import React from 'react'
import { Media, Button } from 'reactstrap'

const ListMedicalCenters = ({ medicalCenters, onDelete }) => {
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
                  {item.legalEntity}
                </Media>
              </Media>
            </Media>
          </li>
        )
      })}
    </ul>
  );
}

export default ListMedicalCenters