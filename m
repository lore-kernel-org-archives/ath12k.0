Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263E3E77188
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rE9EtEQzv33/K9WiKV7OmyHBJiUvIKl7ximc6ShfFv8=; b=ILz2Sgn1jpC2qOiSMRAeC2YmgO
	c40mLxmguKyA7eo40j5hWzqRXRhGSuj1DVV+Ce/J6ErSmqrJqBumKi8el8bjrQ9bxPBKRABMkl/da
	wK6OWT7aOWlMh/zhrFaaMUlN2PXhebEj7u211m2NSU2Gh1V+Gf/Cz41fqsUj4tz+pc0oO13eJ+SSg
	FbQy8Ix2R+lxbPREz2A5CVt8mje2Ggo1peS6xUJ7feMsMsJ8gorpv3IMzCkf0ZLU6IgGPs0KKfriW
	6eQsrSLZYUTzT9pPXZZfmKZJP2OOhi/EVShBNpC9J6s9dHr8PMm8ETsBXMtEBVR5p0YbzdgPneGCN
	knriwTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWqua-000000028sq-34vM
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 05:53:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWquU-000000028s8-1dEh
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 05:53:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C4tIi2020754;
	Sun, 12 Jan 2025 05:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rE9EtEQzv33/K9WiKV7Omy
	HBJiUvIKl7ximc6ShfFv8=; b=O+QxPkbrJxqH4SaB9ugkEhKU+vtveaNKK8/QVk
	EPus8dRQehwMFDg8/4dIRiJ177GUaj/wfRqcoC+zUtwUu6QQ5h6IuDKJsm94H4Gi
	GPnYW2xbCy35ftva+1XTxpIDfk2hfDN/s3y5qJcohQz2Mlc1ieazRtShp4FRkSTR
	Dhk0Gj/CCfudcf8EhOWI3AxDuTatN9/JpQbghUkI+IXO1F6nhFzB51OBQgQxleU1
	aVDPPnFB+P3XYVCEG/9JoKRUK1iDDk/Oyzey5KwBlZiz7ud9XLfQojG+XcWtXGIp
	3An+8TK4X2qmKedBB8BJvFMQb5VfVtgntSenRAYYadnQ/dyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkj9m0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 05:53:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C5rDdB026255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 05:53:13 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 21:53:10 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Sun, 12 Jan 2025 11:23:00 +0530
Subject: [PATCH v2] wifi: ath12k: fix key cache handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALtYg2cC/4WNUQ6CMBBEr0L225puCUT98h6GkLJdYKMWbZVIS
 O9u5QJ+vsnMmxUiB+EIp2KFwLNEmXwGsyuARusHVuIyg9Gm0ohG9fJpr7y0ZGnkNlfcTfygsDM
 lal132FeQx4/AubmJL03mUeJrCsv2M+Mv/aucUaGy9lgZciWV9eH8fAuJpz1Nd2hSSl/C6n95v
 gAAAA==
X-Change-ID: 20250112-fix_key_cache_handling-1b231006b1f5
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hiQxdz3Ir6eDcKEEaGBK2fjuySzlSkfm
X-Proofpoint-ORIG-GUID: hiQxdz3Ir6eDcKEEaGBK2fjuySzlSkfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501120049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_215318_951501_CCE0CE72 
X-CRM114-Status: GOOD (  19.57  )
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

Currently, an interface is created in the driver during channel assignment.
If mac80211 attempts to set a key for an interface before this assignment,
the driver caches the key. Once the interface is created, the driver
installs the cached key to the hardware. This sequence is exemplified in
mesh mode operation where the group key is set before channel assignment.

However, in ath12k_mac_update_key_cache(), after caching the key, due to
incorrect logic, it is deleted from the cache during the subsequent loop
iteration. As a result, after the interface is created, the driver does not
find any cached key, and the key is not installed to the hardware which is
wrong. This leads to issue in mesh, where broadcast traffic is not
encrypted over the air.

Fix this issue by adjusting the logic of ath12k_mac_update_key_cache()
properly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: 25e18b9d6b4b ("wifi: ath12k: modify ath12k_mac_op_set_key() for MLO")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
Changes in v2:
- Add 2025 Copyright
---
 drivers/net/wireless/ath/ath12k/mac.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 48d110e2a7ded61c4094b0ce7e5bbb50b94d5cd4..2cd94405606f4236b3a18f8a42e53cecd5931e4a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -4657,7 +4657,23 @@ static int ath12k_mac_update_key_cache(struct ath12k_vif_cache *cache,
 				       struct ieee80211_sta *sta,
 				       struct ieee80211_key_conf *key)
 {
-	struct ath12k_key_conf *key_conf = NULL, *tmp;
+	struct ath12k_key_conf *key_conf, *tmp;
+
+	list_for_each_entry_safe(key_conf, tmp, &cache->key_conf.list, list) {
+		if (key_conf->key != key)
+			continue;
+
+		/* If SET key entry is already present in cache, nothing to do,
+		 * just return
+		 */
+		if (cmd == SET_KEY)
+			return 0;
+
+		/* DEL key for an old SET key which driver hasn't flushed yet.
+		 */
+		list_del(&key_conf->list);
+		kfree(key_conf);
+	}
 
 	if (cmd == SET_KEY) {
 		key_conf = kzalloc(sizeof(*key_conf), GFP_KERNEL);
@@ -4671,17 +4687,7 @@ static int ath12k_mac_update_key_cache(struct ath12k_vif_cache *cache,
 		list_add_tail(&key_conf->list,
 			      &cache->key_conf.list);
 	}
-	if (list_empty(&cache->key_conf.list))
-		return 0;
-	list_for_each_entry_safe(key_conf, tmp, &cache->key_conf.list, list) {
-		if (key_conf->key == key) {
-			/* DEL key for an old SET key which driver hasn't flushed yet.
-			 */
-			list_del(&key_conf->list);
-			kfree(key_conf);
-			break;
-		}
-	}
+
 	return 0;
 }
 

---
base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
change-id: 20250112-fix_key_cache_handling-1b231006b1f5


