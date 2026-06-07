Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B150CD8C8C
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIp0JgIJ7UwPVe1mRloaHo7yUoyak66S6LBfPJ02ors=; b=B57P5u4b7bOmfMGtK5M+Y1M/7c
	Uz63kAOP36QzQItdhYKqdn+JVy96C/vfcP86mnDGo6sFvNBsJc/FsHN9wNp893g/xvU/2PEuhNHT+
	P5RFZ3lrHyguPhNivEB5eXX4VKGuY66lHu6VNRoXewrW0jMST4L/g/8H1Zz1RnulsmBSfC1aBema+
	ZH8M1BQv++2xQti5dV09DUjrnk04fbaniaxGu8GLKmSX+KV46RDNxBXFpHwr+9FizRhfS0ogSthR6
	3K1Hy0nrbUyNKQaHDSKxdfpUU2Y/9isDReO0yY8Lkt80iKv7DdYFsp6Vnd8PMeUPbjx3qMYoKXzwU
	Eck4kueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmi-00000002O3N-0iwH;
	Sun, 07 Jun 2026 17:59:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmg-00000002O2l-0Hsr
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 17:59:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El3eu866294
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 17:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IIp0JgIJ7UwPVe1mRloaHo
	7yUoyak66S6LBfPJ02ors=; b=Oa8SfcsTFouf9Wp8eGDClO252L46ckRvhghCXR
	WnNqfElUAa7Y0VZKV0ifmWfCsEK8hAstBv6EyZOVcWf+628zBCRGqGHuXMO66NG3
	aeT82DjNA7JyQEHYR5KgcIv/qgoiOHho75C35VlYZ1xcxDLLZwgGrUIsHvAisBB2
	um/mJU4DqFYvLNIrI7lO9/6+8oK5gs29RyP8WI1jKZuPwT6m/tLm0tjgU7H1QHqt
	frzwVf9an9CCOa7Y+zvQyP939eFl0nCAvIVpboTF4IBm2Hir7hcDjyJDhBxCBIDU
	2WSCChjqhAxVSv0UJxApe+M63glfDuFopNzOLbzgorRDt6Tw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4gyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 17:59:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so1864878a12.3
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780855179; x=1781459979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIp0JgIJ7UwPVe1mRloaHo7yUoyak66S6LBfPJ02ors=;
        b=jmXvG2eoSGL6qLbinW7QrhcUjrq93qsl4YafZL7wUGSUISsUK6z2g942TyfFAW92u9
         lhnE3euQnrQ94WqOfRjz5vtyP9SZr3UvAM/OcDj4t9+ciWF3Rgo1QGWIGAeE7dLjeHgw
         GYnktQ0ikMxiGbKqKUmRZI+nxUn7Dxc9SnhnTDNlDtw+27MbB3HyOfTpWhXd0MwaXNdb
         5L1JYG8bWcu+H6/dq4Qg3pmeCh8/sO5ZKeuY3/yZGvlJEF8kvTok0QZyWJUUpVNukpIy
         Nvy9kHyuyb+01iqxbaF8XgY3eBUZX3+wnt4Lw7GLDjBSMaGnQf/EjnyhigaySnEQ67in
         QuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855179; x=1781459979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIp0JgIJ7UwPVe1mRloaHo7yUoyak66S6LBfPJ02ors=;
        b=OcDnlNF8YfLszF9QVO7trybIRkixw4a2Hx4E9F3B4oBEWmobnQUYntXxsQOELH2oTR
         HpSrB/eVhvvKKT97HZLh4YPVscP2Kc6GWOxr9jx10CrCFuF5khwHHKDLRxJHJKzCf7ew
         LTQVPEixZPHB9g3KsFebhzucR31VKfYa5gKSR8Kh9SkdC83AGcJ1QpQuU2rJt7hLv8do
         ZB+UR64QOsfT66rOMPSPlJAgQi/4N72zEcuk4zV+XjpGg4X1mCn5PlZnzSn4r/kGg/Ir
         6jMeN+YQqtkmt9uFN0+6L8t5MQdHEF5Ch1ZiFf6mKukRqPMkpP4PMADICcRFlAUTIN0t
         kAVw==
X-Forwarded-Encrypted: i=1; AFNElJ8Dc/OfgXAcJSu5U//IpuSm/ejSOc/DztoprU4NADjQhQfmycIcAF3QsMRsXfD020O4uX0r0FU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx29iNB06kmKRvC2x0ZjfLEJ34ogqO2APMzxuQsJKKdQgKTCqBU
	ctqsm1KmkGGyHKwLfjPQBHvMK/T/4P3Y9Gs+zgoygCouUHu5WcrYrwEaXjgDHHWEzZZh5oSWtov
	+YMCBF8rhKwRqKKbxGI46oyvn+MmxSG08APhNOzHCSniiJerApjCYW7CoHLUK+gA6
