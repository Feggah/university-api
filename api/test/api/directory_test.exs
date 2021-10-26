defmodule Api.DirectoryTest do
  use Api.DataCase

  alias Api.Directory

  describe "universities" do
    alias Api.Directory.University

    import Api.DirectoryFixtures

    @invalid_attrs %{city: nil, initials: nil, name: nil, students: nil}

    test "list_universities/0 returns all universities" do
      university = university_fixture()
      assert Directory.list_universities() == [university]
    end

    test "get_university!/1 returns the university with given id" do
      university = university_fixture()
      assert Directory.get_university!(university.id) == university
    end

    test "create_university/1 with valid data creates a university" do
      valid_attrs = %{city: "some city", initials: "some initials", name: "some name", students: 42}

      assert {:ok, %University{} = university} = Directory.create_university(valid_attrs)
      assert university.city == "some city"
      assert university.initials == "some initials"
      assert university.name == "some name"
      assert university.students == 42
    end

    test "create_university/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_university(@invalid_attrs)
    end

    test "update_university/2 with valid data updates the university" do
      university = university_fixture()
      update_attrs = %{city: "some updated city", initials: "some updated initials", name: "some updated name", students: 43}

      assert {:ok, %University{} = university} = Directory.update_university(university, update_attrs)
      assert university.city == "some updated city"
      assert university.initials == "some updated initials"
      assert university.name == "some updated name"
      assert university.students == 43
    end

    test "update_university/2 with invalid data returns error changeset" do
      university = university_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_university(university, @invalid_attrs)
      assert university == Directory.get_university!(university.id)
    end

    test "delete_university/1 deletes the university" do
      university = university_fixture()
      assert {:ok, %University{}} = Directory.delete_university(university)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_university!(university.id) end
    end

    test "change_university/1 returns a university changeset" do
      university = university_fixture()
      assert %Ecto.Changeset{} = Directory.change_university(university)
    end
  end
end
