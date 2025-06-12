Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4217C71149
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAfd/466aJtk26pdkcE23ilUVjqGoKW+Tnh2zkx2NW4=; b=bjt2gONPwUKqFdmGxKRHGS157G
	jcZbur9ggXRSL4VmZPmlvokm6FeYbQK8jnfnjNGwxR/bVNBy530BJxfr3b8r0eWnim18FMHRcxc0L
	b3wb1jdlX5IH1Y+mgHOwoXybVC4uLbdc+YhNq+BIgTr/SpXLKsLNBRfNZ4P5K5cDCSz+OMZHl4Ord
	e4Orw5lqrx8zjR+l/Q7eLbGhKEKsoDWGSb/XWS10cTdabAZb3Yd2csVQ35R8sgTRxsAMu1CC7ZkH/
	ZxXyZPYU9EoqRTEpD0ZAYXM/D5IErCkXLqo+4bFmdDGTn/vMbbH1JJ/XDFpaxBaOxVg5fbydm5Fjj
	sXpkaqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntH-0000000ENSC-38S2;
	Thu, 12 Jun 2025 19:47:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlZo-0000000E1MC-3fNt
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 17:18:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CEBRtO020614
	for <ath12k@lists.infradead.org>; Thu, 12 Jun 2025 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FAfd/466aJtk26pdkcE23i
	lUVjqGoKW+Tnh2zkx2NW4=; b=nC62XfK9UZzFHDI4g+xpU2QOqAXn6b+A7Prl/w
	YXxKtazHEVz3vLsP4Xars2nfNDMAVmBlYl8mCfFr4WzH8vJ+n2Jo/QhK9ubT4cDy
	CSsTOEjMXIn4d8npkbKCXxqxhzwomRigFgdKvCevJsmUOVaKrypvBmzSEjlvmvdd
	W9Fi9OJe8MQEiP9baIGvJt5umZd3AztiO5NW6dMTpov1xTr8pDVxQ03pGdWKIG6A
	0eDP7jYdfNzLpfGeB/aaoUuy1khB3PBoZFNzCoHiVe12C1sbRih/XdNbo/na6rtH
	cvCe+iiDsV5XjtHZdgnALjA7//bwmj610dSumU89utDFw5dg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcsbh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Jun 2025 17:18:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234dbbc4899so16917155ad.2
        for <ath12k@lists.infradead.org>; Thu, 12 Jun 2025 10:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748727; x=1750353527;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAfd/466aJtk26pdkcE23ilUVjqGoKW+Tnh2zkx2NW4=;
        b=BdyiAC7hMSI0HwGmWpALknJs5OKa3CQebTxYJLeiiCknujLNx0rqdnuDTH3oh6iV30
         g0H+WnsWhmrfR5rIPnSw+0wu0hIn4KoVUqy7X/EH2B0Cj1vl/5KPqGXiGvkhTmvHtSjH
         zpubdHUL+fgvqbW57ygPK7qPKpnIOQdbUpEPrcHJxPSxqiPiMJHQGwqQIIWGQF07xlT6
         hiYP87BjVrRxNEphZKAnT7IEO1U3sPSqhbbc3mWldOTlrMR4ApUP0YQXjlJIQX9xbvkR
         syf/pI/5ccUp6u/UCLcfCyW7uH8Zmks2u8QOy54Xo/q/O+WokYyLdeFjJxtlHausBpXL
         iC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjf2sqy6x8YFFOe96ionvtdrjng6e/AChwwzkHdAsj6y6p0AEx2leZzZRaqFDh+9hSgDEECRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZ9VGkPCPovTbrsbEBFDBT5VxGN4CQETvDxa9aAO6CzaeMIsp
	QlsVE4hKJvcDCxsJ+UYTKWL9NGKuBzAEVXnPPJk72r+GB2T8ymIOGZdY+OOnMkr4I4fMj50erWp
	8csOow2OElax72e1DUjBrHvt4F+AnMyg0ap31/dX9DsbtoYeO1ICjoeT55z58l+1h
