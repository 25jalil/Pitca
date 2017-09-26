var Orders = React.createClass({ 

	getInitialState() {
  	return {
  		rok: this.props.rok
  	}
  },
	render: function() {
		orders = this.props.orders.map( function(products_order) {
      return (
      	<Order products_order={products_order} key={products_order.id} />      
      );
		});
		return (
      <div>
       <h1>{this.state.rok}</h1>
        <div id="orders">
          <table>
            <thead>
              <tr>
	              <th>Rendition</th>
	              <th>Product name</th>
	              <th>Quantity</th>
	              <th>Price</th>
	              <th>Total price</th>
	              <th>Actions</th>
              </tr>
            </thead>
	          <tbody>
	          	{orders} 
	          </tbody> 
          </table>
        </div>
      </div>
		);
	} 
});