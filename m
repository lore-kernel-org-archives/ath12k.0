Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27281C55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=z6n2WJpzpiHjjYezeH7Pn8qce1
	Bhw57VP5vts46huXZQetLJtjCWP51gJ+Io6gZBQTRAmCJfnaQK6oP+0c7dzHt+0SbXi5Zx2kcODRr
	m+fF5W41nYTOUPLPmwP5rNI29aOOnX/vOeWC3kUhkdWYsv6qu+9Z5DpUx2rOgmAJKMxwiFWzO/3UZ
	GPfng/R3qWPImGAXhzzsIUL1UQTz9cCBQ7qX/jmh25cL8V2YrHF16DQt1e4KHmtGel6HUgE8QsqZ/
	g5NN9J5J6uZmbGS3NloTDBLeWOUPCpKDpXAQ7J/i8mKSQLEuWSFeqzI6M0nTBnrUISFlZmVKdh3nd
	d/CNXu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv7-00000005iQn-2wcl;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv5-00000005iP9-0CdF
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:09:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndjl2104722
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YwGMP9ynsxK
	lI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=LoPbtMRWuGcUseC2MWLYnGj6PsT
	OQfvwrns69I12tsNNhlOyrOVjEzF8RyUg+Ftxsg8G1EUY82yEqlhBG7Fw9IgDZdb
	VWnaXVKk/d2l31aAs3cqS/DxcA/83dxOxTNjLYMGUPBrim5XOPe3HvVsI00iLb9n
	PoCHX5pAjeb+HjZMpQYZlEP+DgCKitorFOKwBdEmZvBmUJ7cYJmuUcMUWguwZtUj
	JKAmBKaKkNu1KYQg9DROTCUGMicfsFr+T36KxhJCw2XO6g2HASgj+NAu8+x9jjN7
	15YvrmzercG6mcffV3oefW5NZAgOcw9/14aXuMV8NJoYiQmptR4CXwKU+nQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730vkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:09:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so36519525ad.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018184; x=1786622984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=cn6XhutZoXbEt1D1dB80UkXgiFiH7GeoH6WWh2i5Y9x+GD/ebOqp5bByctVB8xZHzv
         +r9vebWiMYCgTL/fMk+9oF663rwyX3eTM/7SBa+8XjeXXeHNMFinSHKaZ9cH0Rj34eIG
         gD0S2q9imACfgEWIN4nma0mkpZGsigfQidEbtHhaehePkclYCbpSHalhCX/Bq8vSXSPC
         jXqgMHGRECFL0cND49wcfcRP0B8t+Lv8AeBv3cTxyOCjWfByWAhbejguURmyxXUCKbK6
         2xzLq9Z9mQa+WgWW+wJWa9lyHESgi2oR7kp2wCVS7vkkKqZ/IQXGj1xNhN6rOgkyDEVL
         N6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018184; x=1786622984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=iRQArkaMKQ7FL4UfHoQ5aSjsFDgB03HzllCjV6vo+fCaCf21KKZFlLwSG5GcdBmioB
         p0B9iRLcixTCvOWjZF93XlJ5qT2EM89LwLqcAIbzLRy1xDKvhkiZWtCA9EF3YgvbeLzL
         wa4JawSPTTBp44fCd3GA5VQhl/+OqcZZmZ7YY+fG1SBuvlj2AEjv5nOdqLPf5B2atnTW
         x0MYZoshzhx45Dq5vdJFSK8XKHxRH6LjkayC5OSTFmpz/fGKIj86+SDAdpeOcB//+vna
         +dOHB7fufVLUp3vUhTgh80eRT7QkZoIc0o2URtO767MxsxpT8U3TJhKm70YsYWch9JAB
         ZVzg==
X-Gm-Message-State: AOJu0YyAme6e8HKlXkSoiHnM4xYdrRHc6KwRjMn8ib4dLBi8HDcVRdwl
	+o+SlrZc22bghLWgqzL6H5NGjTe0039RVfa/WBfqCaysHfub7SeZ7zjavKHCYirLtp/HPn/RBMl
	atop9LeVotTzMwj1avuzKclBHOZ7aHZApKK1kXgIhpRrfQG/hg/O1IpkgNPqoQL4yn2MLnZFo
X-Gm-Gg: AR+sD12B7XKzjJ75UVEhw+7YLsuRw2K90Xr1rqI/HpPJ02nndMMwAZqwyr1pz4D1ScC
	E1BF1x0gKcVqc6/XC4oM4o35wEI1+Oo9/3dU6bzB3SFcZ/TbmTVYHxLV0wJkEP+x4Q18byR4dC6
	CjWw5UFLnypCR7L6O6/1c376Z7T16fQbcIbW+aZZw3nnMBwCRRV91CImB3dw1KFwfob04IiJnfz
	bQ9i4haTe9UYtbQ0rt16m1h5ch9L5xU+5MWltrQx6nFAGkuR2GLuOxZYTXUSZ50irz1m56F37N3
	MDllp5xzLAzOCMO1TImgErBW0AmLhAv1pYB8p2p4uMgb0JsyZalR1sN9CN0DVxiYK5y+WfNaWrs
	vBc/TOp3KbyPXQXWNCLOu4tqErl2e9xIyt1QPAUyWEcaCYGaYjSm7
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr15063979a91.4.1786018184504;
        Thu, 06 Aug 2026 05:09:44 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr15063903a91.4.1786018184003;
        Thu, 06 Aug 2026 05:09:44 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:09:43 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Thu,  6 Aug 2026 17:39:20 +0530
Message-Id: <20260806120927.3607733-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX6vtwrTlKJQd1
 mzm9xOrft3Guk58K6QTcJ4w3DvqXu4um4Mek0F6u9qg8pvk2kXuLj7gDg4+GWxaBFCuePGkAalk
 YJ8SkneRzD3HucGgFNG9y5PIThzWlIT/L7j8SkxsGkoTlcUvVtoI6itstDRlYBSiBwyc13kfs7H
 NHJEK+i4MJNSL7BqmoAcQVI1ZAFFt5ewEfY3nnv/L5ngqAo/LajteEB+nr1jQpulLFkfQOjHw9D
 Sf14HLh86B/+FGlQzMX2cYIU5zuuSoA1MVJB1WsBUVkhigz2GYwCoMElkzlxeeEVbik3UHbp4VM
 zhokQBY8L0a3KNWWIJNBW27Pd9ws8XE2wuIBwHsRnbEMBpCs/BEuLYAkBlhKPaVmmaGsMY2MinK
 IBpM7KAjtQvHUKqRCqF3nKNIRra+LwNajtfz7WpxmWi1N5eCOWFofJP0kyql9sRkKWRpLdawwkM
 IpfNv6eqz3HxjQoHBGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX5FyXtrQte7P1
 31E1myzUGW2Z8KfyLkJRipXMh9V4J2HCYL3MNdEGPziS66CMEqtrHFkpQ8kWH888i1pWeV96cOy
 T2z/4LO/JgS+HcpmrvXwW3lOn2yjbqA=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a74798e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QbJcohpuGl3nbjs-xDYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2_2G6PB_ResZEoIGKNyM8k2o8G5hiQB6
X-Proofpoint-GUID: 2_2G6PB_ResZEoIGKNyM8k2o8G5hiQB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050955_089508_B117C0E9 
X-CRM114-Status: GOOD (  11.76  )
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

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
each counter, consistent with the existing pattern used elsewhere in
the ath12k codebase.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..632230e77802 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -582,7 +582,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -984,11 +987,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: 691e5e43b2aa
--
2.34.1


