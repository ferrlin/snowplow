-- Copyright (c) 2013-2014 Snowplow Analytics Ltd. All rights reserved.
--
-- This program is licensed to you under the Apache License Version 2.0,
-- and you may not use this file except in compliance with the Apache License Version 2.0.
-- You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the Apache License Version 2.0 is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
--
-- Author(s): Yali Sassoon
-- Copyright: Copyright (c) 2013-2014 Snowplow Analytics Ltd
-- License: Apache License Version 2.0

CREATE SCHEMA IF NOT EXISTS snowplow_pivots; -- schema with tables that can be directly interfaced via a BI / pivot tool

CREATE SCHEMA IF NOT EXISTS snowplow_intermediary; --schema with intermediary tables

