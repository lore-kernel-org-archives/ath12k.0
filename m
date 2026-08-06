Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535AEC5AC79
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=; b=RqeU8tnyACRyJhlwe1OBK67lEZ
	kqlBTdVhP2GadcVWJtz3LfvoRqX9K9uyfF3c2RozDdhSh9scA4p86ESj0BiGM8U6sJrOQJiC6KKUo
	S54NbURhRqSoLjzycOnacweN94KvbfFKK3mpz4aiNKnQ/IzZa2RVrISuXoC01v174+6F6oEtxbDRc
	HklueQCiS69G8r5KHgsw/VjLuWOVCKjkzmZB9xR3x/oxXk29ktG+HVCUXc1mVi28EK0PDf07bAYpd
	YjerdcVGE/y/YYnK211QOtYkIbslmrzcNrNtoVA23x0kO0/qGKDpQgmLmigsxOtiReJaYPN6WXD78
	EzsEvKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv7-00000005iRF-3vPk;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv5-00000005iOz-0bqn
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nd6d1308839
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqT
	E17eP2eM=; b=h2WIKRXnWG1D6DltOfi7KCug7ftXmatSwrjdxe8tcIPfBCFkZUF
	JUjrBLjZBo2KKEcvJ+KpwlC3ZnRjeFE0DuPbq4FqtlNUZJ4oEYHVSc6HayaRqTvB
	nnBFx0Zxls2/hoUi1MwszFtm0QJ99I/MxkLs4lqQ9CdEiXsPUwhSdfozUT/eI2o7
	ljA03j4LPDpclTy05w7OJcDT0+dvDEGHWD+xHDmsFy8M00QxHmjuE7rhx9yxH5h7
	OR7QH3EzRL2mdAU5O5SWELMMkzR4JE3Fkmj4LQfyW/JaKbALzcfnY4OaeCr/ezyn
	BWjCK8YtVU4cvOXGOpxhyD3xA46oqCvoEQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp72955w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:09:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so30874745ad.2
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018180; x=1786622980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=;
        b=B11NSfqrdm3cS1uXdpp9A5CLap5B+CbygGg7IgVEbW55mDQxgYxkHruX1cBPAK/RgY
         TQhRUbCaUOI7VVmhZn97g6lG6boa7r4JPJNhhOuHsevLBUivRHXzx1IQZ2Ms1svVP21J
         gkGocsZZPTWC9GKN++S1ZyNK/zDpXJzGxfN+15vo+0QUehqKBzzg8ZHGm7Xg5Fd5XD/n
         MyECfuKsGqYaiKmn+fBhqqyiCWx+pBFgixivxH+IGG+FHjUvhDuNO+1AGUKt9LliXbel
         j2aAZa9kJIA25FrfPjiCJksJgJLyXLd8VDLfzG55PnTqwIr5AFN4wl0ybSGhR3G36eC3
         79nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018180; x=1786622980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=;
        b=Es+fxAM18jjB/H8EJbJRrWMuWReh6b90q2dovbd7KuHmBQ0POh5WWnsMVCfhxZ+B1k
         aiJnyhOeK/k06fzB0HWITRbifQul3uSDN/cbuITvcvjZGaFYdfUOXXDLkOguerg4DtOJ
         MjmRF59TmUosuGWoulDYHvB9OHZoXI9O82kW1YNkvsWjAibIc2h17BPv92nZM7RVQVF8
         b99NixB+dfSkZ6/awOt+Vfyp1jWi2x61wDnAE8rgQIXnR1uql50q3UNDmcCtBMS6fBW5
         XZ13AmxAoe49ddfB4ZXoBKjFo6ZrRctSdAaqQdWiAF1ICwACWAs66kVguutBeaaK1AFE
         o+CA==
X-Gm-Message-State: AOJu0Yy78wMkALExyVyl2tz6Wonmx9YEaGCSnQhi1JUhLSP9HEwtlI3m
	o3gJ3uIPygjM9mwPMeExxmkaUTaCvjxqGFWUuz/aEh/NaOB9o9yOslA68xubvIjLPLEaLj3ZtrT
	m9PlB80BL4N+U+DPsGHmLzsoxP+qbqrpfdLOE6zjH5HGdRdV0yLeOxqil/1LauFbOgdkNijrd
