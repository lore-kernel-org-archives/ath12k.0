Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9896C87FD1
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39PxoyaGNcy5eV+ox2Gg8nyAQOoUYs7oUQ/EkBnOdmE=; b=TmawToDqb5PCklOCP/r8t2ozDZ
	2f4eFY0IfVyBqJHGUO+EKWbgCTsHv6pPbtNwXgz/6WEp5xnmU1Q2qtPXBCLmVnzCrBsoPqa2db7IS
	cUNaKez0luK28FNZvugzOBYQcptPtAYmtE/0c69/tO/j9e0h2j92qjpzrqguo1U8dwyYtVSmy4Yy6
	aN8+gktDHyQ6bCqyZ6jKRETgVm59YRi4hcA2MC9oPRnlZMPfOK2LgSKVDWlq+eKxGbs/rasZdj+an
	Sl1frxx6aj5y5nwPZP/Lte/inYgPQoYmsUVF6ZMLX6sLBP2qdyP1CBrpHlgNzZVxC4zz0CFhL8o1C
	3EY2QvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9v-0000000EznT-1sQB;
	Wed, 06 Aug 2025 11:18:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9t-0000000EzlN-0OCb
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765ffKr031579
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=39PxoyaGNcy5eV+ox2Gg8nyAQOoUYs7oUQ/EkBnOdmE=; b=Aw
	AiApTwtQ9pKC9iUv+vdFMwEjas2kFe5DRnNhAPaN63oGZKA0QV3794y3PsLhh89i
	2ihixGb5LSkNFeZ3vsWEGcXnhDtSf9t6JQDMvUB8oY3m78pW5AP8hzU6ZgBB9g4E
	1OIq7cTwo0Ifi9lj62ueBH7uAJlUZGmiRMWP9TZrygzpBpFJxduT0S42TrwBA/a3
	/Mu/A4g/i9W34h84o2ErnBazWy1Rcaqjo7Q6VPwAhzYAS1SojesZAKfeIj2yfohz
	dIKvzyTb0TZbVsk6rahKWU1iCqxKfOmqWHqIybHbJMh7EdA9eIcm9WnhhbdI4u1J
	uYo6NzZPGcNxPXW1prMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybajcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so9179492a12.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479091; x=1755083891;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39PxoyaGNcy5eV+ox2Gg8nyAQOoUYs7oUQ/EkBnOdmE=;
        b=WbRndOriV51Km1ikkuOWYqC8/eDB+Wd7eFXgyd9flrF25GN/YbfeWnWq8UcmzbYPLi
         Wzzfjt/Pvupzh+BuB6nWFSMRI6SLuCK7N39fotdeCb0XZbVsue4DyTrIIFCeptI1/DRQ
         B1jsiWUX04ivc/RGo8OHJaR0xwGUgwCyOx528sUhTJinRm1IdOxc/9123QEmwHTjiMYZ
         KbssbqXe2SFYMdkn0Dg6b/sAl0UFuy7pGYpsxQb3yRAsPwtL0SHXcJY8YdnLbtGmaVMH
         vGVffNvlaxqt+v3O6uDO4s6afrqDkBU5WD0hKzxnxjN5qEqvQf+wQObGS32pqWOxziwd
         y5lg==
X-Gm-Message-State: AOJu0Yy5EMoe7f8qTPt0/w2vF4gMSu27lomJBs+R+1VySCYsS5NcS+g+
	E204bk2HA3dGc3koWg+Y8Y8cbmMWai27kV8V1OrW0dG8uW5HE2gjo4i/sBbS1XU3ljKTMYfJzCA
	YzTSeP42w7Wzq5OkPkzvPgfffwMOK1ZekTMTvWr9kivnNphOauM6lergRwzE2ioqstlWRpf1B
X-Gm-Gg: ASbGncv14P0mehoREuiYEd0Y1moowG73G0jHfksyWRxkTvwO2VYD/n+EiNc/8d1uCoq
	IpBecHztdqRC9ZE5lC0fzNcDtFi5E41HOuIWKCdG2VhaKQ6WwVg2Ti+cHOV6NqXALfxlOL8LK+w
	bHRRdgBYtCIQOi5kZkrbmThrSSwSYYYvpGKovcN3FoCvU1x5ZkDabZHPxVC11pwjYPKI0QasuU9
	UDtck0dlkqEROw16PcHsuv84SjvbB07xbt5ec9885YvVoswHJrqUyHLDlGhHihGp6SC+fANLLBW
	nRkEkoBtN/xeCahf689au4Z2MAPqVkQMVWRwhQHdKjwbWn8gJ3Mq0LTbQX5Qt4STNTr00SlwXtx
	LSsbktjuxY4YBA7GEH/DNSZvOQCwo0W15Lq/aRVG7NjAtu+cHqtilPRWpXd840jzT4bYTXw3iOg
	==
