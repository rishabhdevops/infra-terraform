resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}


resource "aws_iam_group_membership" "developers_members" {
  name = "developers_members"

  users = [
    "${aws_iam_user.arun_kumar.name}",
    "${aws_iam_user.rohit_gupta.name}",
    "${aws_iam_user.mohan_kumar.name}",
  ]

  group = "${aws_iam_group.developers.name}"
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

resource "aws_iam_group" "247ops" {
  name = "247ops"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "admin_policy_attach" {
  group = "${aws_iam_group.247ops.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "247ops_members" {
  name = "247_membership"

  users = [
    "${aws_iam_user.arun_kumar.name}",
    "${aws_iam_user.rohit_gupta.name}",
    "${aws_iam_user.mohan_kumar.name}",
  ]

  group = "${aws_iam_group.247ops.name}"
}
