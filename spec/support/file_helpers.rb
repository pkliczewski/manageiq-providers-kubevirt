#
# Copyright (c) 2018 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require 'recursive_open_struct'

module FileHelpers
  def unprocessed_object(file)
    RecursiveOpenStruct.new(unprocessed_hash(file), :recurse_over_arrays => true)
  end

  def unprocessed_hash(file)
    data = file_fixture(file).read
    YAML.safe_load(data, [Symbol])
  end
end
