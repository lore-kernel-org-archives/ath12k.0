Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD700C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axAsNklMxgFf0ah3MCcqQDPWHHSWt1rtg0cgBrQZVoI=; b=NecYbs0NbZhY+jPGRNwIqKbQVG
	iOaheOfIcZUaBMXiAoDntvtE1NYzhCguwZRua6UB1a0bdJQg64goP89AEp7K5xUKoMuSIS3ppjy7W
	ipYYKlhpCtXnd3iQHqyJuNSrLLJdZn8boN4k9q4nJyoESx9Ly//vrgzTYbrRa9R+DfU9PSOPUJXtD
	d991Z9YjKGxU3jHpdplp1P5+A9lXsqbJDoj0YTHJ+oQprxIPbONCdqULEG7S5tfrZmFeuq63X/S5O
	LhsydVKLsH8i2NjXF09kC6C/6jRkK0/pnStHbV9GmKZ4uPBB94Jh6cI6AhhLack9WQ2Zj9jtucnAh
	EjJrQSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATz-0000000HE7O-2RyV
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATw-0000000HE4N-3KNI
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Jfg9t019020
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axAsNklMxgFf0ah3MCcqQDPWHHSWt1rtg0cgBrQZVoI=; b=Qz+6YlsNhcWkiWgR
	axWgDCaPeLChnXiicuoP6TNcRFX5TrnOLBYcdL11FShpWX8P4HeqQNr0dic6LwNF
	+CzCrOaKfqYNHrw2S+G8JWyRacrwa1vLixXnTWMcULAEvrueiuLIAmQxEBezpfAW
	5+Mj+MyIAB40Zoz9Ny1dsZ3K7C/zanN/qU29DiHkzAl+s2aXUi5dHT3Et9oYhSGo
	gx/2o3CMquum7blpjMbJPpJZexoFB0Sw8bK/THtKNiPkt9okdqo2880/7cGVVPIA
	nlCjER2hFGreR5VMsKspVRRSlL4WSE+SL5DZ7P/kFfnmd5hwpETyrFMhoETFesop
	4JUhQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k46d0wa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166a1a5cc4so109662425ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643054; x=1739247854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axAsNklMxgFf0ah3MCcqQDPWHHSWt1rtg0cgBrQZVoI=;
        b=FDkWAt93ImIJwA4cfElYPm9VooikFcp2LjwZNhiJ8eBJ/76tQlMHHpE7KN0f6fgSls
         YahXzVZyRlzQRdxh6fa8IUVk0s3y6zypKc/3+zNt6KyX/ZZJr+GvGdluDVKP8BXl3cGu
         7GzT+hXjiwVzhOBIrxXk1fNO9Q7PC2oY1BPorsw6PCqKxv6ebxv2DqFjhebMmlkZYd1d
         m0hnbFpdqVPe7k2Cq0Yc9b9RigodFCi9YS4Gc33rFZ9pBurMXxaj7CUBg1u35rRQnDFW
         468cBSqe/6GY7WAQeiJGowmuZcx8xVjZrtw1xTDvbJcb1YyDfUdQgZ7gaZozaB9Hre28
         JskA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHaREc8E69OgsaFMVGfOKqMOEd2ciPHdRs3bZOnSnBHquhvT7IHNTNKeFXa8rh0/TrWA+ydQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBb0n2dG/3b2JSJC7gqJFw97MOTpBp1zXoWKpU21AIV5cIos5z
	aRwxKiYsKx791FVm3b2oPSGCditBwFe+iCOU2hcliFGlWNgTin3KAQ2/6fefqP3h37hcut3+LwK
	8IcAWKbWNb+jMjsliz9g9Vkz67lOP6QZXEG5me0DUqsc8J5BwDOhK40Bzz/qIUsAEOB/s
X-Gm-Gg: ASbGncu0Ll1B5gusBy7DFOlByfNNaNUbI4l6PAD+KREAibSf9tIOBomKpXtcwvWOau4
	7znAQLVuU+vC+sGvhGVAx8QmaCDs+NApL3BCicXH2Z1tmtnTC17TjTOPv6rv2/G/pkiHTkag4eY
	Xgz3SWA7WPe19LgX/onvTXf4OkfM5Yew74o6JfKb/ZHOvoz0UIS5w2iNo/JVTbHv0PzOdUqUZi+
	auIxE3wpqPz6tBfAT5xYkGTiICaPOgw+M9qphEdCrsmIqqS1fQD3SgELlpXijkGSZCE4bBxEJth
	f4ZrwBKA6WVm2zlDwi7mRV0jtxlpaBAt9bEyA3Ms7ZOwlZk7BY8Ydp3q1O32PEaq2RVfx7urTy+
	KNNQLPRHkry8CU/NpQpXu++icZbPLmw==
X-Received: by 2002:a05:6a21:3284:b0:1e8:bd15:6845 with SMTP id adf61e73a8af0-1ed7a5a50eamr38531504637.1.1738643054294;
        Mon, 03 Feb 2025 20:24:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG37uEnTRl9KVMSU4spm40ZsO3haIDtnzXWYxqrau1noeC/5WzeqS9hfmEiHCb/xGDbajfSvg==
X-Received: by 2002:a05:6a21:3284:b0:1e8:bd15:6845 with SMTP id adf61e73a8af0-1ed7a5a50eamr38531478637.1.1738643053911;
        Mon, 03 Feb 2025 20:24:13 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:13 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:47 +0530
Subject: [PATCH 7/8] wifi: ath12k: allocate new links in change_vif_links()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-7-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: TbHrNxyR4GNRIkNfdDwNL-tWog9nMvIG
X-Proofpoint-ORIG-GUID: TbHrNxyR4GNRIkNfdDwNL-tWog9nMvIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202416_961367_1F6DB90C 
X-CRM114-Status: GOOD (  16.07  )
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

Currently, links in an interface are allocated during channel assignment
via assign_vif_chanctx(). Conversely, links are deleted during channel
unassignment via unassign_vif_chanctx(). However, deleting links during
channel unassignment does not comply with mac80211 link handling.
Therefore, this process should be managed within change_vif_links(). To
maintain symmetry, link addition should also be handled in
change_vif_links().

Hence, add changes to allocate link arvif in change_vif_links(). Creating
the link interface on firmware will still be done during channel
assignment.

And since link will be created but channel might not be assigned, there is
a need now to test is_created flag in ath12k_mac_mlo_get_vdev_args() before
accessing link_conf or else link bring up will fail.

A subsequent change will handle link removal part.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5d80bbb664ea6a710eedd7b57db3523df9c893e6..b9017002f3efb27d917f0aa35a0ecc66af18ec99 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3576,6 +3576,31 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       u16 old_links, u16 new_links,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	unsigned long to_add = ~old_links & new_links;
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k_link_vif *arvif;
+	u8 link_id;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	ath12k_generic_dbg(ATH12K_DBG_MAC,
+			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
+			   vif->addr, old_links, new_links);
+
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		/* mac80211 wants to add link but driver already has the
+		 * link. This should not happen ideally.
+		 */
+		if (WARN_ON(arvif))
+			return -EINVAL;
+
+		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
+		if (WARN_ON(!arvif))
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -8765,6 +8790,9 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
 		if (arvif == arvif_p)
 			continue;
 
+		if (!arvif_p->is_created)
+			continue;
+
 		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
 					      ahvif->vif->link_conf[arvif_p->link_id]);
 

-- 
2.34.1


