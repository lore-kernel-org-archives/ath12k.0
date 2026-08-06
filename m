Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE0BC55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=; b=ZD3HkRz721Xh1ls7X0KXgdJxeG
	aXY+vgKcEf1F8ZKRJ4VyvW9gd8YKxtWT5sxuUGxefj3GcdlYHZ7a6fPtMkkj0/0vC+qJHVfFWDb+M
	teuz2QdStcvYrQJDfjRE4/c1amN/Ah9blPvI2S/ngTJiRc9lBK7UVpJdxIGktS7ZdjSSRR6qFEtVh
	I31HbPwkbmdFR2VU8oIDlmIf6kaGJY51PkZESNUDnSgdRwFRtX2qmb+5Jc5m+42NCOwHj/lQ1PhB4
	dlYY+QYW+c8JXTCpAze3A34uUd0OG0MScWJtkpKVxuK8odmUy6BZfH3cf6pI/+HbLGAP1bZ3yDYGO
	tBEWjOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5T-00000005sfC-21Vf;
	Thu, 06 Aug 2026 13:24:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5R-00000005se7-1HID
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:24:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhUt1309003
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqT
	E17eP2eM=; b=AFn17/8J8PCUxpa+793ze9B/H+1wrjcV7naTOcnIUCH5zCixGVz
	dEs+L7XloG1Eu7CAbEJV7snkLijMyOFHPGRtjC3Y28kNNiVit41SapnPkHY6XzKA
	AFEt9BV6joEIW/nY4udL49NeSPJkAtzpjVL1Jc85m1FS1d+nR9wghYDSI9Hny+T8
	yUMwJrOwO4NteX1dToCftJ/HZ7XRhmTblFris+vC/8XHN1iQx8ynm66SkFJl5Kf0
	MmK/EpLAkBg815BGNS2v1anjIDiODcsnDpbEXqTsq1C+9e3M5af99OJQJYPAPxfg
	IrXLbVZrB1rL2iWhP+5yrYEEHSrETdPKGVA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729g7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e1da97175so2966384b3a.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022679; x=1786627479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=;
        b=N9p5pE4BIZwXJ5G26lp82iiodu4IriPUHKMJkyG31h4avi7XCkLvua/kM9mSzTdyAF
         qCm/9z3puGEozUM71D3dbKk1G8k5PlmrX5W9ajS4ExPzt6SAr/4zFSaKCcxNLfkWwQXy
         9fSnzaZW0G01UElHcHeYGMmfDqdgOr2u80+mEn3JcFzG9n/jEYE/mEqoQeQ4eQyYYheJ
         omxpzFYDRFUnRPqxSEu9BqjI86VaFjowgckpS5ZbDURuWBOAr9N3I5XsobNLTsI1ZRki
         n9rG0NPCSJ0bypCPvvEqq/YlKDvBQaA06qLSq3pTKUhE9IgLuCIPJZJ/llryLplQsVac
         svxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022679; x=1786627479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktRiHTx7t1faG0a+hDMeHugxgAdQx3BfAqTE17eP2eM=;
        b=R69CTVQ7PCC5atqmMFSHpRTdVwvEWnE9Lmh/VVYaNtofmzfefKSDbCpt6ugzzPtfz3
         CUikU8FPZzX/23ycnX/A9HAmm5DeRxCZvIclcQDH1T3Q0iCkelJiVx4ea0s6ZivSWWcw
         f0ryoU//Kp0UevdeHPcRuMqcD3LH3qp3kaVk6ukEzTZgbtNh6zTSwfoMD5aShf6zmvqI
         LIwvtIQoA7NBNa9U4KYtzTz4zlDYeRdpp2aT8wlYF1e4w87Nall5cPhFgTiMWtrD2Iy+
         dgtWkBJIFmGv2fc9E6ZhmyLzW1/QiJ9VCXQgJ4058pV5qoutcEuH2OXiThIPmp93Veu3
         qY6w==
