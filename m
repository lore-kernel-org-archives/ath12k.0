Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E262CCF9E9
	for <ath12k@archiver.kernel.org>; Sun, 26 Oct 2025 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqsEVxFe/QEM6tmcBDnoo6nTSqcqq3a1xNgox04mkJ0=; b=YIrdpQgf4CiFG3DXVPCIv8lmu0
	FJ/EcLLabyxnvm9ya66ZfdTXxjf7x2YrgCu/bT7xFwk/akUTVwIxzFEiMFtSL58OHTv4LdwhRvRHH
	mArdWKu6R41qK7dFMZiL2udmv8F18dp0p50Q2KVW2hquecwTPfvDUmRbxLAmCvfoJUhxPViNPaESC
	J+DArfqO6jrVESzO/pAhgIWPRBj2TVw30+IJW1ZY8HFlPUzbl6FOkq/lGCtxLmq3bZk+LpsaikcDa
	UAU5uA0SXBq3aa9ibTmQagPVTeM/teyXhyjsMdkqLvT5bIhmbVz8Pr8+PMY+VadFefDixyA9HyGwV
	z23ANiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5P5-0000000Ccn0-1Op0;
	Sun, 26 Oct 2025 18:23:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5P2-0000000Cclq-0y1Z
	for ath12k@lists.infradead.org;
	Sun, 26 Oct 2025 18:23:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QI0AOQ429699
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZqsEVxFe/QE
	M6tmcBDnoo6nTSqcqq3a1xNgox04mkJ0=; b=BWz/PRQn6XWu65/hjesMOQ7d+UH
	PZYIhAMs5x5Kgxzh3XQaaTDTJqVsjo5EKUPaQKpw6EAJ27QJA/fAnhQBkwpg+ldt
	jr+o97eyiYB5HQdoJbeTnJd9eZv9GfPuhEgDrjgkC4Z5bMJsswnZTckemBVenPZ8
	8fGach8SVXcmDjhyYPe103kO8OzLNcMMHBgGvJM8EmT4zlWUjBUoQjx1iqQpW/fn
	LZKptHvb4oGAmFbbRWviFdAa1caNLj+Hh6WOvIziRSkVkzXZzPk1b2bHBLISboG2
	u8WQ16tuUO50bxjIvbjW8Fn3r/xsQtCzfqL4V8zLXVG9W4h1ER05nXJdThQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0qu829f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29085106b99so37344625ad.1
        for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 11:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761503019; x=1762107819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqsEVxFe/QEM6tmcBDnoo6nTSqcqq3a1xNgox04mkJ0=;
        b=KsCo+Wducm9G+X7SePWggLFkNIsi3X8bGPlwjBneS1RG8EGcSgtNT+pKz1hx7szuqz
         A9ECfjqX5WCFMeiOm0GMypVKudp6smbMehZKG3+U0ETPhLNB/w7su/NqrkdZuSyZxcZS
         I1agcgNeVgym0z5pSBwqaCVadjKH7r+PQnTfDxyR3zQX67XGPRdaTxGrRZvD4Abx2e8G
         mH4qSSAoJ0u8CrYGu10GjkaJKapM2QK1KrPnrzEPsklLIkO968HsVQ53Mf1rN14vRVA8
         ohqaQ54CtxPLdyDNJZKryvs6ayLpuzesQ3Yu0lxg1OnoPb4f5KXh8ffM4pShdC554Dkd
         9Opw==
X-Gm-Message-State: AOJu0Yxpple8m3jE9R5yGIS7q5SWybJZXQJUnG0vomKo7f4e16nAfpwx
	2wLEL6Tnvz63hPErfJZHyaurESWhugYT95KlwVC3r60MqU0iCIGcIDPsiinFBW1CUnom3cVnr8i
	beYLF68TMjbyuST39VJbKS79xe2Pcrcd6+dnqB4PMnEgF8IhuS+JttF08rLstMoMAJCc936qW
