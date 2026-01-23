Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C4DD6261A
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo5Cqh/YaDf/Hx/aCx/Sn/3ZIfQucmSQ5SKZhbC2KjY=; b=zSNRrWp0+phuHT7ZKJoA1W5VH6
	AknOWPSTCstd5MjA37vfLz01oGwmSjxIgywH5vwjqKkT4DjDkQHgwb8nVuBXI6SkXTRJaZOQErEoE
	Ko9NnTWCnA0JZaaq0mDjr1r6yV+Q4pGrb+4EftDnBdHcK+zTpjA3H/sIdoxTn6V2AlzumqO0iQAvI
	MYBMK8CuOTg7Ro8TRM8D6sicYOUK82LqS5uxbXkhpd5qdx8VqF0NfopkGNLkvJE6MsxwOTXpDmSou
	IPCp5jqwNVZgeL51k8lGCDa34643Nsyf4zUM24g8MbkeG1SwIpSJ2nXDaPRGf2eCegU/e8ZgtxAXc
	OjS3+yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBMA-00000008M3G-3P6q;
	Fri, 23 Jan 2026 07:13:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBM6-00000008M1O-2X5m
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 07:13:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6rhmO1325854
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Eo5Cqh/YaDf
	/Hx/aCx/Sn/3ZIfQucmSQ5SKZhbC2KjY=; b=duqbpG2LbLs7v6OYMjTBcdaIrOx
	23x830RB7XkzTyNzt3Ii6JevPpKaN+9Kl+f3btlVWilqTLGgjT9/oZ03pzb4gocz
	6r4DqV0ky3xSaAO6AT+PKg9uqd8HHwcMhVksrgwroBhWuc75QIdyIuMwRDgkKxOy
	rJ8r0yhuhx3Y2FJSzll42W+bGG24Hw70hhtpm2HeGsMOEHiWps/wVui0HroL2mx0
	po0ELR8UAKxLxuiFzHLaiKl9pSWf/IN0pKDX/F2ubms15p1APXC5sDlK48o0JqKO
	lf8fee/lef6bV1/lyS/Dt/RxxTYETo8nbr27jRPKKAvAW95vsk1AHXQdXmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c822a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so21192705ad.0
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 23:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152397; x=1769757197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo5Cqh/YaDf/Hx/aCx/Sn/3ZIfQucmSQ5SKZhbC2KjY=;
        b=U5plYwCOeVY8fMq0xoB+h43ZKhn298PngQrRC3PB7dow3DfsmHtsq022m15xDOZPnP
         riloylgLo2qOGMkA3WeIArGeaXoU5LGTHlhuzX19Zir3PpMMobNJ+WONw1zneMJD6pbq
         6X/U/yzV0/zNn/vACbnP+ySSWoJ8iQ4890Ybpytz8LzXarpOWo99Iz+NOomJubOOy2AU
         zAdQOlLUPTLfYBjVVj+PLQUbG/GkOXMqjEwrtCJ+dvHbegofpiv1ezWSuV2PSTU83XbY
         DOMcY+h7aBLfS+UdbKkO7ZnVPSLNIgru8GyugjdtWr98t738BWZfRZgLUix7/pp8EZiF
         z4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152397; x=1769757197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eo5Cqh/YaDf/Hx/aCx/Sn/3ZIfQucmSQ5SKZhbC2KjY=;
        b=W3JXPLdPtKA+v1fPjhvps2TmeWPArupp4JZKXkgsqkB7vISW08hDWZmFNQOj2UG8Ka
         zJ3Vrc3mn3RVOnB54pEzogLY3khPbjJNVldt5fHyzh+sQwyQIHsmX94P6n4Zny2BWEBI
         mqojkPWc9t6yOVL+SSJldVaP2LonPs+gLO60f2oL5mFU8XXoxgCn091pEfhwjhysvHMa
         /mKbAMsjavsnDSikxyYt7hMpgEGqL/02bEMkt0ylaia/R3Qt7JqI670JxC6aJ9E2SEe8
         ZfisoUmGa8TD0O5oIs1mRQAj9yrU/qjCAnOFudTLSukJmZ015CJKRUH+nM9YqEkZNvEz
         JMYQ==
X-Gm-Message-State: AOJu0YwLs5Gi9sXicxGFBo4Qu8KOilcq8ICPP+kdTGlaaAhyUnGNl0s4
	rQOl7Y0WYpuwV/JHLRsbrKAR46q00DCNnxIqjUMIfPTweoYjBHfh7XbOyLcbpsXka55wThYNtFF
	8C7stacCnzKjk+fNJwoxSegWF05FiV5XbBB98XeDT11uVxhh6uwhs5FKrFDcDJtoV1aGqZzNM
