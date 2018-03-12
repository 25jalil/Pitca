var Orders = React.createClass({ 

  getInitialState() {
    return {
      products_order: this.props.products_order
    }
  },
  
   handleFireOrder(order) {
    var orderList = this.props.orders_user.filter(function(item) {
      return order.id != item.id;
    });
    this.replaceState({orders_user: orderList});
    console.log(this.props.orders_user)
    console.log(this.state.orders_user)
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
		);
	} 
});