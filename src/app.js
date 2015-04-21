import React from "react";
import Router from "react-router";

import Clippy from "./components/Clippy";
import Menu from "./components/Menu";
import Home from "./components/Home";
import Sync from "./components/Sync";

var DefaultRoute = Router.DefaultRoute;
var Link = Router.Link;
var Route = Router.Route;
var RouteHandler = Router.RouteHandler;

var App = React.createClass({
  render: function () {
    return (
      <div id="application">
        <Menu/>
        <RouteHandler/>
      </div>
    );
  }
});

var routes = (
  <Route name="app" path="/" handler={App}>
    <DefaultRoute handler={Home}/>
    <Route name="sync" handler={Sync}/>
  </Route>
);

Router.run(routes, function (Handler) {
  React.render(<Handler/>, document.body);
});
