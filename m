Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF65DCC6B38
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbeCza8hA1qlMcN+Uvbg8tIR05Pv/Xitan3no9pyUjI=; b=uCPXzJ8vPEm/TVnkA88K2w/3Wv
	3s+ZxX98XcVtag6UX9ZDeVpmCmq6tV4809r4wvwdcYU/0OD/SS1VUi+iD5Vchwc7gXiEkBGqEJrPV
	REXGjSCRMbna+LvtI4GCfsjI1Rm47UZkI8I9soQXPK/rQV5hoTGPFXxy5tbB7ZGRas/Y1z3B51hS2
	qkV2gaBCStvKtmcXNx3GPIMvgUPCgQaWOcLuI3ngmovvOZQR0JvYYUbN3G+iaQZFEa5xP6eRW4TG3
	HXFrqtwb1w74v+muMnP6lv7px+nXNI0pVgyrZMvRR4ohNF7+Ybm9NADtHs+g66CMmvktr55H3p5cD
	R3mklFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQt-0000000GtkA-2Mro;
	Thu, 15 Oct 2026 05:55:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQr-0000000Gtj6-3roG
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 05:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DbeCza8hA1qlMcN+Uvbg8tIR05Pv/Xitan3no9pyUjI=; b=ZNihSDhTGQbi7aYmsFa0PhhWo+
	Fs9FIuLpuIeNzroDYtPj7kBCHk1G7tGa2cN4vftVjLVo0+GyNomyNr4SoMNH1PlnDcsFJA3kuBjoj
	ejQASQsMoedSGDiBI0vD9xvXfFdNdLzasinK3BMxAztKKFWD0mHg/4v11mUL+xsItrDJpswwkrnlX
	xPPN4A3UKNUmcxb+EhzmvTk4dZ5trIclaI5yeQlajrEa+W3UzUpptqfZh9aFio6yGgAakjHAWdKLJ
	m6zMd7lqKB1n2Z+d6NoXtfQJQoosOc3OV7V0uKcIcmiJvjkcsRrDOg5sFV8vO5etC9Y9XJ9pW6jV3
	jXpIk89Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHEQn-0000000HVIy-3rrM
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:55:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENQ9PN584445
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DbeCza8hA1q
	lMcN+Uvbg8tIR05Pv/Xitan3no9pyUjI=; b=dX6G9SlGApvAR/YlFYi7RZp73m+
	4Ut8sTXFpRCpOik3vIyJhK0OQeYZJtnj+4NP9IyyDt53Q5+Kl7annPyb0jEHSs4Y
	QxgZhJSfV0RFvvc8gCqfcc9hklB0hsOfVhFPkqGQQyyUWbv3kIsLGZHLoDm0mSfX
	Y41yZ6zMLgQ7Uvau8bREsd/ur3FOjVMBOnx0u7SjAy8pufKUOykRvuwLgMMm+lv+
	dI3t7Fl7D3sKyGEqUzf9U/si1WX/i7d/e2ipXvJolMxxdYj7jquvcJE7BqQ9YMoF
	ict04+kGZyiJl9n81xds4Bv0ei0yVqv4sYLk57AN0jU6o1BKybVoGGt05dA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdes64a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1675393a91.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043705; x=1792648505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbeCza8hA1qlMcN+Uvbg8tIR05Pv/Xitan3no9pyUjI=;
        b=iW7bY3KRqdgg1+q2/cJNwk066rxByThSBy2bumDsPxAkw+5AR6C2hpSCSP0jfkVPCv
         zQmo3TQ/hTe8nAsIWWDRBsqhuD9Xmo2GUTfEb5gHaqL/RNEG/u81sEDOdWSgL7l54h+e
         BgFAL0PgcZrPw4aZSX/WS/XFP9LgbfMYfY1XwU7zGanKlUVmS0RxdPV2slTvy0ouvQmU
         3bLzOmeqrtlietr8xUh34YJMRJeJbDtDRbc2mrFmvxPWt1ya/OfwgK/J+t04BjZTg53j
         L/N+zOK8eYJ+6GZ1iF4uSMiPR6KAUf4eBnjf/Bcr4LQDHiwhU22fN2/Tl17eO0Fy7iCS
         nG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043705; x=1792648505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbeCza8hA1qlMcN+Uvbg8tIR05Pv/Xitan3no9pyUjI=;
        b=daVjQkiEy0360oyBVAxu8e8snY6vtdPL0Jvk9Z+ZwO8VUkHHNdIdNiU8JRAfc/wE7U
         cb1eeT6CZqv1+zHxXxbzudFBg71Os6Jsn9GufiCbYB+TpOpLaRVV8qL22IcpJhbExrAK
         lXp651neH2kSz9v8pFGxdeH2hZZpR807El9Y4FMoCCLRPOieKRd58tuFBtMLgQK4JPYk
         m9j3nvzIcqQE7hK7Kp0m7riQgCo1ybKXreXPUZBjwpVwwyi7H78mkpbxphuk2/BGIMP7
         23RqGNlX8o7AEjvQft0L62I7HjalK577b+UaB2PvtO0hevY9A6uLFuVxhntd2vfBYOcQ
         nZ5g==
