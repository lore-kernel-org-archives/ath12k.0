Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0725FCD3440
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w2jzuTsl7Vqy1OwTlK7qU/Odevc1NEfSotLinMWOYk=; b=E38wT1ZfwyPwoO3UrYL/aDxr9t
	VqqBXZDgDkHMviN0v0xjDRJ4IvqF4H/l+/1ltfyDx+QF1y05bS9tWXdrW+pk6L7Oi3HvHWQIgWmpW
	wXD9K9zt8cJDSioOStvqJ9ilhLZZdDtD6juChp67vpJM1CGP9P+rH5wVefglhhiQCgYASLfgU1Oc3
	7dy3E+E43EtA68NSvEqt2Oyk99AVUT4TZi3I6AoX3TKXuUCoMeXIAQ+uyUO6UiuUtUUCFaU5TkkAW
	A1H06h8VgCXwBQbiQ9vQg6t5bgXGoU0WG+1K9U2fCjtvAr98P2Pz6u+2V13LL6YjWQpuqi3po6Dq4
	mKvn5FSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGva-0000000GXKp-3ENd;
	Tue, 05 May 2026 14:39:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGvY-0000000GXJC-1H5b
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:39:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645DQX8h3187538
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7w2jzuTsl7V
	qy1OwTlK7qU/Odevc1NEfSotLinMWOYk=; b=I3UqU+XIaCXadnm5qxIwE1NHuIL
	6OR0phEcypLgGbTiDKfaSn0mFvSCzHr+eSwR6nnlHI5RbmyXTHloMNiSFwugDe6x
	Egf8z8Vy03FmexA9UcrA7zO56jHfvUuu+zRWorMmEw3ypwzznF86PpWgXTWUoCFH
	W7rqJ/zrc1ai/0/MaqCACyiPgMUcd/6pkha0bmFnopo8vhqPfCvHO49id4NU+cny
	Gp0GQqcHfAb7PgJkaM79q0DwlRd9YUWqZTxjU+NZh8eMve2c49+WsMeDwTsKIJ9j
	W8rbsHh5DgwxyN0sgXX+t5703M62nmxCGoMF/7SXi932mFtFflO4ggoOjiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk9stj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:39:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso7065672a91.0
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777991950; x=1778596750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w2jzuTsl7Vqy1OwTlK7qU/Odevc1NEfSotLinMWOYk=;
        b=a4Q1z5Vi/pG9SsiTlaE6JahQlC+/9wfVY6gMRKwMFVNWZ1+aNTtCKblX7TVuiw6FRl
         zcpGAsmYPGE0W6X4cMR1W22boPf3DU4bGCo2OzXcNcciceyHs215EzH/DlcN+tzoDpeS
         o8CbPvgk50WNquMsqqRaASuOyVq/+/e5Si938tmYfGZoaU+ixHxRaL9a3RMQdXp10OeQ
         4l8Z7AheVLNZUlhhB/r3qRrlg8a5wguFhrKAiVX5INFppqtbkqV5CMzMkRS7PAPA7GGK
         /qxxeC0CChBg26LOJsLTe5gADbNGt4ks00g0ViYWFgqLJt+gTq2YoBAEclH9eGKM/Vue
         ZVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991950; x=1778596750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7w2jzuTsl7Vqy1OwTlK7qU/Odevc1NEfSotLinMWOYk=;
        b=DMqUf9+X1h2b9kqNPF9wbSdNEoLDfZ51XnHYJLRXAML6Q4sHjYmZV3fqdoKiexRu6I
         A5l+TPJyO/AIcXF6av4sP1nToexv45UMKW7uQyemyrCEEHn8rxY8yi6CFM5dTn3ecUTh
         roQmf1OYYHlK8zrXu/9xHxOlhSf+ynhXnqMnp5YMY+FrQ7yaJyo/58UMrb4hoSfiiL+e
         JuNjbAYHeH580HZ1qgTVtP+yQhQQOuJ/X2PS3HxDzj77rC+4+jOQZ/lER3l0iCd6VscG
         2tM85aD3jbLYQ0ZCLT1FtmZ7ohkWLlJc/GxEiRb8Es64CkKWGgYchqcKHKHeu3Otn9/Q
         /hsg==
