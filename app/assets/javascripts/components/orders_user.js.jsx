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

  _getRendition(rendition) {
    if (rendition === true) {
      return "Delivered!";
    } else {
      return "Not delivered";
    }
  },

  _moment(created_at){
    return moment(created_at).format("Do MMM YYYY");
  },

  render() {
    return (
      <tr>
        <td>{this._getRendition(this.state.order.rendition)}</td>
        <td>{this._moment(this.state.order.created_at)}</td>
        <td>{this.state.order.recipient_adress}</td>
        <td>{this.state.order.shipping}</td>
        <td>{this.state.order.total_price}</td>
      </tr>
    );
  }
});
 