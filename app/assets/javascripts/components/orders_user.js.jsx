var Order= React.createClass({
  getInitialState() {
  	return {
  		order: this.props.order
  	}
  },

  render() {
  	return (
      <li>Order{this.state.order.created_at}</li>
  	);
  }
});