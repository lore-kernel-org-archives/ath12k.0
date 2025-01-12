Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBD6E7719D
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjkwfhmIjLEH6BAgFacNFEG1wm15qvrmIFEdQYiMfAw=; b=zLf58nyA4Glmv+aWqQC+S7NcTe
	oScQKFI7HvcFnaKIjdbSVKbjhS8gTOXtOAb1YFb400OyCQOp4P9To+ilZmrHBe8K26shhJ+iVHUke
	jV3yB2fffsY6XVC6CTvqWHJZDlGd9+RJGS2v2MStX3FPFQ5i4UOIBUCU2Z8euDKarWitzpbhQGwIW
	7o99Fhm2vNDo56TxLYcyS5ECCBbWSQefUe7OzxuBvr7qc+XpHQE37fmVZUjXk8Pnvxuuuj0S80v4M
	qe1qDJkbOMmF8bZAE34jwSgZFMPA/xqR57E7Llf98DIoLZ/a7DmPeY1JigSvEJoGvIuOv6l7W0cR+
	mXN7TKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDR-00000002Dfs-1yFI
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 07:16:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDO-00000002DeV-428u
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 07:16:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C3t2LI004703;
	Sun, 12 Jan 2025 07:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjkwfhmIjLEH6BAgFacNFEG1wm15qvrmIFEdQYiMfAw=; b=fk4MJIRO1SIYBpws
	uUqGvZPIvhU5dz4ZoixwnEBGP60LblE4aCQd0VYC6ZJNsmadXkXhj/BqoGrYqX+9
	QTMpCmVQ/w9MGlmoW1nGGggcP/EJ2lTMf6duDMYVkA3eJBWRpAFLzhjOv2hpS4q+
	UnIJJZav6SbJbcLM+SHyuclolBxwmpUQ+dW3Gobz6PAXeIxW92Sxi+Oidm8AMTnG
	hTE7CPHjk0w83g5qTOTaadDeJGu49RY5wHYrLZHmQwOaWtsQd5ziN7oQJj9WxJh0
	onmSXE6c4Dc4DekfBNSGhA8m2UetrRf0jl7HKSEaNU0zDvrCVClK5l9jhBm5MQR2
	b/J8Yg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hjdhpv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C7GrQ2006021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:53 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 23:16:51 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH v4 4/4] wifi: ath12k: Fix uninitialized variable access in ath12k_mac_allocate() function
Date: Sun, 12 Jan 2025 12:46:30 +0530
Message-ID: <20250112071630.4059410-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3OjYVaAlCncikyASuqEqeauADbqSb_q4
X-Proofpoint-GUID: 3OjYVaAlCncikyASuqEqeauADbqSb_q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_231655_005220_C45BB55F 
X-CRM114-Status: GOOD (  16.70  )
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

Currently, the uninitialized variable 'ab' is accessed in the
ath12k_mac_allocate() function. Initialize 'ab' with the first radio device
present in the hardware abstraction handle (ah). Additionally, move the
default setting procedure from the pdev mapping iteration to the total
radio calculating iteration for better code readability. Perform the
maximum radio validation check for total_radio to ensure that both num_hw
and radio_per_hw are validated indirectly, as these variables are derived
from total_radio. This also fixes the below Smatch static checker warning.

Smatch warning:
ath12k_mac_allocate() error: uninitialized symbol 'ab'

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 08f340afb970..af614b301c61 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11383,8 +11383,20 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	u8 radio_per_hw;
 
 	total_radio = 0;
-	for (i = 0; i < ag->num_devices; i++)
-		total_radio += ag->ab[i]->num_radios;
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_mac_set_device_defaults(ab);
+		total_radio += ab->num_radios;
+	}
+
+	if (!total_radio)
+		return -EINVAL;
+
+	if (WARN_ON(total_radio > ATH12K_GROUP_MAX_RADIO))
+		return -ENOSPC;
 
 	/* All pdev get combined and register as single wiphy based on
 	 * hardware group which participate in multi-link operation else
@@ -11397,14 +11409,16 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 
 	num_hw = total_radio / radio_per_hw;
 
-	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
-		return -ENOSPC;
-
 	ag->num_hw = 0;
 	device_id = 0;
 	mac_id = 0;
 	for (i = 0; i < num_hw; i++) {
 		for (j = 0; j < radio_per_hw; j++) {
+			if (device_id >= ag->num_devices || !ag->ab[device_id]) {
+				ret = -ENOSPC;
+				goto err;
+			}
+
 			ab = ag->ab[device_id];
 			pdev_map[j].ab = ab;
 			pdev_map[j].pdev_idx = mac_id;
@@ -11416,10 +11430,11 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 			if (mac_id >= ab->num_radios) {
 				mac_id = 0;
 				device_id++;
-				ath12k_mac_set_device_defaults(ab);
 			}
 		}
 
+		ab = pdev_map->ab;
+
 		ah = ath12k_mac_hw_allocate(ag, pdev_map, radio_per_hw);
 		if (!ah) {
 			ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
-- 
2.34.1


