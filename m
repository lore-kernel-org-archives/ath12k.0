Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24C606D803
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aEgpER/X;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnQ8tkCs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCp+9BrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=; b=aEgpER/XuFakJ2
	HPFhKB64fpgmrf9bud4YlGdM0g03VIcT4+XPQ7UIoekwl+jV/Sea9Fapozi1GfrryJpwLOxNQN+RG
	nkGK/tmdPbQwJqm0zZTJ6Qt9yXmq4tfJS//XbYWXLJp6Sc9kRNXzLYPMzpuqMd5hxlbdibhEnrcqY
	KAl1u9A+Pjvi1plWtnYR0hOuyXvyN46oyRU7pHXKs4ylg2Zdrg6R9b6e9+Xvnf3pIcZwZhyEHDJJY
	ebSSmrDujyhAX7B7AAGKkjtPlFKg7u+d2KDEugkkoR5U2haQaO+XDfpjJ1NGeNPuTUJZkjfo4Jkaa
	5C4sAvwWeTOqsNSDltNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWx-000000043CV-3Mfc;
	Wed, 04 Nov 2026 01:11:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWm-000000042zW-2sIy
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:11:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RVSP230882
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=; b=dnQ8tkCsDqT7CwL2
	FvjyCHEDCwMUYsegh6FGYu/AWaW/yIyurgL8pjNt94d9jQxpfSZaEPtwBFIO8nQn
	QY6osp9vo1+++wcaa8FUI9nGtxeHq+5iyCuMjoq2WyxvakNhLRAf/+Je5lVjYczc
	l14AU2k5L/xqQudzsPX3B6HugVydHD4UMZrGmcWdCD78A9nuKR4lx6NNwPLdP5jp
	e8dBiqOCHYIoEnPJKr05ROeP7pJHdJN4c49hDw3C74DWcxtK41YlJxJpWmeuLjtO
	0waonw4iq/JUVDCQUKUvCVBnG87t+q9mMyTvzPhOTZpstG+cSFgPp624b9oFgp6Q
	BHGN8Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjdwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so520439eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754659; x=1794359459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=;
        b=CCp+9BrW3TYyUsKZvX6SFC2UzRlXmCB+QMbQXx3FUb+IY1JlbMIYOWDxmvodtQlvGY
         +6alxen6j4Q23RwL+TFtgbE1IfGyisF68D+FtK88CkMIAGQRuLemtqTjnDYd/Dne+31O
         x29e2txzA1K0FYHR/W1L9ySIqIHzP4nqpqhuCC4WkvBank7pmT2jJHdTBViSXA+chciz
         16rCXoBH5PcTxiJOOL9z66M64Li2ycZCjbnphQEEq744grBC7PrgEF5856vYS4kUmy6h
         SW0yHsroDl9qL0jKrCxsdjTCVh/fKrw/mm9CMF8n4AF+ZUVqlW7fy8bHe/OIVOPMStLh
         EFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754659; x=1794359459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=;
        b=S8l+lWPOJG5WHyt3O+opOZw0ksDrkLh4qRxqWCD+DQ+sz4wsvY3Lhz+B3cQ7XAC85H
         1gYAxh9q7PIxLw7kZ+tWlsfzsw5kBv7VuwNNPNYAlEgpbKqng+16Ds9kDQL+kYNm9Jog
         W6Bd/9/jLbpW1pr0SL13YNq4TM9qu+m46fCzKShHc9ncWzLgtHtRwJ1yveKD3cDlBNJf
         fUPpGq9kNgZG25BXYQ5qKmyWE0pYfiYFKqOGMTpvQje5uI1myBzjLLyYmRQ7SGJdylJe
         T5KTbK5FJGL1/E/ZMyvG+g/smOtCzFm8uJD5ybkgxAXQzwfoGHuXFVa1RetfvhWhBN6m
         8FXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEHNgoc1nUJgOOZBXDGW6Y/T0R2QA/qzwoQ4hVk8wEZZapn4ev9rlDRbwIw2OZc9+m2cHES+8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ymFwW03MS4WXEbZ3tX6IOILM/x2BULJZncswGN2LCx523mse0
	VnBNTkzAFMW9itldpN6zlXPjw4j2bgw26Z7BCv0nTx+A/BM9Z0vVWkxyqJbXLb55y3LGoteH9Ii
	qYawWERs3EGQ2St2ddcPTLey+O8XFNq4jEqGH1BSQFzCpeep8IsSxRtnfGK0NzGoV
