Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F4C5B555
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNx2PZVkJVHdlf+U6Dk6y7/+9lqdg3iExttgGZVWadc=; b=Skw0QFBtmN8l276vVImdRzvJ1p
	cG5MG53w7nJaQK0jMCDcobb6Pc3IxY19d1LhqAME0TN6HPiG5CyDtMptLO2lfiQe+jYH7OY/IPe74
	LiZcyGDT9CAuEL3APzQ0EE/qVEk+MuL614Pp0seAjtwynkIwB4BkzpymAvXvXour5DbxKjz0r8iSj
	pCtned+91FsNztsD0PD8HgrZYwNnqo21VXwBQ5lL/hDUPK2wKGcNUv+s+ZvsH1nY8iwQitWY7I8sn
	vpo14E60fAuefDvJeYm6we39Z8t4PrCu48gKjGPKLduSDzuVISaO6EiUQ6KXwirYIBE3gkgkTDr5O
	uhJpkOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44P-00000001Trs-1RQx;
	Fri, 30 May 2025 18:03:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44N-00000001Tqq-2OJY
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 18:03:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBDJcs032180
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=bNx2PZVkJVHdlf+U6Dk6y7/+9lqdg3iExttgGZVWadc=; b=nW
	MoDyltudx4Z+x9T+JgVnEtGPdioHO4GlyzcoMGbrabVZHP07XEK7rtorePi00is9
	hyuwiqy/8jyP0gSabVgB1sYPTCrCyyyxpPLsXB031iYJcFUI5iRdWEBBbNSyVv23
	tdq5J+LXkufx/0nx/1+3F+9ZP1V3j3nPOstAj9AjWpfm5G/VKOZP2JCEpybcU8Sq
	e96IUrR0on4RnVOSrGCxJuAkppHvWkqgCMAKG3EW6kB6z0KWt5Z9oNRTatr8aGfL
	QkEemL8cejr2Uphi78JY3z9OibtAATicuqBvhn66JzPoA+AisDgzN3Xp0T6iaU4U
	ztGbud/S9WkTgIdkNb0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk23an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:03:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22c31b55ac6so32675905ad.0
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 11:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748628182; x=1749232982;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNx2PZVkJVHdlf+U6Dk6y7/+9lqdg3iExttgGZVWadc=;
        b=kwS5c7agS39wovVflX2xW5lpgiiqAd0XU8edZFKtFmfcypokdmXJsTbOVIt/GTLvQl
         eoVEx7+OQjmlhgaleyWauGYpWwtF9JRK6jTFj3WVINVgcZOQcgE9yGzMwENQx+LitjgV
         fw7Ng1zNKucd3SETeJm5gIgrKAZSNHofp3X1Kjw6fyradYykD+IAOItE/LkAQTvINygx
         vsM8yu/qXgtdN6m+tSx/ZOeDAuMq/HOgabCSMWML4gqs9Sll4wPfKz+sFqYkzBH8hMNJ
         Cp44+AJPp3IIa7lV6u5CIZlYNcM8vxY3Sod2ODfO0iEK+hWX6mkyHAw3gQ1xx0c9JbqP
         LRZw==
X-Gm-Message-State: AOJu0YyCoxdRCEDbBln5uyHmUIKNjO+3S9yKpNViMkn+8QNJBxOMvceR
	DVkeBRqC5r6fPN5BIUVyiFrbgjU5cQ3qUaWd4fiEteu131Mycoj6DD/5AcZGUxBz0zh/23/hK4V
	HZCX9fGtZM7U4RHSDGnnpDVtHmsxjP6aW62+RHpaL4WmcyX/L60IKZykVehvtJchEWRY9sFK5
X-Gm-Gg: ASbGncs6aJLxc+ADIpwVcq99mKYIOvf9Mlt03AF8Tb0s052n+Q86oXaAO/E2bUXD11S
	w07R0/PhxqJEdFYOYJuuNSn+c8gBoRhBBv5SJ+eyslJ6C9DQ7Hg2KtTyokqdfiEGFnWsb52piEl
	5eELW9XeftBy4UIzCw3FkPcKEgMT50MM+9THDub5OxztA+KalddgIQKTxEEVymfOHc7SRJADkHz
	wd0Hu4HOrbdo0UnE74APWNVMWILdL76eL4MAR4IoZJonsvMZjkh6YttcTMRu9BsWRIWHiuTXcJ5
	ZNq3pt0eTEg3lTAPhARqS4wH1oAfBFcFLL3sPdQX2s2nxWQtoAisIBrLKvx4DVHi7PbJvfulc84
	z4oug174ubjzNprl07fBAnRxnqArZtUUweLbCDH6FRFFwWg==
X-Received: by 2002:a17:903:19cb:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23529a1357amr66794115ad.50.1748628182188;
        Fri, 30 May 2025 11:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFOJdnxoFqU+W4FFU27jXFptIu+Ou7L8bFIvNvx7C7pS7+NxgCzhEaoR1G6UAMm+MfA13U8w==
X-Received: by 2002:a17:903:19cb:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23529a1357amr66793825ad.50.1748628181803;
        Fri, 30 May 2025 11:03:01 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc868asm31374435ad.31.2025.05.30.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 11:03:01 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211
Date: Fri, 30 May 2025 23:32:47 +0530
Message-Id: <20250530180247.424349-4-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839f2d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=xmVKpWhJFmdleDmdprIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q1lF1l-u5aUWuspxPW3s-FYRsJpp_ikA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1OSBTYWx0ZWRfX2fg/rTgD2g0P
 KlFjWd4HZAnQRoY1pbUtYYiorzY8of/wdC2HW+i6Sz9lHvXGB8wO5U9B2TjS9BiCoUDT+/osUN+
 NAG8frDy9PzFZhUXRai8sMCFspYKOJ+5uGvS10XO+WmP2VcBoXN1GxqKG/oR2F+40a2RaFHt4LZ
 RJ8694F/ixaQPMLH3iV/PPsUnu65j9763JnLhcQVLxLu784pY+XWCARlZoGrjEnpyx2SxetHD5S
 97kbL7wrqtXHMZ+JsAknWzkhrQWaqUaIB29Z6keF0PlnFULq+j3sROyeDOF+GgYosMCEKcAnbKQ
 otFw0opvn0PzFlXehKTMIn9m3mwETPV40nQWtnQxFtgWhFXM+Ie8b9VMg4vB0wtfXomJyvHlcZc
 wfROaLq1geswD7KHzDbGLYYGrJ3A85+H4G60OuzzEKjNFNlKcq3keMo8dS0XQhHVYVx/x/8s
X-Proofpoint-GUID: Q1lF1l-u5aUWuspxPW3s-FYRsJpp_ikA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_110303_619948_BF176FC6 
X-CRM114-Status: GOOD (  11.46  )
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

Currently, the mac80211 layer handles construction and parsing
of 802.11 headers during packet transmission and reception.
Offloading encapsulation and decapsulation to hardware can
significantly enhance performance. This can be achieved by
having the driver advertise hardware support to mac80211 to
bypass 802.11 header processing

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 958299bd5acc..f65f0e9e7eb8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12011,6 +12011,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
+	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
+	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
 
 	if ((ht_cap & WMI_HT_CAP_ENABLED) || is_6ghz) {
 		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
-- 
2.17.1


