Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB0C71155
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 03:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXaiysyC/M+/tDpGKqLEbinKnxqzYegzIqQucICqSuk=; b=2Y35Cl1R76UqmnFUWCvfMpplol
	Os5gVHojd2zpCWEM4G5GnxaGSrcbZVmFZO8WabZ3qDn55fMXD45nBVMQfR4IID8o3tHrOTQbvK5kc
	yfdzYfyeFIcQFtu6v/AO54zSufg+1UPFSzL6I6+1T/UqmtFjohsVA9CqTxWLcxv2/Br76ISKumZDs
	pzCPKO2UqmIn5UD4GdnmsMh7JBEzPXiWfn9mCNsFNxFh/N0R0ptruhzMkOdePXFCg/GSHbs8jjFiS
	/S7BGBQHbOec5xWaojgd7HNjPNJ7vTms98mUA/cBnKDiIfwQvRPnMXr/ZurnMRdPKDeuInmlRRnjA
	B2oDUNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRN7M-000000066ta-2IW1;
	Tue, 17 Jun 2025 03:36:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRN7I-000000066tG-07OD
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 03:36:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GH51xW005319
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 03:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SXaiysyC/M+/tDpGKqLEbi
	nKnxqzYegzIqQucICqSuk=; b=FO3C1lS8x/gja3snDKyAey/S7EZk3Y4I7V3Qn8
	SK7GcLHrkvVE9egepyeFKTRX7U4FIY7XVbYyDrKYMSxOYj+RPH0svVGFh+JyDOhe
	wnG3q1Sy6lUkohWROBWrEErCC9KsEON7Qk+WIzD1SKJH6fEtKPWedPqHevc1ACdK
	h16Jo/NSSQqgE4x8E83wYhbl/lSqHiQ4UqFHBEIzCPTBFfGRO6HlQFpSfwP1YuJC
	yE52MgDZNJZQxrIX5q4pdbpV30wyRX/SIglt/FCXfmgNjM8Y1XirbLFTgVwlCEz0
	X9Kj725JJgUtYKVm99tYo3/9BHIvOeQ9pO4zYZNtu52Ts/uw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag232umx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 03:36:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso6090114a91.1
        for <ath12k@lists.infradead.org>; Mon, 16 Jun 2025 20:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750131365; x=1750736165;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXaiysyC/M+/tDpGKqLEbinKnxqzYegzIqQucICqSuk=;
        b=Fz/3ryWsyPPPTVflez/ur+TRy6lyBpP4snlpDimCcMmJ4uxeRvuiHn3NCoe36JKGIP
         jytto7fzU1e6xMXrBCTgekzYD0qTAMj+GILQTLU5ckEMKLNzLg1pDVW6fXHn7khNzfYs
         jy0PADT/yH/QhZDdU+QryKblair6OaiUZmK9njVSSUs9njk9PKObeMk49oKj6GJFir7q
         gwIMJ2FioprOBKWxxZf9u7e6zu39F2goSN9Owh4EAsKqTtGugf4YV4u/16TZudg92Qli
         s/6X1mny0Us1vIXZbc4f+0Ovo/9UBDzW3J67T9swR1RQMnkQI4VtrUa9qwT7+blGl3q3
         Rsuw==
X-Forwarded-Encrypted: i=1; AJvYcCUrsb3vU88LoIcx0/O3ogIjnHOF1V3qRrk9/2GhfRitgq+pvq03ZLTOkA/x1cNMgcE9ML+5Sug=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4VVZf5tgHpBQR2uLOofonaa1auBvmAujJ2ZK9+L1GiVepbKi
	cIVn+kZuLeRlQxquCDIyf6alPq04gl3JgUewrn2sE4uKNqF+vDC5uJdlR6calGEoCqQ04zUy4+b
	Vjf/4ZcNzSib2Vi4kt3hi5m/x2PtpM2F2GrvEM8zupO8ccrP/DOxB6Exs/cy30eh7TDzIaJzW
X-Gm-Gg: ASbGncuJCovhqh6qdzdtc8fgxGSm7GBrY6w3JoPlPnFnTT+bWAlrm0GM9PE/F91g2cP
	vQeRV8T0kK2Sl522Q3XmNNT43ZduIXrG3FqnLpbU+PZ/+HqVBWsn7yZyYXXWoMla7cNXz0g3sng
	P1sBSExciddOWeLUiaiguEtJ3eN8KOw1euKoZ/IyvP4Uu+Clv3SeguQrAfvGQkEX0a8fci6ipkv
	7VwNk9UoZXRMjcieRQWr5dwr7UYBc2o1UAAT8zFT/hZZ1XjFOz5JvIwPPBV9aFmey2Q3GDul9MV
	NxdJWiu+40TzjhfheYSYCSAzLoQOKwHdcXuDpHeTT187HWlPCQyK72pYoXDYxQM1gU1pd4xqQ9f
	m9/0TdqX0or+Z/J+4rs28eZjAwYzocA52+FHIYW2BuiM7K7U=
