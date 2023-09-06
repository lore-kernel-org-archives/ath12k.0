Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAEBEB8FAF
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/SSiK2/gkBs4A6BAyT0mVQJUP6GxVicpwIs9ckxHUU=; b=jkLiE8alm7AqoK
	6q5zfHIchzJ3xoZkBLkaxW662jnp0vXJuZTsVfdUttg87W5cBIfmT7/kH3geazdGZPR3/t1nVdGM6
	sR6SY0yiExHoN3ubDzhV9Ga0AHxfOkL039mGzbkUa28gPI0xohh780FTrL0UhvvhA3typ0Se0i0p5
	iNCq3hBQ7s0ukO9oiUWAJ1qsmV4EKjFe+C32ahkvdY2m/BKFHpX9f9r8CxUfgSd/RpUVOo05NNcA1
	tIz7SDUhG7KZMN27Qk2OkczrMcswnVlcLkkll0/CzvnmY0tHc4y33zLY+Et44kmBize5tPdvsLMb6
	EJNRNKXDX176SLnqUH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpo6-008AMd-1w
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 10:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnvj-007jDl-0N
	for ath12k@bombadil.infradead.org;
	Wed, 06 Sep 2023 08:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XWfFNGxaIA2TWUkMmv4h3By+EpzxcvACVX7lmArOZAs=; b=oMkt2I4BgUe3MuDAN460GZJqCI
	fcSQ5MyZu/VIw/SZbigqfrTnM7FD5x+vUHDjhLJqS36Sn4Qxy6VF+rR8MPmXM3ni9YDKUIHpIIqUQ
	xaDZwTbcWnCW4YMDl7qJAjSWmTxN1D43SBdF+uryMbVWUhYHmvVIGrEksWgwvchVCt2ik132uLbJ/
	AVCc6bCCfdMTiFXc8DwsZd0Y00dBeV85/H6ZOT7GrtTH1NglGYYLWglm6pZR1hvkINDGExDqFkJG5
	/o41Ny3xgY6aatqjqKy1+9E9JxvVTchDl+nCt7T8xGPAwZhTPXLoZhYOOD1snnx4a7iE92xFlg3B3
	Fw1ErKUg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnva-000z18-0t
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 08:30:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3864e0HM028572;
	Wed, 6 Sep 2023 08:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=XWfFNGxaIA2TWUkMmv4h3By+EpzxcvACVX7lmArOZAs=;
 b=AF1ykyO5WacHjD16oLkBweZAvQ3QkNK5RydvcCax4WV59VO7zApw5xwXjnGw4bYh2Py6
 Q74p6p1NH/mI7NkA21CuTqlrB42Kg6PnvzG5iot6RT+4V4k6R1u8t/lvOf97kuk7WjrD
 yvRoh/eCvtEG7l8U+0H9NcvlMB910yqf1wzcPKTa61wz84RbGF5rLmUNwbZyajgHL14T
 OneRp5kfHKACxfgLoT+kfDOYsHbumMqVKfialoHU46DPJr+DKLTbtZuYzbertsyshXRJ
 IRHcmgLRlbWj6qMUcyFAKK5chbZo5dqpDWjatvJRta/7zVknFj+rH9UQK6+uTkrCqVVs IA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxhjf8mqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 08:30:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3868UIxC021631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 08:30:18 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 01:30:16 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 4/4] wifi: ath12k: store and send country code to firmware after recovery
Date: Wed, 6 Sep 2023 04:29:48 -0400
Message-ID: <20230906082948.18452-5-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906082948.18452-1-quic_wgong@quicinc.com>
References: <20230906082948.18452-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Op8zgPzPN4i70HSVC0-EYSzEPZ_vlqDU
X-Proofpoint-GUID: Op8zgPzPN4i70HSVC0-EYSzEPZ_vlqDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_093024_295605_6E7F106A 
X-CRM114-Status: GOOD (  19.49  )
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

Currently ath12k does not send the country code to firmware after device
recovery. As a result the regdomain info is reported from firmware by
default. Regdomain info is important, so ath12k also need to restore
it to the value which was used before recovery.

This is only needed for platforms which support the current_cc_support
hardware parameter.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 1 +
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 8 ++++++++
 drivers/net/wireless/ath/ath12k/reg.c  | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 71450dc1f48d..4433d7701c67 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -696,6 +696,7 @@ static void ath12k_update_11d(struct work_struct *work)
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 		ret = ath12k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
 			ath12k_warn(ar->ab,
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ba8a4f968a3f..10fa9de15024 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -582,6 +582,7 @@ struct ath12k {
 	struct completion completed_11d_scan;
 	enum ath12k_11d_state state_11d;
 	bool regdom_set_by_user;
+	u8 alpha2[REG_ALPHA2_LEN + 1];
 };
 
 struct ath12k_band_cap {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 740e8045a6f1..0df154c34f8f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6908,6 +6908,14 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH12K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		if (ar->ab->hw_params->current_cc_support &&
+		    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
+			struct wmi_set_current_country_params set_current_param = {};
+
+			memcpy(&set_current_param.alpha2, ar->alpha2, 2);
+			ath12k_wmi_send_set_current_country_cmd(ar, &set_current_param);
+		}
+
 		if (ab->is_reset) {
 			recovery_count = atomic_inc_return(&ab->recovery_count);
 			ath12k_dbg(ab, ATH12K_DBG_BOOT, "recovery count %d\n",
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 97c93a4901e6..eb46bfc2b2b9 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -82,6 +82,7 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	 */
 	if (ar->ab->hw_params->current_cc_support) {
 		memcpy(&set_current_param.alpha2, request->alpha2, 2);
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 
 		ret = ath12k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
