var Order = React.createClass({ 
	
  getInitialState() { 
		return { orders: this.props.data }
	},

	getDefaultProps() { 
		return { orders: [] }
	},

	_getRendition(e) {
    if (e === true) {
    	return "Executed!";
    }	else {
    	return "Not executed";
    }
  },

  _getCalculatedOrderPrice(price, quantity) {
    const sum = price * quantity 
    return sum.toFixed([1])
  },

	render() { 
		var orders = this.state.orders.map((order) => {
      return (
        <div key={order.id}>
	        <table>
	          <tbody>  
			        <tr>
			          <td>{this._getRendition(order.rendition)}</td>
			          <td>{order.product_name}</td>
			          <td>{(order.product_price).toFixed([1])}</td>
			          <td>{order.product_quantity}</td>
			          <td>{this._getCalculatedOrderPrice(order.product_price, order.product_quantity)}</td>
	            </tr>
	          </tbody>  
          </table>
        </div>
      )
		}); 
		return ( 
			<div> 
			  {orders} 
			</div> 
		) 
	} 
});