X-Gm-Gg: ASbGncvONtl5qY9RL+NO4oIh2E4gHomD+Qd2fMYWMSMVUF+JpYpPUYmVCfxblYaF6K7
	fgYff5Cnb6569MkVuwWuoVwpUQyawWmQDm0T6k8qxhzgWYcSP3gnJlb4LnePsTk2JVFzhI6wOen
	JsTDLjJZ51c3jZ3gzJWayfC1qzIxmWuxmhopCBw/9FHvEodOUdQK5tYAtPGabsJ0TiErmBzr6b9
	2zLUtRa7esN4lgXOLMqpWWGXHwwSzJwXoTWgvO8jQ5At1DFNDSzt1yMczdOS5wTuLv3ksIiiauD
	H+OvLZ0GkhVOMDGZ4yQBcfvoBGKzBmWXbn+PRvnRXXImvyeZ7ejTm2aqokSP9clL8jMYKiakHHK
	hkG4K9hgIWuyLPtbiKoU8HCnn0tfQ1w5D/RaSnEIwGlQb7Fg=
X-Received: by 2002:a17:902:d489:b0:234:a992:96d8 with SMTP id d9443c01a7336-23641abe52fmr121980165ad.19.1749748727210;
        Thu, 12 Jun 2025 10:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb3hmyzcuYh62ytDN+Gfk1knVYsAAA29UVORbZv5+sAlmWUmsH84jXYEFz2PZxZTBqay4zGA==
X-Received: by 2002:a17:902:d489:b0:234:a992:96d8 with SMTP id d9443c01a7336-23641abe52fmr121979685ad.19.1749748726701;
        Thu, 12 Jun 2025 10:18:46 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd629375fsm1411495a12.45.2025.06.12.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:18:46 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 22:48:20 +0530
Subject: [PATCH ath-next] wifi: ath12k: handle regulatory hints during mac
 registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-handle_user_regd_update_hints_during_insmod-v1-1-576bd0f6dbe0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANsLS2gC/6XPwW7DIAwA0F+pOI8qkFBIT/uPqkIoNomlBjogU
 acq/z6Wyy7bYdvFkm3Zz36yjIkws/PhyRKulCmGmoiXAxsmF0bkBDVnspGqUVLyWoQb2qXO2YQ
 j2OUOrqCdKJRsYUkURkshzxF4JwctELVvzYnVjfeEnh67dmGuTDzgo7Br7UyUS0zv+xmr2Pt/E
 lfBBTfOOwOq1aZ3rzHn49vibkOc52MNO7fKfxCyEh2YzjdeNdrrH4j2izgJ8Tui/fyi70HhgOB
 7/w2xbdsH8kOorb0BAAA=
X-Change-ID: 20250522-handle_user_regd_update_hints_during_insmod-42c71ee7f386
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX/mi5RUFAbCp+
 dnqzt7sCNwp55wdTMYhjcza1HG/OIwJuN8dyEBNynV8dUqIMtIbmYVxLuxLQyWYWSrJuHfGZ5kY
 rhElxEAdtZjeR07PCPMD0jaMOMLxRZK5cckZWqEsxQsOQvSyRrwQwLHVvZJD9qY6Vkc74scId6n
 bUnsQJHTUEkur/SYxPysUGU0w7+sCRh1qgDuT3gX+NuYbuP0acVp/B0+thcpvtt1Al+zpxRjyFU
 9YwdiwYsdt1kiPXi867MlcAarVzbSTPOlYaC7iyizJ5iDJjkA/nuiN31mP6K5Pu/wTSVLng0mKA
 2tYOQN2xAbyeAJMcEY0orfpkxZotdk8qB+R8pQDgwzUONXAn3HiW+MO1uXqP/WGhqm3wznlZnty
 ru/ssqtKG6BzKojA6U8jj/4cHSO0l8iJJxeyFcRSv9seHZeShxE2jRrNR585sQKS5FGBnHZ6
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684b0bf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=cjyl3gcxlCMcS8tmzmQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1JXZR4a3thGIVlzFV7LPpdyJVAaSU5GT
X-Proofpoint-ORIG-GUID: 1JXZR4a3thGIVlzFV7LPpdyJVAaSU5GT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_101856_943333_28D99AAF 
X-CRM114-Status: GOOD (  27.13  )
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

