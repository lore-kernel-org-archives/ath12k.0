Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E85C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2IWrOLH4aN8Oxkjh0KWkGV2f35IvOI6Q7o/t78u0Kc=; b=2hVrsHj2wqGVfiDjBqQHmo6HCz
	kbXK4CxD4CUlNpnQyGrzcOPbpgTwLDc/u3zpL6Q2cBysJyGUB1kBqf37Rs4sz+bznAD3Qw5QNOgYL
	HWP9cYfEK1YnVDdguGU2yv6dFWsiedsWUczda9Avc3+jmimyqpYrZ/bWbg2nYG+KFR8gyXqYwYA5k
	dFgw1E7ztnDWv5ZoD2sFrY0D0OBPudXEIAW9V7Ji5na6148g5+H/Cq9niDH5iu1/Z92jxSajSVJMg
	W9knjJUE+33PRfQca9LIdTz1Jiy2pBoi5DOBmCRs+AwNtQEpyjfLyg+dwRh04e9nS8/TxMYGnNhMx
	37wOXVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdi-0000000ArZC-2vxz;
	Thu, 20 Aug 2026 05:48:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdg-0000000ArXh-2xVp
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7iel1439049
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R2IWrOLH4aN
	8Oxkjh0KWkGV2f35IvOI6Q7o/t78u0Kc=; b=amfDJkUP/DJB+sFOXsgX/EK/L5J
	MtjbYmWCtFI35pnq2yzCS3Blk1Nwg+tDrdiGwX3Lcv6ymFtRAVFXFPPO2RUp6OnC
	DI5E3hpX97NjMK/p8tFNuI7dbyxGfrL1WTtrGmZcpsBcpYdgMP0SztZLrevdUEDu
	NPJdG+yaF/vl8Oppd+qknw1HNjrL2cJBLQHSKbLCPt8WSoNZY59hcxpIeioT5OBq
	ZUDAeCWxLL5jrCSUlD+oZoR0+fJ77HegVRTRPruQ+hzLGoaNaTzLdl2FIFlDCEX/
	7OCJrnD4+csIdF0ZjX6THLqJo+r4a8D4tatjRsu7ia2CMNEtu4b2vGr+Btw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa3trw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3607757a91.1
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204912; x=1787809712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2IWrOLH4aN8Oxkjh0KWkGV2f35IvOI6Q7o/t78u0Kc=;
        b=AMW599+X/4aV/e2qlrsGLeUxvzZa8J7ndCrtNmxsdaY/ENTUrx3PCqHf8AgejvhqOH
         z32bu7vZ/BfVG7+ZsC+jSSmXUo7Y5hT+EwApXHLRZSrf/XxMKh9LR+21yZLnzANcF+hU
         bYKc/4NkGZZAPANEArYlNGFf9PQAbnVlFP3PqfKHFEQ1rDs9+lx8CedVj8qaT+0QjeN6
         5XDeL/RHOD3xH40E1XD2PZsPG1f8+J07v13x+4Dt7fMXX2dkEf1o3LPwk36jm8czbejn
         cOJ8+akapPRHPotahMEl6vvD7PcVYGHY6kXV8cxjBqPgQFJJ+og7MrIUl4aK0c2VxRq3
         10ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204912; x=1787809712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2IWrOLH4aN8Oxkjh0KWkGV2f35IvOI6Q7o/t78u0Kc=;
        b=cNE2j7scVBKMn4CfBMr5OIQT8BKQsX4bVG5R2382lcTB2hU82LmZysjVV1dCuUXdKc
         JzNCukHghE+smPJaR0s5wy4uOhL963iblKd1hg8x+aHG+FogxH4/vAmvo5f+1R3ROYws
         nexA+G9K6DYhf/GcwftSvDWU82QHmetVtlJk7brsMWDNO/n9eStfPF7zpRt1M86IJJnP
         es/hEhZff7wE6BAYnqUa/m24EivFystuINGFjsubGAWtTsW4WAmBktsP3um+ud955qWS
         oSXqsBgtrK42kcik08OZTtFMqPcJxTiMTC9+G8IIO/a3yB9oXmzqeHJh7QDqhVwIZwfM
         OLdw==
X-Gm-Message-State: AFuF++l9TCTv8XKdcHgYKUXQRp3kaBC6/q0enUBCLi4e25jjMJdkJpnZ
	Bp+hcCcLYS0O4jUG8kWSMCsGUBl/T8L2cGh9Do8JrYBQ6RYbcPB5m+js+UG+OaHzJNATRZfLLee
	yYME2Zv1wxEPWiknbuOd6Nc7RxoBsmZ/va3gzlahom5D1DnUklqniU1ymt/iQ7foBCAGM7m1S