X-Gm-Gg: AYBFou0hBD5SrBgx7sgw/eosumPU+vrWBk8zYkUKSDQlCoU7kg7P6zUANau3gHWmt9b
	kNdOFQjSb+xzknWFhZ9WNnlNIedhyJIXFb/gSEkjERUXoFARQIsZp3PigOpZp3i/UW8P6uGhwoO
	B9lRF6RCsjIBiBBQf7MKoIHfFek6dz5pzjo6NUFd20sNcvsbZY/G1tavmXGciQfTfESFVhPAnkE
	9PZKVkt3ZX0WfB/ho/fI149FQBGatgy/PYlL2rKLeq28wR+EbVIRMkerBBeE8rZgdMMXT7ZU1Y1
	HXh/1hKzt1h+q4agc6+KM2R0xLggW1AtATwaRxWlODvhbmf4Jo3znu2BC40hg36TNcx+8YtASPx
	Vj1sM86FqCXTCkOfQ2DyiXI+p3ulj7Ti2pysYDacsxSuOtM2mtBcd57opyN0s5qr64jmwfTsyZS
	Ofk4mxpiBd5+QwO2flYuUIBB5bkqQoXoC616X/
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr22284520eec.3.1793754658474;
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr22284457eec.3.1793754657522;
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:54 -0800
Subject: [PATCH ath-next v3 11/13] wifi: ath12k: ng: add RX TID REO helpers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-11-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX4PgQxEc4syA1
 +BCL1zawao0X2bnvwTnCafGexy/aRTDqosPy3W2DjzvVZz+ihBVlbJ3SeRZ7MF0ePh72eroT3OU
 kMb4A9rnAb492s76sSc1kj8Q/UvGboU=
X-Proofpoint-ORIG-GUID: 9U80g_1O4B2SEhDkHxoSpU0jflUTgSGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXyKLxS8WWDyXK
 C9+dz5c4L/7SoHMzUmmOdG39DjJj4F7TCl5gVHRX3yIb25rnyzEI+VH6DUwvKCcJuAUM6PhhpYZ
 5bqmk7RYJKENAyZV6GV6gN5h12563ciZyM/8D7AIDUhqBmUrqLhsEbSZCSRtmPfy45fxvhwDHkq
 lVS1vVScOAy6vywb2CiiUcBUaWLd47Cis/C+hqz5zsVze7Fhnc9sK0M4RfMmk68CDDX495gmPT2
 R9M4UdCwQM05+Z1pwuJZ9lLVjpXQjHjG8oz9yD+AqTE50JAh2ZZZCb7wG38i+Z6H6CD6Q+NSs0V
 3YgxGqwdSRZlO8WTK+69lgu6nXOHH2qbJBqGh3dVaMPly/raVRprWbINO6gNFLIHkurjwbICJiZ
 ldK7636uNYGxOB/eZ3vvvoQhgoeD6qAZgIGdpbHY3io1bPbMP4Y10u8+kbVUEH5FB6xtO/cyGw0
 jcRUt1fVRQ+ERfx4+Xg==
X-Proofpoint-GUID: 9U80g_1O4B2SEhDkHxoSpU0jflUTgSGY
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea8623 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kM6TWAs1cUZVOPE9P6AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171105_928574_D71BFC2F 
X-CRM114-Status: GOOD (  18.24  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common RX TID path routes queue setup, update, flush and teardown
through architecture hooks. Wi-Fi 8 needs matching helpers before those
hooks can be enabled for QCN9625.

Add helpers for queue update, qref programming, PN configuration, flush
handling and fragment cleanup. Keep the helpers disconnected until the
final wiring patch so intermediate commits do not expose a partial RX TID
implementation.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 288 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  31 +++
 2 files changed, 315 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index 14117430c43b..0b8a9d32e125 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -283,6 +283,287 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
 						   dp_descs, n);
 }
 
