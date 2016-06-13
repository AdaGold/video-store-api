var request = require('request')
var base_url = "http://localhost:3000/"

describe("Endpoint at /", function () {
  it('responds with a 200 status code', function (done) {
    request.get(base_url, function(error, response, body) {
      expect(response.statusCode).toEqual(200)
      done()
    })
  })

  describe("the returned json data", function() {
    it('has the right keys', function(done) {
      request.get(base_url, function(error, response, body) {
        var data = JSON.parse(body)
        expect(Object.keys(data)).toEqual(['whatevs'])
        done()
      })
    })

    it('has the right values for the keys', function(done) {
      request.get(base_url, function(error, response, body) {
        var data = JSON.parse(body)
        expect(data.whatevs).toEqual('whatevs!!!')
        done()
      })
    })
  })
})
