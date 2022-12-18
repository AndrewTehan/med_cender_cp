import React from 'react'
import {
  Card, CardHeader, CardBody, Form, FormGroup, Label, Input, FormText, Button, Alert
} from 'reactstrap'

const styles = { "backgroundColor": "#007bff", "color": "#ffffff", "cursor": "pointer" };

class AddMedicalCenters extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showBody: false,
      legal_entity: "",
      email: "",
      address: "",
      schedule: "",
      formErrors: false
    };
  }
  toggleBody = () => {
    this.setState({
      showBody: !this.state.showBody
    });
  }
  save = (e) => {
    e.preventDefault();
    const { legal_entity, email, address, schedule } = this.state;
    if (legal_entity !== "" && email !== "" && address !== "" && schedule !== "") {
      let medCentr = {
        id: Date.now(),
        legal_entity: this.state.legal_entity,
        email: this.state.email,
        address: this.state.address,
        schedule: this.state.schedule
      };
      let value = { medical_center: medCentr };
      let clear = {
        legal_entity: "",
        email: "",
        address: "",
        schedule: "",
      };
      this.setState({
        formErrors: false,
        showBody: false,
        ...clear
      });
      debugger
      const url = "/medical_centers";
      fetch(url, {
        method: "post",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(value),
      })
        .then((data) => {
          if (data.ok) {
            return data.json();
          }
          throw new Error("Network error.");
        })
        .then(() => {
          // TODO: reloadMedicalCenters
          this.props.loadMedicalCentres();
        })
        .catch((err) => console.error("Error: " + err));
    } else {
      this.setState({
        formErrors: true
      });
    }

  }
  handleChange = (event) => {
    this.setState({
      [event.target.id]: event.target.value
    });
  }
  render() {
    let displayBody = {
      display: this.state.showBody ? 'block' : 'none'
    };
    let errors = {
      display: this.state.formErrors ? 'block' : 'none'
    };

    return (
      <Card className="mt-4 mb-4 card-border" outline color="primary">
        <CardHeader style={styles} onClick={this.toggleBody}><i className="fas fa-plus"></i> Add New Medical Center</CardHeader>
        <CardBody style={displayBody} id="aptBody">
          <FormText color="muted" className="mb-1">
            <span className="text-danger">*</span>All fields are required
          </FormText>
          <Form onSubmit={this.save}>
            <FormGroup>
              <Label for="legal_entity">Legal Entity</Label>
              <Input type="text" id="legal_entity" placeholder="Legal Entity" value={this.state.legal_entity} onChange={this.handleChange} />
            </FormGroup>
            <FormGroup>
              <Label for="email">email</Label>
              <Input type="text" id="email" placeholder="email" value={this.state.email} onChange={this.handleChange} />
            </FormGroup>
            <FormGroup>
              <Label for="address">Address</Label>
              <Input type="text" id="address" placeholder="address" value={this.state.address} onChange={this.handleChange} />
            </FormGroup>
            <FormGroup>
              <Label for="schedule">Schedule</Label>
              <Input type="textarea" id="schedule" placeholder="Schedule" value={this.state.schedule} onChange={this.handleChange} />
            </FormGroup>
            <Alert color="danger" style={errors}>
              Please fill all the details
          </Alert>
            <Button type="submit" color="primary" block>Add Medical Centers</Button>
          </Form>
        </CardBody>
      </Card >
    )
  }
}

export default AddMedicalCenters
