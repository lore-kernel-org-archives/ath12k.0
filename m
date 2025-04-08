Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF3AC369A5
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf4X7nmgLLtsPPYdxMAbBPiLSQqDc/fGOuZSKINRik0=; b=dfIkxg8859ofccgNYqucbeS3t8
	/Vi0M4+K3e1rn5XO+eYnWv5anzQKppcA+vPOzQXL7sKdAEMO8J++XAHEiSB0Muek4v6uN+HFJTE9N
	ZCSE38VAPWz+6aRjW8FNAIYaVWLZ0635YAUeMFllHeWo4lJMkwPBZdLLHEB9D2fB00uYYP3NqC5eM
	CD8XWFy9hudDBntoEO6w2xgN0Yh0BYJ+pjCSOUBQajKFmjed4kVRqheX3XD7L99dc6WhLAWVr57SS
	X7q5GQpWufzs3ajo3Ov2LR56Hv8EvmoLUCa9NWNwyGLrCcFfbIHbMWG9pLTKtlTxXem6mnA342HGA
	O2dhG/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Di-00000002sdr-3Zt3
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:14:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Df-00000002sbp-2b78
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:14:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GObA027695
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jf4X7nmgLLt
	sPPYdxMAbBPiLSQqDc/fGOuZSKINRik0=; b=fAVbN+bky0rov6hMrPPFx6voZOc
	S2vb9bl+LZg4A6qb/4TZ1gUk42BaODUCS0sgkkKU0Mks4zEDluJs36bal42FFIdf
	duTHZXyeF13zmlCE8Sgm1xnFcassjYRWy06XfWO9WggFYpKz0KzE1dw4/JOEC7pn
	v2qheem4BKJu4YyQE/nl6n1Pv+4Zr/QVgoEon6Xmt5SvDrj9TnU4FUPmHaISIcXy
	+UNST43YkjrZEKAaBfrza2YXjgy8OOVLRPjb17etckQpBMUTJE9beUU/A16Be05P
	SuvOZMISdVn52lhAJjB+a7CAW3q1ToV3LWjDxCPutw5GRu2dshr3knpqQjQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyxps2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:13:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso4779864a91.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092837; x=1744697637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jf4X7nmgLLtsPPYdxMAbBPiLSQqDc/fGOuZSKINRik0=;
        b=rL4VM0FofAS95lT9JSRjYKtEooRk9GjcwRYYEb8g5WPqnK49iFD0/9LRZEvZVDQZSU
         RcvOQIzpT0C/mP1hNBlcSDlK3Txp4EXTk0aIh6rx/ytDo8OeYPpPbzZ/DqUS8YJp2JaS
         C0B8BUnSp4j1KPLPrkUqfBmlN9BveNRd1t5kKZhlDZxQa4sZOH5DEHu9tlJ6gdDZnmJV
         kCNp8vKAKVXw40rX6fwQAe/aPq2rih4ocr80ySRHGRPyZbho8VbL8b9F0lGiA5JnrMgV
         kT8ljhhYIGEfOGAj6Yc0YVdCZcDFh+Iqnx5mq9RMA+4On5hLlHdFucAvWDES7OJChO6S
         kbuQ==
X-Gm-Message-State: AOJu0Yz4byRb5LJfb7Q++3RMa3nErsqmJyffMMznbN40zZLLV/bUoyin
	StLLauraWSdda3FLgnzLOrBBgyg4b0lzmkQQ+6tuyEXxwF7NpchxZCxrvl1cVltzgVfny9CNTna
	Gdb7LW6guJQxJYdkw3XLeCEayKkqPE5czRw+1Tr+fPdWpNOW8pslFauSd8PmSvUpvmWRR
