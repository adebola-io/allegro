import torch
import Logger
from transformers import BertForSequenceClassification, BertTokenizer, BatchEncoding

from Source.Server.EmotionModel.train import train
from Source.Server.EmotionModel.utils import load_data


emotion_mapping = {
    0: "admiration",
    1: "amusement",
    2: "anger",
    3: "annoyance",
    4: "approval",
    5: "caring",
    6: "confusion",
    7: "curiosity",
    8: "desire",
    9: "disappointment",
    10: "disbelief",
    11: "disgust",
    12: "embarrassment",
    13: "excitement",
    14: "fear",
    15: "gratitude",
    16: "grief",
    17: "joy",
    18: "love",
    19: "nervousness",
    20: "optimism",
    21: "pride",
    22: "realization",
    23: "relief",
    24: "remorse",
    25: "sadness",
    26: "surprise",
    27: "neutral"
}


class EmotionModel:
    '''Constructor for the emotion model.'''

    def __init__(self):
        Logger.loading('Creating model...')
        self.model: BertForSequenceClassification = BertForSequenceClassification.from_pretrained(  # type: ignore
            "./EmotionModel/emotion-model")
        self.tokenizer: BertTokenizer = BertTokenizer.from_pretrained(  # type: ignore
            "bert-base-uncased")
        Logger.success('Model set up successfully.')

    def predict(self, text: str):
        '''Predict an emotion.'''
        inputs: BatchEncoding = self.tokenizer.encode_plus(  # type: ignore
            text,
            None,
            add_special_tokens=True,
            padding=True,
            truncation=True,
            return_tensors='pt'
        )

        input_ids = inputs['input_ids']
        attention_mask = inputs['attention_mask']

        with torch.no_grad():
            outputs = self.model(input_ids, attention_mask=attention_mask)
            logits = outputs.logits
            predicted_emotion: int = int(torch.argmax(logits, dim=1).item())

        predicted_emotion_label = emotion_mapping[predicted_emotion]
        return predicted_emotion_label


def train_and_evaluate():
    train_file = '/content/drive/MyDrive/go_emotions/data/train.tsv'
    test_file = '/content/drive/MyDrive/go_emotions/data/test.tsv'
    dev_file = '/content/drive/MyDrive/go_emotions/data/dev.tsv'
    train_data = load_data(train_file)
    test_data = load_data(test_file)
    dev_data = load_data(dev_file)

    model = train(train_data)
