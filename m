Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D50CDB466
	for <ath12k@archiver.kernel.org>; Thu, 25 Jun 2026 05:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FIPwpJrdlN+RhaFH+uw0EdAXcTDgZgdTYte4eQcoRyU=; b=1maJefHi5lHyuApWRM0XZhoJhJ
	NVUvWXdA28UYKPGK20wFAnnG95shgggINq96MqpgBE6KmLQkfxmODB4cT5Ug/8cpJslEvB5ikKHVc
	WsTXOoKaWl+aE54YR+my8YYoq9ty2gArIPJwlcgWUNmn0v2NqHzeP3avHMOmB5lK5/zHwl9/08nhs
	4QgnVKFnh/u2pwx/27K3b90lpowMZ0l76MVrXMekzZh3Bxni7AQdLl+0l7v7FgPjew5qvrH6Lq4+m
	AgbhU8NGvfLX8FxijXuQOjF1dcoywxkdpfDG9F1J+DRp3hJgxKLJaQYGLYG1ZD0kGi3IAV11Ot9h1
	TfKEceaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccFk-00000008eGC-1sOO;
	Thu, 25 Jun 2026 05:03:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccFh-00000008eFq-1DDf
	for ath12k@lists.infradead.org;
	Thu, 25 Jun 2026 05:03:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eWVs1131839
	for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 05:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FIPwpJrdlN+RhaFH+uw0Ed
	AXcTDgZgdTYte4eQcoRyU=; b=NeXfj7ZIlchaZQrq1ZsGdfcRp887RXWj7iHOQB
	gRamjHwcBk0l0fSJXqjPuoQasXDTS6BiKN5qQlIyP5zj820YoKUNujSsRYi9loEm
	xIlWLXsk0OQO2wJqQ8Qyo+uGDMyXkPkdH5ursUqwyfTbl8b7KK6JVpRrAPRdus+I
	HDWIjc2iAandDZ494iyxOWmvQfg17ePeOwfkSM2rk3y8AMOBBgnFM+ab94Bx7sSp
	isIOJvJVxcluO/odjKIKgO9H+iSBqT/FLOYhltzO+NehgO6OTkZpaknBe2F8/5/q
	VzhBMgn7AOWOmARhloZLdqulEmhyywsTO+4Ip2csedIVI06g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g3xhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 05:03:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13980b6561dso6932400c88.1
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782363825; x=1782968625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FIPwpJrdlN+RhaFH+uw0EdAXcTDgZgdTYte4eQcoRyU=;
        b=BdkG560pR/lp2FW2Zzb1LwP4Oy+POi/JKHUauiNkTrpuQSZ7l6DCFMffGQqYWx2W/0
         mBvFWaSrMje9R0Fw5bpxCnx7yR2rSscoMUaL2AdK38bPQcI3OXn/NVWc7uDNQAZbfuqq
         cAsV34knxG87QNvM153fj5cvyeDBaI3A2S2vx1/RtMAG2GXwT9QaNEDOsl3qs0Eib6kb
         fQnLk9QGknahc36eXuzQ2yCbS43s+GD0jIPpcxc26ubgbaJSOpNBqTL4zK3oIsLsGAeJ
         I9bsk2f94ZaLhuGp1uUIMuXd3Sp2fgtDoVIUJh580rguLx4cYUR9evreHxQGwnFOuFH8
         KgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782363825; x=1782968625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIPwpJrdlN+RhaFH+uw0EdAXcTDgZgdTYte4eQcoRyU=;
        b=QeCUlhLog1vyR5J06j+6ZKxZ7hrhiab8LUVrPWvC7Ii9SZH7rvOUWtfazjk1F3gCyF
         pjQBcKtuxWvaFcrVRKwCyISoy+gWxZ7c6riNz+G4cn6zhnTRxBN47DOgRVmVHhOFGtKi
         OXFeU+AQ+upw1oOG5vp7ILhV1k6TtNKXE1BkMPzgHcpBsSuHRQwprggBBtIgbDptq42/
         AflvNH/fRAkDVXR9gB5ETbiMWi5It99k6fe22FOUMdtGMdj/mFSS5ft+ud1pdyrTxe36
         I1UDAE8UoRAVJ8HuJA1Hwr2/i8k5HKcA3fg3LKbwiJC89plUsMqQvvOr7uDLx1N/JdzM
         OozQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3NONeXdQlT9n+SKp/zMPKNMWTHR9StecE3+zHh4Q1uZurqpBQ+gKAPVoJynM6kESVO9eKkKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEsGYtprMS4Sf37W1/+/3umLr5elUsOv4iACZsh+4IEFPeeuOb
	GuMDbZmtSIxCwQJMS4JjjMseFQR67lLGReUWWW8VAyKC/Bp0Lu6QMaZ/AgCK+XeZiRX3G4T7AK0
	996nl74mVDJHEka+1ZkTi0rcg6fAcTGd5krjzvgwannp7I0YWc4gTf+XNqJU2QZs6