+static struct ath12k_reo_queue_ref *
+ath12k_wifi8_peer_rx_tid_qref(struct ath12k_dp *dp, u16 peer_id, u16 tid)
+{
+	struct ath12k_reo_q_addr_lut *lut = &dp->reoq_lut;
+
+	if (!lut->vaddr)
+		return NULL;
+
+	peer_id &= ~ATH12K_PEER_ML_ID_VALID;
+
+	return (struct ath12k_reo_queue_ref *)lut->vaddr +
+		peer_id * (IEEE80211_NUM_TIDS + 1) + tid;
+}
+
+void ath12k_wifi8_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id,
+					 u16 tid, dma_addr_t paddr)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_reo_queue_ref *qref;
+
+	if (!central_ab->hw_params->reoq_lut_support)
+		return;
+
+	if ((peer_id & ~ATH12K_PEER_ML_ID_VALID) > DP_MAX_PEER_ID) {
+		ath12k_warn(central_ab, "peer id %d exceeds reo qref table\n",
+			    peer_id);
+		return;
+	}
+
+	qref = ath12k_wifi8_peer_rx_tid_qref(central_dp, peer_id, tid);
+	if (!qref) {
+		ath12k_warn(central_ab, "reo qref table is not setup\n");
+		return;
+	}
+
+	qref->info0 = u32_encode_bits(lower_32_bits(paddr),
+				      BUFFER_ADDR_INFO0_ADDR);
+	qref->info1 = u32_encode_bits(upper_32_bits(paddr),
+				      BUFFER_ADDR_INFO1_ADDR) |
+		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+
+	ath12k_hal_reo_shared_qaddr_cache_clear(central_ab);
+}
+
+void ath12k_wifi8_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id,
+					 u16 tid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_reo_queue_ref *qref;
+
+	if (!central_ab->hw_params->reoq_lut_support)
+		return;
+
+	if ((peer_id & ~ATH12K_PEER_ML_ID_VALID) > DP_MAX_PEER_ID) {
+		ath12k_warn(central_ab, "peer id %d exceeds reo qref table\n",
+			    peer_id);
+		return;
+	}
+
+	qref = ath12k_wifi8_peer_rx_tid_qref(central_dp, peer_id, tid);
+	if (!qref) {
+		ath12k_warn(central_ab, "reo qref table is not setup\n");
+		return;
+	}
+
+	qref->info0 = u32_encode_bits(0, BUFFER_ADDR_INFO0_ADDR);
+	qref->info1 = u32_encode_bits(0, BUFFER_ADDR_INFO1_ADDR) |
+		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+
+	ath12k_hal_reo_shared_qaddr_cache_clear(central_ab);
+}
+
+void ath12k_wifi8_dp_rx_peer_tid_delete(struct ath12k_base *ab,
+					struct ath12k_dp_link_peer *peer,
+					u8 tid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+
+	if (!(peer->rx_tid_active_bitmask & BIT(tid)))
+		return;
+
+	ath12k_dp_mark_tid_as_inactive(dp, peer->peer_id, tid);
+	ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(dp);
+}
+
+int ath12k_wifi8_peer_rx_tid_reo_update(struct ath12k_dp *dp,
+					struct ath12k_dp_link_peer *peer,
+					struct ath12k_dp_rx_tid *rx_tid,
+					u32 ba_win_sz, u16 ssn,
+					bool update_ssn)
+{
+	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
+	struct ath12k_hal_reo_cmd cmd = {};
+	struct ath12k_base *ab = dp->ab;
+	int ret;
+
+	ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid,
+				  !!(peer->rx_tid_active_bitmask &
+				     BIT(rx_tid->tid)));
+
+	cmd.addr_lo = lower_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd.upd0 = HAL_REO_CMD_UPD0_BA_WINDOW_SIZE;
+	cmd.ba_window_size = ba_win_sz;
+
+	if (update_ssn) {
+		cmd.upd0 |= HAL_REO_CMD_UPD0_SSN;
+		cmd.upd2 = u32_encode_bits(ssn, HAL_REO_CMD_UPD2_SSN);
+	}
+
+	ret = ath12k_wifi8_dp_reo_cmd_send(ab, &rx_tid_rxq,
+					   sizeof(rx_tid_rxq),
+					   HAL_REO_CMD_UPDATE_RX_QUEUE,
+					   &cmd, NULL);
+	if (ret) {
+		ath12k_warn(ab, "failed to update rx tid queue, tid %d (%d)\n",
+			    rx_tid_rxq.tid, ret);
+		return ret;
+	}
+
+	rx_tid->ba_win_sz = ba_win_sz;
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_RX,
+		   "rx tid queue update successful for tid: %u, peer_id: %d, peer: %pM, link_id: %u ba_win_sz: %u\n",
+		   rx_tid->tid, peer->peer_id, peer->addr, peer->link_id,
+		   rx_tid->ba_win_sz);
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_reo_cache_flush(struct ath12k_base *ab,
+				    struct ath12k_dp_rx_tid_rxq *rx_tid)
+{
+	struct ath12k_hal_reo_cmd cmd = {};
+
+	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS |
+		   HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS;
+
+	if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
+		cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;
+
+	return ath12k_wifi8_dp_reo_cmd_send(ab, rx_tid, sizeof(*rx_tid),
+					    HAL_REO_CMD_FLUSH_CACHE, &cmd,
+					    ath12k_dp_reo_cmd_free);
+}
+
+int ath12k_wifi8_dp_rx_assign_reoq(struct ath12k_base *ab,
+				   struct ath12k_dp_peer *dp_peer,
+				   struct ath12k_dp_rx_tid *rx_tid,
+				   u16 ssn, enum hal_pn_type pn_type)
+{
+	u32 ba_win_sz = rx_tid->ba_win_sz;
+	struct ath12k_reoq_buf *buf;
+	void *vaddr, *vaddr_aligned;
+	dma_addr_t paddr_aligned;
+	u8 tid = rx_tid->tid;
+	u32 hw_desc_sz;
+	int ret;
+
+	buf = &dp_peer->reoq_bufs[tid];
+	if (!buf->vaddr) {
+		if (tid == HAL_DESC_REO_NON_QOS_TID)
+			hw_desc_sz = ath12k_wifi8_hal_reo_qdesc_size(ba_win_sz,
+								     tid);
+		else
+			hw_desc_sz = ath12k_wifi8_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX,
+								     tid);
+
+		vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1,
+				GFP_ATOMIC);
+		if (!vaddr)
+			return -ENOMEM;
+
+		vaddr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
+
+		ath12k_wifi8_hal_reo_qdesc_setup(vaddr_aligned, tid,
+						 ba_win_sz, ssn, pn_type);
+
+		paddr_aligned = dma_map_single(ab->dev, vaddr_aligned,
+					       hw_desc_sz,
+					       DMA_BIDIRECTIONAL);
+		ret = dma_mapping_error(ab->dev, paddr_aligned);
+		if (ret) {
+			kfree(vaddr);
+			return ret;
+		}
+
+		buf->vaddr = vaddr;
+		buf->paddr_aligned = paddr_aligned;
+		buf->size = hw_desc_sz;
+	}
+
+	rx_tid->qbuf = *buf;
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					  struct ath12k_dp_rx_tid_rxq *rx_tid)
+{
+	struct ath12k_hal_reo_cmd cmd = {};
+
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	/* Keep the queue descriptor valid until the delete completion path
+	 * flushes it from the REO cache. Clearing VLD here can make the
+	 * subsequent flush-cache command fail.
+	 */
+	cmd.upd0 |= HAL_REO_CMD_UPD0_VLD;
+	cmd.upd1 |= HAL_REO_CMD_UPD1_VLD;
+
+	return ath12k_wifi8_dp_reo_cmd_send(ab, rx_tid, sizeof(*rx_tid),
+					    HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
+					    ath12k_dp_rx_tid_del_func);
+}
+
+void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc)
+{
+	enum hal_wbm_rel_bm_act act = HAL_WBM_REL_BM_ACT_PUT_IN_IDLE;
+	struct ath12k_buffer_addr *buf_addr_info;
+	struct ath12k_dp *dp = rx_tid->dp;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (rx_tid->dst_ring_desc) {
+		if (rel_link_desc) {
+			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
+			ath12k_wifi8_dp_rx_link_desc_return(dp, buf_addr_info,
+							    act);
+		}
+
+		kfree(rx_tid->dst_ring_desc);
+		rx_tid->dst_ring_desc = NULL;
+	}
+
+	rx_tid->cur_sn = 0;
+	rx_tid->last_frag_no = 0;
+	rx_tid->rx_frag_bitmap = 0;
+	__skb_queue_purge(&rx_tid->rx_frags);
+}
+
+void ath12k_wifi8_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+					    struct ath12k_dp_rx_tid *rx_tid,
+					    u32 cipher,
+					    enum set_key_cmd key_cmd)
+{
+	cmd->flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd->upd0 = HAL_REO_CMD_UPD0_PN |
+		    HAL_REO_CMD_UPD0_PN_SIZE |
+		    HAL_REO_CMD_UPD0_PN_VALID |
+		    HAL_REO_CMD_UPD0_PN_CHECK |
+		    HAL_REO_CMD_UPD0_SVLD;
+
+	switch (cipher) {
+	case WLAN_CIPHER_SUITE_TKIP:
+	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
+	case WLAN_CIPHER_SUITE_GCMP:
+	case WLAN_CIPHER_SUITE_GCMP_256:
+		if (key_cmd == SET_KEY) {
+			cmd->upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
+			cmd->pn_size = 48;
+		}
+		break;
+	default:
+		break;
+	}
+
+	cmd->addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd->addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
@@ -1318,10 +1599,9 @@ ath12k_wifi8_hal_rx_msdu_link_info_get(struct hal_wifi8_rx_msdu_link *link,
  * ath12k_wifi8_dp_rx_link_desc_return - return a link descriptor to the WBM
  * idle pool.
  */
-static int
-ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
-				    struct ath12k_buffer_addr *buf_addr_info,
-				    enum hal_wbm_rel_bm_act action)
+int ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
+					struct ath12k_buffer_addr *buf_addr_info,
+					enum hal_wbm_rel_bm_act action)
 {
 	struct ath12k_base *ab = dp->ab;
 	struct hal_wbm_release_ring *desc;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 2fb56776adb0..c5ee01e703a5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -8,6 +8,7 @@
 #define ATH12K_DP_RX_WIFI8_H
 
 #include "../core.h"
+#include "../dp_rx.h"
 #include "hal_desc.h"
 
 struct ath12k_dp_hw_group_wifi8;
@@ -171,6 +172,36 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
 					    struct ath12k_reo_cmd_entry *entries,
 					    struct ath12k_reo_dp_cmd_desc *dp_descs,
 					    int n);
