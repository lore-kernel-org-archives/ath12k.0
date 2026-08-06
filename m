Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC01C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TgZ91MLPKAVq/SGJJKRiq+McaAg9n408pI6pgpZr9i8=; b=4yiWMSiScGjGzMMnh06KzO3kop
	KldmlTOVG5rZ4jq9EbrjxdYmJnjw0xZJXmsUYlOunanKCUYz55KXcWx/pspJbWZc1MR3KwZUH1eky
	jTHmAkc4uMDVt+/if5kFeAk2PTAz+2KM2uvKe2jlViAW5On55mDI6KP8M1waiWjnhdt9DbRU20ueN
	H2t3WITH08nOcZRZc0N8JIqzDwsDL41WcMEw6s+LTOKsEn88TLNrDAc5XP7WU0qv5OM7CVBwOtiEC
	rhq8fVUJV7RLHsajIh4aEDVeYMYKN19gi4Topvp6JlyQqpIewWAKZo3IKLcmtqPdMJ8jyMW3ypR9/
	0MUfrTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0P-00000005V8z-3HyP;
	Thu, 06 Aug 2026 10:07:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0N-00000005V8f-2vRq
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neOR1876445
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TgZ91MLPKAVq/SGJJKRiq+McaAg9n408pI6
	pgpZr9i8=; b=BP8hglFJ99g0ct5ST3f/AL2BD9V46a5RrUL0qAoSZo4s9/L9i3x
	nVC1eMrlhThb3JiaxgQx97sglIAChX7xacajS9WO5KaXBcMj31epbbeg0nZcKBmz
	xdU3cBh0FQmA1iq1kjy0V99mHbywNDuc4kLl4XXVB01Kmk/0PNeI//hnlIvAs4rW
	mo2mDDoAfhnlunKiMPhOLawLho78zAUlHVebXTGD9JCh/Z7eH7W5qYSPVJtogfWW
	low/hl89NoDq20mFF7OyWmH5579bg3NpyvpihJjnNaSJ8vBHrQJ1iJZ60pRuM14G
	fdn73ZVlvCwMz557Oq2KOuG7mUfv1mErWYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchfqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so28725105ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010833; x=1786615633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgZ91MLPKAVq/SGJJKRiq+McaAg9n408pI6pgpZr9i8=;
        b=RKRexvQd9flPMkh+YE2KABj30vqqsxEzmKDaW+9UspauSVhGHQ3fb5+cP9Um3eJi3z
         J7TZb8n1AL8cg16rOuLIq3rbyW28Aub5VIMbKiTTFotXmATEL/PEZO6+fN/44nFPxLEu
         7v7u0HLOUljYRNG3C4Yxu/PpnHyM6FIWNhudWuhMauutNigYu2DOqTyXtJybK9xF1hwq
         TtvOR2pgwngngnphDjIxyMiddcqmnBIX7u+sVLLUHO5Iypus6gdyOycH8aL6/zCLg1HY
         0/de4kqN77PPXCZ1ktx2csD5J+u3va3amp6P8gR+jYbc4JRsVVP1dSQD+t+DvKtz2xyD
         Ek3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010833; x=1786615633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgZ91MLPKAVq/SGJJKRiq+McaAg9n408pI6pgpZr9i8=;
        b=HRCcN3a0GNQ6IojJnwMnqxAIspCP0dS9W17A+k1vY1mC/bhWo5BB6zW5s3yUYYYw8H
         Mm65TiSpSJI8po/Tz4V7hzlNjLArnJYLSl9SEnulVK684ByojsEJKI/YrY3q4Fubqe8h
         Jr7OKfTw/J9taC2RT2n6ZXfa4wAbwgQlu1UuVExdCSm9m8EBBXwzj/cAM7mIiWWhOt0D
         c8UCYWL81fzoqM42c4dhbv8zuyHxonlzqHJBZaoNgmYyczGBd46jPvEKNmbyBybwVbs+
         OMtqAFQJufOHQ6gGA+5j6FdTUZRoVusw/py0bAU8T3B0x3dXu920SWn6k8VpjikoGXja
         r4pQ==
X-Gm-Message-State: AOJu0Yyt7gkRduFkDvjFP8KoDnd0dTTh2fdQBVpCwfzglBuJ9bIvOUHF
	A8MMPJlTNIMWBHJFQJvM+O6o8iCRCNqUBCkAHIOBlWPYjEEHwizRN0pmKVWMYPElftlsPcD0+PU
	Kpp/BwNDhB+HB/8WVrg7M2j6SET0nMM/dVsv/f/wDXGfcJtbiLhlQ8qLGmNmKPb5XnX7slFbY
