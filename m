Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BDFCD3427
	for <ath12k@archiver.kernel.org>; Mon, 11 May 2026 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV0ICYiszQYc3S4jZWSNWvmLyvcxkJgwvd5Dn21gKDE=; b=LTbiw0G0lD1eqnp9bq7LVV/uvu
	Flah+pb43eXyKNpN8x2aj7+HwE2nY7NGmSm9z4jlcjMfx+1PGX2VciEmf+2sgzAu9iljq4GGmQkx7
	8euHzFMmEfocwuqHbi9IE51wQfvyfLDX6LZeC+JC9Qt30gwJiHmQp7maii+M6lhsbKZSoGhVzBx9j
	gx0kZycXr1ku/2yqapZPpr7700GjF5V+RPXxHF5xzyJxvb8rqKFNmEpZpbm54l9V7HzpoZQ2Ra5eY
	MSMTp1WOH6MkfhRXYAKV6l6EHVAzL00XT1h45q3QkbFYEXqdBXv/B8t/5KBu6v+IN0EdTGxLYr8ja
	AIQRYK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHrC-0000000CE0a-34Sw;
	Mon, 11 May 2026 04:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHrB-0000000CDzq-0xqp
	for ath12k@bombadil.infradead.org;
	Mon, 11 May 2026 04:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rV0ICYiszQYc3S4jZWSNWvmLyvcxkJgwvd5Dn21gKDE=; b=mwAUWgh9klCGuwO63qq12gBz7F
	oWmVgzZ2Oe33FOhVfnT/1HPtfWyw752TWYp8fvmXj22XDk9O6HkR+/d1ZBCsv2XDjDyM3ZQ1AtfOd
	LLYp9xHMITQjD5sO6T8U6ioujmnmtQw7IWvY7Rs3cgCPR61AVyWYcWtX79ePilQ8YPxgpdnocDFRe
	fPgn/w3a7zF9Mfj809IIkB3PYsHJfWtd0x7PN60BSFzNIfBkEJzOdBInd2ZVy7poz1SRXIJuq63x4
	MyJrZS0VdtFH1sJ7UvtX40E1CT7deEH8qwvc0tJEUp2yaom49k2r4zLGARj0dRRNi8XOFI+TsL5Gr
	O3nkDQbw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHr7-0000000AaGd-2phu
	for ath12k@lists.infradead.org;
	Mon, 11 May 2026 04:03:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AKn4LX4125765
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 04:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rV0ICYiszQY
	c3S4jZWSNWvmLyvcxkJgwvd5Dn21gKDE=; b=cqT/ljFbPcGIerFj3EW7ABNVEzf
	a0ILBl4cRabFxbkItKBWygdly3xvEg3FmRJoko/OeHiKwiyCZuuy3hyOe6V/eLyu
	rrNJvWb1RK50rxnRRj4X5k5kgm3f4pwDg4JIBqrcBd0LVMs3dp7icEsdkY/LqY8O
	mffiXV1CCCiDKKQQHNs+lMVnu9gTxEQM46b0+ZJXIYgbuGhZ6cuOjd3sKRExDSlA
	gMTUZYX7Bt5y7G+tCrJ2aVHPXghpgBeTXOp3haicLtHSi1q3LKrEDezepSKci9mi
	3hWotee2xIZShCl0oyCqws+lMugSm0O/27VDFt5PeakbhaK8L9GjaBQIaxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy4b4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 04:02:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82751074c8so1683426a12.0
        for <ath12k@lists.infradead.org>; Sun, 10 May 2026 21:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778472174; x=1779076974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV0ICYiszQYc3S4jZWSNWvmLyvcxkJgwvd5Dn21gKDE=;
        b=RjkR4dQQ2GJObfPni27bZ/U3pBM4AwxS36zjvhI8emJ+4NIZMyyoADJA0c9guFmIw1
         oLO+g6j4BbfQjQfRqVKc4sR1LNOTRC5ZX3dvjE8mbL3+s5GnC2BOmjYfc3FLiLIPpXUq
         X1Xv14T4BW0fTAFhwNwT4leifE2uWnM0lkYc1W2OTYA2HhGfD2JSaK2w496UxCORz/KI
         Gt61aClucyfrLK07sbAYyXs1UsPxUxrcYOy3RnWzmNf1p6PrvN+C79r0NQHOyY1M70fH
         6u3IEohk6hxpIG6iYdlPvl4znJS0aF2KIL1KDADh74HdYBfn4x3AxtxL3VgS5EXbuTqp
         VU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778472174; x=1779076974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rV0ICYiszQYc3S4jZWSNWvmLyvcxkJgwvd5Dn21gKDE=;
        b=azBFl3EapR2NHXVKBmge4eXt+eWuSCRY8Pni4Oq9hV5xXXXC13vXz6bZYMnkU1wCWc
         QTxWSN0bAIIT1GO38vp9bLlzrVotJFC1xiEiKPgoa4n+JDmLatAwwbJBrlv5qhNGvl/N
         0zkKwJmRpBik+yA8KN9bEtAM0DBs9QSafPpUe9PP52uukBjtHjKiwajcBAvY8xAQlOrg
         CHLVRIwXjpT58a6d0UzCmfvA+pQCwviZholAtA6Bah4h6xgrlmUpJxdHhCSKDszJbmMI
         fjsVcmNXKAPouSjif7wmALcC8g7Y36thRM0Ow4hB7oAo02rJTpOSPIe7t9evvYmsQaBc
         jSQg==
