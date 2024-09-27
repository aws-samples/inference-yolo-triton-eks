# Object detection with YOLO and NVIDIA Triton Inference Server on Amazon EKS

This blueprint deploys a solution for running inference with [YOLO](https://github.com/ultralytics/ultralytics) (You Only Look Once), [NVIDIA Triton Inference Server](https://developer.nvidia.com/triton-inference-server) and [Amazon Elastic Kubernetes Service](https://aws.amazon.com/eks/) (EKS).

## Installation

Export the YOLO model in [ONNX](https://onnx.ai/) (Open Neural Network Exchange) format:

```bash
from ultralytics import YOLO
model = YOLO("yolov8n.pt")
model.export(format="onnx")
```

Move it under the `/model_repository/yolo/1/` directory and rename it `model.onnx`.

Run `install.sh`.

## Cleanup

Run `cleanup.sh`.

## Credits

The code on this repository is based on [Data on EKS](https://awslabs.github.io/data-on-eks/).

## License

This library is licensed under the MIT-0 License. See the LICENSE file.