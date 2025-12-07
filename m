Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC0D2CE17
	for <ath12k@archiver.kernel.org>; Sun,  7 Dec 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tu1DR8dtdPHs8QCR0wAB9LbfGycgG0Ld/Qas8hKG2vU=; b=ybDs2Wz8NLITfmVRCpeqAeYYMt
	89FNcL3L0syBgFxJxRIoJqiMfUIXeuY3Nh/D3NJfPbBqqft/7GR5/w/3CewNbylLzVrCJyKinFVWC
	UfEU3IvmebJ+BznRMd9RExMrMkrkjQywy5Dtjcm48vqqrR2m8J7mMeVNdUaIHgTDriVsyBgi5bHls
	r5ZluPZ2MXzXMzsRrnFYdDMTIo4GlFgbTyT1leqLFeAaOUKfGFqLM4nZVzIeXlkWZDOqzh16cB2i2
	iSCBnUbMlonAMQzuU9oMCwJ2VWER9GBr1f+vDbObd0XA1efH29JeseBFGQi3y6/83sAI1FqFCDy1m
	u1aFfdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS9Bi-0000000BYrc-32M6;
	Sun, 07 Dec 2025 07:28:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS9Bf-0000000BYr8-1Rgt
	for ath12k@lists.infradead.org;
	Sun, 07 Dec 2025 07:28:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B72s2tp950701;
	Sun, 7 Dec 2025 07:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tu1DR8dtdPHs8QCR0wAB9L
	bfGycgG0Ld/Qas8hKG2vU=; b=eTMU09FJcHxCyVovzdsV6hd33dLW/P+AwBIg0i
	WtZ7H0fiQ4CbL3+43tdYxawbhlbP5Dxf36tpfjX87FU3MKx5hFijOHkryv3cfQdw
	3zIc2eRlXeG8L59N8RbE7Z3p2/Zz8rhtxwoQ7nnkcFtO90hHJ786MVdLTo0JHIYW
	ae0dHuStqHgMf95hfYU4K4SvvD59tT67YO5cH+Y3a6zctBkzk4exiKa8GR41bFnc
	2I4MJ4RAwbiouOGpPBR9j4vHc0V4kX633cb9wO9RX98B9J9TMFxm0ZEgKu6HVYUr
	R6dx9j+SJy8dSrahoXSKAvPcB6XWTlhiQuMTvM3DsyL729Ng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcndt38h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Dec 2025 07:28:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B77S3UV004176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 7 Dec 2025 07:28:03 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 6 Dec 2025 23:28:02 -0800
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng] wifi: ath12k: Skip DP peer creation for scan vdev
Date: Sun, 7 Dec 2025 12:57:17 +0530
Message-ID: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zce2ZoTNgt17XqMNl_AMO9zfzqIurapD
X-Authority-Analysis: v=2.4 cv=baJmkePB c=1 sm=1 tr=0 ts=69352c84 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=wIFjEMXumgJnCK9oOwUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Zce2ZoTNgt17XqMNl_AMO9zfzqIurapD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA3MDA2NSBTYWx0ZWRfX2HSXzExcV3th
 BYQwwON6bRR6AhrC/gplBQSE28a0Ufvdx8bXX00aDrc3A4M7U4Y0TAU3n3GW97LYupVD1FC+mt4
 zdNcRPUqAWuyAHWguyuRHdRWi7XTGJAjMAJ9C+2JP4+bfLZv9RUE6DXYumcNmL2mQyK8GVE37Mf
 zXWgIWVGNXQ3XTQLFPVPigqVRjVNNtWzZQixCBrvTwPe4p8u6dyU/9fzKmst8k8FOtnUaFld8+E
 DP/1qwVvOs9OCL84DFxHUygJuuxak9TN6+qeo+0v2W2F2d/CcFTvOMx0wAOgJcerYvycg61rDLd
 4AOF1/wGKkKgHwy7wlh59dFvJgmFANNqsG+bTJWfXNPH0eDxNLcAO2q+CChn136c+p334EDEEod
 t2sspGIgwOGswAKOvabg8Klwujt8Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512070065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_232807_519940_D16B9935 
X-CRM114-Status: GOOD (  14.06  )
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

