Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27968C83F1A
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 04:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sMBToC67fownmwdRlriPNogOpeVJF9xq3PvPlF6Agz4=; b=mPLSgabPn0AF0zhGCX82eCWxzg
	WmRB5SS/K5Nz1mLQxYZyQd9affRcT0ppXyB7hoyyyuhmw12ica9kjbljgliWTXaO7gAhCLQECXJLk
	CeICmxp0aPqoC8ohPgcRb9gVCSo7cojouSHp9xZUARM8kteQakD4yitmLWqLhlZVzuj7kHb3O/0I0
	xn7hTtQkY0lNTI++PiOke29Tqwtuf9A/ZVKYzrgOWua36V+i2XSJe4iM6JsTAKdhGyaLTTBUHUsBS
	F6EWmf0YpqTWuEv53Q4yShtpqhk9S6RyDCfwuH0RY2lfx52pW00PswF3glbL2ghnJA9m0qBBdKPmY
	6xFeAERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGfG-00000009CWG-3VvI;
	Thu, 17 Jul 2025 04:56:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGfE-00000009CVS-1Tf8
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 04:56:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDNnn025212
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 04:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sMBToC67fownmwdRlriPNo
	gOpeVJF9xq3PvPlF6Agz4=; b=FnrVFtTNLY4M9FYO8/88jTK5K+RDexUEH4gB27
	p8V+zobzbPcMShbuLQjbS0JwIp1g+KeLdyDJjCVaKTl/iK3AXWuWFQ29UfjM8Wsq
	37TsetgjPdOFEUqHs3/Ovai1nYicYa1Mp3xsaWhRej35krbJZfdfHI3q/Zq/E3cq
	crQ+5dqcezGBkHG5bdmuMSURNZySs1KHVR6+eahUn/na2bjW6+Rgblt0PTeUddaK
	vo3TiTDYO01UTLt+rhmHwmwv5uMx1LErmYriP3jFqZDzsVlje598vO96OarzWBe6
	ms9IEaL1XtyvO94Cxp+lYebgUlFu7RSwG38BXCEykIofT51w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqag77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 04:56:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23632fd6248so5035175ad.3
        for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 21:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752728169; x=1753332969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMBToC67fownmwdRlriPNogOpeVJF9xq3PvPlF6Agz4=;
        b=PLMIFu9VYxZTxZ+qXttsmNOa1X5Z+BTPujkReWQqUQ+bbFYoQGMcWF5095f75DrYLB
         +WtXw2m30cVP6tTu/98kQhKtZuYKao1aqQ3Gg6Ky4IBfcrSvTcILO5PFUzzCnX7ZbyRj
         aAaVc6GxpvBK4k76Zbs0TLJwwpWJdoiCT0z0Oj8gEx37zomGcLm6yALz7qbz+taAhE/g
         Fesw2gmKvvWtAmHGx7aVZ2T7t9ZFb/leUhL9PlLc5uM0PSpwJjhdost9Qj2dajcKx2mS
         Cq+wlxCSwlB3osZvrrVHDBtGbHu0MdiPWGXAmZO8L23/UXAIaH1Am0sTN4Jib4hUex6C
         263A==
X-Forwarded-Encrypted: i=1; AJvYcCUhm5/wxS0GNGTlX3Q3ojG051Mia6QoaR14Kv4ufGkhh9cG3YCg3M6e4CubfdkJHOBlV0z48m0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6NolrRc4b0P0dN7DO1F2jQUO5tYvmSHsF7RqP7zSI4QJgqWPG
	2nqxahXgL18u+AmzptHqVEZsT42b6piLAsYKNzg1FDBRRjEB5qSlMRDcczp3k1kwMMzJ/2SWtOP
	Xvksc0Fw8gFX0VWB5bHPL18Puu5PGru2/Clz4oGorkyjwozYV8CQsDeoL1aamFDCnnH/J7zMD
