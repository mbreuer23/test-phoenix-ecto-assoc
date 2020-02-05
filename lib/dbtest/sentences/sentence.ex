defmodule Dbtest.Sentences.Sentence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sentences" do
    field :text, :string
    belongs_to :user, Dbtest.Users.User
    many_to_many :tags, Dbtest.Tags.Tag, join_through: Dbtest.SentenceTag

    timestamps()
  end

  @doc false
  def changeset(sentence, attrs) do
    sentence
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
