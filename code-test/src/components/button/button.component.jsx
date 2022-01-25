import React from "react";
import "./button.styles.css";
const Button = ({ value, handleClick }) => {
  return (
    <button className="btn" onClick={handleClick}>
      {value}
    </button>
  );
};

export default Button;
