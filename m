Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0340C369A2
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=Ywg69spjqOZhgNDj0cI2kv993w
	5Pc1lQFvRSLA3iGR9lQO859Ujym2/o3aTYMqzryOlaUqUjM+nJfu35726XJesQqRfw5hTd/alV2uk
	MTzmDslJObBlIWwbwQDp2DBtyk0wGdSZe/qMILdAG7bRWyv1BiKpfKMDzvscCXCEQvZrbcxfA8HIf
	XPvzSUC+UInWCtFunkZoeYoprEFFD/OnqXNMQlgvLBxycHVw8R4qFkcHVhORU5fL8R09/NR08QDyV
	/haAWUxSMJ2T3CYEJY+2ERvxoT+pcFeNd8A69qhrDg2mhTtzUWH+qi7A35+aOkXGWV3/OJKvS40Mh
	teTZDRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tG-0000000CNZK-1XqI
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:17:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34tD-0000000CNYA-3qkB
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:17:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGFkp6031989
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=LZrxuX0mkrT66RKY
	euntjvxIJFfvllFzOP9S9odHEBTcYmSKl3IMWFLkrMQIytrMwA9PzYP7knYNuicu
	vW89eVGbPnxQDA1qMIRNFeyyAdjjLYVtesrU2tOOyYN2AOBt5dqFZrGkM8o7QeHH
	WRA1o9lFi5EnIG2gACP1IKdbeSiXNj6ieKsgRMYC2gQjLAv2ZMnDoP2WKAat03bW
	PXF8xFanaJbBzrzZE7Kjc+yLJ316PTI3WAtXyxi1a5NVT5zRAFgAwFIOEHAJtAPM
	H1lY91IrialsGjRvQ4MmHepvSPejsVp2nOjX9UL2lmUUBUp+2fKpBuHd0I80qAiw
	EjP1gA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmgwtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:17:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73917303082so1007556b3a.3
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341430; x=1744946230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=;
        b=PWyIgcfN/OU9YhXmiJp986nqmowgLG/a9TrdEzGPEGcG75ayBlWiSlpcyZqZG0V6Hq
         xGu4PHlslnI/fLCKZ1OxRHVBexd9l9lUQeI2XSv914HNA6gXFquQPi3ZEOW3LWRTJVWJ
         PyEAW6hCbOtUbfxXqigOBFqW76xCyifEA4+1w8KvDUelY79AbvzzYWowQIY/zAIqnMMG
         TeSR63lufL+0KG6+FGYj4tWBkWVSZTIldPny700Z26dfgPuVPqHaBbwt9BiN0pxU3A0a
         d8gP4mUHPgVgA7ya5Goqop7C6beUJV5ZpSk+ytCTMAley2bJ0+8cGAIP1igsq1v9V4wO
         hzYw==
X-Gm-Message-State: AOJu0YzD/ukgEyMfxiTxCDxX43BTke7qmRY+3ljmw5ENStlZlNsxr2jX
	IsOlQ/jnbYHxEAzDOb9xFHetJH/W1ykpPybZ+NXrIX45e+ysAeOYIIwWt3K8FkcrIxyHB0o/OVq
	veui8ko3OIBerTGAbHKll11amr3bTsXbxhUxFKc6TCS8a3T8J8WEdhMrJfBWM
X-Gm-Gg: ASbGnctILt27MDte6+4P1QzlJBApr7IBBkMk018ZWDV0VTDghZ8QQJJyT1C30QXGx55
	P8SHB4r19+SgHMESbkLcpe3464b/7rdi3D/og5oZ+xuFLQzQvdjezc3JYqAc3oQ8vMKJKqcJzO1
	08jsd0C2ibT1VQN3Q8JmpsmsBGbh22a3CoESN02HJU3u5aFZEp3QtKpFO/3ATr21/SSOOgsROcp
	tr2bi+apnWBpupskpNc6LajGGxQYbKaX8aVAqGfeSHh9dk59BhJ6azdkX2Zu2pIEd9AupgnUahn
	a847M8TJ3/p/+F5w13oXJg41S206bJPHjtubv1HwPwRa64xsRtguzW/TUVG8zOqLd6I9wWv+SZS
	RCUvMgkJFVLERxhYzhTU8mT4HuViFDg57EinU
X-Received: by 2002:a05:6a00:3d46:b0:736:3449:f8ee with SMTP id d2e1a72fcca58-73bd1193f28mr1737611b3a.4.1744341430367;
        Thu, 10 Apr 2025 20:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi0HzPvSIWm/WQrPo31ro0odwbR+LeVRbT3dzfT6QZHjgcjYc627VQX6jONmjKszmxKzGiow==
X-Received: by 2002:a05:6a00:3d46:b0:736:3449:f8ee with SMTP id d2e1a72fcca58-73bd1193f28mr1737571b3a.4.1744341429839;
        Thu, 10 Apr 2025 20:17:09 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:09 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:51 +0530
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: handle scan link during vdev
 create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v2-1-b6740896c144@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: YF8-paXj-hIA9Kvg2DKYm_Vp-5dszLZt
X-Proofpoint-ORIG-GUID: YF8-paXj-hIA9Kvg2DKYm_Vp-5dszLZt
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f889b7 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dhThNb0MqnHfOkfGsx8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_201711_954292_79A77562 
X-CRM114-Status: GOOD (  19.80  )
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

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11a8a5f5733352826c724c671fd49a..4b3469380fb46a629fad7a9a40a44e761ef33fa5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8262,7 +8262,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
 	struct ath12k_wmi_peer_create_arg peer_param = {0};
-	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_bss_conf *link_conf = NULL;
 	u32 param_id, param_value;
 	u16 nss;
 	int i;
@@ -8277,22 +8277,21 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
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
@@ -8447,7 +8446,11 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
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