If a regulatory notification is there in the system while the hardware is
being registered, it attempts to set the new regulatory country. However,
ath12k currently boots with a default country derived from the BDF. If this
default country differs from the one provided in the notification, a race
condition can occur while updating the regulatory information back to
userspace. This potentially leads to driver having the incorrect regulatory
applied.

For example, suppose the regulatory domain for France (FR) is already
applied, and then the driver is loaded with a BDF that has the United
States (US) country programmed. When the driver finishes loading, the
regulatory domain shown in phyX still reflects the US regulatory settings.
This is incorrect, as the driver had already received a notification for
FR during hardware registration, but failed to process it properly due to
the race condition.

The race condition exists during driver initialization and hardware
registration:
- On driver load, the firmware sends BDF-based country regulatory rules,
  which are stored in default_regd via ath12k_reg_handle_chan_list().

- During hardware registration, a regulatory notification is triggered
  through:
    ath12k_mac_hw_register()
      -> ieee80211_register_hw()
        -> wiphy_register()
          -> wiphy_regulatory_register()
            -> reg_call_notifier()

  This sends a country code to the firmware, which responds with updated
  regulatory rules.

- After registration, ath12k_mac_hw_register() calls ath12k_regd_update(),
  which copies default_regd and passes it to the upper layers.

The race occurs between the firmware's response and the execution of
ath12k_regd_update(). If the firmware's new rules are processed before the
update call, the correct values are used. Otherwise, outdated boot-time
country settings are exposed to userspace.

To resolve this issue, introduce a completion mechanism within the hardware
group (ah). Trigger this completion whenever a regulatory change is
requested from the firmware. Then, in ath12k_regd_update(), wait for the
firmware to complete its regulatory processing before proceeding with the
update.

This ensures that during driver load, the default country is processed
first. However, before ath12k_regd_update() is called, the new regulatory
notification will have already been received by the driver. As a result, it
will wait for the firmware's regulatory processing to complete, and only
the final, correct regulatory domain will be updated to userspace.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  4 ++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 15 +++++++++++++++
 drivers/net/wireless/ath/ath12k/reg.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/reg.h  |  2 ++
 drivers/net/wireless/ath/ath12k/wmi.c  | 13 ++++++++++++-
 6 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebc0560d40e3419130e4caf01c9b91bd9affb3bd..9c18a706dc3ae3b8c5b95d8575e778c8a9c898ba 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1470,6 +1470,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete(&ar->vdev_setup_done);
 			complete(&ar->vdev_delete_done);
 			complete(&ar->bss_survey_done);
+			complete(&ar->regd_update_completed);
 
 			wake_up(&ar->dp.tx_empty_waitq);
 			idr_for_each(&ar->txmgmt_idr,
@@ -1509,6 +1510,9 @@ static void ath12k_update_11d(struct work_struct *work)
 		ar = pdev->ar;
 
 		memcpy(&ar->alpha2, &arg.alpha2, 2);
+
+		reinit_completion(&ar->regd_update_completed);
+
 		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
 		if (ret)
 			ath12k_warn(ar->ab,
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 941db6e49d6eaeb03783f7714d433259d887820b..329f3e490a713b179413f73a4024448aedc363fd 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -804,6 +804,7 @@ struct ath12k {
 	enum ath12k_11d_state state_11d;
 	u8 alpha2[REG_ALPHA2_LEN];
 	bool regdom_set_by_user;
+	struct completion regd_update_completed;
 
 	struct completion fw_stats_complete;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87af8b48cb3fafcd364fd9ced4ff197..ef2e8398cbe8723c020aff03da5db7fa7fb2245e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10900,6 +10900,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 			struct wmi_set_current_country_arg arg = {};
 
 			memcpy(&arg.alpha2, ar->alpha2, 2);
+			reinit_completion(&ar->regd_update_completed);
 			ath12k_wmi_send_set_current_country_cmd(ar, &arg);
 		}
 
@@ -12116,6 +12117,16 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		goto err_cleanup_if_combs;
 	}
 
+	/* Boot-time regulatory updates have already been processed.
+	 * Mark them as complete now, because after registration,
+	 * cfg80211 will notify us again if there are any pending hints.
+	 * We need to wait for those hints to be processed, so it's
+	 * important to mark the boot-time updates as complete before
+	 * proceeding with registration.
+	 */
+	for_each_ar(ah, ar, i)
+		complete(&ar->regd_update_completed);
+
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
 		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
@@ -12143,6 +12154,9 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 			memcpy(&current_cc.alpha2, ab->new_alpha2, 2);
 			memcpy(&ar->alpha2, ab->new_alpha2, 2);
+
+			reinit_completion(&ar->regd_update_completed);
+
 			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);
 			if (ret)
 				ath12k_warn(ar->ab,
@@ -12215,6 +12229,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->mlo_setup_done);
 	init_completion(&ar->completed_11d_scan);
