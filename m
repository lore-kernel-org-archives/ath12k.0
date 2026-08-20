Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1E1C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxN8Vq8Yyh7fQ2xvAc0ZugpfsxO62FJwARFvw1IdocM=; b=ssgWcfOZajZGCnAU54rQNxhwBn
	kGVO0s4QphKh0ub6KHxgH7Nq1OTTx0mwOpFUBCRRoLt4p7Xks5UYZEC8Vhu2dMAoR3nTaa5NGbzwL
	BYFrXOJoQRLQuefMw3Ih/KoCv4j7ylXphvyrbUNhAAmOTkMMSYr9VaCpvAe9uj78TgayDD1lq7O15
	rbo+PAQzdcyCjflOyrNyATyI3RbyDGUv1LEvEtQ9eR7VXe/7VhNI1635BFbbBKGqGRkQ6m/oSFn5B
	HqVus0Rr0lOSg5mBRdWTa753xy8eINiA/uDiX3IX+6+NJoLmJSLpP6hqysEiHShqub2knSfp82lJ9
	oC8XdGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdT-0000000ArSC-1S4y;
	Thu, 20 Aug 2026 05:48:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdR-0000000ArRb-0qis
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7vgm1457559
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KxN8Vq8Yyh7
	fQ2xvAc0ZugpfsxO62FJwARFvw1IdocM=; b=ZeSMni+3wS/TqPWkQab1PXh1hNj
	YNljjzO6r7sVVkPPQE5NDQkoW8HJbrqaMX4CLR60vDUtQSEeBTxGYkoLw+hqAN0J
	qGgGCPECP7Mm1zQpJKBpyjhuKuz9R+i1U11vP8Cp2RHLG+Iknf1Bm7py41Monmac
	7XOBncfZSw9L4zGj28UNUxfU0cnW8IJ6C39TrzSw8c9g8G1C8iDBtBwHon50xDx/
	2btaV0B2ZJUdfcGUTPQuMDEB9mDkxLmuZABhgMzVFuvrqUnHTSEG826z8IVzRfoN
	FSzEpmK0iak9yuThh0d/AsmxOWKtuLo/OtPRvKK4nEqpbj0WtC82btwRcZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4b9fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2699288a91.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204895; x=1787809695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxN8Vq8Yyh7fQ2xvAc0ZugpfsxO62FJwARFvw1IdocM=;
        b=WGHdYZ3td/XmD0pMnJeHHtN7HNZXRq+OmLzFmrqE0cjPVlF7pVMxiyeHr3qApDuLNj
         ORCsY5Mz2QPcAT2ZZuofUB5i/HLAuu41L4rdiDs/pcKSkV2Rxrd3o0YuGtQKgD3eIC7h
         0RXidYg444cRnKZm2fjRmtuMaNJtj6jUdkYYu4gdyVZkyxko7ocUFvoQ3Gfqtrg0nGHs
         OzLyr1vjez/E/csXbq6AovTrq65KuSeBRHtMgaS7hExcHR0guFie05q8oSzl9lQfC4SJ
         NYLYCB8mSvlk8H1Ags7dgJU3pgC/x92+NnPdp5SAl4kjmyIIjLMHByU4DGM46iNFmHmx
         xAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204895; x=1787809695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxN8Vq8Yyh7fQ2xvAc0ZugpfsxO62FJwARFvw1IdocM=;
        b=JX5/GCFI93uJX6eVsD9G1xGSxCIhX6O5eqvlcNJyDSGYXUqmLB/m6FgtssxA+OXi4T
         ucGUod9r0tMpGE2eXiis+LIiw2pEMFrLoYXFIXhsN9TDS9OUVwmgxeqLYtm6Qd/2vBt+
         0nr/2KZtETBLx3nQwH5YfL9+SPaLpUNSDRaCJ2pl0O8kLeizQqmH3Xhr4/GiyWTLA3qk
         Zep4Q4OcASTTDEZsZneSTwe2KqJxKpDX+9Ky6dP4GNnJug1kKgSYn6ZOVo3OKjfKG1rK
         F5ru+A0/VgyOcFWVK81acR30+mIhU0WWu2viifHmIAU83zSFRohpLS9jbcKtr/jO+n7q
         Rbgg==
X-Gm-Message-State: AFuF++mYMuclrhvEwShQ4KA+AppX+ONHE9PBYvQWjtDbg341Vf/pG2EW
	56l+ulr80snLd6IrfJOEoEL7wJzUuUcUxt0lAWqZ8ScWWlp6iKxpwcbu7R+OUi+kPQqEyjQtUHr
	QMpuywCvNyaKTG1c6xwZ/yV+IaTyspD2J2oCp36vDHyGefiCKf5XwtYD6GMeuVnl0cXNTDvHI
