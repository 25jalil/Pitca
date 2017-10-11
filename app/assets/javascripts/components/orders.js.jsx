var Orders = React.createClass({ 

	render: function() {
		products_orders = this.props.products_order.map( function(product) {
      return (
      	<ProductsOrder products_order={product} key={product.id} />      
      );
		});
    orders_user = this.props.orders_user.map( function(order) {
      return (
        <Order order={order} key={order.id} />      
      );
    });
		return (
      <div>
        <ol>          
          {orders_user}
        </ol>
        <table>
          <thead>
            <tr>
              <th>Product name</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Total price</th>
              <th>Actions</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
          	{products_orders} 
          </tbody> 
        </table>
      </div>
		);
	} 
});