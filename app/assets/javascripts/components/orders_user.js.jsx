var Order= React.createClass({
  getInitialState() {
    return {
      order: this.props.order
    }
  },

  _moment(creted_at){
    return moment(creted_at).format("Do MMM YYYY")
  },

  render() {
    return (
      <li>Order {this._moment(this.state.order.created_at)}</li>
    );
  }
});
 