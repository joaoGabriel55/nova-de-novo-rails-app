# frozen_string_literal: true

# number = matches[2].gsub(/[\*\-]/, '')

path = File.join(File.dirname(__FILE__), './dump.json')

records = JSON.parse(File.read(path))

def titlelize(string)
  string.split.map(&:capitalize).join(' ')
end

def address_value(record)
  value = [
    record['END'].class != Integer ? record['END'] : '',
    record['REF1'].class != Integer ? record['REF1'] : '',
    record['REF2'].class != Integer ? record['REF2'] : '',
    record['REF3'].class != Integer ? record['REF3'] : ''
  ].map(&:strip).join(' ').strip

  value != '' ? value : 'Não informado'
end

records.each do |record|
  client_name = record['NOME']
  number = 'Não informado'

  puts "Converting #{client_name}"

  next if client_name == ''

  matches = client_name.match(/^(.*?) \((\d+\*\d+)\)$/)

  unless matches.nil?
    client_name = matches[1]
    number = matches[2].gsub(/[*-]/, '')
  end

  address = Address.new(
    street: address_value(record),
    city: record['CIDADE'] != '' ? titlelize(record['CIDADE']) : 'Natal',
    state: record['UF'] != '' ? titlelize(record['UF']) : 'RN',
    zip_code: record['CEP'] != '' ? record['CEP'] : '00000-000',
    neighborhood: record['BAIRRO'] != '' ? record['BAIRRO'] : 'Não informado',
    number: 0,
    complement: nil
  )

  # raise the error
  customer = Customer.create(
    name: titlelize(client_name),
    email: nil,
    phone_number: record['FONE'] != 0 ? record['FONE'] : number,
    whatsapp: number,
    address:
  )

  if customer.errors.any?
    pp customer.errors
    break
  end
end

puts "#{Customer.count} Customer are seeded"

# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Dressmaker.create(
  name: 'Zuzu',
  max_service_quantity: 4,
  start_working_date: '21/02/2022',
  end_working_date: nil
)

t1 = Task.create(name: 'Task 1', description: 'some description', price: 1000)
t2 = Task.create(name: 'Task 1', description: 'some description', price: 1000)

ServiceOrder.create(
  entry_date: '21/02/2022',
  delivery_date: '23/02/2022',
  delivery_period: 1,
  status_service: 1,
  paid: false,
  tasks: [t1, t2],
  customer: Customer.first,
  dressmaker: Dressmaker.first
)

ServiceOrder.create(
  entry_date: '21/02/2022',
  delivery_date: '23/02/2022',
  delivery_period: 1,
  status_service: 1,
  paid: false,
  tasks: [t1, t2],
  customer: Customer.second,
  dressmaker: Dressmaker.first
)
