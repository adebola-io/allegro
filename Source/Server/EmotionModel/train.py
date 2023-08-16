from transformers import BertForSequenceClassification, BertTokenizer, AdamW
from torch.utils.data import DataLoader
import pandas as pd

from EmotionModel.utils import EmotionDataset


tokenizer: BertTokenizer = BertTokenizer.from_pretrained("bert-base-uncased")


def train(train_data: pd.DataFrame):
    train_dataset = EmotionDataset(train_data, tokenizer, max_len=30)
    train_dataloader = DataLoader(train_dataset, batch_size=16, shuffle=True)

    num_classes = 28  # 27 emotions + neutral
    model: BertForSequenceClassification = BertForSequenceClassification.from_pretrained(
        'bert-base-uncased', num_labels=num_classes)

    model.to('cuda')

    optimizer = AdamW(model.parameters(), lr=5e-5, weight_decay=0.01)

    for epoch in range(4):
        model.train()
        for batch in train_dataloader:
            optimizer.zero_grad()
            input_ids = batch['input_ids'].to('cuda')
            attention_mask = batch['attention_mask'].to('cuda')
            labels = batch['labels'].to('cuda')

            outputs = model(
                input_ids, attention_mask=attention_mask, labels=labels)
            loss = outputs.loss
            loss.backward()
            optimizer.step()

    return model
