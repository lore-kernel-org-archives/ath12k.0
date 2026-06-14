Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FB2CD8CA8
	for <ath12k@archiver.kernel.org>; Sun, 14 Jun 2026 05:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgFP3UvqzIlvDi28YX756R6m0ZesSFOytF38ii9aXEM=; b=K+W5k4J1xCt8tgasbh0MDaJqaj
	4RRm5I7kAx7fPUymotPLNX4YhThKJYfVqKQ0pqJoTx5J+pJ3/wWTJCGAxJ0GyDfyIdbXR399K0uek
	16xKRMevjKpf7rmG2klWpwl+fJP0VsF2TWa0isDJTZ6XjqZBObQd+MVIdLvC/4cCWCXBMGXGWUs/m
	kQpVWGl5YgSODHAsx2muEzXnSr/X9Dxgen4+mQ+UdO+py3i0KIenGT24dI35fegJ8di7JVaakf0Gs
	jULMmm23U+hZ5PZs0DVtRneFJx7H6z1wTscdZTIo7FsZkH+kR4KkZSPHws3Pe+YW9gX2EsUhskjB3
	QcfZVeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEl-0000000CkXw-0ou2;
	Sun, 14 Jun 2026 05:18:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdEi-0000000CkXa-3Czm
	for ath12k@lists.infradead.org;
	Sun, 14 Jun 2026 05:18:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E4nBib206382
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wgFP3UvqzIlvDi28YX756R
	6m0ZesSFOytF38ii9aXEM=; b=LiZWEovXLxq8AWi/JX9hIWpViS1h1twDo0ff/5
	WcOPvaz290vV4eiDluZc4pJ9R1Ri10m91liaaXr4W5Gbora2brAyfWfZUiMT/knT
	J8GaexaapG6ZPM5YDbhnIh0Bz8fhiM9q4nYsunN7V3nKlULA6y62qL50h2qXxRFD
	wseiOGnIXLAqwj0DaKTuoj7KBSrGkXJeqFhweEdm2lvPXJtZ5UoMZD+QWLzMxnNI
	6BQwgNzogABZbFikYgzpcqZKCj0zBNGDyc2MlOxzV0wLvsRJl+V98jMzDKHwX4AQ
	CjkabX7AKqno7e5p/WOhnsTtnqLHbVcwNbexf2+ZAj6igM2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye12sa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 14 Jun 2026 05:18:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beff6b6e74so29475445ad.1
        for <ath12k@lists.infradead.org>; Sat, 13 Jun 2026 22:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781414298; x=1782019098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wgFP3UvqzIlvDi28YX756R6m0ZesSFOytF38ii9aXEM=;
        b=ObNjHiQgftHObUazB0BH93iEer35L0P0jIDM+bm8/xKHY7okmL+Cc2riq11iarcJ0k
         dt0ZpXeDtFQwyBmCbzvI5GAsKSlQY7HFn3+XGSpulesEp9wHvfepiZiNkIt5QC/XB+H4
         gaElIdvvUwXpgQwvIUd52IiYsj9sDbPIaNpSQYPGTGPee3u/JMixEoNaJ8XAQ/und5CD
         Bvp1fmRwqglr/6t8t8uQvc+NsXvt5Im/HmvYfFa95gjdFszoXq1YkC6CvSOCr0XA6Q8i
         SYRVbAKSAgmKX0cOnYz2sZw5uGhny5n8gpyzD94W0r61UpR2gBNDPP7una67wfXVh5iZ
         m/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781414298; x=1782019098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgFP3UvqzIlvDi28YX756R6m0ZesSFOytF38ii9aXEM=;
        b=XrWzG7BJ8tzAPjD4DhOS99LjwsDIm8lpf+w+0cywJGp2aPhc2GUrCF8dbxllSfPaGb
         T+TF7MCsPllo8HJjsWNWmJsX9WxPNvHds8NZrFc9QVqiffcPEaomTA7z6TvMCH2XMRbL
         iusma0S57BaD+4X5JVuwoypXbSe7s7UaO38LvIDXELwxDyUKCAdyCXqlGGjym3Uld2bQ
         TJT5UmekLnrz4y1uAo3ZdnEU5UM5PFJ4BImioc+vbIHiPArconJo2uthacd3FyeCNnMI
         CgscSAy8g++/s/XAFT3t+y2QaHBxIQPjbWchpNgsUWDOJeuzfQuzSl0HqnO9E+LZWcxA
         ta5A==
