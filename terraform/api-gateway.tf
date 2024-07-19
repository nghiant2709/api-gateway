resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name = "PowerOfMath"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "my_resource" {
  parent_id   = "g1nvaz5100"
  path_part   = "math"
  rest_api_id = "s6a7772cq9"
}

