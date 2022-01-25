import React from "react";
import { Switch, Route } from "react-router-dom";

import "./App.css";
import Homepage from "./pages/home-page/homePage";
import OverviewPage from "./pages/overviewPage/overviewPage.component";
import SignUpPage from "./pages/sign-up-page/signUpPage";

function App() {
  return (
    <div className="App">
      <Switch>
        <Route exact path="/">
          <Homepage />
        </Route>
        <Route path="/create-user">
          <SignUpPage />
        </Route>
        <Route path="/overview/:email">
          <OverviewPage />
        </Route>
      </Switch>
    </div>
  );
}

export default App;