+void ath12k_wifi8_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+					    struct ath12k_dp_rx_tid *rx_tid,
+					    u32 cipher,
+					    enum set_key_cmd key_cmd);
+int ath12k_wifi8_dp_rx_assign_reoq(struct ath12k_base *ab,
+				   struct ath12k_dp_peer *dp_peer,
+				   struct ath12k_dp_rx_tid *rx_tid,
+				   u16 ssn, enum hal_pn_type pn_type);
+int ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
+					struct ath12k_buffer_addr *buf_addr_info,
+					enum hal_wbm_rel_bm_act action);
+void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc);
+void ath12k_wifi8_peer_rx_tid_qref_setup(struct ath12k_base *ab,
+					 u16 peer_id, u16 tid,
+					 dma_addr_t paddr);
+void ath12k_wifi8_dp_rx_peer_tid_delete(struct ath12k_base *ab,
+					struct ath12k_dp_link_peer *peer,
+					u8 tid);
+int ath12k_wifi8_dp_reo_cache_flush(struct ath12k_base *ab,
+				    struct ath12k_dp_rx_tid_rxq *rx_tid);
+int ath12k_wifi8_peer_rx_tid_reo_update(struct ath12k_dp *dp,
+					struct ath12k_dp_link_peer *peer,
+					struct ath12k_dp_rx_tid *rx_tid,
+					u32 ba_win_sz, u16 ssn,
+					bool update_ssn);
+void ath12k_wifi8_peer_rx_tid_qref_reset(struct ath12k_base *ab,
+					 u16 peer_id, u16 tid);
+int ath12k_wifi8_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					  struct ath12k_dp_rx_tid_rxq *rx_tid);
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);

-- 
2.43.0