X-Gm-Gg: AR+sD11lF+gImaB6U9gFDPcOFQkabOJhoOFADlMc15C6XLBbZQ1SblnN+CbGW72/qIi
	j/EoXSTDmrkzgyp+Y5SiX0UM6ljmOwsROF+dxX8B5S9e0hghiTQZmlS8kVJoqjyfbJwJQjssI/L
	SrSfBWUwB2TxTB4lzTVyWO7AIaBsHi8pFvUgL2yT3xe0j0t0B95zcgA0oOC6j8X3Xltzi/vF3lx
	SZF9hXYhJvdQShnex6WbOHAcNOqWSHanRZ3yuo2MEpm6Q6tDAbM8IN2omwDbk8apZv2RK3KiTkb
	/7top9pyKNySPFK/RCZ4VNGkT1fVCjMEVwTYRzw2TjOea3q+gOIA+E/I1Ge/ak208B+KIUrnC+B
	ECoASAU04x5sl2hCT/090wnNsB/J1uxqJq9v5Yqx1eRUBJL3MjivgqJ2nnGmgDVj59PHAFCxsKy
	vDTRsG7rew79LvN3i0BM2DklA=
X-Received: by 2002:a17:90b:53c7:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3958108453emr19900064a91.12.1787204894958;
        Wed, 19 Aug 2026 22:48:14 -0700 (PDT)
X-Received: by 2002:a17:90b:53c7:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3958108453emr19899953a91.12.1787204894415;
        Wed, 19 Aug 2026 22:48:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:14 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/7] wifi: ath12k: move dp_profile_params to dp.h
Date: Thu, 20 Aug 2026 11:17:58 +0530
Message-Id: <20260820054804.3222296-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v51Z0eku-Qq1rkM0uIBAHT5gjOIkyzKJ
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a869520 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=B-dlgS1riLFybKXUj3sA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXzBkzLMV54eQl
 cen8lAdSXOr1C8lwx0tS2P3tNIwJG9zVj89DudNckVJH94PNjqrQJ15AdpzznPcGIunO2VveRt8
 ogCdonZwKVF+dIIovHacQReuNkQjLsg=
X-Proofpoint-GUID: v51Z0eku-Qq1rkM0uIBAHT5gjOIkyzKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXzmOCM2HaYscx
 LLdRH+CvhofSdM6GXOWo4Okl4LJUDj+Edcww1caz3FAYYYrshUVymGt9k+OacHBsBmc5O/K0Pbi
 XIlBT8nQHUjNaWvWj3uidtPKKqy3Pgx1F/r5WOHLGhTh/I0oMmTArtQcnA5fnlknewhHO9jF0E8
 /LXRYK9nnyO7CAD4ocEmdD48Vf+MGrNSwS66TGN91EPYhTRwDrxe+avkGOjK/rbuTcfH0aHYN2v
 XACQQHXSs9QUYKj5Gyw+kd1R3CDZIxG+Fr49ht6ptkkTBk1lKCT8HZvYoxzMzmx+aYug3XBS1EW
 eYtZtWzp9eGj+YhQLGgnVkmWogVFPElCnntOa+osWzr1uQoQTRz+QrOecGwtTLFt3skFOKV4IMw
 4xj/lec4E4eXMdHZCMlEvuroEBsDhGTlOK6RfKi38zHEHPuvHkqfx0m3Uo3ij3ttS0nmv1eslD9
 7eUTyu84VWVdvoh6W9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224817_356781_14FCC9FA 
X-CRM114-Status: GOOD (  11.05  )
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

Move struct ath12k_dp_profile_params from core.h to dp.h as it is
specifically used for Data Path operations. This improves code
organization by keeping DP-related structures in the DP header.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 9 ---------
 drivers/net/wireless/ath/ath12k/dp.h   | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a98fc6e0699d..4718da494aab 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -928,15 +928,6 @@ struct ath12k_wsi_info {
 	u32 hw_link_id_base;
 };
 
-struct ath12k_dp_profile_params {
-	u32 tx_comp_ring_size;
-	u32 rxdma_monitor_buf_ring_size;
-	u32 rxdma_monitor_dst_ring_size;
-	u32 num_pool_tx_desc;
-	u32 rx_desc_count;
-	u32 rx_release_ring_size;
-};
-
 struct ath12k_mem_profile_based_param {
 	u32 num_vdevs;
 	u32 max_client_single;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..72d3de2db5d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -23,6 +23,15 @@ struct ath12k_ext_irq_grp;
 struct ath12k_dp_rx_tid;
 struct ath12k_dp_rx_tid_rxq;
 
+struct ath12k_dp_profile_params {
+	u32 tx_comp_ring_size;
+	u32 rxdma_monitor_buf_ring_size;
+	u32 rxdma_monitor_dst_ring_size;
+	u32 num_pool_tx_desc;
+	u32 rx_desc_count;
+	u32 rx_release_ring_size;
+};
+
 #define DP_MON_PURGE_TIMEOUT_MS     100
 #define DP_MON_SERVICE_BUDGET       128
 
-- 
2.34.1


