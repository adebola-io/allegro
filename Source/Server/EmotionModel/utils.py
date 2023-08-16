from transformers import BertTokenizer
from torch.utils.data import Dataset
from typing import Any
import pandas as pd


class EmotionDataset(Dataset[dict[str, int]]):
    def __init__(self, data: Any, tokenizer: BertTokenizer, max_len: int):
        self.data = data
        self.tokenizer = tokenizer
        self.max_len = max_len

    def __len__(self):
        return len(self.data)

    def __getitem__(self, index: int) -> dict[str, int]:
        text = str(self.data.loc[index, 'text'])
        emotion = int(self.data.loc[index, 'emotion'])
        inputs = self.tokenizer.encode_plus(
            text,
            None,
            add_special_tokens=True,
            max_length=self.max_len,
            pad_to_max_length=True,
            return_tensors='pt',
        )
        return {
            'input_ids': inputs['input_ids'].flatten(),
            'attention_mask': inputs['attention_mask'].flatten(),
            'labels': emotion
        }


def load_data(file_path: str):
    '''Load emotion data into dataframe.'''
    df = pd.read_csv(file_path, sep='\t', header=None,
                     names=['text', 'emotion', 'emotion_id'])
    df['emotion'] = df['emotion'].apply(lambda x: int(x.split(',')[0]))
    return df