X-Gm-Gg: AfdE7cmj9MLaOCEcYGeB+rsE+tzRAcpL+6rZKp6C/Y+nMLUi5HAspoSKoNXwu5LRy3t
	0vfn6ZAONjZDeffVeluHCs6EH8AG4cZ7iqbjX6e5X6/0uL7pYdHURlNZOD76K0ff9IILwqKFlZg
	LGQ5PVtm1mdKPeF9BFNt1sFnYmIXM0MScE9QUcsQsUBOmCz+s60uygzAKDeHtUxHwAmoD0yxYiN
	BtH9TDMJG3TrBSESxbfEjC8dwjNARpv5BtPG/W46MJyLZQErEnLYE1M7CULTnM4qYrloJpmqD0Y
	A+A5xARS82LL1Hu7IVowbUW3RXYfNfdzCvBRaq4qu+kL9oFaBAH73ejqkO+vbidAXcy/l/zH55w
	ZXJTO+Mwz1J8nmf9DifISt3jHBK4OHuOnHxTiO4cpgrB6b3EGKO558qv+Z28Ll9SEpUjGWvJJzy
	s/Ez9sVwwBTZGpvfTLHVmZN329ejCy6Jkvl6V2m+LkB4A=
X-Received: by 2002:a05:7022:2591:b0:134:feba:3fd with SMTP id a92af1059eb24-139dbb05756mr1113477c88.37.1782363824929;
        Wed, 24 Jun 2026 22:03:44 -0700 (PDT)
X-Received: by 2002:a05:7022:2591:b0:134:feba:3fd with SMTP id a92af1059eb24-139dbb05756mr1113423c88.37.1782363824046;
        Wed, 24 Jun 2026 22:03:44 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e940asm3843910c88.9.2026.06.24.22.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 22:03:43 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Subject: [DESIGN RFC] EHT/UHR Critical update handling 
Date: Thu, 25 Jun 2026 10:33:26 +0530
Message-Id: <20260625050326.2946848-1-manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3cb6b2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=scPDJlhu6FDLwkfH4lQA:9 a=QCYKY_g3eM_dVD-k:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ooRs79Be6SrgJ_iIT9dDSGvWPtq6qiGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0MSBTYWx0ZWRfX0wzKHdr9xWcg
 WGNXOPnttzwGlHoZzq9hNOdnAnT1u+pNj8zvxNL7djivDh/ysyLuOGOBnTUHkbzjWKL5IE7KuWZ
 oRtmrn/wDqxHZy8s/Z0WYmCJmWehhySRrXgxETdAbGc9+xdhOMiwphxG+WkpkK1HF90Yo9/AXuW
 n676QxFyHbJ8NK4vAPkSdawHZHbSe7r8izwXybR6cZ+X6Qg7aqdj+JV1JY7bNubJyrzIlA/JC1L
 /9RsJTHva2eE4fgOxaNz6znS6wFf1tSj978ZrwVMdZl8KLkFDfXW0+bisAzOWu6grWK3OBxFsYN
 sQ/d8MNrZpI085GLkrZbVxvQyAVuTmgouKvieXg9PBXdWKWumhsde7GcggsF9SwPgVOOIw22/Yu
 D+OrGq/n/YslPJeUa/hpUp4fiKLcPaIJoVESnfvtf3ZMVw+384UPfh2VSRC1KKgokSzekM64so4
 Z0gZ9gEJrfHdPI1AZrQ==
X-Proofpoint-GUID: ooRs79Be6SrgJ_iIT9dDSGvWPtq6qiGK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0MSBTYWx0ZWRfX3D+h113X/wBB
 sqK8kgaCZOKWXY+hEGX2RyUOXBZTka10ovz8y+UUX6uug/82Z9G0JXl0Esvqw96sbwsxoH8fuuA
 TKKwHfdKxwC7+YgYbVB7LWPGbF2A6NU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_220349_471466_B769F127 
