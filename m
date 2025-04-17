Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC59C369CA
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY4DrBghMwtTahQM4d6UO66pLjRLPs99V5LIXxHJ/Mk=; b=4gCV/P8wUyN+q3Oe7lcB8YSO/G
	LGra/K4xtVlqWltpyhnNODLLyDL8S1GjCL/oS/hWDzmVa8/XCjrs9AqyOJs4uqrPyJS55iboiJqVZ
	4Sx3xxB9RqLjBWsQHmw/rFRY1rYAbxJ5sMA1aKrhjP4vTBKIMq4W8LE/PHuh7aTi5DMGFjBjww4kz
	mBsh/dwf20z+6bw+pcMzVorJln15mKPjwa4U3U6BrOzaUjzbdzlleF5i6tVo0ZO4FB/DbuoyC5zGP
	FUIfnm7fvd7zIbd9YXznblkFO/9VRe3PM0lIKdfK95GisII4R7f1rmsvC5UTnPJzBPMrYHEct2Bct
	pn0551Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I80-0000000BouP-1cnO;
	Thu, 17 Apr 2025 05:49:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5I7x-0000000BotQ-15ov
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 05:49:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lBnN009563
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KY4DrBghMwtTahQM4d6UO66pLjRLPs99V5LIXxHJ/Mk=; b=RzBYpxgZ6A6zCPW1
	g9u2KchZIN9KHVRbJeboCC5g3UTaRRIClGaWIbGH45f2PV1xX3IzTWHX8ddMCdEL
	X7qhX1pEeOhGFUG3AOYMnO8VQSDaYwq0bFt/UFB4+EjN23qHOZSi0cB6xD7wHMtq
	X0xJzEQ7uNm5A0S4fQclue9N6Ykuw/dHU80emQ74qIOjYxQoKex9RKg7FswpPPB9
	nO6NakEBWWb63jVMe7XgCx8PWVKWupoEewL21hgMUeo3vaz29lUDtjrsuLGYyegx
	aJ/7G6l+PHDkJlXUalg5P6wF+cmZclC+FFE31aq8YTZUrfj4PLEeVNeXpkAfU7xJ
	B6qKeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvb2e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 05:49:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c35bafdbdso7496775ad.1
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 22:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744868971; x=1745473771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY4DrBghMwtTahQM4d6UO66pLjRLPs99V5LIXxHJ/Mk=;
        b=V86KgJTS3GskcGSeFzpA4eNH6YpyBs5rcWiAJJv8IcMDRMzKj7RVZJBzW0aOXRi6dG
         ZwJS3bj918vjNVqUN1UCIyZ9PAsKnimwOSYp+lEWZW0PkmlDEKO3yJqRrluOQv/9klfC
         mLbeQWITFWb/qQbU40nr4Xy7/fiuYMUNIIYEQCYqAU3Y278jCrHxYiRNu988VeEODQun
         MltXWyzFw7im9FRAWK5X8wmlCDkpGCtfpjJYj5+79Adlb9b1L19vLy+hgxg3pqadpzAX
         kGQVLtCAsZKcD/G/V/0iXqwxH5l5DdleeNPvxisdunHLOfvbqhW5jrYzVvtdgz1/4D0u
         0rJA==
X-Gm-Message-State: AOJu0YzrTryb+4BTrXaIdzLHYXdoYY31K1u7eGKV6DVkFmxVzl1s7/ee
	4MD+4ykJr2X0VXIslGYgFZEL1Ir0KUKIhnwVd4YfeMaOIRgQraaN9Cjy6tG+a0p9u3gzZ1sQv1P
	tWx0m8w09DaaDwXFb8w/bml7iZAFIrm1eTBauBOhcDuhD2DGlPAtIQ6bvuD2YyE75qse5
X-Gm-Gg: ASbGncuVl8nuV2aVnIW+2bOklZvCRdZHgWt7tJ5CMjo8eDhZPHPA+U3iegQcEbVKTf/
	j9wsC3T39aRO0XlCmzRETUo7qmpEzwpkljuCukbTfbhJYXM68E3IoYURhJs/1kHbxZdbXkgmGA7
	92eG2BMGF4kzEX8lBE5ZWazt/6fHSJH6arJQTu+jv/rdI805/qcupXbGx0beIPsiuCnZTV+TT/8
	G+sniBlk3+jJeOUOvqxMmpib3TukY36vmAMS9l0/MkFoVSYZOkxcsd/v2OdiEnXWH5BENug9t1i
	SuBQUny6b4ce5f7I0fOT6Pd7G4/93G/Rzux2AwNcJpgdkYWNW2hDVHLZT8Y2TtWIFQC6A783J+C
	Wuy346Tnx59w8E/P16HxA/gLKwetbpVv+5LWp