X-Gm-Gg: Acq92OE71qllMax/kr/Hat/pYjmXW9vcly+NeaVaN6Yv9CduFPrqL8KO5PnXbCr6itG
	BlsdavvG5zTxnhekNyNNYGwbGQqzr1ZKxX/5f3WOIhdNnOLTsV5MeUGzeMJP4eEMsbqa0cugxmu
	wPueOLFJfp/fFW8s1/yLn1wp98wSmoTJMYVNos6/0EE4ZYWJQua1uBBTFD7U5w9mDYmXwCNliYZ
	n7WXShX+6qr71o7fvcTSnR2pkmhAfd+mANdXzYIkxnn0yhblgcyIi3//L9Qclu9rIVevoX77O46
	/VUAV6nyfI51ENpWhR7NCiSrCRu+xW3Tr8kxTkhLMrRJEBbFwDUPqa8KiOO8gS0SkOl/C2mnWbp
	koX9LeX6L7twjf2Sq8U7k0lNTuNPMLneC39wXc9/bzqmdwrnsmChTGArFX1Fa35DuWDDhle7TQW
	esb6Oaj47wNtaV/8Udih3QrLY/4i9fLUcy5JVfVBFgl6+CKdzQwA==
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr14581018637.46.1780855179031;
        Sun, 07 Jun 2026 10:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr14580998637.46.1780855178509;
        Sun, 07 Jun 2026 10:59:38 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm13078522a12.18.2026.06.07.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:59:37 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next 0/5] wifi: cfg80211: Add fragmented per-link station stats in MLO
Date: Sun,  7 Jun 2026 23:29:07 +0530
Message-ID: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5ZMM2RmAynT7zudI0-UGJhwyQAmOGi6Z
X-Proofpoint-GUID: 5ZMM2RmAynT7zudI0-UGJhwyQAmOGi6Z
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25b18c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Svp6a0_rgz3mg1QtYSUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4MCBTYWx0ZWRfX3HukmNljnT/H
 YAYpdh93+eI7YTWxZu4ObnfzZzpY9cEXnwIThL/MQ2fbdTR12wyJIB0EKZ2PNRlHLBWOTP2Spvr
 8wcY33Umqo+wMlojWcZDwClFGn+h4B1b59PCklxstI9flAoPlPD4WdQDPyIRlBQPEjsiUvqIvrX
 hOilMbU7th0jPjacOUVxKY12XNc4W9zbMqpoXtFZBKYCYZSOC5h/tIllvWwD9S9mGiQbWMzqMDX
 J0jA7lcTbLjeDm2hjkfMMIwmgaCIG1Q/46j0ttLQxWCnSpsM8ezSmL0cdf8ijfnbv6OGLqWhhfH
 CSJA6ze59Tqw2ShOhoAvnc40HOPKnwy6PCRaC6FQisw/oPOnNpH8p1V7goAiKadsXpyuf3x2Qor
 PnC+0BBz6PwdtVf8WLFQBGJ3N+Ck0H/WkExl+NfvncpGdCqu+CNbZ75mXSVVhrGnZ5vwaYh66Uh
 TyU0l3Jjdr3wmX7/qzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105942_246379_E34B66E9 
X-CRM114-Status: GOOD (  11.81  )
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

With 802.11be (Wi‑Fi 7), a single station may have multiple links, each
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
Per‑link stats are sent in Phase 1.

Per-Link Stats (Phase 1)

NL80211_CMD_NEW_STATION
  ├─ NL80211_ATTR_IFINDEX
  ├─ NL80211_ATTR_MAC                 (MLO MAC)
  ├─ NL80211_ATTR_GENERATION
  └─ NL80211_ATTR_STA_INFO
       └─ NL80211_ATTR_MLO_LINKS
            ├─ [link0]
            │    ├─ NL80211_ATTR_MLO_LINK_ID = 0
            │    ├─ NL80211_ATTR_MAC = <link0 MAC>
            │    ├─ NL80211_STA_INFO_RX_BYTES
            │    ├─ NL80211_STA_INFO_TX_BYTES
            │    └─ ... more link0 stats ...
            │
            ├─ [link1]
            │    ├─ NL80211_ATTR_MLO_LINK_ID = 1
            │    ├─ NL80211_ATTR_MAC = <link1 MAC>
            │    ├─ NL80211_STA_INFO_RX_BYTES
            │    ├─ NL80211_STA_INFO_TX_BYTES
            │    └─ ... more link1 stats ...
            │
            └─ [link2]
                 ├─ NL80211_ATTR_MLO_LINK_ID = 2
                 ├─ NL80211_ATTR_MAC = <link2 MAC>
                 ├─ NL80211_STA_INFO_RX_BYTES
                 ├─ NL80211_STA_INFO_TX_BYTES
                 └─ ... more link2 stats ...


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

 include/uapi/linux/nl80211.h |  32 ++-
 net/wireless/nl80211.c       | 473 ++++++++++++++++++++++++++---------
 2 files changed, 392 insertions(+), 113 deletions(-)


base-commit: 4cc0cc0b297c17c2b106d6892bd13d9c32fe66ce
-- 
2.43.0