X-Forwarded-Encrypted: i=1; AKwUvBzpwbGwD/fnLg53XyI4oOe2Sw5tdiWaD1CMaVzmryiM36FWnFgVxq8SWHE8Rm8TsK0pZmAD2xw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLY7BZcNhWKrQPWXavCB6y568C6R12WUDvbI7oaz0y9QTeAgFkR
	tAkcFLu5xOrU2TfFbY1MkBQ6gcmPglCPPxtZfxA8bblnCLGMAinWYAVLofRZbrVk7XbiQd0uYU0
	l2vehLhSKScb+cmGv7BXCJa+16TRaCggyiB22hfFIw1c2gvDiBwMtwQ22dEYAzVDJ
X-Gm-Gg: AYBFou1GpBzbuGMdS3kwVpKuDkI/1/liskJuvdc/Jxk2tSpfmUoZjoXTHR1LPJHOnxF
	xVe7mxHTDDjGhdXIYRGAjzOHkDc/i6PDp2hqlgCmrgKLGZ+017Ma1cxsWhB+IhUx9kS74AiHvuN
	GxwfUH7njx3a0nXSrTc/L0qIkcui8Ea9g0v0JeSVuZWndhXW3VMLZV4BIMz/OU9HfLTVAU5lmRW
	5+096/FUzsd9Ak9d5VtYh1f2ArKpK5ycQSH+zPu70HcRIN6g+anCX4X/0qRmVmKTAoy3lPfLTY0
	RnEwEliQ3GXpBr53LPIZ3k+UxvSSm9ovdilCbvm5fooyZgE6K/MKINdDtp5NjEEQHLp37+1FXH+
	/h1f+QK5t34q5Z15Wx3ZVzDMxAeu6FikYJhA5cfxo0px0VRiAyqhqdQl+hAHBLjW8G1Cr7/fdnV
	5Hl/DkOcPu8MJI
X-Received: by 2002:a17:90b:498c:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ac9176f12dmr1951411a91.46.1792043704601;
        Wed, 14 Oct 2026 22:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ac9176f12dmr1951389a91.46.1792043703926;
        Wed, 14 Oct 2026 22:55:03 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:55:03 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Arun Vikas T <arun.t@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 4/7] wifi: mac80211: forward QoS Management configuration to drivers
