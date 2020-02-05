defmodule Dbtest.Repo.Migrations.RefSentencesInTags do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add :sentence_id, references(:sentences, on_delete: :nothing)
    end

    create index(:tags, [:sentence_id])
  end
end
