Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D49C369A2
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 05:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SzTMQY4O7z44F+8FTXEi8JTqBtXQzPRQYGmwhuvW/Eo=; b=3rDLD89B+XfoR+lVkJzgSEi7VE
	WeyWmJT5Dgte6GmzQfzXKUo/EdPJ1xK7vf982/qRvpmoe8U72pKZayopcCG3hEQAApJkHkN+iemC8
	wJM5+1IY0286MI33yjiWAx4OpSxSdh23yPKzrllbtX6hWzbAyZvy80PK2lvZmLsE8hDWvK7XopN/i
	lYlA+pC19b8ZVGcPmFHG8IyytdN7OSpkY4W9JtbzE9rjoziMcNtXC+QutCGgnD6QVHEA+sbYCKqyG
	GxO9Rkf4/sM7GesW6EpqUeAtGgncTB+fV72A7Wf85sU2P4GR8RMDk5R9E2X0sOlyJGtcxJmNOqqFR
	FQWT0kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2O96-00000006AkK-2shC
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 05:38:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2O94-00000006Ajd-0jlm
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 05:38:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZkIu023847
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 05:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SzTMQY4O7z44F+8FTXEi8JTqBtXQzPRQYGm
	whuvW/Eo=; b=NmqFvJ/f8NcW1ahkUIv24vFGF89B7laIjYpzzxi6820x7hChfK8
	ZwTyBlnx4I1Q2qw0aNNa1zF8T8jkmTcdcrPfVnd8YtoAT1wWTpB2h3w6YMgeHeoa
	0CMH0Nr+WygKnOgc5pGdpKY1oKjgS3N9JdCTni+TkP2ZNPgDCP9ZANuS38hiUh0a
	gRjTmTElThOHJ4lF/a0m6u2LT43niQ+pWXJWnQmgJYtnsCunIz3/uMMQUZ6D8p+K
	a7BtuAU2OOWT3moYqTE+WMJcywBnhhppKIvGv5rAht9suvXFMZ22wtBYXBIxr6ET
	2qzvGwVZNAWWcUj0MohiIssTwFs45780U+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd027vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 05:38:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223fd6e9408so2872225ad.1
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 22:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744177119; x=1744781919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzTMQY4O7z44F+8FTXEi8JTqBtXQzPRQYGmwhuvW/Eo=;
        b=FzSPdTnO8oh1vsdRxneSBhwF10nxM9h0U+RpaDuBAEqgMET4E4SaqQsuXEREngUnri
         YXjiGfSDqq8t3vMXp0cKq8JSksoWm4mgTDdoLd37PKLfdGxFQ4Lko7ERaNklCxmUgAXZ
         el/qUrqiByOn3NJwnRVwaqjWkiDtI+/IRd/oHlIVUHix9545o3vLdupUqVRll797KXrh
         cPlWA+geYDwjPFwhEvorpWnEpGngyTmm5jkheL/p16wUqGWC+xKc9HndYoyhoIqXpOYA
         zjuMO+M5scsUxskV3jG1HCT/QRJrt2nfL66mGXWTljQHwiTsBuOp7FzGwd0BInOVihDi
         2C8w==
X-Gm-Message-State: AOJu0YzX7dqB4Op8KhvhS08/PkbKjXI3HhVCC4cYhsFu/TN2oVBtnsKD
	2zwCTruDYzEOLwupu4gGCTwl/EoPhVgC0G/sqW+f3DUeF0VjKa5+qKCoDpSNK3Xf5pFqTYerZ8V
	0AyRYpxr5ORlr6vbQOu9IhXBj6LspF+pYNMwK2j91lUNm2MA843qdM6m/Tp7AuIav9XdG
X-Gm-Gg: ASbGncuM2tUTldJCOcC1rH59Np8IMH7bj9BZ+iyhRA9+mNO2upGVg6BWymwDe7f7jrK
	17pN75S8y2uTNyuoGThZUypvOZxtads8XfIHw1v2jl7UuqYncFLSdk3JTRus+qHef1882vxnZg6
	Nac5j41fWODLMoVKpyJRTE85J+2yPnkf3YmJn+MN2k1wUmxxFQt+IVXk4E4ah/v/NJ77CUmtXEJ
	VJl4aM2leTgCVYFm62uM2bQugw/rMIyTT9owSnPpBXWaMPC34dnyxyyv518EvV+rueXkj8MKfmp
	rR0bJfYcwjdPXZ+Hqeecg9dR8si+bTdJp/nghyLSKk/KiaZfft+OZ/v1KzAMINRE3cpO3dqZaCu
	q1fKxGFXy3Kwew7rraY7dLrs+BPBo20YrnyZxtlQ=
X-Received: by 2002:a17:902:e5d0:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-22ac323bcb4mr21527265ad.2.1744177119014;
        Tue, 08 Apr 2025 22:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHImc/bvLBl5TXB3csV4JovkmY4x/QlKTBRiP+rgF0AXYNtVwj5lNeDsXmcP7EhIH575AX/UA==
X-Received: by 2002:a17:902:e5d0:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-22ac323bcb4mr21527065ad.2.1744177118597;
        Tue, 08 Apr 2025 22:38:38 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7caf86csm2988865ad.164.2025.04.08.22.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:38:38 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Thomas Wu <quic_wthomas@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Disable broadcast TWT feature in HE MAC capabilities
Date: Wed,  9 Apr 2025 11:08:30 +0530
Message-Id: <20250409053830.4039467-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 454UA5VAjveqCraHMCTiGCBQRBbpLJ8j
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f607e0 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xmVKpWhJFmdleDmdprIA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 454UA5VAjveqCraHMCTiGCBQRBbpLJ8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_223842_329883_15D35AF3 
X-CRM114-Status: GOOD (  11.53  )
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

From: Thomas Wu <quic_wthomas@quicinc.com>

Currently, the AP does not support the broadcast target wake time (TWT)
feature. Therefore, disable the broadcast TWT feature in the HE MAC
capabilities element field.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thomas Wu <quic_wthomas@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v2:
  -Line wrapped within 80 characters.
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11..26c0147924a3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6724,6 +6724,8 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
+		he_cap_elem->mac_cap_info[2] &=
+			~IEEE80211_HE_MAC_CAP2_BCAST_TWT;
 		he_cap_elem->phy_cap_info[3] &=
 			~IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK;
 		he_cap_elem->phy_cap_info[9] |=

base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
-- 
2.34.1


