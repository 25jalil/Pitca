var Order = React.createClass({
  getInitialState() {
  	return {
  		order: this.props.order
  	}
  },

  getDefaultProps() { 
    return { order: [] }
  },

  _rendition(e) {
    if (e === true) {
    	return "Executed!";
    } else {
    	return "Not executed";
    }
  },

  _calculatedOrderPrice(price, quantity) {
    const sum = price * quantity
    return sum.toFixed([1])
  },

  render() {
  	return (
      <tr>
        <td>{this._rendition(this.state.order.rendition)}</td>
        <td>{this.state.order.product_name}</td>
        <td>{this.state.order.product_quantity}</td>
        <td>{this.state.order.product_price.toFixed([1])}</td>
        <td>{this._calculatedOrderPrice(this.state.order.product_quantity, this.state.order.product_price)}</td>
      </tr>
  	);
  }

});