var Admin_order = React.createClass({ 

  getInitialState() {
    return {
      products_order: this.props.products_order
    }
  },
  
  render: function() {

		products_order = this.props.products_order.map( function(product) {
      return (
      	<ProductsOrder products_order={product} key={product.id}/>      
      );
		});

    orders_user = this.props.orders_user.map((order) => {
      return (
        <Order order={order} key={order.id} onFireOrder={this.handleFireOrder} />      
      );
    });

		return (
      <div>
        <div className="navbar">         
          <h2> All user orders</h2>
          <table>
            <thead>
              <tr>
                <th>Rendition</th>
                <th>Created_at</th>
                <th>Recipient Adress</th>
                <th>Shipping</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              {orders_user}
            </tbody> 
          </table>
        </div>
        <br/>
        <div className="navbar">         
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
            	{products_order} 
            </tbody> 
          </table>
        </div>
      </div>
		);
	} 
});