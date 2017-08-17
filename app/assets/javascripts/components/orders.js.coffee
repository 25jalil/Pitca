Orders = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultOrders: ->
    records: []  
  render: ->
  React.DOM.div
    className: 'order'
	  React.DOM.table  
	    React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Name product'
          React.DOM.th null, 'Product price'
	    React.DOM.tbody null,
        for order in @state.orders
          React.createElement Order, key: order.id, order: order