X-Gm-Gg: ASbGncvZ+8XpYxj2lcmJUTK4/TU0QY9Z+IJ3jtzI90IqtPBdaB4s1ebVbSZPUkTQufw
	nT2BuVr/b+ID82JG7JATwNuEsxsTvDTJjhLpm4QXZkP6pcs4nfhTsroRF0WRUOMn4DDN0cJknkZ
	tyJ8TuOD391p06jCpsZYFtrwWjM+BW4ReWXdedL91w5uKx+O/qgeguMYmjzrycfhqAisBSdvlVY
	6JtVkN1mA+gIguvlngi2R1jg9r9HdEAEmWxfswGFKUsj/M36cbrxNXHBHTgkWU4e6beY6w56V5n
	YhgIL3tKIRX2Jd6KDkDgAkrqSY/UC+0e1MDelsaq5XwnLa5tZhA3wuqILSPAHeJMd2EJW6gezRJ
	Vs9Ykgy7JUU61MuzaCQ6mZ7iurZspQIIkuOGB8T9TdCE8upw1HVVJ6YUm9M7xDigC
X-Received: by 2002:a17:902:d54a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23e257300ddmr78181835ad.34.1752728168373;
        Wed, 16 Jul 2025 21:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7NicCsd0n4RRF/0Y6gaSocEg9jfxM4G6NoroagLVvxzbbz7cCzIYsuNgKYXM10GyjLiuHuQ==
X-Received: by 2002:a17:902:d54a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23e257300ddmr78181435ad.34.1752728167674;
        Wed, 16 Jul 2025 21:56:07 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aeadcsm136269665ad.78.2025.07.16.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 21:56:07 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [DESIGN RFC] Critical Update handling in the kernel
Date: Thu, 17 Jul 2025 10:25:40 +0530
Message-Id: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6878826a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kDxmFn6s7itEDciakTYA:9 a=CJYILJ9lChCZOd2d:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 93sP0cGFlQBns3RRUwTt0TbbNFspUcYK
X-Proofpoint-GUID: 93sP0cGFlQBns3RRUwTt0TbbNFspUcYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA0MSBTYWx0ZWRfX3+SJMDHhdywQ
 u4PKg1T8VsZvMeiqVZGMjOGQ98HIr/tcu0SDiKnoZxSQrf17npK+Y3cEn+FhsIkIBNW5wZ29rSZ
 VTOiwoagvbXXAGiSD1hEG6bMO0KEhlZf3uVKJ1LYl1RqeLuKf/Kf6NFD/4g6ViF94Oveew7fBJa
 aEl4yc90RvBi9MUZ6jZBHHaPZf7QK6Qki/nc19IFptTbLcndFS69q5XriOXh1eRTrHf1YnsG6rV
 /R4MigjGl0q8VXR2q+exRWqYEtgSiqUoAZvVcrEVFnadBtzm4+pafWxc1TWHdJfbzas8Fz3doon
 UACw6JWv/DjhX5O/vcXpTMnRy5l3BJ+syQj8xenPVqjimjsFgEFAnJXB5QegmGOo1y53lZQRDwd
 oxb1U6gMMYy3WrEJO0RJgKWtrhIViWITbvABLRExPrUv2VhtNIqX2maWC+9a+NTkZO5JJQXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_215612_537526_C7698678 
X-CRM114-Status: GOOD (  16.43  )
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

Hi,

Some time ago, an approach was proposed [1] where all aspects of critical
update handling—including BPCC management, element propagation, and
timing-sensitive updates—were delegated entirely to the vendor's firmware.
While this design offers tight timing control and efficiency, one of the
key concerns raised was:

"What about vendors whose firmware does not support this functionality?"
"What about mac80211_hwsim? How this is supposed to work with
 mac80211_hwsim?"

[1]: https://lore.kernel.org/linux-wireless/20240403162225.3096228-1-quic_rrchinan@quicinc.com/

To address this, a fallback mechanism in the kernel (mac80211) is being
proposed. This kernel-side implementation ensures that the feature remains
functional even when firmware support is absent, albeit with some
limitations in timing precision and certification readiness.

===========================================================================
                            OPEN QUESTIONS
===========================================================================
Before we move forward with implementation, we'd like to confirm whether
the proposed design looks sound. Are there any concerns or potential issues
we should be aware of?

Out of curiosity, we're also interested in understanding how other vendors
are currently handling this feature in their downstream drivers. Is it
typically offloaded to firmware, or is the logic implemented in the kernel?
Just want to confirm whether all this will be used only by mac80211_hwsim
or will there be any actual users?


===========================================================================
                              BACKGROUND
