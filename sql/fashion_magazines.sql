-- Add your sql here
WITH unpaid AS(
	SELECT o.customer_id,
		c.customer_name AS Customer,
		o.order_status,
		s.price_per_month * s.subscription_length AS Amount
	FROM orders o
	JOIN customers c
		ON c.customer_id = o.customer_id 
	JOIN subscriptions s 
		ON s.subscription_id = o.subscription_id 
	WHERE o.order_status = "unpaid" AND s.description = 'Fashion Magazine'
)
SELECT unpaid.Customer,
	PRINTF('$%.2f',SUM(unpaid.Amount)) AS 'Amount Due'
FROM unpaid
GROUP BY Customer;