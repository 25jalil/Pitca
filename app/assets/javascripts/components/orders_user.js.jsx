var Order= React.createClass({
  getInitialState() {
    return {
      order: this.props.order
    }
  },

  _handleOrderRemove() {
    console.log("hbhbjh");
    var that = this;
    $.ajax({
      method: 'DELETE',
      url: '/orders/' + that.state.order.id + '.json'
    })
  },

  _moment(creted_at){
    return moment(creted_at).format("Do MMM YYYY")
  },

  render() {
    return (
      <li>Order {this._moment(this.state.order.created_at)}<button onClick={this._handleOrderRemove} style={{color: 'red'}}>Remove</button></li>
    );
  }
});
 