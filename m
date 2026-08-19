Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE1C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XrAx1khjQTS3f7t6iHsWptHfkk8Zh7xYgrzgV1ecDnA=; b=q/DwmyR2duO7JPgw/yU2z0PEmI
	GHob3pKFjOZxQmmAlm4Y6QogH8VnnU8Iq3jHzslzohl/lUzVTjrrC76ImlvntAkiG+QdTjmgsZBoc
	lZ9nXUN5yzF4AF+ZTIZeauW+eM3FdsEMQExJ2Y2DnKHVxACpYPnFTJRsMrjx0vSMvvkHGVIHvs4h+
	Gxy7g0803tXBkKxSvBTYa8c1pcX2mwYKCPOaUlj5EQRZEbWoWZIkdMd/e8NGN7uwnhukeCdJqFSm0
	ZDiPB08iEp0BJBihJTiHS9sGraNM5BR7D514cRRdca2FYrfzNibPjduAvhL2UMlZsie0zkwRcUkXu
	6yQeF8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYv7-0000000911e-0h2o;
	Wed, 19 Aug 2026 05:33:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYv4-00000009113-1GlS
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:32:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5ICkT3096032
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XrAx1khjQTS3f7t6iHsWptHfkk8Zh7xYgrz
	gV1ecDnA=; b=LKsdzTTWJMTyRFboxB4PkQITY2rb5ac3/cD5KF7igyh3l4fEjJT
	+YXIu1+HlAFO/7JvA4ldK5ca95mgIf722xXW1Yd3l66BEOwglwIlFThV+LcnOFJh
	RPpUk8h+5YupXTzUuaPnumev0tfZd1ZnIzV7TvNogvVqM0ss4pKH2AbSPZyOnfGt
	s22IpTU8upT/mGx4eBjgDc1IkVI85Gf88MXj8oKhb2ojZdBkWQCtVi+PHDeELNDT
	xlDAddhm4Da0VipcR2CK98Wy4fULVPCFkUzTiAltGWLsZMc3dHm0NCCJoMiFJoYD
	/p4N3WO9L4+YqOVSTEP9gMtbD7H/DmRQmzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffhej6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:32:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so452197a12.1
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117575; x=1787722375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrAx1khjQTS3f7t6iHsWptHfkk8Zh7xYgrzgV1ecDnA=;
        b=L1jxbJ1LTGYISrNgUYMgn+rv18zMaPGAYvRG7bAc6y2GQmRJyc+IQ20Ox1tQHowaTJ
         xlc7+tor1cvLq/GnLD4adRCpvr6Q+4/BmuGCY8C2O0UuzGPbLG4c0S5C/cFDs7LLASAt
         k+QaQzughzsb2eStWS01Bb2FFNkLOMINpE7ZnuJcroa69F9XybFccR8lUjIfgwHsEZsd
         zKC9yNWlcZCdBhekvgyNg1NPgdCsK7dz3RYGuKJZNfQz+1eSJ6RJOiEUNXe0dFwfduD3
         2K4YxPhXq3cd+kArgMBf5CTaTcomkv5xEShOYWIT/2Ucflapg7rolnQsvT4S2dbDeqGW
         SR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117575; x=1787722375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrAx1khjQTS3f7t6iHsWptHfkk8Zh7xYgrzgV1ecDnA=;
        b=U44vKjsZMy4c+xG9A114UrK8Y/pcwHYZSb/ptpOPHQGZukRnwLRGHa5k5RVWVEVPi1
         g7i2ZUQLtCxhSOuosfjs4Kl12E7Pk9FDdQ6tmXnjAIOHQyrgPRPRMEGgjajjIc7Z+p/d
         seLeVoupyqTqV+JrCyttQHQNbApFFr9rIHJQ/jbuqj/FYlMCB1RKlrdiOXqANEB836eD
         F1w1OYF2nIcPugym4YOPRxhhrJ0OiGRXayXJ1wPt9BJawLW1rMeujN9BDomX4ti01KMA
         u1jJFnZKIof7ppHn5js5uUQ5Q94iuEVF7vQ9Ga3aHs4mMshpaD6cqZTbOgT+2+LGtAj5
         EghA==
X-Gm-Message-State: AOJu0Yw0GUZ6zk3Q+cDP3O7AgwPAB99W0TOxuTCY9i9e6xjDiuR8wyKs
	cZxUVtPQ8Mdqkk6UYHXRCGiAACyisZWfa25pMO09V6q4BKq38F10/oVjOnSiEueCFqFaK2mXuv9
	khSJ1V2tetZKieKQYuSASCwqQCuqcBPpj/Rge+/NIC/SVcWjA5Kq2MTAFCo3E+6O7jOoU7zSw
X-Gm-Gg: AR+sD13PrM4ST9CJBIXjXrjDfp6KCXuzDQ+GXif9dMcZetXM63p9aWNaDSJNl/JzS6h
	YJEdR7z8KxstWEjqbtxlHWxiDS8AYAocc3hN9xZurf8QITrCYCVoubOJeQH6ozw+LeM5hYEUIv3
	teFnb8ndmMuoaS9mjBuRkf3Lo72Ko6hpxBa9B/3hRoYJjt62av7C8ZJPvKqB1G3NWicKvlIPXzr
	TCsovnxXnLlaYk+ecgLY2IvnTtO2gt++8zCdzzbm2RS/S7WLivFer4q8l5PTI4TNC8asPpcAssX
	jnP0vSTcp+jckzQblEZDgUQOEo0RrcsP01qAvaQyfY2NI0ma4p08AqdtahibEucIVAE6hYGbYli
	ZmU9SswhYO/BnJyh2fE7H66l8QjFVUuk00sclp13yv1zmfbWROhj4