X-Received: by 2002:a17:902:e5c3:b0:224:f12:3734 with SMTP id d9443c01a7336-22c359194d0mr63687045ad.30.1744868971456;
        Wed, 16 Apr 2025 22:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgUIRYQK9CQySZDLp9fCj9zmVxHD4QcP7G3RLpCYsbt/OVETw+o1p5ug4k3wOR1o29Qii2YQ==
X-Received: by 2002:a17:902:e5c3:b0:224:f12:3734 with SMTP id d9443c01a7336-22c359194d0mr63686895ad.30.1744868971092;
        Wed, 16 Apr 2025 22:49:31 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc47e0sm24745715ad.167.2025.04.16.22.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:49:30 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 11:19:13 +0530
Subject: [PATCH ath-next v3 1/2] wifi: ath12k: handle scan link during vdev
 create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-fix_scan_vdev_handling-v3-1-9ec42513d26b@oss.qualcomm.com>
References: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
In-Reply-To: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: h4J5GAnRA9CIZgMh8zLFggvyo5dSJIzb
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6800966c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dhThNb0MqnHfOkfGsx8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: h4J5GAnRA9CIZgMh8zLFggvyo5dSJIzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_224933_305831_1CBA5BC0 
X-CRM114-Status: GOOD (  19.86  )
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

For scanning purposes, the driver can use link ID 15 (scan link). A future
change will make non-ML interfaces to select the scan link. In this
scenario, arvif->link_id will be used to retrieve the link configuration in
ath12k_mac_vdev_create(). However, link ID 15 is not recognized as a valid
link ID in the upper kernel, which will result in a failure to fetch
link_conf and subsequently cause the scan to fail.

To avoid this issue, ensure link_conf is fetched only when the link ID is
within the valid range. Since link_conf cannot be retrieved using the scan
link, use vif->addr as the Ethernet address for creating the scan vdev.
This address will serve as the source address (address 2) in the probe
request frames during scanning. Additionally, use the automatic Tx power
value for the vdev. As this is a scan vdev, these values do not affect the
scan functionality.

Note that vif->addr will only be taken when a valid link_conf can not be
fetched. Otherwise, link_conf's address will be taken as address 2.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfc803879028deaa0bb02ced892238086b2687c9..d219c5b07a79c9829a1de12183e298d24eb5336a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8310,7 +8310,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
 	struct ath12k_wmi_peer_create_arg peer_param = {0};
-	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_bss_conf *link_conf = NULL;
 	u32 param_id, param_value;
 	u16 nss;
 	int i;
@@ -8325,22 +8325,21 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	if (vif->type == NL80211_IFTYPE_MONITOR && ar->monitor_vdev_created)
 		return -EINVAL;
 
-	/* If no link is active and scan vdev is requested
-	 * use a default link conf for scan address purpose.
-	 */
-	if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
-		link_id = ffs(vif->valid_links) - 1;
-	else
-		link_id = arvif->link_id;
+	link_id = arvif->link_id;
 
-	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
-	if (!link_conf) {
-		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
-			    vif->addr, arvif->link_id);
-		return -ENOLINK;
+	if (link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
+		if (!link_conf) {
+			ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
+				    vif->addr, arvif->link_id);
+			return -ENOLINK;
+		}
 	}
 
-	memcpy(arvif->bssid, link_conf->addr, ETH_ALEN);
+	if (link_conf)
+		memcpy(arvif->bssid, link_conf->addr, ETH_ALEN);
+	else
+		memcpy(arvif->bssid, vif->addr, ETH_ALEN);
 
 	arvif->ar = ar;
 	vdev_id = __ffs64(ab->free_vdev_map);
@@ -8495,7 +8494,11 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 		break;
 	}
 
-	arvif->txpower = link_conf->txpower;
+	if (link_conf)
+		arvif->txpower = link_conf->txpower;
+	else
+		arvif->txpower = NL80211_TX_POWER_AUTOMATIC;
+
 	ret = ath12k_mac_txpower_recalc(ar);
 	if (ret)
 		goto err_peer_del;

-- 
2.34.1


