import libraries.stripe3
from libraries.stripe3.test.helper import StripeResourceTest


class ThreeDSecureTest(StripeResourceTest):

    def test_threedsecure_create(self):
        libraries.stripe3.ThreeDSecure.create(
            card="tok_test",
            amount=1500,
            currency="usd",
            return_url="https://example.org/3d-secure-result"
        )

        self.requestor_mock.request.assert_called_with(
            'post',
            '/v1/3d_secure',
            {
                'card': 'tok_test',
                'amount': 1500,
                'currency': 'usd',
                'return_url': 'https://example.org/3d-secure-result'
            },
            None
        )
