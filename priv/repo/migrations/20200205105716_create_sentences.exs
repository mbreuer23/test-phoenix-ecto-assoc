defmodule Dbtest.Repo.Migrations.CreateSentences do
  use Ecto.Migration

  def change do
    create table(:sentences) do
      add :text, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:sentences, [:user_id])
    create index(:sentences, [:tag_id])
  end
end
