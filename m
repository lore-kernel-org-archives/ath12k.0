Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C2FFD4612
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 04:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qMgNgj2OchRl6KrTChErc9AIPXNOheHylxIayzOk3Kw=; b=3s6/kD7qylyPcKy2zpbdlrPH67
	pPLkHAYT4IAQUbi9Xe9vIA/+Nc58YGcTLgoEuU9QNKqDejwJ3SxtOHLoZpsUitXUJ3xr8zr9szEIj
	mr6OetWJG0TC/JD6gihATsXKusL/apKH5KKMaMHcH9DcQnq4J9+VgFl0JU1DPRx3WQ+kKCa9JElnQ
	Ch9BkQ45XbGZrnuMZVnePk/We4bHFOYdiXBLhPVPJ8ulSWpUzUqzbs8tD9ioj07yH7KAugyQ9bxah
	pmccVf7tLjGjOEg38xDWFcrkn8CiBGZo3SlyZP1ywOwkSbrBYJVbz+hpleh3t8Jr/lpXouRRnOZPV
	GBg2TaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSqR-00000005MtK-23pb;
	Thu, 26 Feb 2026 04:19:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSqO-00000005Msz-3cnF
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 04:19:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q2kaoj3005776
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 04:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qMgNgj2OchRl6KrTChErc9AIPXNOheHylxI
	ayzOk3Kw=; b=E0qEgyo9lS+bQwHbhKHXv2SoPsRaRJBaaB0b88o9BSjrhDGnvJy
	wo1VV31TGfvcrwJIhk5urRUneqmtxOG7eL5hnu7yoAZQ+ovKOiHGmh7QIGLBNhDd
	xKfa2Aw0+XydIh2txqCntb4TwdMydS1On5jaaHPJyggkYPtz9cuobyTdT4A7a/jp
	qlfJ3MRAGzD65XeDPaNiytQFMIw1PbDlwBSrLvG1mJBD4Pb0WP8Nr4GG0Om6LLXe
	v1UXZ3BrmtAFnm7v9Zwf3hkv5uA0SY71L5D22dzYP405s3iDB7z8I3MYCgmcvIKv
	fa4/qQr7agcB6ZW1TM9bp84z7t1cwmbgcVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph076g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 04:19:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so5278815ad.1
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 20:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772079558; x=1772684358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMgNgj2OchRl6KrTChErc9AIPXNOheHylxIayzOk3Kw=;
        b=VfymVenSBuq1oZeM1uWKpB+lC60e4IdS3gCSSaF7Kh0qb5/dc4ZslzLg9dtWS4COSV
         wx3sPl1LA5qSvtamlapfAT2TrURtbOBAVK/Y2AEuaQRdtbYm84jyaqrsk8hlDxp97w9/
         zahbZPBgXgXRuwh4m7E7jIvv2+PVezbSw14bv6iY3Q/bp5M31v/FfAoVvzw7D4H3Ftj6
         ICqHU1EeQOPOAaIAopNzZLO7yMXFloSjx0nF+BpTsu09YY7SY+HQTmCpUmfXM1DcA7/a
         clRkI/BpRmTD9zeuEw0+473j44rfdswRO6a4LTXn6s6cYvr2LmZH4/pLUxRNY1ovYnO/
         gr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772079558; x=1772684358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMgNgj2OchRl6KrTChErc9AIPXNOheHylxIayzOk3Kw=;
        b=jOjJgsC2fNJ9i2e6O9F75j4SYw4L2FOG6HX71CyYh68JlRpsnOFm0NMIGJ0L2Y2hJn
         eemN3dn84ozKseZzfG1KahCwCmxm3ptgt28YVvKixv5p53sbsQ47aMolVfJQ6kxI9G0g
         6vB5l+R2+ycJ0R8GDvS5CiLn7YOW9TayFQjshdsxrlam+r6BQbnZiogS+NonWZ9zli7J
         dux3s/ixw1nLBgpf+IJx4bi8sM1BpXLo0+6bskZeC7sVw2Iy3YU39IweXxuRo55W7ajd
         P2zdFEVtHU0de+vqGILjn40z8pTwi8sLaF4y6GM78nAyCriBFQyIoRK3Yg2rTsRsAgM3
         xQ7A==
X-Gm-Message-State: AOJu0YwmCbPRT9Q2GiIfYAgAm63ssw3l1cf638l4TkZkAWqLiK7DRkPa
	sxL3LadCRdONNB5trbv2IpfjxIQFVL54PmpQ0az3NUd0D2OfZmtC24yocy1pNF1/LTAkM6mqqpK
	R0aZgcVOs+VJRu8A4swEJqDHSYzvXroD1f1gkgUrLslEBWuVT0UficqTmMWSEh0Kipf/xMi/+
X-Gm-Gg: ATEYQzwwKPMal8QGBIkJB1C8lJqZqp11cAhuUHTkG7ftrr2Ytu+VA2C+pCO2RyYlWUs
	oay3GoVKShDzV+Sw5Y0O9ko0E2gAFTITKV+nXfyTaqubwK3z0SgwZVk2Hu6ij2oECU00hH2KUn1
	8OBQ+dNdGNcDqdckpqMkOKwzb1ZV23W/JuuM1NUbSHjb/ADGJdaggwqRoh4GTU+Uxd8pfFVKNnx
	fGLZrtx5OGHrbh5Kbf2uKJ5ytiD6lrbkRVJZk2q3Sb5DN+bBJzVeFTvblivqIFSQuXb3uQlhU7U
	CuXImHGooSOr1aH1N59r+pYm9+3iKdy39OdcsGxGrNCh8wE3rB1fm32Ma2d5bSFou8hgcIpUbv/
	XKVIhp3PmvDn9PZnCY+3neP7XUErLAXRTimTGM+GJIpE92BdQ/dMXDSexUoWFc5Nl2oxrJheblg
	HVNW325OTh2Cyn2K2Uv4zlyZsR4BBK9R/cDtOtRIQaGxUJ1bkY
