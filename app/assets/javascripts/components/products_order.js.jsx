var ProductsOrder= React.createClass({
  getInitialState() {
  	return {
  		products_order: this.props.products_order
  	}
  },

  getDefaultProps() { 
    return { products_order: [] }
  },

  _calculatedOrderPrice(price, quantity) {
    const sum = price * quantity
    return sum.toFixed([1])
  },

  _getRendition(rendition) {
    if (rendition === true) {
      return "Executed!";
    } else {
      return "Not executed";
    }
  },

  render() {
  	return (
      <tr>
        <td>{this.state.products_order.product_name}</td>
        <td>{this.state.products_order.amount}</td>
        <td>{this.state.products_order.product_price.toFixed([1])}</td>
        <td>{this._calculatedOrderPrice(this.state.products_order.amount, this.state.products_order.product_price)}</td>
        <td>{this._calculatedOrderPrice(this.state.products_order.amount, this.state.products_order.product_price)}</td>
        <td></td>
      </tr>
  	);
  }
});