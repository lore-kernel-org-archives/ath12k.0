Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F68C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXWRaM1cylEvYyBQLAOCl/odoq1V8DJ3wyrrRKU9QRw=; b=c2aMc7y5nrc0/qcg0hRaA865LF
	xfxqvs7wR8MWdnvNfsQ1yPOFssHdIPRiG7k9kd39dseOVPZBt/bDBuOWyMYLLsYVMnnK69RNuztTW
	ItmZ7V+8ANvFYNRergV285NHvuSunksh1JaWihC+XvMnOKP6L7BNyi0C2uwHpF/JmFoUJ7ABbcjUk
	zLBj94fQap5aJb9i3cEPoCYy0oqiDG2Iu0r2S5PhdJ53Mktky3lGMp2TlbWalc413y4XQE4XDm/jV
	hTnT4ieYhWsJS6NrIcZhs60lU8BW8Ub+5SJzfF5Z5ZKWw+J0He8EuhvwBEKT7rH43FIODaopfZPQF
	J1mBAFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMo-000000012PK-3NyL
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMl-000000012Mw-3NsC
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E1qxX032479
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXWRaM1cylEvYyBQLAOCl/odoq1V8DJ3wyrrRKU9QRw=; b=dkYdlNYEiN5KUGH8
	nn3b2mWakSBWRkQGi8OsChdx5fTRnnpQOP5sXKul9A/haO5l6+GZY2LVzvvCyXHl
	Wq5TyitWmDIsEgmTRqZtmUCLcGXHnlRWwVa7SrwWcFHYSzT2jiuHLyjQYyLknSbi
	/19EJcHDmkgYULs2WbAfznNo1Csxp18Tf4B5jI8pv2SXL8U3F+EGnKops7p2qrLK
	NAfDsuQSgxXF82Y00U3pHNzQaT8oFl9NFL7j/tF2H/rwQ27Csyr/78kJ0/wk8AbM
	r4CBqUdp+p7XRJw8iXVHd3i2JKwZgwnTzmIE0WBPvKmovhmuzXXbg3WM1T3GROc3
	0wDGog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44km9wgf8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216266cc0acso119331295ad.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688738; x=1739293538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXWRaM1cylEvYyBQLAOCl/odoq1V8DJ3wyrrRKU9QRw=;
        b=MrZOtal9Tcez4XQpcS9Yf64DRZtAVL4WHeU7kqAWPzt16U1SUmvfqaMo25n1W0Vuxq
         XNUyBv9X7wDxnXuvHlLJoBtmY0aK2xWuZoO5sfQ8Yv51GjJflmqraPe6bJpuwawEmkR8
         lZmbxNZOdxjkWEFIEZb46qCNZe8Y67YlgGs8QlXykKjWMTQsK7+9vyjinzlIWYcBzNqD
         iR6KC8LdB79FQPZ1h9zYKfO3LoW/atKEks6XaGAbbJs85MkLvybzzcweABThNI6x2hWC
         XUWbmO3AxrZ5d9a+PljRnGEi+t1/skyJ2RR/BTRovvxg/WcAGWWLuNHPlAmAKIzjUA/2
         SaVw==
X-Forwarded-Encrypted: i=1; AJvYcCUpOfNHztg4Yg5x3F5EZAzfmEHvlRVarT9E5TrM1XdtAEzs0TP7GZICuoY5j5E3018UWHUMooU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMsUMRzQativT8WDVvUVJB7Q0Q4QxslDVz4MBlorTsJmaqWHOi
	VVOh6MXm+X/8zMoxVFiqNkiD96icJK+e3QoG+lOkRPZJIsK+8pe1tb5xdi1t9z98bYj/hraBgSu
	L8EfOGE3WBzfUeTA4tCG25BXBMsjf96tELeOPOBAdcZAwxGE++Qz3pIkNFfI5XzKN6N9S
X-Gm-Gg: ASbGnct8Hu0uZBhmRCyi1ePHt5czH5jvga5SZ6qp0kLoTcvsDXKagzkEw/xgenlIfJj
	FfR4bVcu6r1MgGJ6DnR/y8I96cDMO/VyM5zIqxpC1ewmaf4EaIB50GMTjjs0Yt75fyZYuGc4INs
	pM6D84uSkhwGMdtabV70J0g7XhdtXcx58ez3W15mGMHywAAU2ixrbHZwQoZpWi0VlxVswSKpj1y
	RbtBeHDVj+bM3kQgCkYgmQ3INv7xMIBqEZlARmLUCmVChRs8aP2cuXttiV6kM33GXul8w80Zao2
	mfx98/Iq7N5Ow98PwRvgOTA4XE6k4Wg815eSwGGyyWM8D71O/AzNAiibBDBm7p5irjPrzBpjoBa
	5eFYtSNwoeygZk9uO0lECX/xGA9N+Kg==
X-Received: by 2002:a05:6a21:918b:b0:1e0:d5be:bf75 with SMTP id adf61e73a8af0-1edd772d3a5mr6632215637.17.1738688738109;
        Tue, 04 Feb 2025 09:05:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFOZCGllE9vRCHjbzgU7t9YEmIsU4+LL2GFRur7KyGfweOuCHEm8rmV9rRR5FRsq2tNOAJrA==
X-Received: by 2002:a05:6a21:918b:b0:1e0:d5be:bf75 with SMTP id adf61e73a8af0-1edd772d3a5mr6632167637.17.1738688737725;
        Tue, 04 Feb 2025 09:05:37 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:37 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:14 +0530
Subject: [PATCH v2 8/8] wifi: ath12k: handle link removal in
 change_vif_links()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: GQ_44b8ROohFyOJsWaFjLJwJ5rVZAfpD
X-Proofpoint-GUID: GQ_44b8ROohFyOJsWaFjLJwJ5rVZAfpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=874
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090539_854457_C7A69976 
X-CRM114-Status: GOOD (  13.72  )
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

Currently, the link interface is deleted during channel unassignment, which
does not align with mac80211 link handling. Therefore, add changes to only
perform vdev stop during channel unassignment. The actual vdev deletion
will occur in change_vif_links().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9ac2f883cd5cc3ee5950fabdf6b89e5330171468..682ea0fc9a857a97000f1e683eb145f36ef0dd17 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3601,6 +3601,7 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	unsigned long to_remove = old_links & ~new_links;
 	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k_link_vif *arvif;
@@ -3625,6 +3626,21 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			return -EINVAL;
 	}
 
+	for_each_set_bit(link_id, &to_remove, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		if (WARN_ON(!arvif))
+			return -EINVAL;
+
+		if (!arvif->is_created)
+			continue;
+
+		if (WARN_ON(!arvif->ar))
+			return -EINVAL;
+
+		ath12k_mac_remove_link_interface(hw, arvif);
+		ath12k_mac_unassign_link_vif(arvif);
+	}
+
 	return 0;
 }
 
@@ -9438,9 +9454,6 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	if (ahvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
 	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
 		ath12k_mac_monitor_stop(ar);
-
-	ath12k_mac_remove_link_interface(hw, arvif);
-	ath12k_mac_unassign_link_vif(arvif);
 }
 
 static int

-- 
2.34.1