Date: Thu, 15 Oct 2026 11:24:38 +0530
Message-Id: <20261015055441.680588-5-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
References: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad06ab9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZuwutKCGwYuCb3peWq0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Aoz_aKockcXF1nrlh-dOGqZQtbkYF2ZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX+/ivwydXpWeG
 oc2lyivwspqE4O51A12vH6xev1Vq1F7uN/FmmyXjU/bg/Xsx55Op+uNPjsTFwh86QUmWXIoeike
 7XwIe0sX4ETEhafLXpprh5XeQbb+3e6+FDZixKa835162yG9hy4zy9IxPIncvQncnwvcQU+A9Ji
 PT/4qC9w2WtA9hsAcgisTaspJ8Lsyk2KtSLfdkp/IviGxHq7Lq611nDn7lbhQ/5zvscVzqgaAzq
 qCre2ILUPpaexgHczhn+YoeI31/t7d56p04TMOX/DnT7tWSigQiw8S3l+MArwZAwUkFaXDIZhUC
 Z0OrUsis5djgYBqc6mw2Uv8lk+tm6bp34JJtwVvpJnNqriJPkOTJ27i+3MzbmjuF4XT7je1KR9E
 MgV2Ri84GvvljO1qofGVuyufuqlCkmi4PAsJ556RM1EQ3JqTUW0nLP7EvQvPREyzBjQeW2DtZuZ
 jgg0m83/B6vezWFtyBQ==
X-Proofpoint-GUID: Aoz_aKockcXF1nrlh-dOGqZQtbkYF2ZS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXwX3E8hslTAoy
 wgKBD5mNfk3fiZB0+IiCDWI+hknvnqce8SofXbh7OKQsh5K8ZcZyERUSMHMqlHQ8ou6oJ2zqeiD
 hev+UfsztzYVKYPmi6iw7e0fKdxMAcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_065510_683410_B4D5A081 
X-CRM114-Status: GOOD (  17.97  )
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

Add a mac80211 QoS Management driver operation and connect it to the
cfg80211 set_qos_mgmt_cfg() callback.

Pass the parsed SCS/MSCS request, including any QoS Characteristics, to
the driver together with the response descriptor array. The driver is
expected to apply the protocol-specific configuration and update each
response descriptor with the status for its corresponding request.

The accepted configuration is then retained by mac80211 for use by
subsequent data-path handling.

Co-developed-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 include/net/mac80211.h     |  7 +++++++
 net/mac80211/cfg.c         | 13 +++++++++++++
 net/mac80211/driver-ops.h  | 28 ++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h |  4 ++++
 net/mac80211/mlme.c        | 17 +++++++++++++++++
 net/mac80211/trace.h       | 24 ++++++++++++++++++++++++
 6 files changed, 93 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index a1a6409b44c1..a610d6eb92b4 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4760,6 +4760,9 @@ struct ieee80211_prep_tx_info {
  * @set_eml_op_mode: Configure eMLSR/eMLMR operation mode in the underlay
  *	driver according to the parameter received in the EML Operating mode
  *	notification frame.
+ * @qos_mgmt_cfg: Configure QoS Management (QM) for a station. The request
+ *	contains SCS or MSCS parameters, and the driver populates the
+ *	per-descriptor response status.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5173,6 +5176,10 @@ struct ieee80211_ops {
 			       struct ieee80211_vif *vif,
 			       struct ieee80211_sta *sta,
 			       struct ieee80211_eml_params *eml_params);
+	int (*qos_mgmt_cfg)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta,
+			    struct cfg80211_qm_req_data *qm_req,
+			    struct cfg80211_qm_resp_data *qm_resp);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bcea7..f66f736adb92 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6309,6 +6309,18 @@ ieee80211_set_nan_non_evac_channels(struct wiphy *wiphy,
 	return ieee80211_nan_set_non_evac_channels(sdata, channels);
 }
 
+static int
+ieee80211_set_qos_mgmt_cfg(struct wiphy *wiphy, struct net_device *dev,
+			   struct cfg80211_qm_req_data *qm_req,
+			   struct cfg80211_qm_resp_data *qm_resp)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+
+	lockdep_assert_wiphy(wiphy);
+
+	return ieee80211_qos_mgmt_cfg(sdata, qm_req, qm_resp);
+}
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -6432,4 +6444,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.nan_set_local_sched = ieee80211_set_local_nan_sched,
 	.nan_set_peer_sched = ieee80211_set_peer_nan_sched,
 	.nan_set_non_evac_channels = ieee80211_set_nan_non_evac_channels,
+	.set_qos_mgmt_cfg = ieee80211_set_qos_mgmt_cfg,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 83dd15f2daf6..f1dc9ca9f8f7 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1804,4 +1804,32 @@ drv_nan_peer_sched_changed(struct ieee80211_local *local,
 	return ret;
 }
 
