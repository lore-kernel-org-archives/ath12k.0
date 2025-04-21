Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919FAC369D6
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/0lxe84XJznWjf2P/60iOZ5+OXxV9SomLFyZxivZLw=; b=URvJVy5fWEUVp7aeZCgKL1x8Nu
	go1kbErlJ6dGbjaT7qy3P8rWNxkZzxrDxccwz1l8FcU9Z3YOjb6TQTAK8kbP9MvlfNWI+/TP2SIl1
	+UqFBIBvE79qxDJbciFModbzxJqrlBjr96BZ5Qb9FDyYls5OGjdoDNngq8o2B45LJORAJ2PUYs219
	aJM35HsC2xsm/WkZhVH/UUNhiKCmqOHmaTRpcvVI4eFtX38w2fww8eb72sDmIiIfuuKcSzDRAfJZE
	7bsNEEFIUQ2FsIex4N6FMguOH51+YhuAWY73zYUm7uPYh9aKnlXlGRw/3raLr6Dm94JORJfzjm1Cb
	d4Sd+qDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0a-00000003SFC-1MBv;
	Mon, 21 Apr 2025 02:35:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0X-00000003SCr-3U2P
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNj1Gt025310
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F/0lxe84XJz
	nWjf2P/60iOZ5+OXxV9SomLFyZxivZLw=; b=ngWAxCRx7y3Rz8gIt2jo0FSPoY4
	QW2L6CAHnv/+iGl6L8F6ciBDRhoPgDCGcGJcAd6wCdbYnhe6Gj/fu+kYPEpzZhzY
	IpL7tpX8LK6PnK6xAkjC4o5A5NNrotsrKue20aHu87WFYWWZZZ4dqOF612xh3KVr
	6lXMUTn8gExsz3gQ1vEYn4XlXW50L7fPkoGZ6edM5wgNOtiQg7wQ/e0fG6jSjWKk
	gzIrz2mdA9iUUH7kXrDQ4Dpu9+xg8PF6ZfO87iYdAN+K+tXyO9rEtcmiw9XLwwCC
	Iiy9beR7PFUZobGVpK4j0Kr/Z6Hx7TJT14b3jiDPfvL8K6a6lsz2AqGZTHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjaq3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22406ee0243so26922585ad.3
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202937; x=1745807737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/0lxe84XJznWjf2P/60iOZ5+OXxV9SomLFyZxivZLw=;
        b=YHlgoeUHiW+CeU6rAerfQxfJL+vsUwJYWEM0PNIhVd13dCf03Q2b3sL1i8UVZ+Gcz4
         WAGGSkSb3A1PJonGqnyIWPOZcftIGEGelvm8ethmzesXoY/dlP3QA6tvmmFRHz8CYrL1
         RCj4aeMywrAe0sHm9eoVpC12tr/zSBAdzz0AaiBHZhBs6p9r/Gvg/Ccv83u+YMruyraQ
         i2rOvF5TNgaSrP7XBDzgh3T/TE43RBb9doLwzdgkpBNnT2pjkraSjiaGkYHRyVp7Di3W
         jKFBrtQhoDQCXErtHyoZmoyjgSoU4uPfSVCjLHoWHMui+9OeLOzPcLlw0fBjyH8DIomS
         088w==
X-Gm-Message-State: AOJu0YzsmEPZe5CyHp3lbhKraraqzkG+KJ25/scOJyh8HfRF/vJPQud5
	7788nELb4NiBZapfdttqX4WC+DSUUci0fbn/vMFIK1ESWEPx+TYIoOUKU41xQiSrF6knxCFN7iZ
	UPgW6AbXnIkhfjvGiSXQ3YiYUsh6SCRKhVLZ3FQQPronsIvRM34aBP7edF1TFWpZyku9BTWU=
X-Gm-Gg: ASbGnct2vBItSLaozd4+Bm00dgt/EZvn9i/EHlvMxsbEeprVSLtHX3jDgB0Rdy9y2qv
	nwjf4TRwhByzftEyTGUfgYgQz5kuDUliQspxoxHvYPHQGEa34HWByrvgjmYha1jaytZDyMdGHYD
	9mw0oTg5uhIcXUklN6k1fs1ZZrfFPAPInHQRtqq7c/KmbAOvl/nijrU5z9LtJEI+zHK9xIly+S1
	Kmvwo8WGF/MmWCdKK4yp+cnc9zDZGMGHUYGJP/GvyFsVIYomdtUq4Kqus0e7AYu/rsZE6V0WRPC
	d1z4UfPekT27NJQ+iHEE+SyrDxASo6RpZ+koBShlR4vHVsJ2XK/HxYWQSnylOQPFMmGo9SVlH5M
	oVDUJXEAGyhY=
X-Received: by 2002:a17:903:98c:b0:224:1780:c1ec with SMTP id d9443c01a7336-22c5360dc12mr180997555ad.35.1745202936761;
        Sun, 20 Apr 2025 19:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq65mC6OoIEizuH+antbg5u43zDy2K9uh6Jfs02F6+tCcXiuhMp7miRMqAwHqfSQiJRlO/Vw==
X-Received: by 2002:a17:903:98c:b0:224:1780:c1ec with SMTP id d9443c01a7336-22c5360dc12mr180997315ad.35.1745202936404;
        Sun, 20 Apr 2025 19:35:36 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:36 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 11/13] wifi: ath12k: init monitor parameters for WCN7850
Date: Mon, 21 Apr 2025 10:34:42 +0800
Message-Id: <20250421023444.1778-12-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LvpATOIIgG7xzfW0blo69yzH49SVV4Li
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=6805aefd cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=qa2sE8eil9VosqwbHagA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: LvpATOIIgG7xzfW0blo69yzH49SVV4Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=971 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193541_872653_19EA52A0 
X-CRM114-Status: GOOD (  13.33  )
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

Some monitor parameters are only initialized for QCN9274, but WCN7850
also needs them, so initialize them for WCN7850 as well.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index b3f638af1717..828ed55f83f5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -4606,17 +4606,15 @@ int ath12k_dp_rx_pdev_mon_attach(struct ath12k *ar)
 		return ret;
 	}
 
-	/* if rxdma1_enable is false, no need to setup
-	 * rxdma_mon_desc_ring.
-	 */
+	pmon->mon_last_linkdesc_paddr = 0;
+	pmon->mon_last_buf_cookie = DP_RX_DESC_COOKIE_MAX + 1;
+	spin_lock_init(&pmon->mon_lock);
+
 	if (!ar->ab->hw_params->rxdma1_enable)
 		return 0;
 
-	pmon->mon_last_linkdesc_paddr = 0;
-	pmon->mon_last_buf_cookie = DP_RX_DESC_COOKIE_MAX + 1;
 	INIT_LIST_HEAD(&pmon->dp_rx_mon_mpdu_list);
 	pmon->mon_mpdu = NULL;
-	spin_lock_init(&pmon->mon_lock);
 
 	return 0;
 }
-- 
2.34.1