===========================================================================
Critical Update is a mechanism where, if a BSS parameter changes on one of
the links within a Multi-Link Device (MLD), that change is also signaled in
the beacons/probe response of its partner links. This allows the multi-link
client to be proactively informed of the update through any of the partner
links, rather than waiting to receive the updated beacon/probe responses
from the affected link itself.

For instance, if Link A initiates a channel switch, it will include the
Channel Switch Announcement (CSA) element in its own beacon.
Simultaneously, Link B will reflect this change by embedding the same CSA
element within Link A’s per-STA profile inside the Basic Multi-Link Element
(BMLE) of its own beacon.

This ensures that multi-link clients monitoring Link B can be promptly
informed of the change on Link A, without needing to wait for Link A’s next
beacon.

The below diagrams tries to depict the above said behavior:

Link A and Link B (part of MLD) originally beaconing just fine:

┌──────────────────────────────┐ ┌───────────────────────────────┐
│         Link A's beacon      │ │         Link B's beacon       │
│                              │ │                               │
│......                        │ │......                         │
│┌────────────────────────────┐│ │┌─────────────────────────────┐│
││RNR Element:                ││ ││RNR Element:                 ││
││  TBTT INFO:                ││ ││  TBTT INFO:                 ││
││    MLD INFO:               ││ ││    MLD INFO:                ││
││       LINK ID: B           ││ ││       LINK ID: A            ││
││       BPCC: 1              ││ ││       BPCC: 1               ││
│└────────────────────────────┘│ │└─────────────────────────────┘│
│......                        │ │......                         │
│┌────────────────────────────┐│ │┌─────────────────────────────┐│
││MULTI LINK Element:         ││ ││MULTI LINK Element:          ││
││  COMMON INFO:              ││ ││  COMMON INFO:               ││
││     LINK ID: A             ││ ││     LINK ID: B              ││
││     BPCC: 1                ││ ││     BPCC: 1                 ││
││                            ││ ││                             ││
││  Basic STA profile count: 0││ ││  Basic STA profile count: 0 ││
│└────────────────────────────┘│ │└─────────────────────────────┘│
└──────────────────────────────┘ └───────────────────────────────┘

Link A started CSA and during CSA, the beaconing would look like -

┌──────────────────────────────┐ ┌──────────────────────────────┐
│       Link A's beacon        │ │       Link B's beacon        │
│                              │ │                              │
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││Capabilities Info:          ││ ││Capabilities Info:          ││
││   BIT 6: CU Bit: True      ││ ││   BIT 6: CU Bit: True      ││
│└────────────────────────────┘│ │└────────────────────────────┘│
│┌────────────────────────────┐│ │ ......                       │
││CSA:                        ││ │┌────────────────────────────┐│
││  CS Count: 5               ││ ││RNR Element:                ││
│└────────────────────────────┘│ ││  TBTT INFO:                ││
│......                        │ ││    MLD INFO:               ││
│┌────────────────────────────┐│ ││       LINK ID: A           ││
││RNR Element:                ││ ││       BPCC: 2              ││
││  TBTT INFO:                ││ │└────────────────────────────┘│
││    MLD INFO:               ││ │......                        │
││       LINK ID: B           ││ │┌────────────────────────────┐│
││       BPCC: 1              ││ ││MULTI LINK Element:         ││
│└────────────────────────────┘│ ││  COMMON INFO:              ││
│......                        │ ││     LINK ID: B             ││
│┌────────────────────────────┐│ ││     BPCC: 1                ││
││MULTI LINK Element:         ││ ││                            ││
││  COMMON INFO:              ││ ││  Basic STA profile count: 1││
││     LINK ID: A             ││ ││  Per STA Profile:          ││
││     BPCC: 2                ││ ││     Link ID: A             ││
││                            ││ ││     ┌─────────────────────┐││
││  Basic STA profile count: 0││ ││     │CSA:                 │││
│└────────────────────────────┘│ ││     │  CS Count: 5        │││
└──────────────────────────────┘ ││     └─────────────────────┘││
                                 │└────────────────────────────┘│
                                 │......                        │
                                 └──────────────────────────────┘



===========================================================================
                            DESIGN PROPOSAL
===========================================================================

Assumptions:
------------
The critical update procedure is highly timing-sensitive. Ideally, this
should be handled by the firmware to ensure precise synchronization with
DTIM beacons. However, since not all firmware implementations support this
capability, the proposed kernel-side handling serves as a fallback
mechanism.

