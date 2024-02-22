import libraries.stripe3
from libraries.stripe3.test.helper import (
    StripeResourceTest, DUMMY_INVOICE_ITEM
)


class InvoiceTest(StripeResourceTest):

    def test_add_invoice_item(self):
        customer = libraries.stripe3.Customer(id="cus_invoice_items")
        customer.add_invoice_item(**DUMMY_INVOICE_ITEM)

        expected = DUMMY_INVOICE_ITEM.copy()
        expected['customer'] = 'cus_invoice_items'

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/invoiceitems',
            expected,
            None,
        )

    def test_retrieve_invoice_items(self):
        customer = libraries.stripe3.Customer(id="cus_get_invoice_items")
        customer.invoice_items()

        self.requestor_mock.request.assert_called_with(
            'get',
            '/v1/invoiceitems',
            {'customer': 'cus_get_invoice_items'},
        )

    def test_invoice_create(self):
        customer = libraries.stripe3.Customer(id="cus_invoice")
        libraries.stripe3.Invoice.create(customer=customer.id)

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/invoices',
            {
                'customer': 'cus_invoice',
            },
            None
        )

    def test_retrieve_customer_invoices(self):
        customer = libraries.stripe3.Customer(id="cus_invoice_items")
        customer.invoices()

        self.requestor_mock.request.assert_called_with(
            'get',
            '/v1/invoices',
            {
                'customer': 'cus_invoice_items',
            },
        )

    def test_pay_invoice(self):
        invoice = libraries.stripe3.Invoice(id="ii_pay")
        invoice.pay()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/invoices/ii_pay/pay',
            {},
            None
        )

    def test_upcoming_invoice(self):
        libraries.stripe3.Invoice.upcoming()

        self.requestor_mock.request.assert_called_with(
            'get',
            '/v1/invoices/upcoming',
            {},
        )
