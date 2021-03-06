gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

field :first_name, as: :string
field :last_name,  as: :string
field :email,      as: :string
field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!

# new_contact = Contact.create(first_name: 'Marty', last_name: 'McFly', email: 'mart@mcfly.com')
# new_contact = Contact.create(first_name: 'George', last_name: 'McFly', email: 'george@mcfly.com')
# new_contact = Contact.create(first_name: 'Lorraine', last_name: 'McFly', email: 'lorraine@mcfly.com')
# new_contact = Contact.create(first_name: 'Biff', last_name: 'Tannen', email: 'biff@tannen.com')
# new_contact = Contact.create(first_name: 'Doc', last_name: 'Brown', email: 'doc@brown.com')

  # attr_accessor :first_name, :last_name, :email, :note
  # attr_reader :id

  # @@contact = []
  # @@next_id = 1000
  #
  # def initialize(first_name, last_name, email, note="N/A")
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email

  #   @id = @@next_id
  #
  #   @@next_id += 1
  # end


    # def full_name
    #   "#{first_name} #{last_name}"
    # end

#   def self.all
#     @@contact
#     return @@contact
#   end
#
#   def self.create(first_name, last_name, email, note)
#     new_contact = Contact.new(first_name, last_name, email, note)
#     @@contact << new_contact
#     return new_contact
#   end
#
#   def update(attribute, value)
#       if attribute == "first_name"
#         self.first_name = value
#       elsif attribute == "last_name"
#         self.last_name = value
#       elsif attribute == "email"
#         self.email = value
#       elsif attribute == "note"
#         self.note = value
#       end
#   end
#
#
#   def self.find(id)
#     unique = nil
#     @@contact.each do |contact|
#       if id = contact.id
#         unique_contact = contact
#         return contact
#       end
#     end
#   end
#
#
#   def self.find_by(attribute, value)
#     if attribute == "first_name"
#       @@contact.each do |contact|
#         if value == contact.first_name
#           return contact
#         end
#       end
#       nil
#     end
#     if attribute == "last_name"
#       @@contact.each do |contact|
#         if value == contact.first_name
#           return contact
#         end
#       end
#       nil
#     end
#     if attribute == "email"
#       @@contact.each do |contact|
#         if value == contact.email
#           return contact
#         end
#       end
#       nil
#     end
#      if attribute == "id"
#        @@contact.each do |contact|
#          if value == contact.id
#            return contact
#          end
#        end
#        nil
#      end
#      return contact
#   end
#
#   def self.delete_all
#     @@contact.clear
#   end
#
#
#   def delete
#     @@contact .delete(self)
#     return @@contact
#   end
#
#
# end
#
#
# #   # This method should initialize the contact's attributes
# #   def initialize
# #
# #   end
# #
# #   # This method should call the initializer,
# #   # store the newly created contact, and then return it
# #   def self.create
# #
# #   end
# #
# #   # This method should return all of the existing contacts
# #   def self.all
# #
# #   end
# #
# #   # This method should accept an id as an argument
# #   # and return the contact who has that id
# #   def self.find
# #
# #   end
# #
# #   # This method should allow you to specify
# #   # 1. which of the contact's attributes you want to update
# #   # 2. the new value for that attribute
# #   # and then make the appropriate change to the contact
# #   def update
# #
# #   end
# #
# #   # This method should work similarly to the find method above
# #   # but it should allow you to search for a contact using attributes other than id
# #   # by specifying both the name of the attribute and the value
# #   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
# #   def self.find_by
# #
# #   end
# #
# #   # This method should delete all of the contacts
# #   def self.delete_all
# #
# #   end
# #
# #   def full_name
# #
# #   end
# #
# #   # This method should delete the contact
# #   # HINT: Check the Array class docs for built-in methods that might be useful here
# #   def delete
# #
# #   end
# #
# #   # Feel free to add other methods here, if you need them.
# #
# # end
