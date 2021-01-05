require 'rails_helper'

describe Event do
  describe '#create' do

    it "イベント名が空欄の場合は登録できない" do
      event = build(:event, event_name: "")
      event.valid?
      expect(event.errors[:event_name]).to include("イベント名が空欄です。入力してください。")
    end
    
    it "イベント名が51文字以上の場合は登録出来ない" do
      event = build(:event, event_name: "a" * 51)
      event.valid?
      expect(event.errors[:event_name]).to include("イベント名は4文字以上50文字以内で登録してください。")
    end

    it "イベント名が3文字以内の場合は登録できない" do
      event = build(:event, event_name: "a" * 3)
      event.valid?
      expect(event.errors[:event_name]).to include("イベント名は4文字以上50文字以内で登録してください。")
    end

    it "開始日時が空欄の場合は登録出来ない" do
      event = build(:event, start_time: "")
      event.valid?
      expect(event.errors[:start_time]).to include("開始日時が空欄です。入力してください。")
    end

    it "タグが未入力の場合でも登録できる" do
      event = build(:event, tag_list: "")
      event.valid?
      expect(event.errors[:tag_list]).to include("タグが未入力です。入力してください。")
    end

    it "都道府県が空欄の場合は登録出来ない" do
      event = build(:event, prefecture: "")
      event.valid?
      expect(event.errors[:prefecture]).to include("都道府県が空欄です。入力してください。")
    end

    it "開催場所が空欄の場合は登録でいない" do
      event = build(:event, place: "")
      event.valid?
      expect(event.errors[:place]).to include("開催場所が空欄です。入力してください。")
    end

    it "イベント詳細説明が空欄の場合は登録出来ない" do
      event = build(:event, detail: "")
      event.valid?
      expect(event.errors[:detail]).to include("イベント詳細説明が空欄です。入力してください。")
    end

    it "イベント名 開催日時 タグ 都道府県 開催場所 イベント詳細説明が存在すれば登録できる" do
      event = build(:event)
      expect(event).to be_valid
    end

  end
end
