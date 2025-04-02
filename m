Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D983C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qEUXBk6klBeSZKXlhsLnnQbIGUHKLNJO/j04SlxMffI=; b=ikSuek46aKCWf9owe4RbOjgNL2
	m44ARaYrF1rY6ruauDOkisDWyAzR1ZIdN4ZksavoT5BBgY9f9wExuJE4+saoylzRF1dkSwOL9sC+C
	ghQUWXDmLYF/XrOdnaOGy0id8W6Vlb5qugZPs5wH6CxejeAfk1f/zJPbNg1nKSBEhpDyepRFeGslz
	9Soluwb1EHeD/Vd8nMC6MowEiznzISergJq4YuteXGmIxV9kQYvYv8JO4VekgrdO60MINDKeLTnti
	+4J8gF8EqwunZk0KdtOJAW5kH6o9mtSzpyTHaOrpm248Z7QMdduKtPwqJ35GlAb0IQa9x6/YDvjBj
	BTaoZf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02LG-00000006rh5-2oDz
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 17:57:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02LD-00000006rg6-31a7
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 17:57:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532C4VMg007237
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 17:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qEUXBk6klBeSZKXlhsLnnQbIGUHKLNJO/j0
	4SlxMffI=; b=eKH1Ujca95BAluZwM8vdhy/qci8905FIrI8vlDCQreSo7rAHNMT
	8M2E2JbgfiyP9RAG4kRuGulRaSjqPqHnnyaZYl/18ZDgqRDuMTUCsEU3+hTGgL2K
	PzHeeYtODpx9q/4vAbBCyiLAn6qGW3gOLAjZQ6wRLi9DDrAkL3r6gqWD/mUc6/04
	xP7fPaCsWv0v3MVtVC3/guzIt0UuCWFKNzwIRNNfHtWXkYLxXFhiJUhZFtHlOowM
	Ero0N0r/QBX0J1tGGR0+QxdSjZkeZ6RSrVan1BzHPJXffN16/tlNAobsQMV6Bywe
	DOqq4e8/7WJ8l5sEhynqFNc1I7rL2dwNmZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7ym637-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 17:57:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e0b4b85so719705ad.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 10:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743616649; x=1744221449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEUXBk6klBeSZKXlhsLnnQbIGUHKLNJO/j04SlxMffI=;
        b=jUDilmjA09qwmFlMZVov/mHakuEn+H5GR55yrOrCyEeB9j2HBAA1XtQNmUGFIJopKY
         6iTYZKLatup7GUkPqROwf444YUiN8oa1aQqVg4bD0ivuSxyM1s98Cb9Y2ixc/Tm0L/JG
         ZpVN0ltSKJaCbtMFR+Q/8XcLRtwAXUBAwQimhPEaH2t4AnGpOW0qur6XIVJ9XLMIsMw9
         xTZz/6rAXIKCTNYWd6LSZdAbdQsIGw+tDEoBFOB2qFWjGJJqb3SujLy8E7R1gYJgjvjp
         G1rtfVkQuADdCx/elh70qTOS/gjd5ei4a2efpBgmjJq6Ef8DC3FosUH38dD0jkv0hRvM
         p3TA==
X-Gm-Message-State: AOJu0YxnfOjY/RBvpI3YEOY0WKQCRVjPVNWKQJceDSQvSKrkAnzyXW1N
	lMfsaA/o1MOsaXKdpxuG7/OvSPjfqYnjPCAtj/J4n354zDpu5of3j8lTTeIh0Pz75QPeayVCvb1
	rbaRG15gpM3vxEWerBiG9eTEddyvRMxNwloZXJ39e37XvMg9AEF1Z2hPYV/IRn9DQ9L2o
X-Gm-Gg: ASbGncvh2IRj2c88im2siDGzt+3GRRM2lWTsilcqw0tVRYw585702SkJSTkJ06n3leu
	sfPKFDO5T+5HYPNBRqTVDsUHtIFwSJ8TMFLFgAwPwZ9+C60P7HN4QyR8lHPdNjiZ1nXxd6WRtTZ
	nr5+iHen6mVSrFJ/H1U6MkX2L3vEYSPJmcw25tsiQfhDlVUXyRYY9JITZ5bbPVDCLTysFpNFoj6
	uqmAJUB+Uv4i5y0eFpDHsW2i9H0M7A1hpnNEytfMLr0Eslt32dB5eVQMX8A9szhd9tt68RlJd6z
	YmQcKw6xIbIB6svvWLRDaxmM34i0Rru4c7pqINezitRRtmEEjnV7++rf35eZ7g3hR1CXy1Tpd8O
	t2j/sN+CRQ8PY8uX+Z5FQ892IFcHbfakASQ==
X-Received: by 2002:a17:903:8c3:b0:21f:6ce8:29df with SMTP id d9443c01a7336-229765a48a0mr6068235ad.3.1743616648857;
        Wed, 02 Apr 2025 10:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzaLxOYupk4yzNKqDaP5LtWI0Rcx+fUIcvnq+y10gZE7lDourTrM/E0tBG7HjD4rLOwZW4KA==
X-Received: by 2002:a17:903:8c3:b0:21f:6ce8:29df with SMTP id d9443c01a7336-229765a48a0mr6067935ad.3.1743616648437;
        Wed, 02 Apr 2025 10:57:28 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef9dsm11312234b3a.23.2025.04.02.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:57:28 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Fix memory corruption during MLO multicast tx
Date: Wed,  2 Apr 2025 23:27:14 +0530
Message-Id: <20250402175714.2667270-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ed7a8a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7ECTBQRQhtQV3OkP7bIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7jgWXbLN9GrOovUNVuzHYeR59dJPuB3y
X-Proofpoint-ORIG-GUID: 7jgWXbLN9GrOovUNVuzHYeR59dJPuB3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_07,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=822
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_105731_891616_27324CEA 
X-CRM114-Status: GOOD (  14.21  )
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

The struct sk_buff's control buffer is shared by mac80211's struct
ieee80211_tx_info and ath12k's struct ath12k_skb_cb. When the driver wants
to transmit an skb, it caches all the mac80211-specific information from
struct ieee80211_tx_info, then performs a memset on the control buffer
before writing the ath12k-specific information using struct ath12k_skb_cb.
However, during multicast tx, the key is being filled into the driver data,
which overwrites some crucial members like link_id and flags in struct
ath12k_skb_cb. This causes invalid information retrieval when the driver
accesses these fields during ath12k_dp_tx(). Fix this issue by removing
the key filling logic during MLO multicast tx, as it is not used anywhere
in the tx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 2f50de725677 ("wifi: ath12k: Add support for MLO Multicast handling in driver")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f2fddf213afb..8aeba791dbc5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7467,7 +7467,6 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 								info_flags);
 
 			skb_cb = ATH12K_SKB_CB(msdu_copied);
-			info = IEEE80211_SKB_CB(msdu_copied);
 			skb_cb->link_id = link_id;
 
 			/* For open mode, skip peer find logic */
@@ -7490,7 +7489,6 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 			if (key) {
 				skb_cb->cipher = key->cipher;
 				skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
-				info->control.hw_key = key;
 
 				hdr = (struct ieee80211_hdr *)msdu_copied->data;
 				if (!ieee80211_has_protected(hdr->frame_control))

base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
-- 
2.34.1


