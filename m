Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690E3C5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iM2U/yypuTZBTMptELc9jAfcUPywYPhDAWLI3nFxvgc=; b=d7M2MWIXjhrq0jfruWq9TqnbtO
	lc96QZETw8dQRhgb3OZCosu7JZNqR0dkNDAYk6R5eEkWXN0l98tUwzB1OgqmWHLZT0b4/tRqJg5XO
	zXUAwOJH1H4K6XsXUvzf/7qvY3y1E+LFGomj5TvbxX6vTGpAnAdSYgWh4YqCv0wsCC4g6umkyqzj3
	2PUdpxl/Xv6GJ61lc0dGVIycfO7ZRXE8jJ7bg0tBY0tsQGYdfxyG1t/1pqKn8MYepKWASKO0AObr3
	lkgEG/SMSpw/03XezxA570BCj8qXCMRj+Sa7hvfh2YAFP5ipeabLdddYARf/oTSokyPcydfaZQjZ1
	5w+Gs1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFH-0000000C3Fn-0FME;
	Mon, 10 Aug 2026 14:44:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFF-0000000C3FQ-0EFk
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:44:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjHFu1959740
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iM2U/yypuTZBTMptELc9jAfcUPywYPhDAWL
	I3nFxvgc=; b=EML9HzMbfNXjULngkuQvpvLM3EV4gISZ1JuM+8h3AHr5vqyVaJ/
	cPbCSAbi3xx0ZVEJSMT2NWQduuhp5fQ5wy30xVsgo7GDlhSg54ydGqW0LsSr7Cs4
	nMaKwb+TsKk8OXo1m6Jpc2vZ5D6IChjFJoUnjy0Ys37m7c47madWuI7tYBLzef1P
	CLS43nHguVXo+h1HMlf7TocQ2iLNh3iUg3ix5ii9Uy+HR4kjThBCRYkUSA0z0W/1
	63SJBgL8Ul4IZQ9pIODhy/kFd8I3FLPfqgcwscEcbijp/lJ8kpB0vUo6jj0iQEzc
	MntVZkoa806yLGETfuIns9L0Vr9paCHg8OQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xu2pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1880876a91.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373090; x=1786977890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM2U/yypuTZBTMptELc9jAfcUPywYPhDAWLI3nFxvgc=;
        b=gYCwTjNMfqDleJYF9k7mw5fkHETELPvMz/8vE2fE51y/aqcUZRfBeWf42r1KXkCAMg
         oy5nSCQwST/FMSk2ErR8oMQPxz5Y7xurj7LPmbr4zjoepRZzqySrETpGOHdRJws+YnYW
         ZtF5fCPaHOS8E0txPktFpgvoe4HI/PPE9Fw4JPIog262t1CDhEcaLWf2qrjdMrlojV6Q
         deGOW+vR2x46TmQEOg363RzwMzQ1hcR7bwfowe99PYtqtwXWv6R4mjjWIn8UwKhQoocE
         xGj3zP7zQa5Cm7RdlF3YqqNIptjjHlq68IXx3mhFDGOIG1W5fgLMu4+MHc7mBBJz+IFk
         xlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373090; x=1786977890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM2U/yypuTZBTMptELc9jAfcUPywYPhDAWLI3nFxvgc=;
        b=oiEz/eRWCo7+H0hlRe3y/tIpBRUpo6NgpxnP6ANPMli8K5phNgVAM0eVar2vzofDWN
         wKJ/eVfm62Rc9Yp5FL+EYJ1HvVrA3+CFDgTM4ZVXxojuPiaHm8FAveK/MejF7PL7kiih
         VH403g3M/WfVA+ugr7xHepLlaGIc+gS69CcQqwnTLDn0bQG7Kl4YoXlqCq6RSX/AeA6Q
         ZJvUOqct+etC3FjcRWyCsoF17ef+EzNPd05CzxqxnIaWr7GkKV7OCjp9bInN4sQXeBwF
         R82+wzW+tfmHWP9+aFyGv99dtzmbnV4yyBaIsvSkF8eJRnxA4AILa+cBr7mlh1DcMFWf
         AfUA==