X-Gm-Gg: ASbGncuZ70d2YK9n/tefWMQWMmCBPFxROUuk4DPFdB2PLfQXxgKeWIQ/gbbPa4eAnUs
	JiVbNvA6pk9+OM0YWNJlcVU63qrb7HTuv/Y/tndndKU8TLlcZvbnLwRONuuwu5cDcOQKfPmV1jz
	FeCQv+BUrhHUWqJ0qxReKFw81SuKjSkEPOTOKw4refM/dXEdViMAvGfFS6yrI9Yvz8vOhyCK17V
	7Necv639E1yHe36gc6dXo5PiXugmVfknuOXZdqvEYSCM4B0S/upHi7Exk0jNgrY/6xChQjNDc5G
	LXx9Uff6H5ohKT3qM5VI/woL/NekjyCUmxSAS47zcZXZVxXAvVgxOXvAR8KJBs/tNukoGNb0qCe
	XaIt8FvtEWVO947S/fU3razyS+Y2nTjBMMumQrGuIgRe6+iE+qtH0qqiLnr0rPKsxrj/rYRE7Zj
	xZ30NRze6gVcglXc1DchS2y7PBp7I=
X-Received: by 2002:a17:902:eccf:b0:290:91d2:9315 with SMTP id d9443c01a7336-2946e128595mr151526825ad.42.1761503018895;
        Sun, 26 Oct 2025 11:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ACezJkPsU6V3ps65VlD3fH5aaIoToRyiVREfsv5gGh1rZAggvkW/92gRcnLRHd+C8BaHQw==
X-Received: by 2002:a17:902:eccf:b0:290:91d2:9315 with SMTP id d9443c01a7336-2946e128595mr151526685ad.42.1761503018447;
        Sun, 26 Oct 2025 11:23:38 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm55208655ad.100.2025.10.26.11.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:23:37 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: unassign arvif on scan vdev create failure
Date: Sun, 26 Oct 2025 23:52:54 +0530
Message-Id: <20251026182254.1399650-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FukmBLLiHYQg_naTgpnBXgmNdU0VmqOq
X-Proofpoint-GUID: FukmBLLiHYQg_naTgpnBXgmNdU0VmqOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDE3NiBTYWx0ZWRfX6+fl2F7wa5bb
 wtGuoQ69lQiIrjH76Tov3yH8sJ+N/ClrTqUus/r0j8mrgiIyv7FcHQi5s14TbSQYhEaeN2Yybye
 mVWcqfeZmRnGHxEESBLJSL9xNu9VrNOZnZAMSmWidwa88UBvyPW1QDkxSjyYOAllYpDx22Hhpy2
 YZxRRBLQE5IpmYIRQ7uYkrvDq/ruLHg5QQZ32e2qrXnxuP7rfIe5jeAtOimJak5SWTiEq2oMxIQ
 zheSqkCd6cBUs619v0YwO0HeVP0bIW6b1a+f9D23hgOOLMaQLtLNtE42Jr6W/TyXLPywH+MvYk+
 ptkCM0U/z+yhJf3fMIMawH7dAPkGNpXk86Hnt94laWTk3mxTfVz8+CxlkYeAEcRLgWY7ugCWd6K
 tum6nyLwFZDWLTdqf0WazPg5edMWGA==
X-Authority-Analysis: v=2.4 cv=CMAnnBrD c=1 sm=1 tr=0 ts=68fe672b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=YQYput0e2kp1zi38YLcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510260176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112340_292333_9A054E01 
X-CRM114-Status: GOOD (  13.25  )
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

During scan and remain-on-channel requests, a scan link vif (arvif) is
assigned and a temporary vdev is created. If vdev creation fails, the
assigned arvif is left attached until the virtual interface is removed,
leaving a stale link in ahvif.

Fix this by freeing the stale arvif and resetting the corresponding link in
ahvif by calling ath12k_mac_unassign_link_vif() when vdev creation fails.

While at it, propagate the actual error code from ath12k_mac_vdev_create()
instead of returning -EINVAL in ath12k_mac_initiate_hw_scan().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal for MLO")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 931aff85d35c..28d6b2b3314a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5125,7 +5125,8 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 		ret = ath12k_mac_vdev_create(ar, arvif);
 		if (ret) {
 			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
-			return -EINVAL;
+			ath12k_mac_unassign_link_vif(arvif);
+			return ret;
 		}
 	}
 
@@ -12973,6 +12974,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		if (ret) {
 			ath12k_warn(ar->ab, "unable to create scan vdev for roc: %d\n",
 				    ret);
+			ath12k_mac_unassign_link_vif(arvif);
 			return ret;
 		}
 	}
-- 
2.34.1