X-Gm-Gg: AR+sD11ZJ5TYnhnCKqfBozGUyrBUBUPPvxv3AXMNQzruDmtEtcv1fS7jc+FpbwBKbsg
	BkTcvztjLlhq0aRmad8kWwQcAnoqWJonEdI+uvsglrjpxeCdi4brMHp3wuWhyw93RNlX4AJLdK4
	X/s3scjwhphgwu0f7IUVWNdC5tHGlKRhOmoqCHcQHSC6G2OT02FyH9yxXSaRDRN7JTdbxfzTByK
	UncSy2OngtseLPlXbENZaE1S7GNi/Ddoe8zPCzSafHJnVFRlueYaHl3Bgz6zNDqt5qx+WhjYIYA
	0t1uM4zo9bA54XSZ4O3TDwG4whjsmfr1Bo5nFCA1GI5opO9KK9/DZMQOTpwGgVgnm7HI6VqyIPH
	nbdytY25g1oohdvA+sQu1OrdRCMxB+bBV9pbwurFkTRBkEA9CcjYS
X-Received: by 2002:a17:90b:17c5:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3903b9f3ee3mr12285925a91.0.1786018180377;
        Thu, 06 Aug 2026 05:09:40 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3903b9f3ee3mr12285830a91.0.1786018179780;
        Thu, 06 Aug 2026 05:09:39 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:09:39 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Thu,  6 Aug 2026 17:39:19 +0530
Message-Id: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tIJvPgTErCICudgx9uPWuYD7LP8kMdC5
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a74798a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=olAotSUzlDmdGhVfZMkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX6ZkujACEMSat
 9acQHr3OJjJuo7JBlkNm6WYtEJvZCTKRJlDCZ6Wbz3jBqfNIYWwHkfAPrZbFIxT+tQWazm31QR+
 tm1Ijn2UjCAETLBPScdoQBivoeRUDjMFJhu1tPv6sCIPFJrZ8L7qWFB3L5zaPq+a+HfYkmyZ6Vd
 28vWc8PjH0tbfjJEpf9j6ywvho4K6oLzh6rjREjm2W93/m6vyOUZs7eJ5jcyMgfk34To9BeNtsT
 lCqPJqroF9HxTpQ17nt3pGeKbGHk+fn2xbWPCAPB2Xd9I6v8SDevHYb1gngcTcWIzX+Kcep+4e9
 iLsX2GgnDv4DX2H6wVfZm4fSVZnm3p+gkfxgAeJ0Jd5HGEBw4v7SjL/uF80/tpgGe9gCxsXvRkP
 46UX7W+7o5Kf5eW//JJDQfohwKGuI5JlnZBreUAN7UbPSDRE0ajWaglOB8N2DFzZwvlfc7SEtiG
 LwLlJzs5hQPGQfVvEdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX62PUAx2IumRa
 lKUA6mpvATlQtYTHjUcR9RS+TrZD1j/BBFMHtdFC5gCOx31h3GtwV1ZjliJ1C5/R6eG9BLztAs3
 t0fIFC2yUrU7tM5+kgcC/OAPvvreRoE=
X-Proofpoint-GUID: tIJvPgTErCICudgx9uPWuYD7LP8kMdC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050955_323810_BF1430C3 
X-CRM114-Status: GOOD (  12.31  )
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

v2 changes:
- Fix txbuf_na[] indexing: use pool_id instead of ring_id so the counter
  tracks TX descriptor pool exhaustion per traffic class, not per CPU
  ring (patch 3).
- Fix sent_to_stack[] to use a 2D array [ring_id][device_id] attributed
  to the ring owner's dp, making it directly comparable with reo_rx[] in
  the same debugfs file in MLO configurations (patch 6).
- Fix double-counting of WBM_ERR_DROP_RXDMA_GENERIC: move the increment
  inside rxdma_err()'s default: branch so it counts only unhandled RXDMA
  errors, consistent with WBM_ERR_DROP_REO_GENERIC (patch 5).
- Remove WBM_ERR_INV_PEER_ID, WBM_ERR_DROP_INV_COOKIE and
  WBM_ERR_DROP_INV_PUSH_RSN from the drop reason enum; these have no
  corresponding increment sites in the datapath (patch 5).
- Remove leading space from "WBM Rx Drop Count" section header (patch 5).
- Add likely()/WARN_ON_ONCE() bounds check on ring_id before indexing
  sent_to_stack[] (patch 6).
- Update commit messages for patches 3 and 6 to reflect corrected
  semantics.

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


