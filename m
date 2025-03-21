Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB261C28B30
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 01:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZkanKkLeMm6zSZhEdPwL9AeMOk6nmlwmWL5HpmB02Y=; b=NZ1MrGD5E2Aj302EQFhQ4Km+UZ
	dxhwi/1IDy7aNDHnEXVsYEyD6Vag1lJ6jlE1IaYOO8rZ7A+e3Bz4XXoV+EKKF2iWEJ7wUVLn0R6A0
	FWK14MQu85X7ZJopcuUfyqTayrGEOT9TraCrN9ApzVUQjkn8cPoHjOS72w4QjBpDjGqyPpKl3rD67
	6Y7HWg1JzqNe/0rxadG1gWJErKJ7uQtpbGbuCUyMcJBpg5LhrxqJ5lnQZq8678D1KEePOXXmLyd5R
	OPMkuDrc0MhLYdaKwqtKbfOoNnLBdl3CV493rB7W0EmXQCGLi2nM0+3GD/4YroSvkm4KGiYZ6XOjQ
	YPKTnAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvRT5-0000000DeiT-2pXb
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 01:46:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvRT0-0000000Dei1-2UH7
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 01:46:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1Wd22010236;
	Fri, 21 Mar 2025 01:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TZkanKkLeMm6zSZhEdPwL9
	AeMOk6nmlwmWL5HpmB02Y=; b=UpO/J9caj7uVcjvXQY0iKYmxdDZB+VIdgX9CQ7
	YoAPO+CdWuILhSsy1Ot9lYoJdDCYtFuwJDyfkK32hZ+t6LJhR7LVfVbwiZkdgAyD
	s+vAba+YFzJMsu+v5fHjQfLTa/2cxtvwAQMA1MxJfJGoxoiVDiV4MV2SoecHIOLQ
	h7s1vfJgoBcx7fnKYj4OAjO+GJD2v/eNbHMmp7ZoFlb3DSY65PXIRT/yQ9SGkzf7
	KC4rukF1XSnKaj9fsN5cIb80PIetEeCslLAMSiyk07ZBygckW0KIgVWznNaBtm3N
	AB6VmA1wmPk4Fv1oKJbAhqnkl8yx+fIiVg2ZJkQtalfmprQg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kghcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 01:46:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L1kSba002944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 01:46:28 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Mar
 2025 18:46:26 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 21 Mar 2025 09:45:53 +0800
Subject: [PATCH ath-next] wifi: ath12k: don't put ieee80211_chanctx_conf
 struct in ath12k_link_vif
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANDE3GcC/x2N0QqDMAxFf0XyvEAarYP9ythDqXEGoUqbSUH89
 3V7PHDPPScUySoFHt0JWQ4tuqUG7tZBXEJ6C+rUGJjYU88Ogy2OV5y2ZLh/DH+raBU1YciHzui
 JBj/c48jkoN3sWWat/8QTmo1JqsHrur69hoi0fAAAAA==
X-Change-ID: 20250321-ath12k-dont-put-chanctx-in-arvif-5004547c6201
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m3a0AwRBFXoZxNKtbvo5WHfYONWJJZn7
X-Proofpoint-ORIG-GUID: m3a0AwRBFXoZxNKtbvo5WHfYONWJJZn7
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dcc4f5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pkFYjrFKJ6VnwjaiwVAA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=736 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_184634_661065_3D805945 
X-CRM114-Status: GOOD (  14.99  )
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

ieee80211_chanctx_conf struct is not put at the end of ath12k_link_vif.
Note ieee80211_chanctx_conf has flexible array member inside it, causing
below warning with GCC-14:

drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Although there is no issue for now since the array is not getting used,
this should be fixed to avoid any potential data corruption issue in the
future.

Remove this struct from ath12k_link_vif, fetch it from ieee80211_bss_conf
instead when needed.

This change only applies to WCN7850, and should has no impact on other
chipsets.

This is an alternative to the solution proposed in [1].

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Link: https://msgid.link/Z8-Snz86Xfwdlyd7@kspp # [1]
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 -
 drivers/net/wireless/ath/ath12k/mac.c  | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bed996919f040645fd8b474d9709539758a34150..4675648c7bcb1f282db7935c92bb6a46821e550a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -295,7 +295,6 @@ struct ath12k_link_vif {
 	int txpower;
 	bool rsnie_present;
 	bool wpaie_present;
-	struct ieee80211_chanctx_conf chanctx;
 	u8 vdev_stats_id;
 	u32 punct_bitmap;
 	u8 link_id;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fda97667d4e3468f28194bf55cc194fe123533c..842eda56c8b152b3303c83b43fbef400442c59fc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9550,16 +9550,26 @@ static int ath12k_start_vdev_delay(struct ath12k *ar,
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ieee80211_chanctx_conf *chanctx;
+	struct ieee80211_bss_conf *link_conf;
 	int ret;
 
 	if (WARN_ON(arvif->is_started))
 		return -EBUSY;
 
-	ret = ath12k_mac_vdev_start(arvif, &arvif->chanctx);
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ab, "failed to get link conf for vdev %u\n", arvif->vdev_id);
+		return -EINVAL;
+	}
+
+	chanctx	= wiphy_dereference(ath12k_ar_to_hw(arvif->ar)->wiphy,
+				    link_conf->chanctx_conf);
+	ret = ath12k_mac_vdev_start(arvif, chanctx);
 	if (ret) {
 		ath12k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
-			    arvif->chanctx.def.chan->center_freq, ret);
+			    chanctx->def.chan->center_freq, ret);
 		return ret;
 	}
 
@@ -9622,7 +9632,6 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	    ahvif->vdev_type != WMI_VDEV_TYPE_AP &&
 	    ahvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
 	    !ath12k_peer_exist_by_vdev_id(ab, arvif->vdev_id)) {
-		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
 		ret = 0;
 		goto out;
 	}

---
base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
change-id: 20250321-ath12k-dont-put-chanctx-in-arvif-5004547c6201

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