X-Forwarded-Encrypted: i=1; AFNElJ/IkJb6YmQlsSXUg3YdihG3EE3cMKf7iahTFtzN3g9Q/dHJ4+R9GREVWmA7y5MvsUXPTvsyc4w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEzjZtZoawwrO/sV3kgDiq4rHWTZ/hiE+xCu+wrJQkakdsBFSn
	Ehf16Fwed4MpT7prp6MmjV9aC1gz1ze/VqQ4673OkEoTGGLlirtuaIXDXkTaX9OqzkIYcXvDUDs
	rZGC1orjwBySj4JgjMVXuifcDnR0qGX8J+alyMX//ztmhQzM+LGpINeY9KcQoYlJM
X-Gm-Gg: Acq92OFtWGzbpbNkNuEEUbBbQjkUW9tph3mkMHfiGfuhLGtEbY7huzYY6Dy4HnzmAeu
	SOCyCQbMKDLkHRHC2yXo0U8nk2mQcr1XPva6p4fP4hiXSh9w9hS2b81+Cz9CjOL0sOB0XEcVBuK
	DtnwwQ3NCyUW8aXMSRRGmtUEZjrw+zWaj+5E2X+R2eNl/h9Br6j04VHQp48vJD+xk5y7HnVKK1j
	MNoQ5xZyxiYFvtclGRUrfzXobVhfsRYtIopjB9btHUb7MHyjM/XaZQ5ra5j2i6hHBPKUn8UK/5I
	ADO+asKHln4fUMn/iJ8xaVLYRKnoaVo60CdPqn0wrE45VYWNROSHcwP1MW52v9f0k0wxVYUeThR
	1hJsQsPQRWcvKfXCpg4nM+sOusLeMpFw0zu1n2Q9/xtqt6Dj1yIBzh2QQBXLVm7pUaWYwSPToYN
	Rr4jLIGhflJQbQIByS3t0SHhBgz1EXKz1Ke/jja58=
X-Received: by 2002:a17:903:240f:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c4125591a7mr97800425ad.21.1781414297582;
        Sat, 13 Jun 2026 22:18:17 -0700 (PDT)
X-Received: by 2002:a17:903:240f:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c4125591a7mr97800205ad.21.1781414297033;
        Sat, 13 Jun 2026 22:18:17 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c651dsm64456705ad.26.2026.06.13.22.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:18:16 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next v2 0/5] wifi: cfg80211: Add fragmented per-link station stats in MLO
Date: Sun, 14 Jun 2026 10:47:30 +0530
Message-ID: <20260614051739.3979947-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ARavWXFPhXWPfBhenk4i89FHB0O9y-QV
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2e399a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=WN52PlUurRMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=D0vhY7WTa_WH9j_4aaoA:9 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfXwUThbt02MBaF
 pA3mt9byiKjVKtLV2ZjbBV/PjjQMGTplMhnHV+1u7lpaWjGL1td34xb08AQB4evh5S0ff6U7rpk
 L01mYs5aTUN9prcdFcc01ldV8hSoVOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA0OSBTYWx0ZWRfX7xnfIUb20ri8
 SJgrNIBQoCTOqaSI7tBs03fdzXXS5VxNBhLFRT5IivtRHJ6Xo9CuNdS3VKw/M70RF2GJsF43jeN
 5Dnwfeb9WHrZF1xmIkklBt/bvZjpNaTvK8FmUxqMfXs62eNkMdc7Y2uFsuyOsMS+yHuxPWQhBkC
 S85wcvR+SpKfunlLroXS5ZVY7gFnuxvSnI6pmK8lM7dcKGPYz7n2JKmR3s3guGJ5SGXxRbGDMCI
 3gr1H4HZ3kuSAdSlyuC+unrC3RCQmCz3YxbpHq/8djGLLDz9X2UP49WItVct6K6ALWbGKQNODuF
 Ppd8TkXLSbATE2NCYY3aadi44wWyRBb9Nb9szDnNGRj0oei6obkPqKmCfwsN49EervJtUM1OfzB
 mkhBHaZMA3NI5Xz/0balidsSpIc2yQXLmw/HkkXYPY5gujPsuXPyH181EecTQCYvUWCz5C5bxEE
 IgaWdmw9TCfU8M4AUHQ==
X-Proofpoint-ORIG-GUID: ARavWXFPhXWPfBhenk4i89FHB0O9y-QV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_221820_936054_2319745A 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This series introduces fragmentation support for Multi-Link Operation
(MLO) station statistics in nl80211.

The current nl80211_dump_station() implementation works well for legacy
(single-link) stations, but it does not scale for MLO peers. With
multiple links per station, dumping all per-link information in a single
netlink message can exceed size limits, resulting in -EMSGSIZE errors
and incomplete dumps.

With 802.11be (Wi-Fi 7), a single station may have multiple links, each
with its own statistics. To address this, this series introduces a
stateful dump mechanism that splits station information into multiple
messages when required.

The dump is performed in two phases:
  - Phase 0: Aggregated (station-level) statistics
  - Phase 1: Per-link statistics sent in separate messages

