import gzip
import numpy as np
import tensorflow as tf
from typing import Tuple
import requests
from PIL import Image

class NeuralNetwork(tf.keras.Model):
  def __init__(self):
    super(NeuralNetwork, self).__init__()
    self.sequence = tf.keras.Sequential([
      tf.keras.layers.Flatten(input_shape=(28, 28)),
      tf.keras.layers.Dense(20, activation='relu'),
      tf.keras.layers.Dense(10)
    ])

  def call(self, x: tf.Tensor) -> tf.Tensor:
    y_prime = self.sequence(x)
    return y_prime


labels_map = {
    0: 'T-Shirt',
    1: 'Trouser',
    2: 'Pullover',
    3: 'Dress',
    4: 'Coat',
    5: 'Sandal',
    6: 'Shirt',
    7: 'Sneaker',
    8: 'Bag',
    9: 'Ankle Boot',
  }


def read_images(path: str, image_size: int, num_items: int) -> np.ndarray:
  with gzip.open(path, 'rb') as file:
    data = np.frombuffer(file.read(), np.uint8, offset=16)
    data = data.reshape(num_items, image_size, image_size)
  return data


def read_labels(path: str, num_items: int) -> np.ndarray:
  with gzip.open(path, 'rb') as file:
    data = np.frombuffer(file.read(num_items + 8), np.uint8, offset=8)
    data = data.astype(np.int64)
  return data


def get_data(batch_size: int) -> Tuple[tf.data.Dataset, tf.data.Dataset]:
  image_size = 28
  num_train = 60000
  num_test = 10000

  training_images = read_images('data/FashionMNIST/raw/train-images-idx3-ubyte.gz', image_size, num_train)
  test_images = read_images('data/FashionMNIST/raw/t10k-images-idx3-ubyte.gz', image_size, num_test)
  training_labels = read_labels('data/FashionMNIST/raw/train-labels-idx1-ubyte.gz', num_train)
  test_labels = read_labels('data/FashionMNIST/raw/t10k-labels-idx1-ubyte.gz', num_test)

  # (training_images, training_labels), (test_images, test_labels) = tf.keras.datasets.fashion_mnist.load_data()

  train_dataset = tf.data.Dataset.from_tensor_slices((training_images, training_labels))
  test_dataset = tf.data.Dataset.from_tensor_slices((test_images, test_labels))

  train_dataset = train_dataset.map(lambda image, label: (float(image) / 255.0, label))
  test_dataset = test_dataset.map(lambda image, label: (float(image) / 255.0, label))

  train_dataset = train_dataset.batch(batch_size).shuffle(500)
  test_dataset = test_dataset.batch(batch_size).shuffle(500)

  return (train_dataset, test_dataset)


def training_phase():
  learning_rate = 0.1
  batch_size = 64
  epochs = 5

  (train_dataset, test_dataset) = get_data(batch_size)

  model = NeuralNetwork()

  loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
  optimizer = tf.keras.optimizers.SGD(learning_rate)
  metrics = ['accuracy']
  model.compile(optimizer, loss_fn, metrics)

  print('\nFitting:')
  model.fit(train_dataset, epochs=epochs)
    
  print('\nEvaluating:')
  (test_loss, test_accuracy) = model.evaluate(test_dataset)
  print(f'\nTest accuracy: {test_accuracy * 100:>0.1f}%, test loss: {test_loss:>8f}')

  model.save('outputs/model')


def inference_phase():
  print('\nPredicting:')

  model = tf.keras.models.load_model('outputs/model')

  url = 'https://raw.githubusercontent.com/MicrosoftDocs/tensorflow-learning-path/main/intro-keras/predict-image.png'

  with Image.open(requests.get(url, stream=True).raw) as image:
    X = np.asarray(image, dtype=np.float32).reshape((-1, 28, 28)) / 255.0

  predicted_vector = model.predict(X)
  predicted_index = np.argmax(predicted_vector)
  predicted_name = labels_map[predicted_index]

  print(f'Predicted class: {predicted_name}')


training_phase()
inference_phase()