That said, due to inherent limitations in kernel-level timing
accuracy—especially in offloaded beacon scenarios—this approach may not
fully meet the strict timing requirements expected in certification
processes. It provides a best-effort solution but may not be suitable for
deployments where certification compliance is mandatory.



Extended feature flag:
----------------------
This design introduces additional computational overhead, which could
potentially delay beacon processing. Since not all mac80211 drivers may
prefer this behavior, introduce a new extended feature flag -
CRITICAL_UPDATE_SELF_MANAGED. mac80211 will NOT perform these extra
computations if the driver advertises this feature support.



Parsing the beacon update:
--------------------------
During the ieee80211_assign_beacon() call (where link->u.ap.beacon is
updated whenever the beacon content is initially set using
ieee80211_start_ap(), modified through ieee80211_change_beacon(), or
changed as a result of channel or color switch events) -

1. Store the new beacon data in a new pointer, following the usual flow.
2. Parse the beacon (using the head and tail pointers) and record the
   starting offsets of each required Element (earlier referred to as IE i.e
   Information element) in an array, indexed by element id or extended
   element id. This is done per link object.
3. If a previous beacon exists:
    3.1 For each element related to the critical update, perform a memcmp()
        to detect changes compared to the previous contents.
    3.2 If any such element has changed, set the critical update flag in
        some link-level object (e.g., link_conf). (this is for the affected
        link)
        3.2.1 At the same time, set the critical update flag for all
              partner links as well in the same object.
    3.3 Increment the BPCC[2] value (modulo 256 excluding 255) for the
        current link.
4. If critical update flag got set in previous step for partner links, call
   link_info_changed() with CHANGED_BEACON to notify lower layer that
   beacon has changed. This applies only in case when beacon is offloaded
   to firmware. In case beacon is given to driver at every TBTT, there is
   no need to notify since at next TBTT, driver will fetch the latest
   beacon anyways.



Forming the new beacon:
-----------------------
In the __ieee80211_beacon_get() function, where the beacon SKBs are
constructed:

1. Allow the existing logic to generate all beacon SKBs (including multiple
   SKBs in the case of MBSSID-EMA).
2. For each beacon SKB:
    2.1 Parse the RNR (Reduced Neighbor Report) element.
        2.1.1 For each TBTT Info entry:
            2.1.1.1 Extract the BSSID
            2.1.1.2 Retrieve the corresponding link sdata from BSSID
            2.1.1.3 fetch the latest BPCC value.
            2.1.1.4 Update the frame with this latest BPCC value.
    2.2 Parse the MBSSID profile element.
        2.2.1 For each non-Tx profile:
            2.2.1.1 Extract the BSSID
            2.2.1.2 Retrieve the corresponding link sdata from BSSID
            2.2.1.3 If the critical update flag is set in link object, set
                    the CU (Critical Update) bit in the capability element.
            2.2.1.4 Set non_tx_update = true.
    2.3 Parse the multi-link element.
        2.3.1 For the self link (already known), fetch the latest BPCC
              value.
        2.3.2 Update the frame with this BPCC value.
    2.4 Update the capability element in the SKB:
        2.4.1 If the critical update flag is set, set the CU bit.
        2.4.2 If non_tx_update == true, also set the non-Tx CU bit.

This mechanism sufficiently handles critical updates due to modifications
of existing elements (elements related to the critical update which are
already present in the beacon and just one or more field is/are changing
its value). However, in the case of new element inclusion (elements related
to the critical update which are not alread present in the beacon, but is
getting added from next beacon), additional handling is required.
Specifically, the newly included elements related to the critical update
must be added to the per-STA profile within the Basic Multi-Link Element
(BMLE) [3].

To achieve this:

3. Allow the existing logic to form the beacon SKB as previously defined
   (this already handles modification updates).
4. Maintain an extra_len variable to track any additional space required
   for including additional elements.
5. While parsing:
    5.1 If critical update is going on in partner link due to inclusion of
        elements, increment extra_len accordingly.
    5.2 The required length is determined using the eid/ext eid based
        offset  maintained in each beacon data structure.
    5.3 Since the element offset is known, and the next byte is the tag
        length, the total length is tag_len + 2 (for EID and length
        fields).
    5.4 Account for any additional fields that may be needed (e.g.,
        sub-element ID and length in the Multi-Link IE).