X-Gm-Message-State: AOJu0Yzp/EAqJ1sNtMw7vmlLQ/Y/p5xfeQv3O+wrGlob1RqrWqjwO4T7
	FNyU1+1zxoFpxHrtm7uOSpLjJKS2oF20yI0K7ClLue+hNJKF4nEkrMJUALXhzMarW63J5uI9fUY
	X4l4JrXt17MdIJbEIJP3w86TCsRhqEQXvVdZZg4qnT2XHflx/AEUAK72FusP1Mc5PMstr1cdj
X-Gm-Gg: AR+sD10knKKBN79wXWj8or2PKhD8xEvkIl8jQ0nJnMj8OjOAebxWR5CHigfX+WsY1tI
	RlRB5pr08QaFdh1uXXu+2t7XfB53Hg5612pwkyr7muouJ77/1bWNqcthcwEYtOXmHAHP54J5qEG
	bEZaZ/e2dDayOCg7M5GPAbk63EeTADbXN6RXZ/VrTjFst/1Ie8Lf5Gf9wXI3eiWnrSJX+rsfAHK
	yBl0kBe3cMrFgYP3OSVUQ0gO0wOrbyQngH8tdbX3+pqyfAbAmpDTDa3wc6pGXjtiD3bERLcJE4l
	aqa/nSeqlqq03vI6nrN/Kw0VJEK1G6co57YDc3Fy5m7S+xvGnpqlT7BNXK6NQEOEBOzekx7oXqk
	leg2LhBFmSaxgCFhA6E9rR7FkkcHLKfDFHZS6pE8MBp4ykG1VLHuA
X-Received: by 2002:a17:90a:c2c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-392cca3507dmr1997438a91.15.1786373090481;
        Mon, 10 Aug 2026 07:44:50 -0700 (PDT)
X-Received: by 2002:a17:90a:c2c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-392cca3507dmr1997394a91.15.1786373089857;
        Mon, 10 Aug 2026 07:44:49 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:44:49 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 0/8] wifi: ath12k: extend device DP stats for TX and RX observability
Date: Mon, 10 Aug 2026 20:14:36 +0530
Message-Id: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX4wr/cZRtkn2H
 uhmUztyM1hrngzbWLUWAcnlrUXdlVivx1tCq2eruHuq6qyEAQ76QjNaLELd/T0EOtnvnDY6Rnhm
 zXCFbBzcP1nidx6TJBaeSvXHGUXjsLY=
X-Proofpoint-ORIG-GUID: _z8-M1uVWVsJPwmd0Biz_q3vXO0SveCP
X-Proofpoint-GUID: _z8-M1uVWVsJPwmd0Biz_q3vXO0SveCP
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79e3e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xUrUGq4uUGx-1kL8JP8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX/MRO0F5BtZsF
 llJRqc1BAdqlf/MwoMCTqhKz6/uc+q9MOTYnpn3dXmK8GCvLq7hEs8tr76ZjvAfYcNSszrLTHg9
 M95jeSN6IVmNjqGVzCHhIziQSr0nyLCEBhrBJe0K9XAHWUS6RgJQeqC/dxoQ0b9r/KatdJSNYh9
 qgN9IK8VCS/J/Ok40ZsIIN70Gke2LUDnJgH9I2iC59q5iUQ+bdbokKmItJfQi+f4UiAM38rre8y
 Jlq3MWdtJ6b1fI8XhRqQsyw9R43MfcUlcG3pDnIBgClC44G8QxCd06n+flxxI6/heIcrh1knvZL
 UEm9XBJoDjkn5n2jwqRnx/cPmi+0fiJ17R6PBujA+1WI5ooMpyYt0jnIkgkPA8sX0DFaYh6wNjW
 nGcWM927AiARlEuEXDD2pc6mcN7VRpozVYY580kZvPZPdD18IoSg615elYJQnuMHurwHRtCh/uK
 S0DI1b0IHMDFSU+7fpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074453_207480_C98F5C1C 
X-CRM114-Status: GOOD (  13.41  )
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

 drivers/net/wireless/ath/ath12k/debugfs.c     | 80 ++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h          | 14 +++-
 drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 52 +++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 27 ++++---
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
 6 files changed, 177 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

base-commit: 691e5e43b2aa5da35b044532845a3b230e540894
--
2.34.1