X-Gm-Message-State: AOJu0Yx9MrijZSEH6K4A/yEgJurTM7WpnSeZlz+OCXNrzLvOGn9FlUWk
	CNcjuHQnnUCIuWtS7BhPmtIJfquYYRBAF0Q7/aVzP2Qf19Wyj5wq0ZmcQnpXTUIf5zXZDDnWxI0
	xXJztlGs1dJjoWZdIV3mUcYdVAFi23t7Uzduov7AvkZwK4t69ovWi1mIFe/Ox8X6bl+BasWQ0
X-Gm-Gg: Acq92OEoOFc7gg8MuiA0XBgkZnixw94pKjFhUo6tUT/e5VDwhUA2Bl8YB0snTvtvgeC
	n9VwCdXlGchY9peu8tArZmsGjCKM7TX249+JxTC4bQccRO7q6FAYEjERsE/dpO1mGiFcQJokT+r
	MCijZJvOwi1OfZFjDc9/0yU29nwiVpqKPJGAD1R5XohJOdqoQrEpGoiUwTc9bmQpn0KrpbnTp14
	GhxhnuuwXQKPWeBvvUFK+tEOw9pNgSCaJ/eZWCBU6PYCOcSuheiYMsCRyp3Vt856Y9Xm9AIUvGA
	WJMfGGscJ7KywFdh4eFzENav92DHnE0LiF/3M1XiLRQknJDlqjf4/OQhA14xTwaI7U7Sb04NMXX
	DrqIqpZJx9ti8X47eDI7b+SOz0Xf6ApyxqRpPklYFwCFD5Ym5kqvC7WKr8kdNcODYYM7hhlvP0U
	6NXpvq6alFjhaju6KD8rC+NEDO90EEBEIL35c=
X-Received: by 2002:a05:6a00:1891:b0:837:e9cc:d458 with SMTP id d2e1a72fcca58-83e39150f1amr7787006b3a.10.1778472174491;
        Sun, 10 May 2026 21:02:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:1891:b0:837:e9cc:d458 with SMTP id d2e1a72fcca58-83e39150f1amr7786966b3a.10.1778472173935;
        Sun, 10 May 2026 21:02:53 -0700 (PDT)
Received: from hu-amitajit-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm22792259b3a.46.2026.05.10.21.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:02:53 -0700 (PDT)
From: Amith A <amith.a@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, amith.a@oss.qualcomm.com,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: Add debugfs support to simulate incumbent signal interference
Date: Mon, 11 May 2026 09:32:42 +0530
Message-Id: <20260511040242.1351792-3-amith.a@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
References: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a0154ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=E_qLJZnl5bbyJCvZBeAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 4vNfzDl9nBQZuNjb8SbInBspTuNVROKk
X-Proofpoint-GUID: 4vNfzDl9nBQZuNjb8SbInBspTuNVROKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA0MSBTYWx0ZWRfX7mdZtkT9b34u
 cdGCBn2A5mJzZVjMk6EiObUA9XpQv/8NpXS5mtoQIAo1UfN40Y1ajolrnkevisBPIlGNosE2LsP
 vqy+Al6HlZfIeszjZiLHFuvsjr/L/O4lz1ZyO7wJViaFLap4ZIAqZGppAjmXpVOjU4AVp4P22fd
 WSkeX3kDqqatoDb8NsUyOZkkJ1z8OWydBvxfYtq8XZGhu0Y8OuY9+IUofM2BIWidaoioJcdmNiN
 kLpi8a4C+B68V7PFqmDtvTvf5c/VNTHiOmVuLZId2cvA7/PqBlLcnEqF0QS3fXqmuvTEO+4XFWl
 AVO4lHrSokU9CdzjfnpfPlZwwXKrzoTkfcmgTXdxp/9y2ZUl6C0th4u5P9GX/nk6HJVhal4kN7V
 7W59eM9pwdJR3MOyzfk5sP9BJv89DN1Lj7dUIKyJcBgComPRIVibFtxwdwVnC2gR3uZRtnWBYzF
 sbvhRuu9AOEflskdbeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_050258_450840_34663AEB 