X-CRM114-Status: GOOD (  11.48  )
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

This RFC outlines a proposed approach for handling EHT/UHR Critical Update (CU)
procedures across different driver models. The focus is on ensuring correct and
consistent behavior of beacon and management frames, while addressing timing
constraints and scalability challenges observed in the previously discussed
approaches.

================================================================
               Background and Motivation
================================================================
For handling EHT/UHR Critical Updates (CU) across both beacon offload and
non-offload drivers, Johannes previously proposed a design in [1], where the
responsibility for managing CU-related updates resides entirely in
user space (hostapd). In this approach, the kernel/driver provides timing
information (e.g., TSF and TBTT), which hostapd uses to compute and update
beacon contents. As part of the CU procedure, hostapd is expected to update
beacon contents at every beacon interval until the CU session completes.

While this approach is functionally applicable to both offloaded (where
firmware handles beacon transmission) and non-offloaded drivers, but it
introduces scalability concerns. Specifically, in real-time scenarios involving
low-power chipsets operating at high load (e.g., supporting up to 256 clients
with multiple virtual interfaces), repeatedly processing CU updates in user space
at every beacon interval can incur significant overhead. This may impact system
efficiency and responsiveness, particularly under constrained resources.

[1] https://lore.kernel.org/all/1cf0ae795b0e3e95b38cb7abf84ffad34c187fdf.camel@sipsolutions.net/

==================================================================
                Prior Alternative and Limitations
==================================================================
An alternative approach was proposed in [2], where mac80211 would take
responsibility for stitching or updating beacon contents during CU. This design
aimed to address timing constraints by moving the processing closer to the
driver, thereby reducing reliance on user space scheduling and latency.

However, this proposal was not accepted, primarily due to concerns about
increasing complexity and processing overhead within mac80211. The consensus was
that such logic is better suited for user space, keeping mac80211 lightweight
and focused on its core responsibilities.

[2] https://lore.kernel.org/all/20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com/

Problem Statement:
===================
Given the above, there remains a gap between:

 - Meeting strict timing requirements for CU operations, and
 - Avoiding excessive overhead in either user space (hostapd) or
   kernel(mac80211).

Additionally, any solution must work seamlessly across both:

 * Beacon offload drivers (firmware-driven beaconing), and
 * Non-offload drivers (e.g., hwsim and similar mac80211-based drivers).

Proposed Direction:
===================
To address these challenges, a new design is proposed that strikes a balance
between timing accuracy, scalability, and implementation complexity.

The objective is to:

 - Minimize per-beacon processing overhead in user space,
 - Avoid adding significant processing burden to mac80211, and
 - Ensure compatibility across both offloaded and non-offloaded driver models.

This approach is designed to meet CU timing requirements efficiently, while
remaining scalable for high-density and resource-constrained deployments.

======================================================================
                        ATH12K Design
======================================================================

Currently in the ath12k driver [3], beacon updates during an ongoing CU session
are handled entirely by firmware. The firmware is responsible for
composing (“stitching”) the beacon contents based on inputs provided by
userspace.

For example, consider a Multi-Link (ML) reconfiguration scenario where Link A
initiates a link removal. In this case:

  - Link A includes the Multi-Link Reconfiguration element in its beacon.
  - At the same time, Link B also incorporates the same element in its beacon
  and updates the BPCC value within the Reduced Neighbor Report (RNR)
  corresponding to Link A.

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

Link A started link removal, during link removal, the beacon would look like

