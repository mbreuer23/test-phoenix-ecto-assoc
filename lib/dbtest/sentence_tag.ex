defmodule Dbtest.SentenceTag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "sentence_tags" do
    belongs_to :sentence, Dbtest.Sentences.Sentence
    belongs_to :tag, Dbtest.Tags.Tag

    timestamps()
  end

  @doc false
  def changeset(sentence_tag, attrs) do
    sentence_tag
    |> cast(attrs, [:sentence_id, :tag_id])
    |> validate_required([:sentence_id, :tag_id])
  end
end