X-Gm-Gg: ASbGncuZsAfuzsmp0V7UZsNt8gUQzeDa6X/DftQtSBYtdkZD6C4y/SFRp/4ikHf7CpF
	pTCWvEwvUt9yKmUknacKsktgTym0UnuNDzFWx/+lsTDtjeTbjl3V51M6XDacJipEaYukfm98yjX
	/ovt2kiwrRibpZHliawzCvbqT59H8dDJjtuqPC0vZWZJ8K2OulNN+SreKLdIkMe0EZq1opDAxZh
	ebLKRfdparR3kbMKDX3wyPcuVmSoLY+pKlVe7QsFIs1vvoD58UdXjj9g9B4Mn8tctut1aRWoKnZ
	JEjP0V9Ye9aP71w3s7FebOdIsYVTqAhOyQw7+WA+1+1G9QB9ZV/0zdzzmqUezqwN14He4eWfGko
	YwUe9uvhaP2sICMK9osjObXlZRu4bsNIIhg==
X-Received: by 2002:a17:90a:d60c:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-306a62137c1mr14778030a91.22.1744092836906;
        Mon, 07 Apr 2025 23:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4zeDZwRMBgzLBqfd01jymT1YpR7b25k588jo1J2XTWsT6kjoa3QT980ig55+H9URMzQROHQ==
X-Received: by 2002:a17:90a:d60c:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-306a62137c1mr14778011a91.22.1744092836327;
        Mon, 07 Apr 2025 23:13:56 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb94f4esm10258444a91.46.2025.04.07.23.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:13:55 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2 1/4] wifi: ath12k: Handle error cases during extended skb allocation
Date: Tue,  8 Apr 2025 11:43:40 +0530
Message-Id: <20250408061343.2774345-2-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
References: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5pnZEn_RnTBAU1OK-U49mboyYAG9DWuF
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f4bea6 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Qd23BeFobrpH1aaNZ9kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5pnZEn_RnTBAU1OK-U49mboyYAG9DWuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_231359_774696_7CD6E750 
X-CRM114-Status: GOOD (  17.63  )
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

Currently, in the case of extended skb allocation, the buffer is freed
before the DMA unmap operation. This premature deletion can result in
skb->data corruption, as the memory region could be re-allocated for other
purposes. Fix this issue by reordering the failure cases by calling
dma_unmap_single() first, then followed by the corresponding kfree_skb().
This helps avoid data corruption in case of failures in dp_tx().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index b93669348f35..6b394534e3a2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -230,7 +230,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
 	struct hal_tcl_data_cmd *hal_tcl_desc;
 	struct hal_tx_msdu_ext_desc *msg;
-	struct sk_buff *skb_ext_desc;
+	struct sk_buff *skb_ext_desc = NULL;
 	struct hal_srng *tcl_ring;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	struct ath12k_vif *ahvif = arvif->ahvif;
@@ -416,18 +416,15 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			if (ret < 0) {
 				ath12k_dbg(ab, ATH12K_DBG_DP_TX,
 					   "Failed to add HTT meta data, dropping packet\n");
-				kfree_skb(skb_ext_desc);
-				goto fail_unmap_dma;
+				goto fail_free_ext_skb;
 			}
 		}
 
 		ti.paddr = dma_map_single(ab->dev, skb_ext_desc->data,
 					  skb_ext_desc->len, DMA_TO_DEVICE);
 		ret = dma_mapping_error(ab->dev, ti.paddr);
-		if (ret) {
-			kfree_skb(skb_ext_desc);
-			goto fail_unmap_dma;
-		}
+		if (ret)
+			goto fail_free_ext_skb;
 
 		ti.data_len = skb_ext_desc->len;
 		ti.type = HAL_TCL_DESC_TYPE_EXT_DESC;
@@ -463,7 +460,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			ring_selector++;
 		}
 
-		goto fail_unmap_dma;
+		goto fail_unmap_dma_ext;
 	}
 
 	ath12k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc, &ti);
@@ -479,13 +476,16 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 	return 0;
 
-fail_unmap_dma:
-	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
-
+fail_unmap_dma_ext:
 	if (skb_cb->paddr_ext_desc)
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc),
 				 DMA_TO_DEVICE);
+fail_free_ext_skb:
+	kfree_skb(skb_ext_desc);
+
+fail_unmap_dma:
+	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
 
 fail_remove_tx_buf:
 	ath12k_dp_tx_release_txbuf(dp, tx_desc, pool_id);
-- 
2.34.1


