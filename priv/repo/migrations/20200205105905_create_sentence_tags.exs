defmodule Dbtest.Repo.Migrations.CreateSentenceTags do
  use Ecto.Migration

  def change do
    create table(:sentence_tags) do
      add :sentence_id, references(:sentences, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:sentence_tags, [:sentence_id])
    create index(:sentence_tags, [:tag_id])
    create unique_index(:sentence_tags, [:sentence_id, :tag_id])
  end
end
