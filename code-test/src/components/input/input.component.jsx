import React from "react";
import "./input.style.css";
const TextInput = ({
  placeholder,
  handleChange,
  type,
  value,
  name,
  textarea,
}) =>
  textarea ? (
    <textarea
      className="input-text-area"
      onChange={handleChange}
      name={name}
      cols="30"
      rows="10"
      placeholder={placeholder}
      value={value}
    ></textarea>
  ) : (
    <input
      required
      className="input-text"
      type={type || "text"}
      placeholder={placeholder}
      onChange={handleChange}
      value={value}
      name={name}
      autoComplete="off"
    />
  );

export default TextInput;