┌──────────────────────────────┐ ┌──────────────────────────────┐
│       Link A's beacon        │ │       Link B's beacon        │
│                              │ │                              │
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││Capabilities Info:          ││ ││Capabilities Info:          ││
││   BIT 6: CU Bit: True      ││ ││   BIT 6: CU Bit: True      ││
│└────────────────────────────┘│ │└────────────────────────────┘│
│                              │ │                              │
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││RNR Element:                ││ ││RNR Element:                ││
││  TBTT INFO:                ││ ││  TBTT INFO:                ││
││    MLD INFO:               ││ ││    MLD INFO:               ││
││       LINK ID: B           ││ ││       LINK ID: A           ││
││       BPCC: 1              ││ ││       BPCC: 2              ││
│└────────────────────────────┘│ │└────────────────────────────┘│
│                              │ │                              │
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││MULTI LINK Element:         ││ ││MULTI LINK Element:         ││
││  COMMON INFO:              ││ ││  COMMON INFO:              ││
││     LINK ID: A             ││ ││     LINK ID: B             ││
││     BPCC: 2                ││ ││     BPCC: 1                ││
││                            ││ ││                            ││
││  Basic STA profile count: 0││ ││  Basic STA profile count: 0││
│└────────────────────────────┘│ │└────────────────────────────┘│
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││MULTI LINK Element:         ││ ││MULTI LINK Element:         ││
││  Type: Reconfiguration (2) ││ ││  Type: Reconfiguration (2) ││
││  Per-STA Profile 1         ││ ││  Per-STA Profile 1         ││
││    Link ID: <Link A's ID>  ││ ││    Link ID: <Link A's ID>  ││
││    STA Info:               ││ ││    STA Info:               ││
││      Length:               ││ ││      Length:               ││
││      AP Removal timer:     ││ ││      AP Removal timer:     ││
│└────────────────────────────┘│ │└────────────────────────────┘│
└──────────────────────────────┘ └──────────────────────────────┘

From the user space perspective, hostapd constructs the Multi-Link
Reconfiguration element and conveys only the relevant element to the firmware.
The firmware then integrates this element into the corresponding beacon frames
for all affiliated links and continues transmitting updated beacons within the
configured TBTT window for the CU session.

Firmware Notifications:
=====================
During the CU lifecycle, the firmware provides explicit notifications to both
kernel and user space to ensure proper synchronization:

STARTED:
--------
Indicates the initiation of the link reconfiguration process. This notification
allows both kernel and user space to transition into the CU handling state.

COMPLETED:
----------
Triggered after the final beacon corresponding to TBTT = 1 is transmitted. At
this point, the firmware removes the Multi-Link Reconfiguration element from
all affiliated AP MLD links and signals completion to kernel and user space.

RX MGMT Event:
-------------
While a CU session is in progress, if a Probe Request or (Re)Association
Request is received on the AP MLD, the firmware forwards an RX management
event to userspace. This event includes the current TBTT and BPCC values,
which hostapd uses to construct appropriate Probe or (Re)Association Response
frames.

[3] https://lore.kernel.org/all/20240807034521.2091751-1-quic_mdharane@quicinc.com/

======================================================================
                        DESIGN PROPOSAL
======================================================================

Introduction:
=============
The design proposal ensures that during an ongoing Critical Update (CU) session,
beacon frames are dynamically updated by the driver or firmware to include the
required CU elements and indication bits. It establishes coordination between
kernel, driver, and user space to track CU state, handle lifecycle notifications
(start/completion), and maintain consistency. Additionally, management responses
such as Probe and (Re)Assoc are updated with accurate CU parameters
(e.g., TBTT), ensuring synchronized signaling without requiring full state
re-transmission from user space.

Beacon Update Handling:
=============================
For non-offload drivers (e.g., hwsim), beacon updates during a CU session are
handled in a manner analogous to firmware-assisted designs. The driver is
responsible for stitching the required EHT/UHR CU elements into the beacon
prior to transmission.

Assumptions:
===========
 - A mechanism can be added to notify the driver when a CU session is active.
 - A common interface can be added to retrieve the required Critical Update
   elements from mac80211.

Compiling Beacon frame:
======================

Upon receiving the reconfiguration element from hostapd, the driver retrieves
the beacon template using ieee80211_beacon_get(). If a CU session is in
progress, the beacon is updated as follows:

1) Retrieve the base beacon using ieee80211_beacon_get()..

2) Compute the updated length: size_t new_len = skb->len + ie_len;

3) Allocate new_skb:
   struct sk_buff *new_skb = dev_alloc_skb(hw->extra_tx_headroom + new_len);

4) Insert the new element in the respective position.

5) Set the CU indication and transmit the updated beacon for the duration of
   the TBTT window.

6) Remove the CU flag after the DTIM beacon is sent out.

Notifying user-space:
=====================
Since user space (hostapd) primarily initiates the CU procedure, the kernel is
expected to provide explicit notifications for CU lifecycle events:

 * STARTED — Indicates that the CU session has begun.
 * COMPLETED — Indicates that the CU session has ended.

For instance, in ML reconfigure, hostapd can trigger a BTM frame to let the
associated stations know that this link will be removed after a period
indicated by TSF offset.

