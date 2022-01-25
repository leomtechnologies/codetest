import React from "react";
import { useParams, Link } from "react-router-dom";

import "./overviewPage.styles.css";

const OverviewPage = () => {
  const { email } = useParams();
  const allUsers = JSON.parse(localStorage.getItem("users")) || [];
  // localStorage.clear();
  const currentUser = allUsers.find((el) => el.email === email) || null;
  console.log(currentUser);

  if (currentUser) {
    const { name, phone, address, description } = currentUser;
    return (
      <div className="overview-page">
        <h2 className="overview__name">{name}</h2>
        <p className="overview__description">{description}</p>
        <p className="overview__email">
          <span>Email Address : </span>
          {email}
        </p>
        <p className="overview__phone">
          <span>Phone Number: </span>
          {phone}
        </p>
        <p className="overview__address">
          <span>Address: </span>
          {address}
        </p>
        <Link to="/">
          <button className="btn">Home</button>
        </Link>
      </div>
    );
  } else {
    return (
      <div>
        <div className="nothing">Nothing to display</div>
        <Link to="/">
          <button className="btn">Home</button>
        </Link>
      </div>
    );
  }
};

export default OverviewPage;
