var Orders = React.createClass({ 

	render: function() {
		orders = this.props.orders.map( function(products_order) {
      return (
      	<Order products_order={products_order} key={products_order.id} />      
      );
		});
		return (
      <div>
        <div id="orders">
          <table>
            <thead>
              <tr>
	              <th>Product name</th>
	              <th>Quantity</th>
	              <th>Price</th>
	              <th>Total price</th>
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