Thus, adding a notification framework for indicating started/completed will be
helpful for user-space to take necessary actions like sending BTM broadcast
frame with link removal imminent bit set after link reconfiguration removal is
started.

Example design flow for link reconfigure in the proposed model:

 *           (Initiate ML reconfigure)
 *
 * [*] = New NL command/attribute
 *
 *    +---------+      +---------------------------+      +-------+
 *    | hostapd |      | nl80211/cfg80211/mac80211 |      | hwsim |
 *    +----+----+      +-------------+-------------+      +---+---+
 *        |                         |                      |
 *        |--.                      |                      |
 *        | Initiate ML reconfigure |                      |
 *        | + build ML Reconfig     |                      |
 *        |   element               |                      |
 *        |<--'                     |                      |
 *        |                         |                      |
 *        +-------------------------+                      |
 *        | [*]                     |                      |
 *        | NL80211_CMD_CRITICAL_UPDATE                    |
 *        | attrs:                  |                      |
 *        | NL80211_ATTR_MLO_LINK_ID,                      |
 *        | NL80211_ATTR_AP_REMOVAL_COUNT,                 |
 *        | NL80211_ATTR_IE,        |                      |
 *        | NL80211_ATTR_CU_TYPE (e.g                      |
 *        | reconfig/TTLM/UHR)      |                      |
 *        +-------------------------+                      |
 *        |                         |                      |
 *        NL80211_CMD_CRITICAL_UPDATE                      |
 *        |------------------------->                      |
 *        |                         |                      |
 *        |                         |--.                   |
 *        |                         |   Based on CU_TYPE   |
 *        |                         |   (EHT [Reconfigure/ |
 *        |                         |    TTLM etc.]/UHR    |
 *        |                         |    params), choose   |
 *        |                         |   nl80211_remove_    |
 *        |                         |    link() for link   |
 *        |                         |    reconfigure       |
 *        |                         |<--'                  |
 *        |                         |--------------------->|
 *        |        +--------------------------------+      |
 *        |        | [NEW] Send element to hwsim    |      |
 *        |        | driver via ops                 |      |
 *        |        +--------------------------------+      |
 *        |                         |--------------------->|
 *        |                         |                      |--.
 *        |                         |                      |   Compile
 *        |                         |                      |   beacon
 *        |                         |                      |   with new
 *        |                         |                      |   element
 *        |                         |                      |   and CU
 *        |                         |                      |   bit set
 *        |                         |                      |<--'
 *        |                         |                      |
 *        +-----------------------------------------------+|
 *        | [*] NL80211_CMD_CRITICAL_UPDATE_NOTIFY         |
 *        +-----------------------------------------------+|
 *        |                         |                      |
 *        |                         |<---------------------|
 *        |                         |   notify started with|
 *        |                         |   tbtt set to > 0    |
 *        |<------------------------|                      |
 *        |                         |                      |
 *        | EVENT_LINK_REMOVE_STARTED                      |
 *        | <start BTM and other respective actions        |
 *        |  that need to be completed before TBTT window  |
 *        |  ends>                                         |
 *        |                         |                      |
 *        |                         |                      |
 *        |                         |                      |--.
 *        |                         |                      |   Remove CU
 *        |                         |                      |   bit after
 *        |                         |                      |   DTIM
 *        |                         |                      |   period
 *        |                         |                      |<--'
 *        |                         |                      |
 *        |                         |<---------------------|
 *        |                         |   notify completed   |
 *        |                         |   after beacon with  |
 *        |                         |   tbtt=1 is sent     |
 *        |                         |   <completed will be |
 *        |                         |    denoted by setting|
 *        |                         |    tbtt=0 while      |
 *        |                         |    sending to user-  |
 *        |                         |    space>            |
 *        |                         |                      |
 *        |                         |                      |--.
 *        |                         |                      | Remove
 *        |                         |                      | reconfigure
 *        |                         |                      | element
 *        |                         |                      | from
 *        |                         |                      | partner
 *        |                         |                      | profile
 *        |                         |                      |<--'
 *        |<------------------------|                      |
 *        |                         |                      |
 *        | EVENT_LINK_REMOVE_COMPLETED                    |
 *        |                         |                      |
 *        |--.                      |                      |
 *        |   (cleanup/disable/     |                      |
 *        |    remove link)         |                      |
 *        |<--'                     |                      |
 *        |                         |                      |
 *        |------------------------>|                      |
 *        |   Set beacon for all    |                      |
 *        |   enabled BSSs          |                      |
 *        |                         |                      |