X-Gm-Message-State: AOJu0YwWUhAx8etEFC1pW2nk4zDrAYquvQSuB1rIa4Lz/yR50v73G7+X
	41KmkaBxxGwE67ZQcllPFekfWHq0dOXnIWwjvDQNzCD6gLwguY6Xc69B8j9jnB8b1qn1xJtTeG2
	Nc/LKHW4IakxbGMU+iSyn4Eoqm4kUWULXT3odOItvH6cNZ1ve0lCi0q64slTd9FyDhmFKOuef
X-Gm-Gg: AR+sD12OLIP+A3Yljz+UuzHH/CqlGyLKG7RD1n1z8mTsnNW29k8vvQghyB3whdPX6Ur
	koAaDmEwLCNz+ZtbgZdpCb+Y3YoGGmsK113Fpbf3nh9cwJaKQ4pHfaQZN0jr3AdHU6pSlF1aeRX
	Yq1bH8dCYPcLB/9mf29OvzseiR2LXw6Be+gcxK4brQpHUvJkWJBDN9a6p16tZ7qOPKwMfUYBc8k
	vph2mtKE1pHNVdv0eP2mYScnx6yEnBKycqPO13xP6ymtwS/qW6pZ5YQSsireUsnKBWhzxDk/DDX
	hwTPcd59b0Egw13di2HWsz3B4H98hyS2ZM33aiZKYnw26MYYOhS71XwPz4K5kAYHtoz/bsMg079
	6IKGcJgbY7zkF+i/5z1d+biTI49+n3BQUYYGRQtFqKzhyTHim3Gf9
X-Received: by 2002:aa7:9303:0:b0:848:77b3:579a with SMTP id d2e1a72fcca58-84f2dfeb92dmr17780648b3a.17.1786022678889;
        Thu, 06 Aug 2026 06:24:38 -0700 (PDT)
X-Received: by 2002:aa7:9303:0:b0:848:77b3:579a with SMTP id d2e1a72fcca58-84f2dfeb92dmr17780612b3a.17.1786022678358;
        Thu, 06 Aug 2026 06:24:38 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:37 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Thu,  6 Aug 2026 18:54:19 +0530
Message-Id: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UeO_oXx73pYi0ZjZP9R0z__XcpmmMpFJ
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a748b18 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=olAotSUzlDmdGhVfZMkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfXzDhLTMTngF5N
 8TaiDrtv0krPK2D4Pqa33xqpgsVueh6wum3//t4bMyqn7MKMv4SUaze9tDYAT0Fez4rLCE0S77/
 he+bSzEEcboBaYC0S/h/TpzVrIZjWEO+BWJ3MxEGNFPlN9yWBhpPhxN9130X8XHuHAZot+qxPPj
 fluHaiR6UG+YHhl4SHeCJvGsosU/kFtZcuZZoSjMvN+GXQCn5Qw38ntCApD0qDJVZsrjhFLeZCz
 cjjnlFz2faC9ivGaW/01aS6fbudxbY/EDWEhFguRjQaf9sYJiJ2VX/SvSRQ2sIReChFhEHbM0qA
 kUraQt795Vh9OsQB96r/J1xYVy2a4wcv3qpq3mPonjvTfoYJQMD4YZEvSMIq+X/c5BD7+HQznEc
 H9JRlKPtXu+8YrGEk88gEVhobUuj7qcHp0YjvqeXqnI+A5CvfgQ+fCHecA1rZrvLR5In/zAEQ6G
 VG/iCOziB0s/7Yz8qWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX2O8Yz2cHxpty
 dsHcUmM5NM0CIz9lTzOY7TgR4ybQKOgv3UIRunL8PsUhZceH1KQ2AuQiAAOEdMoBw+iYMUt4LJB
 +WJSH1BIFwI9EC5CI85Il8nqQU1j4tA=
X-Proofpoint-GUID: UeO_oXx73pYi0ZjZP9R0z__XcpmmMpFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062441_457557_5A38188B 
X-CRM114-Status: GOOD (  12.33  )
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


