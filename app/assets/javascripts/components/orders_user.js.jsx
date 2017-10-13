var Order= React.createClass({
  getInitialState() {
    return {
      order: this.props.order
    }
  },

  handleOrderFire() {
    var that = this;
    $.ajax({
      method: 'DELETE',
      url: '/orders/' + that.state.order.id + '.json',
      success: function(res) {
        that.props.onFireOrder(that.props.order);
      }
    })
  },

  _moment(created_at){
    return moment(created_at).format("Do MMM YYYY");
  },

  render() {
    return (
      <h4>Order {this._moment(this.state.order.created_at)}<button onClick={this.handleOrderFire} style={{color: "red"}}>Remove</button></h4>
    );
  }
});
 