X-Gm-Gg: AR+sD11Mz29UJM/mHUz66t9B7gAcHQRaybG6XvfcoWNC0sedbitWxXXy0YpVHCQ2vE6
	gyiP+lJVQ4kdkKTpFDwuehrK9DGnRzN9pcE0MZqpWJv8dS9reJn0bnpVZbkmEM4vW0WjyfZsWJG
	6Mljx7Rx0MWgUccBlxYKqnSpd+1pGX1enob8G6qEc6s5ADGjDcUTZ9dK81matQ0H10xj7XtTMRh
	azWO37OHQUpvwYvPfHeYipyy4RmpjhyAGIuA1Kf68TePx3muTdKU/aTvKys8VXUP6I+3GH7fGSR
	AWc9qYebgr16mT4GWfjr1D4MqB4preyTIrN9v3sOA7EZfscFQV8zvLYxfTAb8h0HCcyQGtV2zLI
	U1lTtJRte6/69ryBnp69ay3f0lQFo2SD8SftGkQEsFFTLdgI3jY0zT7OLmuQhek2w9m2NKxiSuf
	RR8HuUZh8DKfxKmWE4j30OWEs=
X-Received: by 2002:a17:90b:3c06:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-39580edaf9fmr20466013a91.8.1787204911504;
        Wed, 19 Aug 2026 22:48:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-39580edaf9fmr20465923a91.8.1787204910982;
        Wed, 19 Aug 2026 22:48:30 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:30 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 6/7] wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
Date: Thu, 20 Aug 2026 11:18:03 +0530
Message-Id: <20260820054804.3222296-7-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a869530 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=J7uF1pG4YNW_MTHx-GEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 9Heq8AV2RByfXQeXnvqK4u7uh4G2zFUa
X-Proofpoint-ORIG-GUID: 9Heq8AV2RByfXQeXnvqK4u7uh4G2zFUa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX7Refgq0CWvI2
 IKujWqZ6uDAh+giBS6277MaPDuVG5nWGy5+Es+bSRXfWKWdQP6GDWh7FaWb0x6/hgbvAK+49+H/
 qHOFT7by8eet98qfdSGwHs6LOzBGCy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXz4Q6fCxlCutP
 gH3okDg7KxEvJFPXcWW2TrzeVuJhMyGxwUGVnziUGugGzsrXWARj+zP0GzbD8meD91kZN0GUTat
 GqRwscll5xUP2Bw00Wx5l2s10mfna2I46O8tYUpjiau4vF9XVOMyLq57MdBD3LaGCPFo6NB+C0B
 mnGDjGIUxYKtDzieb+VMcgmhpSG0GqrSHHUmyBXuurWamC2cS9Ae5wS2HEXs1+Es3GlQ2DbcOmA
 o1L/SLM3+0QkenK3RlLj8ZPPnqzYc2OE/ybhaudNEnKvjGZYXa9bB+xYHB1mFfH8fXsnhxeWWmg
 WxG4WQD3PadZ9yZ2iYvxQouwFPb6STVED4FyAWZhjiHu4h+mKKoxkdZm66GP78YhKjcLdK7a3XP
 URr7ohfFtN3oLLxBQz94eQk6/+jYdIns6HKyx6xhu/Vk0GeFL/1QWzVFa75yP1/6TW2WzWv8Y14
 fGYOEo3O/6usB7ycHig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224832_750721_9FC522A7 
X-CRM114-Status: GOOD (  18.53  )
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

Replace ATH12K_RX_DESC_COUNT with ath12k_dp_rx_desc_count() static inline
helper, also replace ATH12K_NUM_RX_SPT_PAGES which is calculated from
ATH12K_RX_DESC_COUNT into static inline helper functions and pass the DP
profile parameters explicitly to improve type safety and make the interface
explicit.

Also remove the unused ATH12K_NUM_TX_SPT_PAGE_START macro.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 18 +++++++++++-------
 drivers/net/wireless/ath/ath12k/dp.h | 24 ++++++++++++------------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 93a41b2440da..417d960bbd07 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -968,7 +968,7 @@ void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif)
 static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 pool_id, tx_spt_page, tx_spt_pages_per_pool;
+	u32 pool_id, tx_spt_page, tx_spt_pages_per_pool, num_rx_spt_pages;
 	struct ath12k_tx_desc_info *tx_desc_info, *tmp1;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_rx_desc_info *desc_info;
@@ -983,8 +983,10 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	/* RX Descriptor cleanup */
 	spin_lock_bh(&dp->rx_desc_lock);
 