Consider a multi-link AP configuration:

    MLD vif (MAC addr: aa:bb)
        |-- 2.4 GHz link (BSSID: aa:bb)
        |-- 5 GHz link   (BSSID: cc:dd)

For AP vdevs, ath12k creates a DP peer using the arvif's BSSID and stores
it in dp_hw->dp_peers_list. During scan operations, the driver assigns an
arvif to the scan vdev and uses the vif's MAC address as its BSSID. In
the above scenario, the scan vdev MAC address (aa:bb) matches the BSSID
of the 2.4 GHz AP link, causing a duplicate entry in dp_hw->dp_peers_list
and leading to scan vdev creation failure.

Failure in vif bringup sequence:
1. Create AP vdev for 2.4 GHz link:
   - Assign arvif with BSSID = aa:bb and link_id = 0.
   - Create DP peer with address aa:bb and add to dp_hw->dp_peers_list.

2. Create scan vdev for 5 GHz link:
   - Assign arvif with BSSID = aa:bb (same as vif MAC address) and
     link_id = 15.
   - Attempt to create another DP peer with address aa:bb.
   - Operation fails because aa:bb already exists in dp_hw->dp_peers_list,
     resulting in duplicate entry conflict.

3. Delete scan vdev for 5 GHz link.
4. Create AP vdev for 5 GHz link.

Since DP peer is not needed for scan operations, identify scan vdev using
arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS and skip DP peer creation
and deletion.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c  | 22 ++++++++++++++--------
 drivers/net/wireless/ath/ath12k/peer.c | 12 +++++++-----
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3649f58fef84..42e750376926 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1229,7 +1229,8 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 	/* Delete all the self dp_peers on asserted radio */
 	list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
-		if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		if ((arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) &&
+		    (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)) {
 			ath12k_dp_peer_delete(dp_hw, arvif->bssid, NULL);
 			arvif->num_stations = 0;
 		}
@@ -4031,7 +4032,8 @@ static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
 			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
 				    arvif->vdev_id, arvif->link_id, ret);
 
-		ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
+		if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)
+			ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
 	}
 	ath12k_mac_vdev_delete(ar, arvif);
 }
@@ -9720,6 +9722,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	u8 link_id;
 	struct ath12k_dp_link_vif *dp_link_vif = NULL;
 	struct ath12k_dp_peer_create_params params = {};
+	bool dp_peer_created = false;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
@@ -9805,11 +9808,14 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	case WMI_VDEV_TYPE_AP:
 		params.ucast_ra_only = true;
 
-		ret = ath12k_dp_peer_create(&ah->dp_hw, arvif->bssid, &params);
-		if (ret) {
-			ath12k_warn(ab, "failed to vdev %d create dp_peer for AP: %d\n",
-				    arvif->vdev_id, ret);
-			goto err_vdev_del;
+		if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+			ret = ath12k_dp_peer_create(&ah->dp_hw, arvif->bssid, &params);
+			if (ret) {
+				ath12k_warn(ab, "failed to vdev %d create dp_peer for AP: %d\n",
+					    arvif->vdev_id, ret);
+				goto err_vdev_del;
+			}
+			dp_peer_created = true;
 		}
 
 		peer_param.vdev_id = arvif->vdev_id;
@@ -9925,7 +9931,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	}
 
 err_dp_peer_del:
-	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP)
+	if (dp_peer_created)
 		ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
 
 err_vdev_del:
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index c2fb5bbd6cea..5f3bd3b9a3e9 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -241,11 +241,13 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 	spin_unlock_bh(&dp->dp_lock);
 
-	ret = ath12k_dp_link_peer_assign(ath12k_ab_to_dp(ar->ab),
-					 &(ath12k_ar_to_ah(ar)->dp_hw),
-					 arvif->vdev_id, sta,
-					 (u8 *)arg->peer_addr, link_id,
-					 ar->hw_link_id);
+	if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		ret = ath12k_dp_link_peer_assign(ath12k_ab_to_dp(ar->ab),
+						 &(ath12k_ar_to_ah(ar)->dp_hw),
+						 arvif->vdev_id, sta,
+						 (u8 *)arg->peer_addr, link_id,
+						 ar->hw_link_id);
+	}
 
 	return ret;
 }

base-commit: a1e19289932aeef26085feb97597d624da6302ab
-- 
2.34.1