X-Gm-Message-State: AOJu0YxhqrxJlzD08jw7ueWpgOEGfQ8ldTRu4YUvmIzKCnbVXLXfnOcZ
	QsRng+09hRtlJepwKOJWem6/PctEfqBY4c4mFNHXFaOOnkU9lyia5mrN11A9ldwEgKM3tgZrJv4
	aT5CQj/Aid7GehpVm1fhb+6ZJJGP6F/FaYUNdJLeTtDHOpE6DlzhEh5p61Ff2YyIx0BqxEy65
X-Gm-Gg: AeBDietUEsQaReYue5pY0Wq9AZUiHffqFsNdYBrgIFIY23S7uVe3/jkP0T5C1l9/j3+
	/T/zL0LFvn7a6n7U3tjRQeBQsZWAUkV6YdAJiY0/2HGNfr5msp3C++UYvnvBp9fGzGtZEb6eT31
	j5z0E6zEqHcvRlcxJgJolIHuyYTSKwulVcK1YE4lNYsCJ4B/koPxlLsaaPj/B2ydxjA3TXVkWPn
	diaBPPYwWDKK607RKRK4+RwQ22njzu10F7hjUIuVnxnbnOrpUAuaJqXDJR/B8I7sq0DvO26Cv5L
	F/mGFxyyzHSwnw9wAAM3qEShwHYNT/8sKG9KGh+cG1rsqYinluAENXhTTVBBMDqA2A61mxgQxcH
	58Uc8iun7emFeic5T0g+YHJsuzp8voZaIwYzv5m3Jc3+6tKG9eR1U149RrkhFY2pfqZf4RVOmhf
	KSAAMVgvMnyeovE6dmlAN+s1+r8GK351JffWSHTQZsrxr1Gg==
X-Received: by 2002:a17:90b:4b0b:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-365722540e7mr3205577a91.2.1777991950106;
        Tue, 05 May 2026 07:39:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0b:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-365722540e7mr3205521a91.2.1777991949341;
        Tue, 05 May 2026 07:39:09 -0700 (PDT)
Received: from hu-amitajit-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36578259e7fsm2831030a91.2.2026.05.05.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:39:08 -0700 (PDT)
From: Amith A <amith.a@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, amith.a@oss.qualcomm.com,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Add debugfs support to simulate incumbent signal interference
Date: Tue,  5 May 2026 20:08:53 +0530
Message-Id: <20260505143853.295368-3-amith.a@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505143853.295368-1-amith.a@oss.qualcomm.com>
References: <20260505143853.295368-1-amith.a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0MCBTYWx0ZWRfX7TtYGWPDxUSV
 M6DzzMwfKYIFIKWdoBIbzA7Mf9Hf20hVt3si9P/qULR/xy64KcpiA4GDYeU9chWDWq43dHXhity
 ZcjE4u2P0A2m+OhMvqSQKvQlIqk3Co4VybIz7sVuRZ/HYah0sT3RZaEEAKnQP9pTDe+XMbn6iap
 GlX2tHHRzgPTNAk8I4SBHGZT9Sml6CoRq/pFqBxFLEMUEerSuyrO3EIaZKWyIG7/gbQwHCJ6ZM5
 OPvYDmTuJVuiUSS6jf/+VinZkOYVeILXnyWtl/oaLCHicfzq745C4/lxlyRorm4rhCKaN1JbhMi
 Wv9WA1VEpPz6lBUNlHfVCf+djvyngMswIhH9E0Hdcp9Gov38pMY3cza4aZZPwLRiQjreNOmrXBW
 4j4PUB8Y/yWz/nEB6r75BbKUGmB9zrJkRvpkq5/rc05HQLku6+x8SsQqPgkJFozQdXjvw/M5C6J
 c6EM7wnBagDAfzBfMjQ==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69fa010f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=E_qLJZnl5bbyJCvZBeAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Y5EHGOqqjYPf4D-28sMpuOOZphUUq-So
X-Proofpoint-ORIG-GUID: Y5EHGOqqjYPf4D-28sMpuOOZphUUq-So
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073912_485216_01A6D10F 
X-CRM114-Status: GOOD (  17.60  )
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
index b9e107cfd869..4ec5b12f703b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -10561,6 +10561,42 @@ int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
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


