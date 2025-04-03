Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F9C3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbTzqnkUjWaBGAa+M5WyuW2Lwd0XVXESY098g/Hz86w=; b=1ThHsH/A16SIxT/dx1BeLg0QKW
	TgOMWqvWuZDxmigN2CWmfBNChyn/da4Z5LA+af9soq9fZZLNal3eKoVM2iKl6qjD7mAkWrb0KHS7Q
	5Tg/NB3qCZibu25Q98uiDCFvNe8sg16qhgk0guP7zHdfmuEHXyhbfDXOBGnLXhGARZJ+B/0RNuNQT
	YVYg7Jfq3lNtlToCpdrYrODsNKKMIOe+vjQT3nm1HBVRnaQdXL0c9hWhpU4sqF4uv8wcOJV2IOE6O
	tdIW/wFaONmFQUCCr2utBBNn48J5mStcUliYrMdvdrwW2pXmMkiLeRXd9Jdwb4JAeOK58khdQUv49
	nvGDYxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FqA-00000008FRC-1rsu
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 08:22:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fq7-00000008FPS-1NfM
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 08:22:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5338FWmu025059
	for <ath12k@lists.infradead.org>; Thu, 3 Apr 2025 08:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pbTzqnkUjWa
	BGAa+M5WyuW2Lwd0XVXESY098g/Hz86w=; b=nyZSa5hkPBluC8Dc51ka508ouXG
	+zGPpgO3kT5PORF6bmhc0adIVyI27E6mQeNBUNphPQVLeMVvEztNvksQHgOSICHv
	nIuz84Pe+2RDGUp6rwgzHcKkeQNq094E42YhEQ7IjKz3osoXbCJiBeaj2S2uik21
	jQiAg97sIjU8qWcUucH+UDkUPO4gkf/i1fqVuFPbwE02WjIQjvpLiZSBkE+HRDuU
	Abtk16MgIp0CCe8ULM3sgr9nl24tm+ABBh5gB0dgAwRHhp0Zb6dh9rvCYA2MPZqh
	Dgy8W90z65nfi9C1jLcYM1h3GxinBtnU5XGYYT9wL9lJ6QZLD/CItemn6KQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp00k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 08:22:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7369b559169so535531b3a.1
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 01:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668537; x=1744273337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbTzqnkUjWaBGAa+M5WyuW2Lwd0XVXESY098g/Hz86w=;
        b=Xw8VAEGkdG8fxUqNKjjPbwAw2vPjVWdJ3r7lEp/R1YOLVEHl0VJLwGzpRm8UqOczTk
         lzNv2c0iIWnoVAjSKLoV/AcUkth692NrLIq1k+YvtNKQk/YfjxaENzu1M8NjrVoYQs5N
         qy8dTYr8QADUe5rAkMeAtRrTCyYfOiu9ciB+cWcltMDgc3csvlhqmndNRkPzkfTskkVS
         OWijJLiFThBik5kdt/gUXzG0SXxAm2BKBye+M558B1iBlcAo9Eg93KZTG9SPkIbcXrg9
         bpuc1+HZsOLE/mljOvcvoZfVl+5/HDyLobHfK4E6yF0SfnFDBUt9BI5zoEMNhafrOPjD
         lUhg==
X-Gm-Message-State: AOJu0YzvkHtW7zgqFJPsgzRQWvbxpmEnFkz9Tpl1F7JPy1d0/1i4/Mfb
	/AFAF76XNI9YiADOstEu1BsAehN53nSFUvTpwwx/GKRrQhtNR9DS+0rvFgKWvE2W2jVKFDk3DPH
	Aq2KbnteR/4uyS+fzBTx+8Den10dN/GJL+j/9OoMsekptgcMDpzQXznzBXraeqlB1VMBv
X-Gm-Gg: ASbGncvnAh//f9q06IS03LDeJ7awt867TUeDAhzkyzgM55rpYJiM1dnaIXYF4B4oXh1
	hjXMocVIk+EUsFjeLkgJzFW4OnwwvI0AtQC2Er56ZdFy3JbNteZktQ7dBFDdWkoAz2uSBp+0Xqr
	0NAK9TtcgtiZmmR+qCNM5DHUZ2OcVvk4PmWaYfuYlgrn1GJPPnBK9+pgl7WvvsS3mky4lmWkUCC
	JvbOHJOCBWqerQ3oNdqOUMNcTXJ90vTgAqWXaTmS7dfAVZhWgXl7tRnXl6NPitshaQgNdnUGsYB
	vQCUhljcYNz1hBxh+k4ygIL0W4ADYKoCHc1kzIt2BCzjw0WQLYf3KD36wgQ+oVohv7tGJx8ly78
	CSygng0FKeNO/fAbZTCiO2LxOiFE//ofcpWR+tZo=
X-Received: by 2002:a05:6a00:890:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-739d834c643mr2369652b3a.0.1743668536786;
        Thu, 03 Apr 2025 01:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqsWE9G+caW1pyWMILrByDaNLCVf5Ir0Q136+lDLGLobUBxhtKjLaeoaRf3WLuJGU+NshJeg==
X-Received: by 2002:a05:6a00:890:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-739d834c643mr2369629b3a.0.1743668536359;
        Thu, 03 Apr 2025 01:22:16 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea080esm900381b3a.108.2025.04.03.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:22:16 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Resolve multicast packet drop by populating key_cipher in ath12k_install_key()
Date: Thu,  3 Apr 2025 13:52:06 +0530
Message-Id: <20250403082207.3323938-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YKFNB7Kk0HGpaCS32PI59GglUpCqJRxI
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee453a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=L4pZBo2K2MvCq6627mAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: YKFNB7Kk0HGpaCS32PI59GglUpCqJRxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_012219_524747_56D0CEF1 
X-CRM114-Status: GOOD (  13.18  )
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

Currently, the key_cipher in the ath12k_vif structure, which represents the
group cipher of the MLD AP, is populated when the link address matches the
ieee80211_vif address within ath12k_install_key().

However, in MLD AP, the link address and ieee80211_vif address can differ.
Due to this key_cipher is not populated and multicast packets don't get the
correct cipher information and resulting multicast packets drop.

To fix this, compare the link address with the arvif->bssid instead of the
ieee80211_vif address.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Fixes: 3dd2c68f206ef ("wifi: ath12k: prepare vif data structure for MLO handling")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b19e30d95560..0036178cf999 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4658,7 +4658,6 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		.macaddr = macaddr,
 	};
 	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -4711,7 +4710,7 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 	if (!wait_for_completion_timeout(&ar->install_key_done, 1 * HZ))
 		return -ETIMEDOUT;
 
-	if (ether_addr_equal(macaddr, vif->addr))
+	if (ether_addr_equal(macaddr, arvif->bssid))
 		ahvif->key_cipher = key->cipher;
 
 	return ar->install_key_status ? -EINVAL : 0;
-- 
2.34.1


