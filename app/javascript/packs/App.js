import React, { Component } from 'react';
import _ from 'lodash';
import { Container } from 'reactstrap';
import NavBar from './components/NavBar';
import ListMedicalCenters from './components/ListMedicalCenters';
import AddMedicalCenters from './components/AddMedicalCenters';
import Footer from './components/Footer';

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      medicalCenters: [],
    };
  }

  componentDidMount() {
    this.loadMedicalCentres();
  }

  loadMedicalCentres = () => {
    const url = "/medical_centers";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
        throw new Error("Network error.");
      })
      .then(data => this.setState({
        medicalCenters: data
      }))
      .catch((err) => message.error("Error: " + err));
  }

  saveMedicalCenter = (newMedicalCenter) => {
    let medcenters = this.state.medicalCenters;
    medcenters.push(newMedicalCenter);
    this.setState({
      appointments: medcenters
    });
  }

  reloadMedicalCenters = () => {
    this.setState({ medicalCenters: [] });
    this.loadMedicalCentres();
  };

  deleteMedicalCenter = (id) => {
    fetch(`/medical_centers/${id}`, {
      method: "delete",
    })
    .then((data) => {
      if (data.ok) {
        this.reloadMedicalCenters();
        return data.json();
      }
      throw new Error("Network error.");
    });
  }

  getMedicalCenter = (id) => {
    window.location.href = `http://localhost:3000/medical_centers/${id}`;
  }

  render() {
    let { medicalCenters } = this.state;
    
    return (
      <>
        <NavBar />
        <Container>
          <ListMedicalCenters medicalCenters={medicalCenters} onClick={this.getMedicalCenter} onDelete={this.deleteMedicalCenter} />
          <AddMedicalCenters saveMedCentr={this.saveAppointment} loadMedicalCentres={this.loadMedicalCentres}/>
        </Container>
        <Footer />
      </>
    );
  }
}
