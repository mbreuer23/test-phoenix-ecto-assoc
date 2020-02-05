defmodule Dbtest.SentencesTest do
  use Dbtest.DataCase

  alias Dbtest.Sentences

  describe "sentences" do
    alias Dbtest.Sentences.Sentence

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def sentence_fixture(attrs \\ %{}) do
      {:ok, sentence} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sentences.create_sentence()

      sentence
    end

    test "list_sentences/0 returns all sentences" do
      sentence = sentence_fixture()
      assert Sentences.list_sentences() == [sentence]
    end

    test "get_sentence!/1 returns the sentence with given id" do
      sentence = sentence_fixture()
      assert Sentences.get_sentence!(sentence.id) == sentence
    end

    test "create_sentence/1 with valid data creates a sentence" do
      assert {:ok, %Sentence{} = sentence} = Sentences.create_sentence(@valid_attrs)
      assert sentence.text == "some text"
    end

    test "create_sentence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sentences.create_sentence(@invalid_attrs)
    end

    test "update_sentence/2 with valid data updates the sentence" do
      sentence = sentence_fixture()
      assert {:ok, %Sentence{} = sentence} = Sentences.update_sentence(sentence, @update_attrs)
      assert sentence.text == "some updated text"
    end

    test "update_sentence/2 with invalid data returns error changeset" do
      sentence = sentence_fixture()
      assert {:error, %Ecto.Changeset{}} = Sentences.update_sentence(sentence, @invalid_attrs)
      assert sentence == Sentences.get_sentence!(sentence.id)
    end

    test "delete_sentence/1 deletes the sentence" do
      sentence = sentence_fixture()
      assert {:ok, %Sentence{}} = Sentences.delete_sentence(sentence)
      assert_raise Ecto.NoResultsError, fn -> Sentences.get_sentence!(sentence.id) end
    end

    test "change_sentence/1 returns a sentence changeset" do
      sentence = sentence_fixture()
      assert %Ecto.Changeset{} = Sentences.change_sentence(sentence)
    end
  end
end