Note: If a new CU update is triggered while an existing CU session is ongoing,
hostapd only provides the delta (i.e., the new element). The driver (or firmware,
where applicable) is responsible for combining this with the existing state when
generating subsequent beacons. Re-sending previously applied CU parameters from
user space is not required. Also, it would internally handle the MBSSID
cases as well.

Adding current TBTT in Probe/(Re)Assoc response:
================================================

In the proposed model, the driver/firmware is responsible for maintaining the
current TBTT state while updating beacon frames during an ongoing CU session.
Consequently, any Probe Response or (Re)Association Response transmitted during
this period must also carry the corresponding CU element with the correct and
up-to-date TBTT value.

Two approaches are considered:

1) Updating TBTT in Probe/(Re)Assoc response in mac80211:
=========================================================
In this approach, mac80211 updates the TBTT value before transmitting management
responses:

When hostapd queues a Probe/(Re)Assoc Response via NL80211_CMD_FRAME, mac80211
checks if a CU session is active. If active, mac80211 retrieves the latest TBTT
from the driver/hwsim. The TBTT value in the response frame is then updated
before passing the frame to the driver for transmission.

To support this, NL80211_CMD_FRAME is extended to include an array of offset
attributes indicating where TBTT values must be updated within the frame. This
is required to handle:

 Multiple concurrent CU contexts (e.g., EHT ML reconfiguration and UHR CU), and
 Updates within per-STA profiles (e.g., partner link CU scenarios).

For updating associated counters two options exist:

 1) Fetch the latest value from the driver at the time of transmission, or
 2) Pass the value from lower layers along with the frame.

The former is preferred, as it ensures the most accurate state at transmission
time.

      +-----------+               +------------+    +----------------+
      |  hostapd  |               |  mac80211  |    | firmware/hwsim |
      +-----------+               +------------+    +----------------+
           |                              |                  |
           |                              |                  |
           |<-----------------------------|                  |
           |     NL80211_CMD_FRAME        |                  |
     +---->|     Probe/(Re)Assoc request  |                  |
     |     |                              |                  |
 Compile   |                              |                  |
 response  |                              |                  |
     -     |                              |                  |
     +---->|----------------------------->|                  |
           |    NL80211_CMD_FRAME         |                  |
           |    Probe/(Re)Assoc response  |                  |
           |                              |                  |
           +------------------------------+                  |
           |*NL80211_ATTR_CU_TBTT_OFFSET  |                  |
           |                              |                  |
           | Array of offset attributes   |                  |
           | to denote the TBTT           |                  |
           | placeholder for updating the |                  |
           | latest count                 |                  |
           +------------------------------+                  |
           |                              |----+             |
           |                              |    v             |
           |                              |Update            |
           |                              |response frame    |
           |                              |    ^             |
           |                              |----+             |
           |                              |                  |
           |                              |----------------->|
           |                              | Queue response   |
           |                              | frame            |
           |                              |                  |

2) Propagating TBTT to user-space:
==================================
To reduce per-frame processing in mac80211, this approach propagates the
current TBTT value to user space:

The kernel includes the current TBTT and CU type as part of
NL80211_CMD_CRITICAL_UPDATE notifications. Hostapd uses this information to
construct Probe/(Re)Assoc Responses with the appropriate TBTT values before
sending them via NL80211_CMD_FRAME.

While this avoids additional processing in mac80211, it introduces potential
latency issues. Specifically:

The response may be transmitted after the CU state has changed
(e.g., TBTT progressed or CU completed), resulting in stale parameters. The
driver/firmware must therefore handle such cases, including rejecting frames
containing outdated CU information if the CU session has already completed.

A similar user space–driven model was previously proposed in [4]. While it
requires refactoring to align with the current design, it provides a high-level
reference for propagating CU state to user space.

[4] https://lore.kernel.org/all/20240403162225.3096228-1-quic_rrchinan@quicinc.com/

With this design of stitching beacon in hwsim/firmware, we believe the proposed
design can effectively meet real-time requirements, including high client
density scenarios on low-power chipsets, while also enabling validation through
simulation-based test environments (e.g., hwsim) for various Critical Update
cases.

Please let us know your thoughts on the same.

[Note: EHT Link reconfiguration is used as an example to depict the
proposed design. The same will be used across other Critical Update
(EHT/UHR) handling.]


