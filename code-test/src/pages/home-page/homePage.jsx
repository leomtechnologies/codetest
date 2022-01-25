import React, { useState } from "react";
import { Link, withRouter } from "react-router-dom";

import TextInput from "../../components/input/input.component";
import Button from "../../components/button/button.component";

import "./homepage.styles.css";

const Homepage = ({ history }) => {
  const [userCredential, setUserCredential] = useState({
    email: "",
    password: "",
  });
  const handleChange = (e) => {
    const { name, value } = e.target;

    setUserCredential({ ...userCredential, [name]: value });
  };
  // Viewing and rendering a user detail
  const handleViewUser = () => {
    const allUsers = JSON.parse(localStorage.getItem("users"));
    const currentUser = allUsers.find(
      (el) =>
        el.email === userCredential.email &&
        el.password === userCredential.password
    );
    if (currentUser) {
      history.push(`/overview/${currentUser.email}`);
    } else {
      setUserCredential({
        email: "",
        password: "",
      });
    }
  };
  return (
    <div className="homepage">
      <h1 className="homepage__title">Welcome</h1>
      <p className="homepage__text">
        Enter your email and password to retrive user details
      </p>
      <TextInput
        value={userCredential.email}
        name="email"
        placeholder="email"
        handleChange={handleChange}
      />
      <TextInput
        type="password"
        value={userCredential.password}
        name="password"
        placeholder="password"
        handleChange={handleChange}
      />
      <Button handleClick={handleViewUser} value="View Details" />

      <p className="or">Don't have an account?</p>

      <Link to="./create-user">
        <Button value="Register" />
      </Link>
    </div>
  );
};

export default withRouter(Homepage);
