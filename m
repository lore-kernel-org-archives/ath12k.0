Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF6C369A8
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=hxZk30Yv3pP9qiGAGv3wzzw0VR
	EU+AS6RDp6N8g9VTaPrhVfWFoqoCoIaw1uGMB4/sqbd/QRJt9/TNzdBL6yzS8Bg/AHg8yYI7mt8tX
	4iB0usP4qMy3lVj1bHRnGYwmgY2w0hptBuap30L1POI8/uQTqKWYLLTv/ZtdLvpila5IlJR+yx5LX
	wDkRCjcDMWd9UPKPHqGKjHFFZhCmqY2R/uIOssbP6a6e8dWLvdcZUYyt3vP4vkSIyk64Nnxn7IRFr
	j884vffFNyZL6OOBfDJSHmbtDOwjtzzurJc3uvCHzwtV5YgH6w0KeJnVwLLuJiPWKn4oIGRkUYSbB
	TlM17OOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hX-0000000CMUt-1sPr
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:05:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hU-0000000CMU4-47VM
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:05:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGBwLq028891
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=h1hfm8oW0bY8ZhOp
	Lzjq8PStgg9ygzN7KP43vPaSn0zlTsv6Ha+duW9QsKAbiJx1oHFTzFLLnCsFb00z
	jQvA1yAUj7xNmeiVSp1bkjg8F6egbLmqh5+sWIhewwSEm0Xui7lYhr14CvPZUu5Z
	FWu5B4eI4+JlvdmMW1m6IqW94mAuFOrwXK771rEGE2TZJiA8Yd8U6rcXEJZYxHCv
	a99JYey+YQZq5MgdFqEWkq3jpID/6c8zHC1nBR0r7C1kLPSD5RgFu+xLuozztneR
	MH1HAUn4V0Ro063lGCBz08MT79VXZhkPRnwZ0jjsy5gZg+Ne2VqSXa+61Ed7ADKa
	giFbtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus076-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af91804dd0bso1008126a12.2
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340703; x=1744945503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=;
        b=lAPckXGYW8KUhGVd3/6E2zG+TCSNDvTiuWl5Kd6/tWnEbrfp1o8XfvGCiM4bB1UnmG
         PjNDMPHfTra90uUS3YKurdCguCQbIRDY/tjW2vaCv1j3T/AfVIm/nEqGvKhLpabRDtEx
         aS76d1pILi+SheKAgSvMhbqqLwN0TnUGkkEy6QqwHn8yZ+qdSHjVsSlQgmymZ8LlaM7O
         qHbQ/Fo2sA+Oo8nZ7b4yNpiapxK+00S9qepFgGDCSiCDXDtAbAaW20D0mdAYoTWsPQZL
         /g8CmQapdpf0kj3aeNIjKA/t2K0ENfrtbF1EzxumV4VL1hXMAc9H4iLw3c2zDojKPwV+
         vNTw==
X-Gm-Message-State: AOJu0YwsL9UKRTQ4qddipcpTDCtw3JoZj2co6n5soHI0GFBkHFyRk8bQ
	EdHNVd0usgUXqexrWUvwyFcg6qrMok6tSYzXsd76NXiS5aBRiH7w7zp73cXIe+NL0mBvxpmW/cH
	vVXXPSynK2X2ltLcd61sdsCPof0rV/i6JwBYdAt+42V6h5jvMxfFPbNke4PZ+smwi8t0a
X-Gm-Gg: ASbGncvjME7diLtmLHPuol3wQDk42XzByim39w8Vflgy0pS65Nv/y4rtolv0QQzQG4x
	VVZZGnmLxW0AaUcB8Aua5KK0IOW+x2jKeq2lsOoRS8ZfXW20yHL3wfOkHo6zgXcrhtNgPCFyWc6
	eT7PfwdVPLDGEUioEDA3NpMIWvvVllgCZYEoan6Epg1LgQBbBdsVgyBnGwJ48M0S25z3Vb6P32S
	OnXlWZ3Rs2sSsV7jL7EaIQfUhJOFm9mLAx2Izodqr7CveaIkeywkHqHCU19OvxbC2hVF/7NT7DE
	Fzq+9Cf1s+Tzk5nwqdlhvgFJXBjzQELSzQ2J/B39WDT+qMVJqL6l+Cws8/i8pedQrlmwRJlxOp9
	vzp/josUOwj15bD7jblCjHW8j0gcgRj/O69B5
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr18742345ad.28.1744340702878;
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi1w9hqm7k0eeSxhd4/OeOCeNVskfPOWILNkPCEyraSrbb2rPO6sHpmLchCsf4OlCODFPSOw==
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr18741985ad.28.1744340702468;
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:34:50 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: handle scan link during vdev
 create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v1-1-07d8b4a5d19d@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZxIFpy0i-3wRGfZj9-ftsYl2IFFmx_Qt
X-Proofpoint-ORIG-GUID: ZxIFpy0i-3wRGfZj9-ftsYl2IFFmx_Qt
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f886df cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dhThNb0MqnHfOkfGsx8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_200505_027718_24A9D7DC 
X-CRM114-Status: GOOD (  20.07  )
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


