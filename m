Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808B3EB64DD
	for <ath12k@archiver.kernel.org>; Mon, 17 Jul 2023 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m5eC01n/l9xjRGm+FP3rj6Wqz0QelLVCawJA/ztSVG8=; b=fzzrJBYsYwqqdE
	YsuFeaJqnHXV/RDRGb/2DKv0LXtk4ScvJ7RqzaEMDjSx+YSUb/x44BiqL3rnumjCyuG2IqWo7AnYC
	/oQDG1GlK0whepxmpzX/FukbQJiQc8xc9PerL/Yi+w2WtZ2QS5Fo7WxfY8klhIodjuAx7Tu+enhpG
	Mo93beoMYQf3aq4H9WbLodYTJNe0evohJYJZX1yoq2dJZCEZ35RuNc4heU4nFQf+18hI8RrC5Wx9z
	dytfG/nmREfF1kxsBdTF9JTxv33IC/JZONJSdeMEr0sqmq9g4ScbCKWeyRExSh8uCc/VDRKE+hjm9
	n4+57UTdFMl5dn4uSypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLF0f-001TeA-1T
	for ath12k@archiver.kernel.org;
	Mon, 17 Jul 2023 03:34:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLF0b-001TaT-2u
	for ath12k@lists.infradead.org;
	Mon, 17 Jul 2023 03:34:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3Os0K009510;
	Mon, 17 Jul 2023 03:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=/Z8riPn3ScbJN5rDM32TSeD0fLCyWVrQNthAHxLN05A=;
 b=J2xDK3iePDClmf+Ei6s1R3vqTrZmDl8ZBx25vAU2AJ8PhsyAUu+mLOorZoJM8diHGJOC
 aW3l2HzaQ/D3CbIZVefmWQsgw2Wyv2wp1s1aOj1S+9cLwf2o57wiT/OwnHIcgVyn5JhV
 3g8KAtmMo4HVBn55KSF7zqEVRyu7141R58FoLX8n79RVtFzkz8j13USe85s/Y0DDrx9d
 89TpA8QC4b/zwv2U43ovvpyOV2+OlIUGaBPZX16lWR66/TyDSS7NMp9jcWWmsXFzFFHo
 xTTzL2dL3RYwUoJ2IClfuM327JJVOFEBN0Xm8o17JABhfJXlznK3o708UZaGR0FvJZJf ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run0cabbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:34:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36H3YkgI003397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:34:46 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 16 Jul 2023 20:34:45 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: change to use dynamic memory for channel list of scan
Date: Sun, 16 Jul 2023 23:34:31 -0400
Message-ID: <20230717033431.21983-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zUPQ0eN5ZfK-5Hbzi8prw-3ujUWPpIn4
X-Proofpoint-ORIG-GUID: zUPQ0eN5ZfK-5Hbzi8prw-3ujUWPpIn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_02,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=833 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307170031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_203450_084781_80126724 
X-CRM114-Status: GOOD (  19.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently there are about 60 channels for 6 GHz, then the size of
chan_list in struct scan_req_params which is 40 is not enough to
fill all the channel list of 6 GHz.

Use dynamic memory to save the channel list of scan.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  3 +--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b411..e3ba84f5dd68 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2767,6 +2767,14 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	if (req->n_channels) {
 		arg.num_chan = req->n_channels;
+		arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
+					GFP_KERNEL);
+
+		if (!arg.chan_list) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
 		for (i = 0; i < arg.num_chan; i++)
 			arg.chan_list[i] = req->channels[i]->center_freq;
 	}
@@ -2785,6 +2793,8 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 						      ATH12K_MAC_SCAN_TIMEOUT_MSECS));
 
 exit:
+	kfree(arg.chan_list);
+
 	if (req->ie_len)
 		kfree(arg.extraie.ptr);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 08a8c9e0f59f..0048f6a8e502 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3030,7 +3030,6 @@ enum scan_dwelltime_adaptive_mode {
 
 #define WLAN_SCAN_MAX_NUM_SSID          10
 #define WLAN_SCAN_MAX_NUM_BSSID         10
-#define WLAN_SCAN_MAX_NUM_CHANNELS      40
 
 struct ath12k_wmi_element_info_arg {
 	u32 len;
@@ -3239,7 +3238,7 @@ struct ath12k_wmi_scan_req_arg {
 	u32 num_bssid;
 	u32 num_ssids;
 	u32 n_probes;
-	u32 chan_list[WLAN_SCAN_MAX_NUM_CHANNELS];
+	u32 *chan_list;
 	u32 notify_scan_events;
 	struct cfg80211_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
 	struct ath12k_wmi_mac_addr_params bssid_list[WLAN_SCAN_MAX_NUM_BSSID];

base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