X-Gm-Gg: AZuq6aK6MgnKxCcnqbnw+9Ilzrt+Vn5n6pHS6IdHT0PbkyP2B/m68vLs8o1EN457uwO
	4BUlOMh3ne7beFMiPgXxzLq2aFGOE3NJvRf/+CluNl8VfNJl9Gs63Oi6D5Jo1xGGPhAPOjkMsFD
	Rvtml8mtNKI54UP4tFoHZAvLaQKCUKQPeNM/Oj3IUPLQLKaukH+DyvqNIgzRTcOkUAxc5WUIv3W
	n/8ujk80shCgBkCY/+/37uSq97x5kzJCpmCEvb83TOP1+uvOjNai3gRuYjurV1Q5M1I20IbD4N9
	hPwVe0lx3UaUMxWzddJJPn+QbAzYdJp9euNNXjqql4lQVaWBAfcReP83ODDUewTlUO77EWAq5u1
	R0yrM2E+mwucq5Wa7CeEUbc/T5Hs3OMU3bGvBY2C5ad7s1fQ4+a/lbu+4rChCGUbxDE6chPwlob
	ySUCVhQuw89VHCr6SsH9AsiHIUGCB328at
X-Received: by 2002:a17:902:f54e:b0:2a0:89c6:1824 with SMTP id d9443c01a7336-2a7d2f17e0bmr51989465ad.8.1769152396834;
        Thu, 22 Jan 2026 23:13:16 -0800 (PST)
X-Received: by 2002:a17:902:f54e:b0:2a0:89c6:1824 with SMTP id d9443c01a7336-2a7d2f17e0bmr51989315ad.8.1769152396318;
        Thu, 22 Jan 2026 23:13:16 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa654sm11319165ad.11.2026.01.22.23.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:15 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath12k: Add support TX hardware queue stats
Date: Fri, 23 Jan 2026 12:42:53 +0530
Message-Id: <20260123071253.2202644-4-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=69731f8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r7p6sMyryvZn4FPVG9QA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: a5FPLrz3NhIVlJDhW9d8591qD8XIGjaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX4AJuZjJ2HAiF
 S1ed5aTzD5YhEBBZRSTEvdnqFo6TaQ24VcNVroF1QqguRA68r3uXfLd/QtXWEc/4voPLRGAQ3OE
 Wk9j/0UeopSrRsCKUUjd2doA17rMjt07dKnH5Xb9aMCrU8cFfGexoPA7kV/vo5oiqjL8b6RZDcT
 niZymXN1f9/Mqf0gk2V/HSGQlQhjMAbgFSLNsyq9F8lJ+TohIyODEj9fadfcuokFPAQ1SuxDtBZ
 QsKiSoKQ/gA46cKnXHDcCh/lCgjRKc+dLJ4RCGuKpe1d0S51ZCD/7fGSyhfdaYd2YsvhBtG+NJW
 nlOIlIayQmEZIAxCjIj2cjHS23DMM7Eat8LyKc1+76NXK8PDpvwh20vJvafPeHmcQTlt/0D3S+X
 cXsrDmoPf23DhzuZ8tWz3A6MW41nQDxwTS1+mI65nmfCwwRqpL+c0/eNCzbCQr/rmqKHQcZ/oLO
 HFrw3lUJw5EBKpmjXqw==
X-Proofpoint-ORIG-GUID: a5FPLrz3NhIVlJDhW9d8591qD8XIGjaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_231318_645203_823DDA50 
X-CRM114-Status: GOOD (  13.60  )
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

Add support to request and receive TX hardware queue stats using
HTT stats type 3. This stats type reports MPDU mac id and hardware
queue information, including xretry, BAR, RTS, CTS, self, and QoS-null
counts, along with underrun, flush, and filter counters.

Sample output:
-------------
echo 3 >/sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats

HTT_TX_HWQ_STATS_CMN_TLV:
mac_id = 0
hwq_id = 0
xretry = 0
underrun_cnt = 0
flush_cnt = 0
filt_cnt = 0
null_mpdu_bmap = 0
user_ack_failure = 379
ack_tlv_proc = 0
sched_id_proc = 0
null_mpdu_tx_count = 0
mpdu_bmap_not_recvd = 0
num_bar = 0
rts = 0
cts2self = 0
qos_null = 0
mpdu_tried_cnt = 379
mpdu_queued_cnt = 379
mpdu_ack_fail_cnt = 0
mpdu_filt_cnt = 0
false_mpdu_ack_count = 0
txq_timeout = 0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 64 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 26 ++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index a667eb9966c9..7f6ca07fb335 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5661,6 +5661,67 @@ ath12k_htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
+				      struct debug_htt_stats_req *stats_req)
+{
+	const struct htt_tx_hwq_stats_cmn_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_TX_HWQ_STATS_CMN_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			le32_to_cpu(htt_stats_buf->mac_id__hwq_id__word) & 0xFF);
+	len += scnprintf(buf + len, buf_len - len, "hwq_id = %u\n",
+			(le32_to_cpu(htt_stats_buf->mac_id__hwq_id__word) & 0xFF00) >> 8);
+	len += scnprintf(buf + len, buf_len - len, "xretry = %u\n",
+			le32_to_cpu(htt_stats_buf->xretry));
+	len += scnprintf(buf + len, buf_len - len, "underrun_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->underrun_cnt));
+	len += scnprintf(buf + len, buf_len - len, "flush_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->flush_cnt));
+	len += scnprintf(buf + len, buf_len - len, "filt_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->filt_cnt));
+	len += scnprintf(buf + len, buf_len - len, "null_mpdu_bmap = %u\n",
+			le32_to_cpu(htt_stats_buf->null_mpdu_bmap));
+	len += scnprintf(buf + len, buf_len - len, "user_ack_failure = %u\n",
+			le32_to_cpu(htt_stats_buf->user_ack_failure));
+	len += scnprintf(buf + len, buf_len - len, "ack_tlv_proc = %u\n",
+			le32_to_cpu(htt_stats_buf->ack_tlv_proc));
+	len += scnprintf(buf + len, buf_len - len, "sched_id_proc = %u\n",
+			le32_to_cpu(htt_stats_buf->sched_id_proc));
+	len += scnprintf(buf + len, buf_len - len, "null_mpdu_tx_count = %u\n",
+			le32_to_cpu(htt_stats_buf->null_mpdu_tx_count));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_bmap_not_recvd = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_bmap_not_recvd));
+	len += scnprintf(buf + len, buf_len - len, "num_bar = %u\n",
+			le32_to_cpu(htt_stats_buf->num_bar));
+	len += scnprintf(buf + len, buf_len - len, "rts = %u\n",
+			le32_to_cpu(htt_stats_buf->rts));
+	len += scnprintf(buf + len, buf_len - len, "cts2self = %u\n",
+			le32_to_cpu(htt_stats_buf->cts2self));
+	len += scnprintf(buf + len, buf_len - len, "qos_null = %u\n",
+			le32_to_cpu(htt_stats_buf->qos_null));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_tried_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_tried_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_queued_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_queued_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_ack_fail_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_ack_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_filt_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_filt_cnt));
+	len += scnprintf(buf + len, buf_len - len, "false_mpdu_ack_count = %u\n",
+			le32_to_cpu(htt_stats_buf->false_mpdu_ack_count));
+	len += scnprintf(buf + len, buf_len - len, "txq_timeout = %u\n",
+			le32_to_cpu(htt_stats_buf->txq_timeout));
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -5960,6 +6021,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PDEV_RTT_TBR_CMD_RESULT_STATS_TAG:
 		ath12k_htt_print_pdev_rtt_tbr_cmd_res_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_TX_HWQ_CMN_TAG:
+		ath12k_htt_print_tx_hwq_stats_cmn_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index a6656f20b845..bfabe6500d44 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -128,6 +128,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_RESET				= 0,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX			= 1,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX			= 2,
+	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_HWQ			= 3,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_SCHED			= 4,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_ERROR			= 5,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TQM			= 6,
@@ -174,6 +175,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_PDEV_SIFS_TAG			= 2,
 	HTT_STATS_TX_PDEV_FLUSH_TAG			= 3,
 	HTT_STATS_STRING_TAG				= 5,
+	HTT_STATS_TX_HWQ_CMN_TAG                        = 6,
 	HTT_STATS_TX_TQM_GEN_MPDU_TAG			= 11,
 	HTT_STATS_TX_TQM_LIST_MPDU_TAG			= 12,
 	HTT_STATS_TX_TQM_LIST_MPDU_CNT_TAG		= 13,
@@ -2130,4 +2132,28 @@ struct htt_rx_pdev_fw_stats_tlv {
 	__le32 bytes_received_high_32;
 } __packed;
 
+struct htt_tx_hwq_stats_cmn_tlv {
+	__le32 mac_id__hwq_id__word;
+	__le32 xretry;
+	__le32 underrun_cnt;
+	__le32 flush_cnt;
+	__le32 filt_cnt;
+	__le32 null_mpdu_bmap;
+	__le32 user_ack_failure;
+	__le32 ack_tlv_proc;
+	__le32 sched_id_proc;
+	__le32 null_mpdu_tx_count;
+	__le32 mpdu_bmap_not_recvd;
+	__le32 num_bar;
+	__le32 rts;
+	__le32 cts2self;
+	__le32 qos_null;
+	__le32 mpdu_tried_cnt;
+	__le32 mpdu_queued_cnt;
+	__le32 mpdu_ack_fail_cnt;
+	__le32 mpdu_filt_cnt;
+	__le32 false_mpdu_ack_count;
+	__le32 txq_timeout;
+} __packed;
+
 #endif
-- 
2.34.1