X-Received: by 2002:a05:6a20:7f8d:b0:23f:f9c7:f47d with SMTP id adf61e73a8af0-2403129257cmr3909721637.17.1754479090458;
        Wed, 06 Aug 2025 04:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVKfeY8aoYbQjn0GTzpcAW0M7lH3I9YFDLGxDthQ2fQBAozf4xB5iClyFOBidfEheT33uRMQ==
X-Received: by 2002:a05:6a20:7f8d:b0:23f:f9c7:f47d with SMTP id adf61e73a8af0-2403129257cmr3909670637.17.1754479089904;
        Wed, 06 Aug 2025 04:18:09 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:18:09 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 7/7] wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors
Date: Wed,  6 Aug 2025 16:47:50 +0530
Message-Id: <20250806111750.3214584-8-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5BlNAiCXImiY
 QbiTqoJ91SvYzGUTBh+qiAPyi77yNO6+L199ZyW3xq35TKuuoPpy2UoS9xahO3rq+vWcy8B4Vu+
 kgMxS9IK5uf0CWQC/45kp9acaYpFs3JymtnTHThDYjIFmI6AWiApbXcpN+yb+zmvYRXKCl2FRiU
 nAp1gTlpArG0/Gu+RTAJ1PzXMxhJ9PdJuuWpmnD9G+rmCHS4NkjWf+9wg8L9IhYOi0gQwkyEBGL
 G4mWpjOj4Hp5eAPj0pM4VKAy6O3nNswS96BqTLj7vWzz16lcvWndg1b+hy1ZjlWmRZJOiFitFX/
 i41HMBnszAR99rb6SnNktLYI+e6O775AIcdJu5hJFAEADOGb6MQ7NkD+pYLKIMqrfDYgrId8S2l
 Jk0pIukG
X-Proofpoint-GUID: 8o_nQfzQIzkiZ9Knc1kNhk6PK4Otli2M
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=689339f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=U3mdeq3A4Ipmt2oGaEUA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 8o_nQfzQIzkiZ9Knc1kNhk6PK4Otli2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041813_252534_A989752A 
X-CRM114-Status: GOOD (  21.64  )
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

From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>

Currently, if the descriptor size exceeds 128 bytes, the total
descriptor is split into multiple 128-byte segments, each
requiring a separate flush cache queue command. This results in
multiple commands being issued to flush a single TID, which
negatively impacts performance. To optimize this, use the
_FLUSH_QUEUE_1K_DESC REO command to flush a 1KB descriptor in a single
operation to optimize performance.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c    | 59 +++++++++++-----------
 drivers/net/wireless/ath/ath12k/hal.h      |  1 +
 drivers/net/wireless/ath/ath12k/hal_desc.h |  1 +
 drivers/net/wireless/ath/ath12k/hal_rx.c   |  3 ++
 4 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9cdb7cb03e23..8c5238c3a5db 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -693,44 +693,33 @@ static int ath12k_dp_reo_cmd_send(struct ath12k_base *ab,
 	return 0;
 }
 
-static void ath12k_dp_reo_cache_flush(struct ath12k_base *ab,
-				      struct ath12k_dp_rx_tid_rxq *rx_tid)
+static int ath12k_dp_reo_cache_flush(struct ath12k_base *ab,
+				     struct ath12k_dp_rx_tid_rxq *rx_tid)
 {
 	struct ath12k_hal_reo_cmd cmd = {};
-	unsigned long tot_desc_sz, desc_sz;
 	int ret;
 
-	tot_desc_sz = rx_tid->qbuf.size;
-	desc_sz = ath12k_hal_reo_qdesc_size(0, HAL_DESC_REO_NON_QOS_TID);
-
-	while (tot_desc_sz > desc_sz) {
-		tot_desc_sz -= desc_sz;
-		cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned + tot_desc_sz);
-		cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
-		ret = ath12k_dp_reo_cmd_send(ab, rx_tid,
-					     HAL_REO_CMD_FLUSH_CACHE, &cmd,
-					     NULL);
-		if (ret)
-			ath12k_warn(ab,
-				    "failed to send HAL_REO_CMD_FLUSH_CACHE, tid %d (%d)\n",
-				    rx_tid->tid, ret);
-	}
-
-	memset(&cmd, 0, sizeof(cmd));
 	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
 	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
