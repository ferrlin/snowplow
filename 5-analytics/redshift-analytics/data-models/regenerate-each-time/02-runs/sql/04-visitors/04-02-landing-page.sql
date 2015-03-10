-- Copyright (c) 2013-2015 Snowplow Analytics Ltd. All rights reserved.
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
-- Authors: Yali Sassoon, Christophe Bogaert
-- Copyright: Copyright (c) 2013-2015 Snowplow Analytics Ltd
-- License: Apache License Version 2.0

-- The visitors_landing_page table contains one line per individual website visitor (in this batch).
-- The standard model identifies visitors using only a first party cookie.

-- Next, create a table with landing page per visitor

DROP TABLE IF EXISTS snowplow_intermediary.visitors_landing_page;
CREATE TABLE snowplow_intermediary.visitors_landing_page
  DISTKEY (blended_user_id) -- Optimized to join on other session_intermediary.visitors_X tables
  SORTKEY (blended_user_id) -- Optimized to join on other session_intermediary.visitors_X tables
  AS (
    SELECT
      blended_user_id,
      page_urlhost,
      page_urlpath
    FROM (
      SELECT
        blended_user_id,
        FIRST_VALUE(page_urlhost) OVER (PARTITION BY domain_userid ORDER BY dvce_tstamp, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS page_urlhost,
        FIRST_VALUE(page_urlpath) OVER (PARTITION BY domain_userid ORDER BY dvce_tstamp, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS page_urlpath
      FROM snowplow_intermediary.events_enriched_final
    ) AS a
    GROUP BY 1,2,3
  );