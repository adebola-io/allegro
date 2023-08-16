import torch
from torch.utils.data import DataLoader
from transformers import BertForSequenceClassification, BertTokenizer
from pandas import DataFrame
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

from EmotionModel.utils import EmotionDataset


def evaluate_model(model: BertForSequenceClassification, tokenizer: BertTokenizer, test_data: DataFrame):
    model.eval()
    test_dataset = EmotionDataset(test_data, tokenizer, max_len=30)
    test_dataloader = DataLoader(test_dataset, batch_size=16, shuffle=False)

    all_preds = []
    all_labels = []

    with torch.no_grad():
        for batch in test_dataloader:
            input_ids = batch['input_ids'].to('cuda')
            attention_mask = batch['attention_mask'].to('cuda')
            labels = batch['labels'].to('cuda')

            outputs = model(input_ids, attention_mask=attention_mask)
            logits = outputs.logits
            preds = torch.argmax(logits, dim=1).cpu().numpy()

            all_preds.extend(preds)
            all_labels.extend(labels.cpu().numpy())

    accuracy = accuracy_score(all_labels, all_preds)
    precision = precision_score(all_labels, all_preds, average=None)
    recall = recall_score(all_labels, all_preds, average=None)
    f1 = f1_score(all_labels, all_preds, average=None)

    print('Accuracy:', accuracy)
    print('Precision:', precision)
    print('Recall:', recall)
    print('F1 Score:', f1)