-	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	/* HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS - all pending MPDUs
+	 *in the bitmap will be forwarded/flushed to REO output rings
+	 */
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS |
+		   HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS;
+
+	/* For all QoS TIDs (except NON_QOS), the driver allocates a maximum
+	 * window size of 1024. In such cases, the driver can issue a single
+	 * 1KB descriptor flush command instead of sending multiple 128-byte
+	 * flush commands for each QoS TID, improving efficiency.
+	 */
+
+	if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
+		cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;
+
 	ret = ath12k_dp_reo_cmd_send(ab, rx_tid,
 				     HAL_REO_CMD_FLUSH_CACHE,
 				     &cmd, ath12k_dp_reo_cmd_free);
-	if (ret) {
-		ath12k_err(ab, "failed to send HAL_REO_CMD_FLUSH_CACHE cmd, tid %d (%d)\n",
-			   rx_tid->tid, ret);
-		dma_unmap_single(ab->dev, rx_tid->qbuf.paddr_aligned, rx_tid->qbuf.size,
-				 DMA_BIDIRECTIONAL);
-		kfree(rx_tid->qbuf.vaddr);
-		rx_tid->qbuf.vaddr = NULL;
-	}
+	return ret;
 }
 
 static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u16 tid)
@@ -828,9 +817,19 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 		if (dp->reo_cmd_cache_flush_count > ATH12K_DP_RX_REO_DESC_FREE_THRES ||
 		    time_after(jiffies, elem->ts +
 			       msecs_to_jiffies(ATH12K_DP_RX_REO_DESC_FREE_TIMEOUT_MS))) {
+			/* The reo_cmd_cache_flush_list is used in only two contexts,
+			 * one is in this function called from napi and the
+			 * other in ath12k_dp_free during core destroy.
+			 * If cache command sent is success, delete the element in
+			 * the cache list. ath12k_dp_rx_reo_cmd_list_cleanup
+			 * will be called during core destroy.
+			 */
+
+			if (ath12k_dp_reo_cache_flush(ab, &elem->data))
+				break;
+
 			list_del(&elem->list);
 			dp->reo_cmd_cache_flush_count--;
-			ath12k_dp_reo_cache_flush(ab, &elem->data);
 			kfree(elem);
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index c1750b5dc03c..efe00e167998 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -832,6 +832,7 @@ enum hal_rx_buf_return_buf_manager {
 #define HAL_REO_CMD_FLG_FLUSH_ALL		BIT(6)
 #define HAL_REO_CMD_FLG_UNBLK_RESOURCE		BIT(7)
 #define HAL_REO_CMD_FLG_UNBLK_CACHE		BIT(8)
+#define HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC	BIT(9)
 
 /* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO0_UPD_* fields */
 #define HAL_REO_CMD_UPD0_RX_QUEUE_NUM		BIT(8)
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 0173f731bfef..13ddac4a9412 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -1225,6 +1225,7 @@ struct hal_reo_flush_queue {
 #define HAL_REO_FLUSH_CACHE_INFO0_FLUSH_WO_INVALIDATE	BIT(12)
 #define HAL_REO_FLUSH_CACHE_INFO0_BLOCK_CACHE_USAGE	BIT(13)
 #define HAL_REO_FLUSH_CACHE_INFO0_FLUSH_ALL		BIT(14)
+#define HAL_REO_FLUSH_CACHE_INFO0_FLUSH_QUEUE_1K_DESC	BIT(15)
 
 struct hal_reo_flush_cache {
 	struct hal_reo_cmd_hdr cmd;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index 48aa48c48606..669096278fdd 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -89,6 +89,9 @@ static int ath12k_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
 	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_ALL)
 		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_FLUSH_ALL);
 
+	if (cmd->flag & HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC)
+		desc->info0 |= cpu_to_le32(HAL_REO_FLUSH_CACHE_INFO0_FLUSH_QUEUE_1K_DESC);
+
 	return le32_get_bits(desc->cmd.info0, HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 }
 
-- 
2.17.1