X-Received: by 2002:a05:6a20:6f91:b0:38d:efcb:2e84 with SMTP id adf61e73a8af0-395ad0f10b1mr2558574637.32.1772079558016;
        Wed, 25 Feb 2026 20:19:18 -0800 (PST)
X-Received: by 2002:a05:6a20:6f91:b0:38d:efcb:2e84 with SMTP id adf61e73a8af0-395ad0f10b1mr2558547637.32.1772079557508;
        Wed, 25 Feb 2026 20:19:17 -0800 (PST)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5eab4esm522145a12.6.2026.02.25.20.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:19:17 -0800 (PST)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix the assignment of logical link index
Date: Thu, 26 Feb 2026 09:49:11 +0530
Message-Id: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M4sZeVf-EhpLW2GYyCzIDNSjuq3XtIXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAzNSBTYWx0ZWRfXy+RxgKF9vYvy
 lHEHS0oH2s5w/xpkkoknXUUF5zNdndUq9F5OAHb6ItCztc3R9luXdOu4Hajdx86XAFOWReVLKBk
 zXJJUkQOA9KFqnttMrq+xecfknoD3qRJq1Itjz9b8L5dhor5uYqpKB+8pqzSVHfjFTAEbEe+dxX
 TEQevtFtN82+o3DOwp4YfHZiusVOpKROhWQC1X8dCUk9lxgib+OaGOTFgNWgGqKMZpx9veCmyQW
 fcxVulYYAw3w/6/itfGmc023bkRpfr5VAd2sxgVsSIClW9VonM6Pi9fnx7wNMHxRtLfQuoCvDLL
 0CmwO+O+L+dsJMtCfTWbS+/NhxU6DzkkfqKfBzFo6MIRDp5rvgW9CVgcH4EU+31TOXL6PgzadSn
 VYrl4xFXSwA1qyyIw3KQlNF0ePuBl3jP0S5VP3k88/WA4ciDqE/2AZJ1lYvZXQqBCLxYs+JWPlA
 jThJjJTcHW4dYBZ4HfQ==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=699fc9c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KoRwW9U0jdfTxXC0uPgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: M4sZeVf-EhpLW2GYyCzIDNSjuq3XtIXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_201921_027588_C0BF1E30 
X-CRM114-Status: GOOD (  17.62  )
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

From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>

Per-link logical index is assigned from the global counter,
ahsta->num_peer. This logical index is sent to firmware during peer
association. If there is a failure in creating a link station,
ath12k_mac_free_unassign_link_sta() clears the link, but does not decrement
the logical link index. This will result in a higher logical link index for
the next link station created. Also, if there is a leak in logical link
index as we assign the incremented num_peer, then the index can exceed the
maximum valid value of 15.

As an example, let's say we have a 2 GHz + 5 GHz + 6 GHz MLO setup. So the
logical link indices that they have are 0, 1 and 2, respectively. If the
5 GHz link is removed, logical link index 1 becomes available, and num_peer
is not reduced to 2 and still remains at 3. If a new 5 GHz link is added
later, it gets the index 3, instead of reusing link index 1. Also,
num_peer is increased to 4, though only 3 links are present.

To resolve these, create a bitmap, free_logical_link_idx, that tracks the
available logical link indices. When a link station is created, select the
first free logical index and when a link station is removed, mark its
logical link index as available by setting the bit.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 990934ec92fc..5498ff285102 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -522,7 +522,7 @@ struct ath12k_sta {
 	u16 links_map;
 	u8 assoc_link_id;
 	u16 ml_peer_id;
-	u8 num_peer;
+	u16 free_logical_link_idx_map;
 
 	enum ieee80211_sta_state state;
 };
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 68431a0e128e..db1b098b67d0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6784,6 +6784,8 @@ static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
 		return;
 
 	ahsta->links_map &= ~BIT(link_id);
+	ahsta->free_logical_link_idx_map |= BIT(arsta->link_idx);
+
 	rcu_assign_pointer(ahsta->link[link_id], NULL);
 	synchronize_rcu();
 
@@ -7102,6 +7104,7 @@ static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
 	struct ieee80211_link_sta *link_sta;
 	struct ath12k_link_vif *arvif;
+	int link_idx;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
@@ -7120,8 +7123,16 @@ static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
 
 	ether_addr_copy(arsta->addr, link_sta->addr);
 
-	/* logical index of the link sta in order of creation */
-	arsta->link_idx = ahsta->num_peer++;
+	if (!ahsta->free_logical_link_idx_map)
+		return -ENOSPC;
+
+	/*
+	 * Allocate a logical link index by selecting the first available bit
+	 * from the free logical index map
+	 */
+	link_idx = __ffs(ahsta->free_logical_link_idx_map);
+	ahsta->free_logical_link_idx_map &= ~BIT(link_idx);
+	arsta->link_idx = link_idx;
 
 	arsta->link_id = link_id;
 	ahsta->links_map |= BIT(arsta->link_id);
@@ -7630,6 +7641,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	if (old_state == IEEE80211_STA_NOTEXIST &&
 	    new_state == IEEE80211_STA_NONE) {
 		memset(ahsta, 0, sizeof(*ahsta));
+		ahsta->free_logical_link_idx_map = U16_MAX;
 
 		arsta = &ahsta->deflink;
 

base-commit: 62f9b9b19939138c34ce0ac1e5d4969d617ecbb6
-- 
2.43.0