+	init_completion(&ar->regd_update_completed);
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 2598b39d5d7ee9b24ad8ed5d6de1bc5bbc6554e0..079dcb6d83df4eb487fb0dbf4088fb8cacca8f6e 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -102,6 +102,8 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 
 	/* Send the reg change request to all the radios */
 	for_each_ar(ah, ar, i) {
+		reinit_completion(&ar->regd_update_completed);
+
 		if (ar->ab->hw_params->current_cc_support) {
 			memcpy(&current_arg.alpha2, request->alpha2, 2);
 			memcpy(&ar->alpha2, &current_arg.alpha2, 2);
@@ -272,9 +274,19 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
 	int ret, regd_len, pdev_id;
 	struct ath12k_base *ab;
+	long time_left;
 
 	ab = ar->ab;
 
+	time_left = wait_for_completion_timeout(&ar->regd_update_completed,
+						ATH12K_REG_UPDATE_TIMEOUT_HZ);
+	if (time_left == 0) {
+		ath12k_warn(ab, "Timeout while waiting for regulatory update");
+		/* Even though timeout has occurred, still continue since at least boot
+		 * time data would be there to process
+		 */
+	}
+
 	supported_bands = ar->pdev->cap.supported_bands;
 	reg_cap = &ab->hal_reg_cap[ar->pdev_idx];
 
diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
index 8af8e9ba462e90db3eb137885d0acd4b1cb2286e..fb508302c7f0f1fea2588ad4cf9d813da574d06b 100644
--- a/drivers/net/wireless/ath/ath12k/reg.h
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -13,6 +13,8 @@
 struct ath12k_base;
 struct ath12k;
 
+#define ATH12K_REG_UPDATE_TIMEOUT_HZ	(3 * HZ)
+
 #define ATH12K_2GHZ_MAX_FREQUENCY	2495
 #define ATH12K_5GHZ_MAX_FREQUENCY	5920
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..047d7a0f0e7423759f7cf05dff4aafbd3b9697d7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6143,6 +6143,7 @@ static void ath12k_wmi_htc_tx_complete(struct ath12k_base *ab,
 static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct ath12k_reg_info *reg_info;
+	struct ath12k *ar;
 	u8 pdev_idx;
 	int ret;
 
@@ -6198,7 +6199,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	kfree(reg_info);
 
 	if (ret == ATH12K_REG_STATUS_VALID)
-		return ret;
+		goto out;
 
 fallback:
 	/* Fallback to older reg (by sending previous country setting
@@ -6212,6 +6213,16 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	WARN_ON(1);
 
 out:
+	ar = ab->pdevs[pdev_idx].ar;
+
+	/* During the boot-time update, 'ar' might not be allocated,
+	 * so the completion cannot be marked at that point.
+	 * This boot-time update is handled in ath12k_mac_hw_register()
+	 * before registering the hardware.
+	 */
+	if (ar)
+		complete(&ar->regd_update_completed);
+
 	return ret;
 }
 

---
base-commit: 8270f43193a0d097659eca55e701fd6818708945
change-id: 20250522-handle_user_regd_update_hints_during_insmod-42c71ee7f386


