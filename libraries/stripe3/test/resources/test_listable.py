import libraries.stripe3
from libraries.stripe3.test.helper import (
    StripeApiTestCase, MyListable
)


class ListableAPIResourceTests(StripeApiTestCase):

    def test_all(self):
        self.mock_response({
            'object': 'list',
            'data': [
                {
                    'object': 'charge',
                    'name': 'jose',
                },
                {
                    'object': 'charge',
                    'name': 'curly',
                }
            ],
            'url': '/v1/charges',
            'has_more': False,
        })

        res = MyListable.list()

        self.requestor_mock.request.assert_called_with(
            'get', '/v1/mylistables', {})

        self.assertEqual(2, len(res.data))
        self.assertTrue(all(isinstance(obj, libraries.stripe3.Charge)
                            for obj in res.data))
        self.assertEqual('jose', res.data[0].name)
        self.assertEqual('curly', res.data[1].name)
