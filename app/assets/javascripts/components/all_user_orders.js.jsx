var All_user_orders = React.createClass({ 
  
  getInitialState() {
    return {
      orders_user: this.props.orders_user
    }
  },

  handleFireOrder(order) {
    var orderList = this.props.orders_user.filter(function(item) {
      return order.id != item.id;
    });
    this.replaceState({orders_user: orderList});
  },  
  
  render: function() {

    orders_user = this.props.orders_user.map((order) => {
      return (
        <Order order={order} key={order.id} onFireOrder={this.handleFireOrder} />      
      );
    });
		return (
      <div className="navbar">         
        <h2> All user orders </h2>
        <table>
          <thead>
            <tr>
              <th>Rendition</th>
              <th>Created_at</th>
              <th>Recipient Adress</th>
              <th>Shipping</th>
              <th>Total price</th>
            </tr>
          </thead>
          <tbody>
            {orders_user} 
          </tbody> 
        </table>
      </div>
		);
	} 
});



      