6. Compute the new beacon size:
     new_size = current_size + extra_len
7. Allocate a new SKB with the updated size.
8. Copy the existing contents and insert the new or updated elements at the
   appropriate offsets.
9. Since IE offsets are cached in the beacon data structure, the entire IE
   can be copied directly without re-parsing the full beacon from other
   links.
10. Free the original beacon SKB.
11. Return the newly constructed beacon SKB.



DTIM beacon handling:
---------------------
As per requirement [4], the Critical Update (CU) bit in the capability
field must be cleared in the DTIM beacon.

For Non-Offloaded Beacon Handling:
    1. The function __ieee80211_beacon_add_tim() is responsible for
       updating the DTIM count.
    2. When the DTIM count reaches 1 (indicating that the next beacon will
       be a DTIM beacon), the critical update flag in the corresponding
       link object should be reset.

For Offloaded Beacon Handling:
    1. If precise control is required:
         1.1 Since DTIM updates are managed by the lower layer (typically
             the firmware or driver), an API will be provided to explicitly
             reset the critical update flag.
         1.2 The driver, upon detecting that a DTIM beacon is about to be
             transmitted, can invoke this API to perform the reset.
    2. If some timing inaccuracy is acceptable:
         2.1 mac80211 can maintain a timer to reset the critical update
             flag after a DTIM interval.
         2.2 However, this approach may lead to synchronization issues, as
             mac80211 cannot guarantee the exact timing of beacon
             transmission handled by the hardware.



Update BPCC back to NL:
-----------------------
After the kernel increments the BPCC value, it can emit a netlink event
containing the updated BPCC value. This allows hostapd to receive the
latest BPCC and include it in probe/association response frames, as
required by the specification.

This coordination ensures that all - beacon, probe response, and
association response frames reflect consistent BPCC values, maintaining
compliance with spec-defined behavior for multi-link and critical update
handling.



Counter offset handling of partner links:
-----------------------------------------
Note: This applies only in case of offloaded beacon case.

Since not all links operate with the same beacon interval, the firmware
cannot simply decrement the counter on every self-beacon transmission.

To handle this correctly:
Each BPCC counter will be associated with:
    * An offset (location in the frame where the counter resides), and
    * A periodicity value, indicating how often the counter should be
      decremented.

The firmware is expected to:
   * Track the number of self-beacon transmissions per link.
   * Decrement the counter only after the specified number of
     transmissions, as defined by the periodicity value.
   * This ensures that counter updates are aligned with each link’s
     individual beacon schedule, maintaining spec compliance in multi-link
     scenarios.



Complexities:
-------------
When adding elements in per STA profile, the element length might exceed
hence fragmentation needs to be handled properly.

Max Channel Switch Time element handling is still tricky since this field's
value starts decrementing once counter reaches 0 and before beacon comes up
in next new channel.



Alternative approach:
---------------------
memcmp vs hashing
=================
In the section where memcmp() is used to detect changes in beacon elements
(to determine if a critical update is needed), this logic could
alternatively be handled at the hostapd level.

Since hostapd does not retain the previous beacon frame, it cannot perform
a direct memory comparison. However, it can compute and store hashes of the
required elements during beacon formation. On subsequent updates, it can
compare the new hashes with the previously stored ones to detect changes.

If any element's content has changed, hostapd can:
   1. Include this information in a new netlink attribute, indicating which
      elements have changed.
   2. Pass this to the kernel, allowing mac80211 to make informed decisions
      about setting the Critical Update (CU) bit.

This approach offloads the comparison logic from the kernel and leverages
hostapd’s control over beacon generation, while still respecting the timing
and structural constraints of the beacon update process.

Only this comparison—and consequently the signaling of the critical update
can be offloaded to hostapd if needed. All other operations must remain in
the kernel to meet strict timing requirements.


References:
-----------
Spec: IEEE P802.11be/D7.0, August 2024

[1]: The elements which are considered for critical update are classified
     in section 11.2.3.14 TIM Broadcast.

[2]: BPCC stands for BSS Parameters Change Count

[3]: AH.7 Example of critical update operation and AH.8 Example of
     advertising quieting or channel switching information of a link on
     another link.

[4]: 9.4.1.4 Capability Information field