+	num_rx_spt_pages = ath12k_dp_num_rx_spt_pages(dp_params);
+
 	if (dp->rxbaddr) {
-		for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES(ab); i++) {
+		for (i = 0; i < num_rx_spt_pages; i++) {
 			if (!dp->rxbaddr[i])
 				continue;
 
@@ -1166,7 +1168,7 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_dp *dp,
 	dp_params = &dp->ab->profile_param->dp_params;
 
 	start_ppt_idx = dp->rx_ppt_base + ath12k_dp_rx_spt_page_offset(dp_params);
-	end_ppt_idx = start_ppt_idx + ATH12K_NUM_RX_SPT_PAGES(dp->ab);
+	end_ppt_idx = start_ppt_idx + ath12k_dp_num_rx_spt_pages(dp_params);
 
 	if (ppt_idx < start_ppt_idx ||
 	    ppt_idx >= end_ppt_idx ||
@@ -1208,10 +1210,10 @@ EXPORT_SYMBOL(ath12k_dp_get_tx_desc);
 static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
+	u32 num_rx_spt_pages = ath12k_dp_num_rx_spt_pages(dp_params);
 	struct ath12k_rx_desc_info *rx_descs, **rx_desc_addr;
 	struct ath12k_tx_desc_info *tx_descs, **tx_desc_addr;
 	u32 i, j, pool_id, tx_spt_page, tx_spt_pages_per_pool;
-	u32 num_rx_spt_pages = ATH12K_NUM_RX_SPT_PAGES(ab);
 	u32 ppt_idx, cookie_ppt_idx, rx_spt_page_offset;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 
@@ -1317,7 +1319,7 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	case ATH12K_DP_RX_DESC:
 		cmem_base += ATH12K_PPT_ADDR_OFFSET(dp->rx_ppt_base);
 		start = ath12k_dp_rx_spt_page_offset(dp_params);
-		end = start + ATH12K_NUM_RX_SPT_PAGES(ab);
+		end = start + ath12k_dp_num_rx_spt_pages(dp_params);
 		break;
 	default:
 		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
@@ -1349,7 +1351,8 @@ static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
 
-	return ATH12K_NUM_RX_SPT_PAGES(ab) + ath12k_dp_num_tx_spt_pages(dp_params);
+	return ath12k_dp_num_rx_spt_pages(dp_params) +
+	       ath12k_dp_num_tx_spt_pages(dp_params);
 }
 
 static int ath12k_dp_cc_init(struct ath12k_base *ab)
@@ -1377,7 +1380,8 @@ static int ath12k_dp_cc_init(struct ath12k_base *ab)
 		return -ENOMEM;
 	}
 
-	dp->rx_ppt_base = ab->device_id * ATH12K_NUM_RX_SPT_PAGES(ab);
+	dp->rx_ppt_base = ab->device_id *
+			  ath12k_dp_num_rx_spt_pages(&ab->profile_param->dp_params);
 
 	for (i = 0; i < dp->num_spt_pages; i++) {
 		dp->spt_info[i].vaddr = dma_alloc_coherent(ab->dev,
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7e48379d18a0..c8ca3ab4d5e1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -249,10 +249,6 @@ struct ath12k_pdev_dp {
 #define ATH12K_SHADOW_DP_TIMER_INTERVAL 20
 #define ATH12K_SHADOW_CTRL_TIMER_INTERVAL 10
 
-/* TODO: revisit this count during testing */
-#define ATH12K_RX_DESC_COUNT(ab) \
-	((ab)->profile_param->dp_params.rx_desc_count)
-
 #define ATH12K_PAGE_SIZE	PAGE_SIZE
 
 /* Total 1024 entries in PPT, i.e 4K/4 considering 4K aligned
@@ -263,16 +259,8 @@ struct ath12k_pdev_dp {
 /* Total 512 entries in a SPT, i.e 4K Page/8 */
 #define ATH12K_MAX_SPT_ENTRIES	512
 
-#define ATH12K_NUM_RX_SPT_PAGES(ab)	((ATH12K_RX_DESC_COUNT(ab)) / \
-					  ATH12K_MAX_SPT_ENTRIES)
-
 #define ATH12K_TX_SPT_PAGE_OFFSET 0
 
-/* The SPT pages are divided for RX and TX, first block for RX
- * and remaining for TX
- */
-#define ATH12K_NUM_TX_SPT_PAGE_START(ab) ATH12K_NUM_RX_SPT_PAGES(ab)
-
 #define ATH12K_DP_RX_DESC_MAGIC	0xBABABABA
 
 /* 4K aligned address have last 12 bits set to 0, this check is done
@@ -716,6 +704,18 @@ ath12k_dp_rx_spt_page_offset(const struct ath12k_dp_profile_params *p)
 	return ath12k_dp_num_tx_spt_pages(p);
 }
 
+static inline u32
+ath12k_dp_rx_desc_count(const struct ath12k_dp_profile_params *p)
+{
+	return p->rx_desc_count;
+}
+
+static inline u32
+ath12k_dp_num_rx_spt_pages(const struct ath12k_dp_profile_params *p)
+{
+	return ath12k_dp_rx_desc_count(p) / ATH12K_MAX_SPT_ENTRIES;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
-- 
2.34.1


