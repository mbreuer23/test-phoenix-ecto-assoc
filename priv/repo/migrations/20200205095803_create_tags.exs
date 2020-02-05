defmodule Dbtest.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string
      # add :sentence_id, references(:sentences, on_delete: :nothing)

      timestamps()
    end

    # create index(:tags, [:sentence_id])
  end
end
