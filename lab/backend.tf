terraform {
  backend "s3" {
    bucket = "tf-lab-infra-state"
    key    = "terraform/lab/lab_state.tfstate"
    region = "ap-south-1"
  }
}
