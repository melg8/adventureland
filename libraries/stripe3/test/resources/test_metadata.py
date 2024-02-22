import libraries.stripe3
from libraries.stripe3.test.helper import StripeResourceTest


class MetadataTest(StripeResourceTest):

    def test_noop_metadata(self):
        charge = libraries.stripe3.Charge(id='ch_foo')
        charge.description = 'test'
        charge.save()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/charges/ch_foo',
            {
                'description': 'test',
            },
            None
        )

    def test_unset_metadata(self):
        charge = libraries.stripe3.Charge(id='ch_foo')
        charge.metadata = {}
        charge.save()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/charges/ch_foo',
            {
                'metadata': {},
            },
            None
        )

    def test_whole_update(self):
        charge = libraries.stripe3.Charge(id='ch_foo')
        charge.metadata = {'whole': 'update'}
        charge.save()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/charges/ch_foo',
            {
                'metadata': {'whole': 'update'},
            },
            None
        )

    def test_individual_delete(self):
        charge = libraries.stripe3.Charge(id='ch_foo')
        charge.metadata = {'whole': None}
        charge.save()

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/charges/ch_foo',
            {
                'metadata': {'whole': None},
            },
            None
        )
