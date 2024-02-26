Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3777FC5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WeaJlfCOZBzhWyoVmlZIsOgCFhwZIxr59P1NauudU7g=; b=dztEyOSS35Y2BLX5dt3YMLS5IS
	mybHGBAncH5u+nW2yqN2noiVZRl2y6P0FtqYC4ib7CzWXv+gPl9zmthLzMOb73cCqddQXJr8xCeYO
	DZ168ZXUVwfM6rDhPAkxOCqDpdq57QzR7qABwqoVWhd7avARdOG1BaqKnfdBA1+N/VA5SfVVwy0VH
	VjAfSeyWfUVjXbaoLsQeg16f+ljLxSxlxgR2x2s9QGDJ+9kbwsb1l3rFgWtVOg8YmMYeo6Q+HdM4j
	LomPMvm+grRgrEHIQwH2C8WPOPhY56OqepKLp3FaA8tyGDyvlW1Mnmp+t0E1ohCoLtattksQNrcig
	NNBkgq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei5I-00000002bhb-3fMi
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 21:00:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei5F-00000002bfM-1mGR
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 21:00:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QKmSva025052;
	Mon, 26 Feb 2024 21:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=Wea
	JlfCOZBzhWyoVmlZIsOgCFhwZIxr59P1NauudU7g=; b=cMu+rolQSiIcUcSNjV8
	EeZoeQFutc5gb5bzCEJcfIAm9kilSsZ6aI7fV8AmKubdn+bKicbI79YwnfIpYR/I
	396+UOF5+mupe0+z/2xY7sUD3jQ6m01rGlYGnk8LidW2KRm33KtH/D/FZa7rfKar
	M3q0LaEvb8XbZVUrkcjOEGZE+T92a82hN476tyLKH1lwKHSV8DsgovJk/Cpk0XA/
	XPE6qPnojelMWAW7CqAQlJCTTIZ71Fo/3LjNODbrfagRxp6es9w6O9jVdVvxln8F
	YNqURGkNFMRx4rEn1yYhpkZZG3lER2kk3T9t999y1fZL2M4HzM+drwZo5XvDowEW
	xYA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxq22db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 21:00:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QL0H7W025119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 21:00:17 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 13:00:11 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 26 Feb 2024 13:00:11 -0800
Subject: [PATCH] wifi: ath12k: remove obsolete struct wmi_start_scan_arg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240226-ath12k-obsolete-wmi_start_scan_arg-v1-1-07b0b563cb27@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANr73GUC/5WNQQ6CMBAAv0J6toauVIWT/zCElLrARmm1W1FD+
 LuVH3icOczMgjEQsqiyWQSciMm7BGqTCTsY16OkS2IBORQ5wF6aOCi4St+yv2FE+Rqp4WhCbNg
 a15jQS4RjbtruAEWpRQrdA3b0XifnOvFAHH34rM9J/exf+UlJJVsDoHVX6p0uTo8nWXJ2a/0o6
 mVZvu73GDLWAAAA
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TrbdV0NSdXW-UtzuAIEDeyJEVqPfAic8
X-Proofpoint-GUID: TrbdV0NSdXW-UtzuAIEDeyJEVqPfAic8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=665 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_130021_653440_501FC5B6 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

ath12k inherited struct wmi_start_scan_arg from ath11k. However, in
ath12k, this struct is unused -- struct ath12k_wmi_scan_req_arg is
used for this functionality. So remove the unused struct.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 103462feb935..2492082b4524 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3357,34 +3357,6 @@ struct wmi_bssid_arg {
 	const u8 *bssid;
 };
 
-struct wmi_start_scan_arg {
-	u32 scan_id;
-	u32 scan_req_id;
-	u32 vdev_id;
-	u32 scan_priority;
-	u32 notify_scan_events;
-	u32 dwell_time_active;
-	u32 dwell_time_passive;
-	u32 min_rest_time;
-	u32 max_rest_time;
-	u32 repeat_probe_time;
-	u32 probe_spacing_time;
-	u32 idle_time;
-	u32 max_scan_time;
-	u32 probe_delay;
-	u32 scan_ctrl_flags;
-
-	u32 ie_len;
-	u32 n_channels;
-	u32 n_ssids;
-	u32 n_bssids;
-
-	u8 ie[WLAN_SCAN_PARAMS_MAX_IE_LEN];
-	u32 channels[64];
-	struct wmi_ssid_arg ssids[WLAN_SCAN_PARAMS_MAX_SSID];
-	struct wmi_bssid_arg bssids[WLAN_SCAN_PARAMS_MAX_BSSID];
-};
-
 #define WMI_SCAN_STOP_ONE       0x00000000
 #define WMI_SCAN_STOP_VAP_ALL   0x01000000
 #define WMI_SCAN_STOP_ALL       0x04000000

---
base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
change-id: 20240226-ath12k-obsolete-wmi_start_scan_arg-e280abf72495


