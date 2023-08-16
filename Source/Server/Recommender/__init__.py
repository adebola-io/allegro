import torch.optim as optim
from typing import Literal
from transformers import BertTokenizer
from torch import cat, cosine_similarity
import torch.nn as nn


tokenizer: BertTokenizer = BertTokenizer.from_pretrained('./Models/Tokenizer')


class Track:
    '''A music track.'''

    def __init__(self, track_args):
        self.title: str = track_args['title']
        self.album_artist = track_args['album_artist']
        self.artist = track_args['artist']
        self.release_year = track_args['release_year']


def featurize(tracks: list[Track]):
    '''Ranks the tracks based on user preference.'''
    track_vectors = []
    for track in tracks:
        # concatenate the track data into a single string
        track_data = track.title.join(
            [track.album_artist, track.artist, track.release_year])
        # encode the track data as a vector
        track_vector = tokenizer.encode(track_data, return_tensors='pt')
        # append the vector to the list of track vectors
        track_vectors.append(track_vector)

    # convert the list of track vectors into a tensor
    track_vectors = cat(track_vectors, dim=0)
    # calculate the cosine similarity matrix
    cosine_sim = cosine_similarity(track_vectors, track_vectors, dim=1)
    # reshape the cosine similarity matrix into a square matrix
    cosine_sim = cosine_sim.view(len(tracks), len(tracks))

    # define the number of latent factors
    num_factors = 10
    # create two embedding matrices for tracks and users
    track_embedding = nn.Embedding(len(tracks), num_factors)
    # assuming there is only one user
    user_embedding = nn.Embedding(1, num_factors)
    # initialize the embedding matrices randomly
    track_embedding.weight.data.normal_(0, 0.01)
    user_embedding.weight.data.normal_(0, 0.01)


def train(track_embedding, user_embedding, cosine_sim):
    # define the number of epochs
    num_epochs = 100
    # create an optimizer for the embedding matrices
    optimizer = optim.SGD(
        [track_embedding.weight, user_embedding.weight], lr=0.01)
    # create a loss function for mean squared error
    loss_fn = nn.MSELoss()
    # loop over epochs
    for epoch in range(num_epochs):
        # compute predicted similarity matrix
        pred_sim = user_embedding.weight @ track_embedding.weight.t()
        # compute loss
        loss = loss_fn(pred_sim, cosine_sim)
        # compute gradients
        loss.backward()
        # update embedding matrices
        optimizer.step()
        # reset gradients
        optimizer.zero_grad()