X-Gm-Gg: AR+sD11HBVoLsG1fqAxBN+Oho/ysoe8fQERKFKwFbG8V5lFc5bJRSXW+PdB4Zo51r3i
	9VfpRdIYH6x6hIFgA7Usf1MJUFb4P70AoPXsevCQ3c3YESx1g+ogrjuLWH3P1rCGCZGnkx7xDaR
	odpY3TBiPsGRd1kIJA5h0jBtGNK0OskS7p3Mr9WEzgMbx90Ox0JmNU5FZTH2mmDRIdHHBr2CB/D
	j++cJD2OlSsivhVFMQi9wcgmtcHYKF8KeZm77VwU8LwwfSEeFqRnpJtisAmo2lQx+PvbCkJEL6L
	VV4YVF8cNHihTaJ0skRKaPtwajfL6QZ2uO+7GgCXjfBcctnPpJxS9Ve1QrMKzYjVZWdUL9l/BLB
	LnTviEIbgYBM/r5lED2gccSJ6jG61b5AW1HqJsUySSklcGeRfuYE5
X-Received: by 2002:a17:902:f708:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d106a1a049mr1338495ad.5.1786010832939;
        Thu, 06 Aug 2026 03:07:12 -0700 (PDT)
X-Received: by 2002:a17:902:f708:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d106a1a049mr1337905ad.5.1786010832474;
        Thu, 06 Aug 2026 03:07:12 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:11 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Thu,  6 Aug 2026 15:36:54 +0530
Message-Id: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX/gNH+dxfNj1B
 1+jV5WfXfzQbogco62WPPy+XEk67juY49k0i2hG/xiqUxdjrM9UiHWmbjQUjQfwyEaH5nKE+CRa
 fjKS9KPUP7t+x7Fq3uTIK09NZ53SQf4=
X-Proofpoint-GUID: p0AFECaVAs1guYgK5kdf16WyrDbW319e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX9YAyvK/GKGLN
 Vy6DNO689yq/yfa5xPZR8CB+llA4e5FpiNA4SKJQPxdPtvsqE6OOY0a26x0Qw27D970W6VGt9Ms
 8OJoU96fmLRHfHTceQJKfI+tsx2PD9G8dswUZ4211OEk2l6XXmoMLhEeMRSFEmSc7QeekYjNOS6
 tKgy+rCDztnJVqLQs9TzoVksBPT+DXL/OqD2KC/BqrYxDK08d+f6VQjrAyUJLZAyH5dETWQxue9
 4/7uulcvIokm8+pe9OzyZNQ+hgNvK2xUooB0mudTlmYltzVNnQrIbuGoto0LOJPFReqhdbmQbfX
 jFHg6bSdnFlddEiePm4wp9613dy6t2alAPFqA7i8f6/uIrcIzIBk6LI3AGNWsVOBooMogI+bwTO
 uUQsE0bMFit3JGb4kJY+4itUGtcjtN/6gBclJsW0U6WJyLLiecmyw+JwGDAcsXqV0kBuhoFbaDB
 gEcbDaET+qR7dXpDrvQ==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a745cd2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XRJRJbIxxDQRkIj6_doA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: p0AFECaVAs1guYgK5kdf16WyrDbW319e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030715_889535_E7988C17 
X-CRM114-Status: GOOD (  10.25  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

Extend ath12k device DP stats for TX and RX path observability.

Patch 1 fixes out-of-bounds array access on TX stats arrays
fw_tx_status[], tx_wbm_rel_source[] and tqm_rel_reason[] by adding
likely()/WARN_ON_ONCE() bounds checks before each increment.

Patch 2 renames the local variable wbm_status to htt_status in
ath12k_dp_tx_process_htt_tx_complete() to accurately reflect the field
origin, and simplifies ts.acked to use true directly.

Patch 3 adds a per-pool TX descriptor allocation failure counter
txbuf_na[] indexed by pool_id to track which traffic class ran out of
TX descriptors, and exposes it in device_dp_stats debugfs.

Patch 4 adds a write handler to device_dp_stats debugfs so that writing
'reset' clears all device DP stats counters without reloading the driver.

Patch 5 introduces a new dp_stats.h header with the
ath12k_wbm_err_drop_reason enum, adds per-drop-reason counters in the
WBM RX error path, and exposes them in device_dp_stats debugfs.

Patch 6 adds a 2D sent_to_stack[ring_id][device_id] counter to track
successful MSDU deliveries to the network stack, attributed to the ring
owner's dp so it is directly comparable with reo_rx[] in the same
debugfs file in MLO configurations.

Patch 7 fixes the REO Rx Received debugfs output to use 0-based ring
indexing and lowercase "ring%d:" consistent with other ring counters.

Patch 8 adds a dedicated sw_desc_fallback counter to track how often the
WBM RX error path falls back to SW descriptor retrieval when HW CC is
not done, distinct from actual packet drops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---

Aniruddha Mishra (2):
  wifi: ath12k: add WBM RX error drop statistics
  wifi: ath12k: add WBM SW desc fallback counter

Hariharan Ramanathan (4):
  wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
  wifi: ath12k: add TCL ring TX buffer allocation failure counter
  wifi: ath12k: add device DP stats reset support via debugfs
  wifi: ath12k: track per-ring RX sent-to-stack count

Pardeep Kaur (2):
  wifi: ath12k: fix out-of-bounds access on TX stats arrays
  wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output

 drivers/net/wireless/ath/ath12k/debugfs.c     | 79 ++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
 drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 +++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 29 ++++---
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
 6 files changed, 178 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

base-commit: 691e5e43b2aa5da35b044532845a3b230e540894
--
2.34.1


