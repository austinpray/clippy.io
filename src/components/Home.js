import React from "react";
import Router from "react-router";
var Link = Router.Link;

export default React.createClass({
  render(): any {
    return (
      <div className="main-container">
        <div className="choice-screen">
          <h1>clippy.io</h1>
          <p className="lead">
            Dead simple clipboard syncing.
          </p>
          <ul className="featured-list">
            <li>Anonymous, federated, no account needed</li>
            <li>Pastes encrypted client side with PGP</li>
            <li>Nothing stored on server</li>
          </ul>
          <div className="featured-options">
            <Link to="sync" className="pure-button-primary pure-button">Sync With Another Device</Link>
            <Link to="sync" className="pure-button-primary pure-button">Sync With Another Device</Link>
          </div>
        </div>
      </div>
    );
  }
});
