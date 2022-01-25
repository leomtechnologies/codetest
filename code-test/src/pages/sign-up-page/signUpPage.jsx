import React from "react";
import TextInput from "../../components/input/input.component";
import { withRouter } from "react-router-dom";
import { useState } from "react";

import Button from "../../components/button/button.component";

import "./signUpPage.styles.css";

const SignUpPage = ({ history }) => {
  const [userCredential, setUserCredential] = useState({
    email: "",
    password: "",
    name: "",
    address: "",
    description: "",
    phone: "",
  });
  const handleChange = (e) => {
    const { name, value } = e.target;

    setUserCredential({ ...userCredential, [name]: value });
  };

  // Creating a new user

  const createNewUser = (e) => {
    e.preventDefault();
    const oldUsers = JSON.parse(localStorage.getItem("users")) || [];
    const found = oldUsers.find((el) => el.email === userCredential.email);
    let newUsers;
    if (!found) {
      newUsers = [...oldUsers, userCredential];
    } else {
      newUsers = oldUsers;
    }

    localStorage.setItem("users", JSON.stringify(newUsers));

    history.push(`/overview/${userCredential.email}`);
    console.log({ newUsers }, { oldUsers }, { history });
  };
  return (
    <div className="sign-up">
      <form className="sign-up__form" onSubmit={createNewUser}>
        <div className="sign-up__left">
          <TextInput
            value={userCredential.name}
            name="name"
            placeholder="name"
            handleChange={handleChange}
          />
          <TextInput
            value={userCredential.email}
            name="email"
            type="email"
            placeholder="email"
            handleChange={handleChange}
          />
          <TextInput
            value={userCredential.password}
            type="password"
            name="password"
            placeholder="password"
            handleChange={handleChange}
          />
          <TextInput
            value={userCredential.address}
            name="address"
            placeholder="home address"
            handleChange={handleChange}
          />
          <TextInput
            value={userCredential.phone}
            name="phone"
            type="number"
            placeholder="phone number"
            handleChange={handleChange}
          />
        </div>
        <div className="sign-up__right">
          <TextInput
            value={userCredential.description}
            textarea
            name="description"
            placeholder="Tell us a little about yourself"
            handleChange={handleChange}
          />
          <Button value="Create user" />
        </div>
      </form>
    </div>
  );
};

export default withRouter(SignUpPage);