X-Received: by 2002:a17:90b:4e90:b0:312:f88d:260b with SMTP id 98e67ed59e1d1-313f1c07f88mr20268769a91.14.1750131364617;
        Mon, 16 Jun 2025 20:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8F9gocBMZScl0mlUsjSwGe6dHuZffl7cW0gp2NR649XWeFN4k80zvim3Vf1qS+FoYNQ95Ew==
X-Received: by 2002:a17:90b:4e90:b0:312:f88d:260b with SMTP id 98e67ed59e1d1-313f1c07f88mr20268699a91.14.1750131364049;
        Mon, 16 Jun 2025 20:36:04 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1fa0sm69273695ad.86.2025.06.16.20.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:36:03 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 09:05:59 +0530
Subject: [PATCH ath-next v2] wifi: ath12k: handle regulatory hints during
 mac registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ7iUGgC/6WQwW7DIAyGX6XiPCogAZKd9h5ThWhsEqQGOkiiV
 lXefSSXHbYd1l0s2b/8f7/9IBmTx0xeDw+ScPHZx1Aa8XIg3WBDj9RD6YlgQjIpBC1DuKCZy55
 J2IOZr2AnNIMPUzYwJx9640MeI9BadJojalc1ihTHa0LnbzvtndhpoAFvEzkVZfB5ium+x1j4r
 j9FXDjltLHONiAr3bT2LeZ8/JjtpYvjeCxly7FbK/6EtdTqDMwpOCP7br1dsoh/pBcFUUNTO+Y
 k007/gqi+EIrzvyGq7UFtCxI7BNe6HxDrun4CJfPahRgCAAA=
X-Change-ID: 20250522-handle_user_regd_update_hints_during_insmod-42c71ee7f386
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SR-xnNwNLvB3dvhlbeJQhZgTRkn5p-so
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6850e2a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=cjyl3gcxlCMcS8tmzmQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAyOSBTYWx0ZWRfX58/p/VryN3tw
 xOGhD0FWT1J7t/zD1wqyizMp+1/pU+/5btqF2x8+SzX8v3n3xVZjRY0zcwOwauNkYJ783KKNNrY
 1Ri2k1BKtjIFcaOIbSC4c/GkivbcFFgl1gEyJXKmTLtYEcIgWYxz1e/W2a6To/XmkzyQEiR48ee
 QGNbdhhkE3GilyNq0N+hjk7CEMKOVuyLnI9oxkyNMrohHJH7u+yCfOiGUiqP8zxiDXszy8MJWuj
 BubGGgCt3OAVTZqjJhcApVJ0aHuFNZXHM00Qx70azgHkTo1jkvW5C7VlPcplMzHTA1I5KAermXK
 OPgtlrjNZZb0mBFKIqm4GxBFccaJmhVxF2SFtYmm2C8Q+mS+knCd5Aqpz8jCk00+ItTaAm0oL3c
 ZF+wnbwXiWUXk6j/UviexQURihJ5GFXwm9x0BHU/CBP16DSDqXGdskHodNNHZuaAyY8gbZ3k
X-Proofpoint-GUID: SR-xnNwNLvB3dvhlbeJQhZgTRkn5p-so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_203608_258241_EAE68EE9 
X-CRM114-Status: GOOD (  27.21  )
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
Changes in v2:
- Fixed uninitialed variable usage warnings (detected by clang)
---
 drivers/net/wireless/ath/ath12k/core.c |  4 ++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 15 +++++++++++++++
 drivers/net/wireless/ath/ath12k/reg.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/reg.h  |  2 ++
 drivers/net/wireless/ath/ath12k/wmi.c  | 17 +++++++++++++++--
 6 files changed, 49 insertions(+), 2 deletions(-)

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
index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..db839fc835816c9a2d03d194547af506760f6c81 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6143,7 +6143,8 @@ static void ath12k_wmi_htc_tx_complete(struct ath12k_base *ab,
 static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct ath12k_reg_info *reg_info;
-	u8 pdev_idx;
+	struct ath12k *ar = NULL;
+	u8 pdev_idx = 255;
 	int ret;
 
 	reg_info = kzalloc(sizeof(*reg_info), GFP_ATOMIC);
@@ -6198,7 +6199,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	kfree(reg_info);
 
 	if (ret == ATH12K_REG_STATUS_VALID)
-		return ret;
+		goto out;
 
 fallback:
 	/* Fallback to older reg (by sending previous country setting
@@ -6212,6 +6213,18 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	WARN_ON(1);
 
 out:
+	/* In some error cases, even a valid pdev_idx might not be available */
+	if (pdev_idx != 255)
+		ar = ab->pdevs[pdev_idx].ar;
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
base-commit: 7fb79ce2693c94f8f74bf62ad25a97e4b61721b8
change-id: 20250522-handle_user_regd_update_hints_during_insmod-42c71ee7f386