X-CRM114-Status: GOOD (  17.84  )
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

From: Aishwarya R <aishwarya.r@oss.qualcomm.com>

Add debugfs support to simulate incumbent signal interference from the
host for testing purposes. The debugfs entry is created only for 6 GHz
radio when firmware advertises the support through
WMI_TLV_SERVICE_DCS_INCUMBENT_SIGNAL_INTERFERENCE_SUPPORT flag.

Debugfs command:
echo <interference_bitmap> > /sys/kernel/debug/ath12k/pci-000X/macX/simulate_incumbent_signal_interference

Each bit in the interference_bitmap represents a 20 MHz segment. Bit 0
corresponds to the primary 20 MHz segment, regardless of its position
within the operating bandwidth. Bit 1 represents the next adjacent 20 MHz
segment, bit 2 the lower 20 MHz segment of the adjacent 40 MHz segment,
and so on-progressing sequentially across the bandwidth..

Example:
echo 0xF0 > /sys/kernel/debug/ath12k/pci-0002:01:00.0/mac0/simulate_incumbent_signal_interference
This indicates that all the subchannels in the secondary 80 MHz segment
were affected.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
Signed-off-by: Amith A <amith.a@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 46 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c     | 36 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     | 14 +++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 8c81a1c22449..d17d4a8f1cb7 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1450,6 +1450,44 @@ static const struct file_operations fops_pdev_stats = {
 	.llseek = default_llseek,
 };
 
+static ssize_t
+ath12k_write_simulate_incumbent_signal_interference(struct file *file,
+						    const char __user *user_buf,
+						    size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
+	struct wiphy *wiphy = ath12k_ar_to_hw(ar)->wiphy;
+	u32 chan_bw_interference_bitmap;
+	int ret;
+
+	if (ah->state != ATH12K_HW_STATE_ON)
+		return -ENETDOWN;
+
+	/*
+	 * Bitmap uses the firmware primary-based ordering documented in
+	 * ath12k_wmi_transform_interference_bitmap() & intf_map_80.
+	 */
+	if (kstrtou32_from_user(user_buf, count, 0, &chan_bw_interference_bitmap))
+		return -EINVAL;
+
+	wiphy_lock(wiphy);
+	ret = ath12k_wmi_simulate_incumbent_signal_interference(ar, chan_bw_interference_bitmap);
+	if (ret)
+		goto exit;
+
+	ret = count;
+
+exit:
+	wiphy_unlock(wiphy);
+	return ret;
+}
+
+static const struct file_operations fops_simulate_incumbent_signal_interference = {
+	.write = ath12k_write_simulate_incumbent_signal_interference,
+	.open = simple_open,
+};
+
 static
 void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
 {
@@ -1515,6 +1553,14 @@ void ath12k_debugfs_register(struct ath12k *ar)
 			    ar, &fops_tpc_stats_type);
 	init_completion(&ar->debug.tpc_complete);
 
+	if (ar->mac.sbands[NL80211_BAND_6GHZ].channels &&
+	    test_bit(WMI_TLV_SERVICE_DCS_INCUMBENT_SIGNAL_INTERFERENCE_SUPPORT,
+		     ar->ab->wmi_ab.svc_map)) {
+		debugfs_create_file("simulate_incumbent_signal_interference", 0200,
+				    ar->debug.debugfs_pdev, ar,
+				    &fops_simulate_incumbent_signal_interference);
+	}
+
 	ath12k_debugfs_htt_stats_register(ar);
 	ath12k_debugfs_fw_stats_register(ar);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 8609c612aa2c..25e61cc7e5ac 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -10568,6 +10568,42 @@ int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
 	return ret;
 }
 