This ensures:
  - Reliable delivery of complete station information for MLO peers
  - Backward compatibility for legacy stations
  - A scalable design for future extensions

Summary of changes:
  - Drop unused per-link stats handling from nl80211_send_station()
  - Introduce a helper to pack common station-level STA_INFO attributes
  - Refactor nl80211_dump_station() to use a stateful dump context
  - Implement per-link stats fragmentation using a two-phase approach
  - Add optional MAC address filtering for per-link station dumps

Message Layout Examples:

Aggregated Stats (Phase 0)

NL80211_CMD_NEW_STATION
 ├─ NL80211_ATTR_IFINDEX
 ├─ NL80211_ATTR_MAC
 ├─ NL80211_ATTR_GENERATION
 └─ NL80211_ATTR_STA_INFO
      ├─ <aggregated station attributes>
      └─ ...

Note: No NL80211_ATTR_MLO_LINKS is included in this phase.
Per-link stats are sent in Phase 1.

Per-Link Stats (Phase 1) - one message per link

NL80211_CMD_NEW_STATION
  ├─ NL80211_ATTR_IFINDEX
  ├─ NL80211_ATTR_MAC  (MLO MAC)
  ├─ NL80211_ATTR_GENERATION
  └─ NL80211_ATTR_STA_INFO (empty - present for parser compat)
       └─ NL80211_ATTR_MLO_LINKS
            └─ [linkN]
                 ├─ NL80211_ATTR_MLO_LINK_ID = N
                 ├─ NL80211_ATTR_MAC = <linkN MAC>
                 └─ NL80211_ATTR_STA_INFO
                      ├─ NL80211_STA_INFO_RX_BYTES
                      ├─ NL80211_STA_INFO_TX_BYTES
                      └─ ... more linkN stats ..

Testing:
  - Verified using "iw station dump" on a 3-link MLO station
  - iw requires some updates to parse fragmented per-link stats
    (e.g., NL80211_ATTR_MLO_LINKS handling). Those changes will be
    submitted separately.

Sample station dump output:

Single link EHT STA:
~~~~~~~~~~~~~~~~~~~

Station ff:ff:ff:0f:f8:64 (on wlan0)
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            yes
        TDLS peer:      no
        inactive time:  182068 ms
        rx bytes:       1567
        rx packets:     15
        tx bytes:       1083
        tx packets:     6
        tx retries:     0
        tx failed:      0
        rx drop misc:   0
        signal:         -30 dBm
        signal avg:     -27 dBm
        tx bitrate:     6.0 MBit/s
        tx duration:    3136 us
        rx bitrate:     1441.3 MBit/s 80MHz EHT-MCS 7 EHT-NSS 4 EHT-GI 0
        rx duration:    0 us
        last ack signal:-31 dBm
        avg ack signal: -31 dBm
        DTIM period:    2
        beacon interval:100
        connected time: 185 seconds
        associated at [boottime]:       157.326s
        associated at:  157326 ms
        current time:   342408 ms

        Link 0:
                address: ff:ff:ff:0f:f8:64
                inactive time:  182068 ms
                rx bytes:       1567
                rx packets:     15
                tx bytes:       1083
                tx packets:     6
                tx retries:     0
                tx failed:      0
                rx drop misc:   0
                signal:         -30 dBm
                signal avg:     -29 dBm
                tx bitrate:     6.0 MBit/s
                tx duration:    1568 us
                rx duration:    0 us
                last ack signal:-31 dBm
                avg ack signal: -31 dBm
                DTIM period:    2
                beacon interval:100

3 link MLO EHT STA:
~~~~~~~~~~~~~~~~~~

