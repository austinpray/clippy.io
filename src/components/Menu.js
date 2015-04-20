import React from "react";
import Router from "react-router";
var Link = Router.Link;

export default React.createClass({
  render(): any {
    return (
      <header className="menu">
        <nav className="menu-nav">
          <Link to="app">clippy.io</Link>
        </nav>
      </header>
    );
  }
});
