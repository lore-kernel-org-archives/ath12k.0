Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE31C4707C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiii4WNJ08UCJ25Bg/Du3YqiS1dWKr9sCMUJz026c3U=; b=O6EaWd5P84NKfGf+cVmfhQ0t8q
	dwKb1NB1sJXpSDMrvZSrep7QRbjizFFx2w4B93Nt1j17ShcCRFS0oNtbXR91plShNllog/SvUK78e
	vU5CSxK/rj7Wg7enjNGVY7FTz0rNDQsYPVSz+wev25uuNwsEWl2OOrZy/SHt4hOPThycedw7JzJBI
	PVJYmItjrP+bjUaLTmy4TkhN4diWI27LqOCD7IPi4NXMwNwt9sUxOfMoxWbsoFa7Q010YMCO/W8a2
	dfynZ/0ykIYOCKMovdJ3UHuR/4xCbYK9pXQBSA/c5t/RjGE50iz32wJrrLfT/o1ObOyzv0dWnUY1R
	4n0Pq3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODqN-002Kf0-3C
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 09:28:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODqL-002KcY-0d
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 09:28:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C2vZAb009733;
	Fri, 12 Jan 2024 09:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=yiii4WNJ08UCJ25Bg/Du3YqiS1dWKr9sCMUJz026c3U=; b=KM
	H1YjhwgXYXcUho0BB1lQvBPmKGLpk2TJUzpAS00SCQfwvP0iohY5RvMD6ydz/Bdf
	agcU9ULA2mBnC5WvrUVY6nEaOxCq+teo482zLg/mJIMQfD9/By1OXke6yXCpDyM2
	+hXYixPpzDsn/5buVEcoUbLb91gl+DR2LmBwVifjAzem2/zDj9j4EjI0XE5V05Rp
	7NZcVB5ExNE2SQ82Y+oXsAKQTaGNXT1Y0TNdqvbEDoO1lGkARaOQ4Fe6UVvEja89
	HpMjMbYrDjtmpzpqFMf9GgRIVhfyTc5ualha+1oNIx3Qa85VksSt+8Pc6HRRR8Qk
	lxbqCeE0+L86yqacZZiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjv4js2bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 09:28:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C9Slte026701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 09:28:47 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Jan 2024 01:28:46 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 06/10] wifi: ath12k: allow specific mgmt frame tx while vdev is not up
Date: Fri, 12 Jan 2024 17:28:20 +0800
Message-ID: <20240112092824.7664-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112092824.7664-1-quic_kangyang@quicinc.com>
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jGQzOermFvhOyu24ABdtBG0kL0dBasa3
X-Proofpoint-ORIG-GUID: jGQzOermFvhOyu24ABdtBG0kL0dBasa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012849_351997_092AC5BC 
X-CRM114-Status: GOOD (  12.17  )
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

In current code, the management frames must be sent after vdev is started.
But for P2P device, vdev won't start until P2P negotiation is done. So
this logic doesn't make sense for P2P device.

Also use ar->conf_mutex to synchronize vdev delete and mgmt, TX.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v2: add Tested-on tag of QCN9274.

---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 92ba88d5e4e9..70726e810093 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4995,8 +4995,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		}
 
 		arvif = ath12k_vif_to_arvif(skb_cb->vif);
-		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id) &&
-		    arvif->is_started) {
+		mutex_lock(&ar->conf_mutex);
+		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
 			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
 				ath12k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
@@ -5010,6 +5010,7 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 				    arvif->is_started);
 			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 		}
+		mutex_unlock(&ar->conf_mutex);
 	}
 }
 
-- 
2.34.1


