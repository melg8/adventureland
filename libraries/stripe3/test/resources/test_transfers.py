import libraries.stripe3
from libraries.stripe3.test.helper import StripeResourceTest


class TransferTest(StripeResourceTest):

    def test_list_transfers(self):
        libraries.stripe3.Transfer.list()
        self.requestor_mock.request.assert_called_with(
            'get',
            '/v1/transfers',
            {}
        )

    def test_cancel_transfer(self):
        transfer = libraries.stripe3.Transfer(id='tr_cancel')
        transfer.cancel()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/transfers/tr_cancel/cancel',
            {},
            None
        )
