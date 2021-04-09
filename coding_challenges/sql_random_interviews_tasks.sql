/*
The state of the deal should be important as well. I do not see the need for aggregating e.g. "cancelled/unpaid deals" with "paid deals".
However, I have no information about the context of the state field within the deals table and thus skipped it. Simple WHERE condition would do the trick if needed.
*/
CREATE TABLE customer_deals AS
    SELECT 
        customer_id,
        COUNT(DISTINCT deal_id) AS deals_total_count,
        SUM(price) AS deals_total_price
    FROM customer
    LEFT JOIN deal
        ON customer.deal_id = deal.deal_id
    GROUP BY
        customer_id;


CREATE TABLE team_deals AS
    SELECT 
        team_id,
        SUM(price) AS deals_total_price
    FROM team
    LEFT JOIN deal
        ON team.team_id = deal.team_id
    GROUP BY
        team_id
    ORDER BY
        team_id ASC;


CREATE TABLE deal_first_invoice AS
    SELECT 
        deal_id,
        invoice_id,
        RANK() OVER ( PARTITION BY deal_id ORDER BY created_date ASC ) AS invoice_deal_rank,
    FROM invoice_item
    LEFT JOIN invoice
        ON invoice_item.invoice_id = invoice.invoice_id;
    
/*
Not sure how you meant highlighting the first invoice within the deal.
If you meant creating a flag, simple SELECT above with a CASE WHEN invoice_deal_rank = 1 THEN True AS is_first_invoice

The above query would assign the same rank in case multiple invoice_id have exactly the same created_date. 
To deal with such situation, just use ROW_NUMBER() instead of RANK.

The usage of either ROW_NUMBER or RANK depends on the context and the usage of the data.
*/


CREATE TABLE invoice_events AS 
    SELECT invoice_id,
        unnest(array['created_date', 'paid_date', 'posting_date']) AS event,
        unnest(array[created_date, paid_date, posting_date]) AS date
    FROM invoice
    ORDER BY invoice_id;