X-Received: by 2002:a17:90b:3b50:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3957f8b5579mr1965963a91.4.1787117575048;
        Tue, 18 Aug 2026 22:32:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3b50:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3957f8b5579mr1965934a91.4.1787117574476;
        Tue, 18 Aug 2026 22:32:54 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:32:54 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Wed, 19 Aug 2026 11:02:39 +0530
Message-Id: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX1mTt3T3ENuwY
 U9jZx5cxQE8tYcaQYyQyP1tBbdP3+2cnD6DfO5ASOvSRfDwBwY1l7ZSn2yE9MMZpNIk6hG1qLPL
 e+9SBQqKje01JAnPnufTflMORQatjVQ=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a854008 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=86WhgQvHTe_COOI2mw8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: G8nQdIUQwTp6YJDAgH9XlAXHm0ny4GK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX/o1r5OcTE8nX
 Lqvxydtp6m0N3jtAAZUaDxN4tiAWaByA2JZ7KNoazQoMVgWmE6dDUc6iZlqOBgNxLRGX46caIqp
 m1WVpgM20c8SsB3r7+wnPGuXpz6p7WCrdiKYZ8+FB4qjujLAUwiDwVhJYiIxeGiCYeF61xz1rMG
 PuleR0mXHO5Brlj1qVDds/0CsYUgjKRLspjXrTTqPj/87URdVSckOg7YJQCLAjXGv1F3Dc6EJ4K
 0B9iYRmI8b35qmSguFFvsZObCShG6zjLEhM5QTUu7ZkiAy/0mmM00ywkRPOwu3ovTAkXhoHZ0fZ
 4A/iLPbNNhKTodHLlnkegYxINvKrwPx6G/72lqgMDl4qZoWjQup/jQap8mZZBkFs86RUNDIEs8j
 ejezaINoTfnVXgj5y6T6YFHfPm0y/hwM4sQxbm4GeOJ1WysyiIr1lGdbT0VtCKKjZd5ggL6Zhu+
 bOglYk2wIqwvgJwjk5w==
X-Proofpoint-GUID: G8nQdIUQwTp6YJDAgH9XlAXHm0ny4GK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223258_692406_1D9A454E 
X-CRM114-Status: GOOD (  15.64  )
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
likely() bounds checks before each increment. The default: case of the
switch statement that follows already handles unknown values with
ath12k_warn(), so no WARN_ON_ONCE is added for fw_tx_status to avoid
double-warning on an out-of-range htt_status value.

Patch 2 renames the local variable wbm_status to htt_status in
ath12k_dp_tx_process_htt_tx_complete() to accurately reflect the field
origin, and simplifies ts.acked to use true directly.

Patch 3 adds a per-pool TX descriptor allocation failure counter
txbuf_na[] indexed by pool_id to track which traffic class ran out of
TX descriptors, and exposes it in device_dp_stats debugfs.

Patch 4 adds a write handler to device_dp_stats debugfs so that writing
'reset' clears all device DP stats counters without reloading the driver.
Uses simple_write_to_buffer() to correctly handle partial writes and
non-zero ppos, consistent with ath12k_write_simulate_fw_crash().

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

v4 changes:
- Rename WBM_ERR_GET_SW_DESC -> WBM_ERR_DROP_GET_SW_DESC and
  WBM_ERR_DESC_PARSE -> WBM_ERR_DROP_DESC_PARSE for naming consistency
  with all other enum values in the same enum (patch 5).
- Remove extra space before = in wbm_rx_drop[] array initializer (patch 5).
- Drop ath12k_warn() on unsupported command in the stats reset handler;
  -EINVAL is the correct user-facing mechanism, consistent with all other
  .write() handlers in the same file (patch 4).
- Fix missing colon in "REO sent to stack" section header; all other
  section headers in the same function use ":\n" (patch 6).

v3 changes:
- Remove WARN_ON_ONCE for fw_tx_status out-of-range: the default: branch
  of the switch already calls ath12k_warn() for unknown htt_status values
  so adding WARN_ON_ONCE would double-warn (patch 1).
- Replace copy_from_user() with simple_write_to_buffer() in the stats
  reset handler to correctly handle split writes and non-zero ppos (patch 4).
- Drop Fixes: tag from patch 7; cosmetic debugfs fix not needing backport.

v2 changes:
- Fix txbuf_na[] indexing: use pool_id instead of ring_id so the counter
  tracks TX descriptor pool exhaustion per traffic class (patch 3).
- Fix sent_to_stack[] to use a 2D array [ring_id][device_id] attributed
  to the ring owner's dp, making it directly comparable with reo_rx[] in
  the same debugfs file in MLO configurations (patch 6).
- Fix double-counting of WBM_ERR_DROP_RXDMA_GENERIC: move the increment
  inside rxdma_err()'s default: branch (patch 5).
- Remove WBM_ERR_INV_PEER_ID, WBM_ERR_DROP_INV_COOKIE and
  WBM_ERR_DROP_INV_PUSH_RSN from the drop reason enum; no increment
  sites in the datapath (patch 5).
- Remove leading space from "WBM Rx Drop Count" section header (patch 5).
- Add likely()/WARN_ON_ONCE() bounds check on ring_id for sent_to_stack[]
  (patch 6).
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

 drivers/net/wireless/ath/ath12k/debugfs.c     | 78 ++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
 drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 ++++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 27 ++++---
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
 6 files changed, 175 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

base-commit: e07447e654476262558bee570f4cf456e2b32565
--
2.34.1


