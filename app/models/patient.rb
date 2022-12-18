require 'elasticsearch/model'

class Patient < ApplicationRecord
  include Elasticsearch::Model

  belongs_to :medical_center

  has_many :visits
  has_many :inspection_reports, through: :visits

  validates :full_name, :phone_number, :email, presence: true

  settings analysis: {
    filter: {
      ngram_filter: { type: "nGram", min_gram: 2, max_gram: 12 }
    },
    analyzer: {
      index_ngram_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: ['lowercase', 'ngram_filter']
      },
      search_ngram_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: ['lowercase']
      }
    }
  } do
    mapping do 
      indexes :full_name, type: "string", analyzer: "index_ngram_analyzer", search_analyzer: "search_ngram_analyzer"
      indexes :passport_number, type: "string", analyzer: "index_ngram_analyzer", search_analyzer: "search_ngram_analyzer"
    end
  end
end

Patient.__elasticsearch__.create_index!
Patient.import