+static inline int
+drv_qos_mgmt_cfg(struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_local *local, struct ieee80211_sta *sta,
+		 struct cfg80211_qm_req_data *qm_req,
+		 struct cfg80211_qm_resp_data *qm_resp)
+{
+	int ret = -EOPNOTSUPP;
+
+	might_sleep();
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (!check_sdata_in_driver(sdata))
+		return ret;
+
+	/*
+	 * Called only for SCS descriptors carrying a QoS Characteristics
+	 * element (9.4.2.326, IEEE Std 802.11be-2024).  Legacy SCS and MSCS
+	 * are handled in mac80211.
+	 */
+	trace_drv_qos_mgmt_cfg(local, sdata, sta, qm_req);
+	if (local->ops->qos_mgmt_cfg)
+		ret = local->ops->qos_mgmt_cfg(&local->hw, &sdata->vif,
+						sta, qm_req, qm_resp);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 1a6cbbb5a17d..63391a1fd9c6 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -3020,6 +3020,10 @@ ieee80211_uhr_cap_ie_to_sta_uhr_cap(struct ieee80211_sub_if_data *sdata,
 				    u8 uhr_cap_len,
 				    struct link_sta_info *link_sta);
 
+int ieee80211_qos_mgmt_cfg(struct ieee80211_sub_if_data *sdata,
+			   struct cfg80211_qm_req_data *qm_req,
+			   struct cfg80211_qm_resp_data *qm_resp);
+
 #if IS_ENABLED(CONFIG_MAC80211_KUNIT_TEST)
 #define EXPORT_SYMBOL_IF_MAC80211_KUNIT(sym) EXPORT_SYMBOL_IF_KUNIT(sym)
 #define VISIBLE_IF_MAC80211_KUNIT
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 6ec45a9f7221..e476c6b9cb14 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -12036,3 +12036,20 @@ void ieee80211_sta_rx_queued_frame(struct ieee80211_sub_if_data *sdata,
 		break;
 	}
 }
+
+int ieee80211_qos_mgmt_cfg(struct ieee80211_sub_if_data *sdata,
+			   struct cfg80211_qm_req_data *qm_req,
+			   struct cfg80211_qm_resp_data *qm_resp)
+{
+	struct ieee80211_local *local = sdata->local;
+	struct sta_info *sta;
+
+	if (sdata->vif.type != NL80211_IFTYPE_AP)
+		return -EOPNOTSUPP;
+
+	sta = sta_info_get_bss(sdata, qm_req->peer_mac);
+	if (!sta)
+		return -ENOENT;
+
+	return drv_qos_mgmt_cfg(sdata, local, &sta->sta, qm_req, qm_resp);
+}
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index ea46c3cca21a..ce69e5edd03f 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3431,6 +3431,30 @@ TRACE_EVENT(drv_nan_peer_sched_changed,
 	)
 );
 
+TRACE_EVENT(drv_qos_mgmt_cfg,
+	    TP_PROTO(struct ieee80211_local *local,
+		     struct ieee80211_sub_if_data *sdata,
+		     struct ieee80211_sta *sta,
+		     struct cfg80211_qm_req_data *qm_req),
+	    TP_ARGS(local, sdata, sta, qm_req),
+	    TP_STRUCT__entry(LOCAL_ENTRY
+			     VIF_ENTRY
+			     STA_ENTRY
+			     __field(u8, qm_type)
+			     __field(unsigned int, num_qm_desc)
+	),
+	    TP_fast_assign(LOCAL_ASSIGN;
+			   VIF_ASSIGN;
+			   STA_NAMED_ASSIGN(sta);
+			   __entry->qm_type = qm_req->qm_type;
+			   __entry->num_qm_desc = qm_req->num_qm_desc;
+	),
+	    TP_printk(LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT
+		      " qm_type:%u num_qm_desc:%u",
+		      LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG,
+		      __entry->qm_type, __entry->num_qm_desc)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.34.1


