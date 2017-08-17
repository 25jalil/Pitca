@Order = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.order.product_name
      React.DOM.td null, @props.order.product_price