+int ath12k_wmi_simulate_incumbent_signal_interference(struct ath12k *ar,
+						      u32 chan_bw_interference_bitmap)
+{
+	struct wmi_unit_test_arg wmi_ut = {};
+	struct ath12k_link_vif *arvif;
+	struct ath12k_vif *ahvif;
+	bool arvif_found = false;
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ahvif = arvif->ahvif;
+		if (arvif->is_started && ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
+			arvif_found = true;
+			break;
+		}
+	}
+
+	if (!arvif_found)
+		return -EINVAL;
+
+	wmi_ut.args[ATH12K_WMI_INCUMBENT_SIGNAL_TEST_INTF] =
+		ATH12K_WMI_UNIT_TEST_INCUMBENT_SIGNAL_INTF_TYPE;
+	wmi_ut.args[ATH12K_WMI_INCUMBENT_SIGNAL_TEST_BITMAP] =
+		chan_bw_interference_bitmap;
+
+	wmi_ut.vdev_id = arvif->vdev_id;
+	wmi_ut.module_id = ATH12K_WMI_INCUMBENT_SIGNAL_UNIT_TEST_MODULE;
+	wmi_ut.num_args = ATH12K_WMI_INCUMBENT_SIGNAL_MAX_TEST_ARGS;
+	wmi_ut.diag_token = ATH12K_WMI_INCUMBENT_SIGNAL_UNIT_TEST_TOKEN;
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "Triggering incumbent signal interference simulation, interference bitmap: 0x%x\n",
+		   chan_bw_interference_bitmap);
+
+	return ath12k_wmi_send_unit_test_cmd(ar, &wmi_ut);
+}
+
 int ath12k_wmi_connect(struct ath12k_base *ab)
 {
 	u32 i;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index d74f7fca7678..b5b3e472631c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2269,6 +2269,8 @@ enum wmi_tlv_service {
 
 	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
 
+	WMI_TLV_SERVICE_DCS_INCUMBENT_SIGNAL_INTERFERENCE_SUPPORT = 286,
+
 	WMI_TLV_SERVICE_11BE = 289,
 
 	WMI_TLV_SERVICE_WMSK_COMPACTION_RX_TLVS = 361,
@@ -4244,6 +4246,10 @@ struct wmi_addba_clear_resp_cmd {
 #define DFS_UNIT_TEST_MODULE	0x2b
 #define DFS_UNIT_TEST_TOKEN	0xAA
 
+#define ATH12K_WMI_INCUMBENT_SIGNAL_UNIT_TEST_MODULE	0x18
+#define ATH12K_WMI_INCUMBENT_SIGNAL_UNIT_TEST_TOKEN	0
+#define ATH12K_WMI_UNIT_TEST_INCUMBENT_SIGNAL_INTF_TYPE	1
+
 enum dfs_test_args_idx {
 	DFS_TEST_CMDID = 0,
 	DFS_TEST_PDEV_ID,
@@ -4251,6 +4257,12 @@ enum dfs_test_args_idx {
 	DFS_MAX_TEST_ARGS,
 };
 
+enum ath12k_wmi_incumbent_signal_test_args_idx {
+	ATH12K_WMI_INCUMBENT_SIGNAL_TEST_INTF,
+	ATH12K_WMI_INCUMBENT_SIGNAL_TEST_BITMAP,
+	ATH12K_WMI_INCUMBENT_SIGNAL_MAX_TEST_ARGS,
+};
+
 /* update if another test command requires more */
 #define WMI_UNIT_TEST_ARGS_MAX DFS_MAX_TEST_ARGS
 
@@ -6682,6 +6694,8 @@ int ath12k_wmi_send_vdev_set_tpc_power(struct ath12k *ar,
 				       struct ath12k_reg_tpc_power_info *param);
 int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 					    struct wmi_mlo_link_set_active_arg *param);
+int ath12k_wmi_simulate_incumbent_signal_interference(struct ath12k *ar,
+						      u32 chan_bw_interference_bitmap);
 int ath12k_wmi_alloc(void);
 void ath12k_wmi_free(void);
 
-- 
2.34.1


