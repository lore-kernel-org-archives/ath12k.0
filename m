Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8141E7717F
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ktBAWct96S9fIp8SK/v2LJzzKjMOBuyw6DeKNeU8CE=; b=ZxbdDXRp5pPVgSdzxfRGM9/G0L
	QpTu0+zdVAWEmdSRsCeWi9YHzwkHoTBeqa4NlIJnu3O7QklkjS9M273kbn2SAELUCMZoxklidpaxa
	O2P2922VRvvq7RR7lKMTloXvG2TEnlWTg5H+5QZxkUH3jzeXZQS/27L4PuiMJEoTjJMtFDI8bihIu
	DbuXabC5VESfHKvOwJxbfQlZZeXBBREjknnM7qvr2+GzFSg+0G4SM6NYVwj0TuqZq8tQowgsROgy+
	IENL/rl7FGFJ4xZa7pjIaSIFGPa4Vb739x+AS53r4gudOm9lP8IAEBgqxQ2wZVe3NauyOSmYgqdD5
	nem4983Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKTil-00000006DbE-2Rv8
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 02:42:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKTij-00000006DaT-0rwD
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 02:42:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8MK1qg022735;
	Mon, 9 Dec 2024 02:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ktBAWct96S9fIp8SK/v2L
	JzzKjMOBuyw6DeKNeU8CE=; b=girPbniKiviosvBHko8L/4bsNTyjP5SfxB+kzz
	c/TDxbQSl///Be4zetS9kYGqxOlcqAWwBll9u2w9NmA4yoyXyerRqi1Pk/sCZtcG
	SfJgajOzOo7rP2UA0ZuXPW8u1VlHLjPMyAXOYkm/rWjJ0ZLjCiA3Is/hcxUtZauB
	md0RJvggCEXtE5+oSX5CoFTKhhKucZu0Iw0o26L4fGJ5OAm7xfK0x5PKNYROsIQA
	vhEGxBBUwf5mHG22fYZBtqF6CP2XKhkM4PJ25q6k9GUvUzvHOWQReGnYmmRfFBEw
	xFjZdMG7G9y9bAWxeRkhCi5PKuam26FLcNyNylj2UsRV+YSA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgk52k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 02:41:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B92fwUA024931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 02:41:58 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Dec 2024 18:41:57 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: use link specific bss_conf as well in ath12k_mac_vif_cache_flush()
Date: Mon, 9 Dec 2024 10:41:46 +0800
Message-ID: <20241209024146.3282-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O6Mw8q3eumhi75wDSXAKEEzuH-nMt4av
X-Proofpoint-ORIG-GUID: O6Mw8q3eumhi75wDSXAKEEzuH-nMt4av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_184201_372440_579FA139 
X-CRM114-Status: GOOD (  12.31  )
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

Commit 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of
bss_conf") aims at, where applicable, replacing all usage of vif's bss_conf
with link specific bss_conff, but missed one instance in
ath12k_mac_vif_cache_flush(). This results in wrong configurations passed
to ath12k_mac_bss_info_changed() when the link in question is not the default
link.

Change to use the link specific bss_conf to fix this issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c4eab4c1c10e..629ce22f727a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7973,6 +7973,7 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ath12k_link_vif
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_vif_cache *cache = ahvif->cache[arvif->link_id];
 	struct ath12k_base *ab = ar->ab;
+	struct ieee80211_bss_conf *link_conf;
 
 	int ret;
 
@@ -7991,7 +7992,13 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ath12k_link_vif
 	}
 
 	if (cache->bss_conf_changed) {
-		ath12k_mac_bss_info_changed(ar, arvif, &vif->bss_conf,
+		link_conf = ath12k_mac_get_link_bss_conf(arvif);
+		if (!link_conf) {
+			ath12k_warn(ar->ab, "unable to access bss link conf in cache flush for vif %pM link %u\n",
+				    vif->addr, arvif->link_id);
+			return;
+		}
+		ath12k_mac_bss_info_changed(ar, arvif, link_conf,
 					    cache->bss_conf_changed);
 	}
 

base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
-- 
2.25.1