Station ff:ff:ff:ff:5f:23 (on wlan0)
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            yes
        TDLS peer:      no
        inactive time:  173476 ms
        rx bytes:       1036
        rx packets:     9
        tx bytes:       1694
        tx packets:     6
        tx retries:     1
        tx failed:      1
        rx drop misc:   0
        signal:         -20 dBm
        signal avg:     -22 dBm
        tx bitrate:     6.0 MBit/s
        tx duration:    2476 us
        rx duration:    0 us
        last ack signal:-22 dBm
        avg ack signal: -22 dBm
        DTIM period:    2
        beacon interval:100
        connected time: 174 seconds
        associated at [boottime]:       168.236s
        associated at:  168236 ms
        current time:   342412 ms

        Link 0:
                address: ff:ff:ff:ff:5f:23
                inactive time:  173476 ms
                rx bytes:       138
                rx packets:     3
                tx bytes:       0
                tx packets:     0
                tx retries:     0
                tx failed:      0
                rx drop misc:   0
                signal:         -27 dBm
                signal avg:     -28 dBm
                tx duration:    0 us
                rx duration:    0 us
                DTIM period:    2
                beacon interval:100
        Link 1:
                address: ff:ff:ff:ff:5f:24
                inactive time:  173976 ms
                rx bytes:       898
                rx packets:     6
                tx bytes:       1694
                tx packets:     6
                tx retries:     0
                tx failed:      0
                rx drop misc:   0
                signal:         -20 dBm
                signal avg:     -22 dBm
                tx bitrate:     6.0 MBit/s
                tx duration:    2476 us
                rx bitrate:     6.0 MBit/s
                rx duration:    0 us
                last ack signal:-22 dBm
                avg ack signal: -22 dBm
                DTIM period:    2
                beacon interval:100
        Link 2:
                address: ff:ff:ff:ff:5f:25
                inactive time:  174188 ms
                rx bytes:       0
                rx packets:     0
                tx bytes:       0
                tx packets:     0
                tx retries:     1
                tx failed:      1
                rx drop misc:   0
                signal:         -30 dBm
                signal avg:     -31 dBm
                tx bitrate:     12.0 MBit/s
                tx duration:    1920 us
                rx duration:    0 us
                DTIM period:    2
                beacon interval:100

With HE AP and STA:
~~~~~~~~~~~~~~~~~~

Station ff:ff:ff:f1:f8:f4 (on wlan0)
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            yes
        TDLS peer:      no
        inactive time:  10176 ms
        rx bytes:       968
        rx packets:     10
        tx bytes:       856
        tx packets:     6
        tx retries:     0
        tx failed:      0
        rx drop misc:   0
        signal:         -24 dBm
        signal avg:     -27 dBm
        tx bitrate:     6.0 MBit/s
        tx duration:    1300 us
        rx bitrate:     1297.1 MBit/s 80MHz HE-MCS 6 HE-NSS 4
        rx duration:    0 us
        last ack signal:-30 dBm
        avg ack signal: -30 dBm
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 11 seconds
        associated at [boottime]:       69.552s
        associated at:  69530 ms
        current time:   80780 ms
---
v2:
    - In patch 1/5, Narrowed the scope: only drops the link stats from
      nl80211_send_station() (formerly also deleted nl80211_fill_link_station();
      that function is now moved to patch 4/5 and reused there). Also fix
      the nla_put_failure label indentation (spurious leading space).
    - In patch 2/5, Fix all nla_nest_start_noflag() calls in
      nl80211_send_station() for nested attribute types (STA_INFO,
      BSS_PARAM, TID_STATS, per-tid) to use nla_nest_start() so that
      NLA_F_NESTED is set correctly.
    - In patch 3/5, Drop nl80211_dump_station_cb wrapper struct and
      nl80211_send_accumulated_station() helper; store the context pointer
      directly at cb->args[2] following the nl80211_dump_wiphy pattern.
      Build the common netlink header inline in the dump loop instead of
      delegating to a helper. Add documentation explaining why
      memset(&ctx->sinfo) is required after cfg80211_sinfo_release_content()
      to prevent a double-free in nl80211_dump_station_done().
    - In patch 4/5, Restructure the dump loop around a switch statement so
      one netlink message is produced per iteration with header construction
      in a single place. Replace nl80211_send_link_station() helper with a
      leaner nl80211_put_link_station_payload() that only fills the
      NL80211_ATTR_MLO_LINKS nest, leaving header assembly to the caller.
      Fix all nla_nest_start_noflag() calls in nl80211_fill_link_station()
      to use nla_nest_start(). Fix the AGGREGATED phase to propagate the
      real error from nl80211_put_sta_info_common() instead of returning
      skb->len, which would cause an infinite re-invocation loop on
      -EMSGSIZE. Use __free(kfree) for attrbuf to avoid scattered manual
      kfree() calls.
    - In patch 5/5, Rename local mac_addr pointer to mac to avoid shadowing
      the outer ctx->mac_addr field. Set cb->args[2] = 0 on the MAC
      validation error path to prevent nl80211_dump_station_done() from
      attempting to free a partially initialised context.
---

P Praneesh (5):
  wifi: cfg80211: Drop unused link stats handling in
    nl80211_send_station()
  wifi: cfg80211: Add helper to pack station-level STA_INFO
  wifi: cfg80211: Refactor nl80211_dump_station() to prepare for
    per-link stats
  wifi: cfg80211: Fragment per-link station stats in
    nl80211_dump_station()
  wifi: cfg80211: support MAC address filtering in station dump for link
    stats

 include/uapi/linux/nl80211.h |  19 ++
 net/wireless/nl80211.c       | 402 ++++++++++++++++++++++++-----------
 2 files changed, 297 insertions(+), 124 deletions(-)


base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.43.0


