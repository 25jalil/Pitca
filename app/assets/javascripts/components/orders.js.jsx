var Orders = React.createClass({ 

	render: function() {
		orders = this.props.orders.map( function(order) {
      return (
      	<Order order={order} key={order.id} />      
      );
		});
		return (
      <div>
        <div id="orders">
          <table>
            <thead>
              <tr>
	              <th>Rendition</th>
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