resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group_policy" "developers_policy" {
  name  = "developers_policy"
  group = "${aws_iam_group.developers.id}"
 
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
      "Action": "iam:GetAccountPasswordPolicy",
      "Effect": "Allow",
      "Resource": "*"
    },
    { 
      "Action": [
        "iam:ChangePassword"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam:::user/$${aws:username}"
    }
   ]
  }
EOF
}
