resource "null_resource" "ansible" {
  depends_on = "aws_instance.web"
  provisioner "local-exec" {
  	command = "sed -i \"s/SERVER1_IP/${aws_instance.web.public_ip}/g\" ansible/hosts"
  }
  provisioner "local-exec" {
    command = "sleep 10"
  }
  provisioner "local-exec" {
    command = "sleep 20 && cd ansible && ansible-playbook -i hosts playbook.yaml -vvv"
    interpreter = ["/bin/bash", "-c"]
  }
}

