Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE1D46952
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E74W34W/eG+FYxMKIL2lw+1iyQKgUkv2lDVmu9qYHfc=; b=kZf73FSYXO13cE2V9SU49ftD/t
	R5yYeBopT0RIt38zUxLgz0i8VUWG3qQC5bB+g6SonmSFq1hArVogpAhz6yqN6n00WjEtMu8YNNLLU
	8cUiq9oCBPh0jFSbkQ9NiGcGU8qY8zk1jhfI8sRmsbQrDy8D1cX2Z9gGKYX57KPuu1mk3JZcfgkxS
	o9dXONZNWJcgmmX99qypT5E3PbFG5suA/Ood13giHItwqrmgZgPAhrw+9bpy7q2ZqwVArYi6ZV1yh
	dP9eQqGubIIN0OPqMQX/M56iET9Nr04XniyatLqGlNV0zu8vB08qhOy59QmWx9mKs4Dqjpmhfm9vF
	9monhcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAy7-00000008Juv-2CC0;
	Fri, 23 Jan 2026 06:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAy5-00000008Jtw-1PLf
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 06:48:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4Z4473811202
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E74W34W/eG+
	FYxMKIL2lw+1iyQKgUkv2lDVmu9qYHfc=; b=j0tSiiUx5ZzsxJl5CyZpbxl6rdK
	pV74N4TvHJPYs17Jtmch5uK/fnLtN+9iIoDv/XmndWuPgrGtF9QsBYFlCDr7o+Jt
	cBeAW+J2uXVqrk9JgaS+4H7v5Sc7iKOS6DKiin2Rl+KIlE9frr2itCnttAc9JDyk
	ptSa3kae6SW9UEdSoFmYCu6vYhWLpeBwgQtha5o4z6KqGUw0bYNy6wdO2sHLVA74
	3pEB3qGhYWC9+mqioAkuAPJ2zbcl1E07ZWxqM0lhSHg7zLwHpueW8KhowfWZ9Jl1
	mH+7e+sL+JAwVnjFsNud6CIsCmohJ0cagaoixiw25Hk26VzfpzooJl068hA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1brm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b738854780so926801eec.0
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 22:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769150908; x=1769755708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E74W34W/eG+FYxMKIL2lw+1iyQKgUkv2lDVmu9qYHfc=;
        b=DfCkn4oipZ0wlSp4MllJEVSGAr9zTTv931p9vkBP1iCkbWwhV0DfQJayzz1UpWSYFV
         n2tkk9Qvf57zK4nQI45KGeUkFNKs5rEQQI/pdQ26btUwZ/gSmQJX3r++H57B9QyclA/1
         2lA3UB79v4+0Uh/xY+5RWJcf8dX2wyzbO2KVUpyT5JM8A7yLszqAPo9j9/kCXj2/0Q6P
         qB62+YXCFZzszsFXcMPk6hCe/xWvwJuB4Ionydmg1CeudDqzH/aPdttmMRrTt67GN2vN
         nhTv5sN+JiCzs9iqwl/4u6ivZqld6O0HfY+eYlC1TeG7FeDxQIbTjh94aPWM4KLn28Uh
         Acig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150908; x=1769755708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E74W34W/eG+FYxMKIL2lw+1iyQKgUkv2lDVmu9qYHfc=;
        b=bHLMB4qhIClh7Y8taHY0pK2emzmljsaL9/OfdoS6zJHco3gTJ1S2G8XVSyDoUvzEf/
         eA6JA//icDRK11MHP7FlYsezMMUJ2I1e2nPHs2dIREq2zD5WM6JlQYgWwq4rhbPwOjVp
         54s72QzIaqtXiyGfTSBeVrjYaLpHO6Pg2vBzuSWJydj1KYuXFTmW7pkwBk75UpWO9u/S
         szUpQ22m7WA/3+NsOGbCGErsMS2RykzGVCmj7K6dZBZJHv2ym3kSHM0GxLp/CzqZiBHX
         Js6tvM+8Hk/SdWfXUsdGCswKjjXc3SHz09PZfhSh6rpp0BqgW2nJoSw8MtAe9T8gsmqA
         s8zw==
X-Gm-Message-State: AOJu0YztT8NxoVgDi6WEYuTUS2308nxOeMUAC6KOgBpr9QNi+gvvbTif
	aMfD60gLegJmb6Ndni32Rf37j1K1VfcSQz7y6ZcbpqYLjgI7hhul1fpsw+0NIwiL18yDX3UrjM3
	XZKoKz2iYy3KFAmYtje1jAPTOjqZnP6QZlkac4OO68NZuG/pU7wT3XgKv7HuhYG+U
X-Gm-Gg: AZuq6aLLRITcQTK5d0oCwVnsZWg1mwTP2eM7NDDFgL7GUuLE3HZ8QDWJRJbsiDDFUGI
	WSYN69fRKv3Ww2IjpS+gFmx0MFl3qXuOofnwSosrlF1DnuoRa+ppwgjbRww6ceHCBKj78erTx82
	4TKxUzdbV2XS4PyDstY9A9u78ZxrkK0um9k+OBY1pcRHzcxppyx7r3PDedM4WBHGQKnk1xFITCg
	10/ddTifZofy9tuaoe8sP6vACyt5lWigChfRVPt7AdkJEim1SLhsvPUP3evr80kYJHmdSWhsOHe
	ifLc0j0d6KBpw36eJsxofDLXbRZ34tvEVBrrrFtQJ/0bU1jbwZRFFtWzevcoAOW2fuSVUazuXa/
	y8yX+4PTiW2sVWrRyYACXkvZ9oIo2ZDyfHQEfn4mDOf3RJkFSCh0vw/yh03aLVeQlRA==
X-Received: by 2002:a05:7300:570a:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2b739bce0bdmr1023593eec.25.1769150907736;
        Thu, 22 Jan 2026 22:48:27 -0800 (PST)
X-Received: by 2002:a05:7300:570a:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2b739bce0bdmr1023568eec.25.1769150907050;
        Thu, 22 Jan 2026 22:48:27 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90d13esm2819484c88.2.2026.01.22.22.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:48:26 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 1/2] wifi: ath12k: add WMI support for spatial reuse parameter configuration
Date: Thu, 22 Jan 2026 22:48:16 -0800
Message-ID: <20260123064817.364047-2-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
References: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lmfsTM2UNLfYNR5e2nWvdr8lk6dQKI-E
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=697319bc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OEGGlgRjERhNdV2A9hcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: lmfsTM2UNLfYNR5e2nWvdr8lk6dQKI-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MCBTYWx0ZWRfX4m45deKzt+PP
 LGZSHDF6RqJc84FTcc5sb4e9jxw/qkAISK3UjD8RJLFAz5T9dQVuFo3i4Kj716G5lKsV4O/TMeS
 9hSp2S0phfDRuQs87qdVPnshNtdpoQqMmlH7z39eDtxSIcMJOd4QzAIa21XimkJ6bWlilqbg0eQ
 GPZ9yuJlhEVA77aP7wWQ1oRo1+hM6gxtPYdMIviLpYo/cvBE+OH2pO4nylsD/shsBF20UlKoRYx
 6O3SMwinu+Mayvkb/0n8htI+UP7/gFw82KM/zV18KV9NAliI89ZIS9sr7OPcyp/BkCAPZnq4/ZF
 /ntvFXiuy0JVhgzOlwW0hW9NcuEBuwq41Bi1CZMJb+Un+ouefs6c1SEV4kvEgfOXtZXiTTcy8Ub
 OcPN1XEdHzenxZj+M+51UtJptFek+E6Tyhk/OYrb4jSXDEhZCDOqtqc7ZYG1vWBuD9Pw5SsrPV+
 xyknfRWYWJA/5MnnTJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224829_382258_FC7BB32D 
X-CRM114-Status: GOOD (  16.77  )
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

Add WMI support for configuring SRG and non-SRG OBSS PD bitmaps at
the pdev level. The new commands allow the host to set BSS color bitmaps,
partial BSSID bitmaps, and the corresponding enable masks used for
SRG/non-SRG OBSS PD processing.

Introduce new WMI command IDs, TLV tags, a service flag
(WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT), and a bitmap payload
structure required by these commands. These additions are needed to
support HE Spatial Reuse and firmware-managed OBSS PD behavior.

The APIs introduced in this patch will be utilized in an upcoming patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 142 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  46 +++++++++
 2 files changed, 188 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cce3d699112d..7617fc3a2479 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -126,6 +126,14 @@ struct wmi_tlv_mgmt_rx_parse {
 	bool frame_buf_done;
 };
 
+struct wmi_pdev_set_obss_bitmap_arg {
+	u32 tlv_tag;
+	u32 pdev_id;
+	u32 cmd_id;
+	const u32 *bitmap;
+	const char *label;
+};
+
 static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 	[WMI_TAG_ARRAY_BYTE] = { .min_len = 0 },
 	[WMI_TAG_ARRAY_UINT32] = { .min_len = 0 },
@@ -3560,6 +3568,140 @@ ath12k_wmi_send_obss_spr_cmd(struct ath12k *ar, u32 vdev_id,
 	return ret;
 }
 
+u32 ath12k_wmi_build_obss_pd(const struct ath12k_wmi_obss_pd_arg *arg)
+{
+	u32 param_val = 0;
+
+	param_val |= u32_encode_bits((u8)arg->srg_th, GENMASK(15, 8));
+	param_val |= u32_encode_bits((u8)arg->non_srg_th, GENMASK(7, 0));
+
+	if (arg->srp_support)
+		param_val |= ATH12K_OBSS_PD_THRESHOLD_IN_DBM;
+
+	if (arg->srg_enabled && arg->srp_support)
+		param_val |= ATH12K_OBSS_PD_SRG_EN;
+
+	if (arg->non_srg_enabled)
+		param_val |= ATH12K_OBSS_PD_NON_SRG_EN;
+
+	return param_val;
+}
+
+static int ath12k_wmi_pdev_set_obss_bitmap(struct ath12k *ar,
+					   const struct wmi_pdev_set_obss_bitmap_arg *arg)
+{
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	const int len = sizeof(*cmd);
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(arg->tlv_tag, len);
+	cmd->pdev_id = cpu_to_le32(arg->pdev_id);
+	memcpy(cmd->bitmap, arg->bitmap, sizeof(cmd->bitmap));
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "wmi set pdev %u %s %08x %08x\n",
+		   arg->pdev_id, arg->label, arg->bitmap[0], arg->bitmap[1]);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, arg->cmd_id);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send %s: %d\n", arg->label, ret);
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int ath12k_wmi_pdev_set_srg_bss_color_bitmap(struct ath12k *ar,
+					     u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "SRG bss color bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
+int ath12k_wmi_pdev_set_srg_partial_bssid_bitmap(struct ath12k *ar,
+						 u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "SRG partial bssid bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
+int ath12k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath12k *ar,
+						 u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "SRG obss color enable bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
+int ath12k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath12k *ar,
+						 u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "SRG obss bssid enable bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
+int ath12k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath12k *ar,
+						     u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "non SRG obss color enable bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
+int ath12k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath12k *ar,
+						     u32 pdev_id, const u32 *bitmap)
+{
+	struct wmi_pdev_set_obss_bitmap_arg arg = {
+		.tlv_tag = WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+		.pdev_id = pdev_id,
+		.cmd_id = WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
+		.bitmap = bitmap,
+		.label = "non SRG obss bssid enable bitmap",
+	};
+
+	return ath12k_wmi_pdev_set_obss_bitmap(ar, &arg);
+}
+
 int ath12k_wmi_obss_color_cfg_cmd(struct ath12k *ar, u32 vdev_id,
 				  u8 bss_color, u32 period,
 				  bool enable)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index fdc203fdba0a..2a81819ef543 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -374,6 +374,12 @@ enum wmi_tlv_cmd_id {
 	WMI_PDEV_DMA_RING_CFG_REQ_CMDID,
 	WMI_PDEV_HE_TB_ACTION_FRM_CMDID,
 	WMI_PDEV_PKTLOG_FILTER_CMDID,
+	WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID = 0x403b,
+	WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID,
+	WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
 	WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID = 0x4044,
 	WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID = 0x4045,
 	WMI_PDEV_SET_BIOS_INTERFACE_CMDID = 0x404A,
@@ -1076,6 +1082,9 @@ enum wmi_tlv_pdev_param {
 	WMI_PDEV_PARAM_RADIO_CHAN_STATS_ENABLE,
 	WMI_PDEV_PARAM_RADIO_DIAGNOSIS_ENABLE,
 	WMI_PDEV_PARAM_MESH_MCAST_ENABLE,
+	WMI_PDEV_PARAM_SET_CMD_OBSS_PD_THRESHOLD = 0xbc,
+	WMI_PDEV_PARAM_SET_CMD_OBSS_PD_PER_AC = 0xbe,
+	WMI_PDEV_PARAM_ENABLE_SR_PROHIBIT = 0xc6,
 };
 
 enum wmi_tlv_vdev_param {
@@ -1987,6 +1996,12 @@ enum wmi_tlv_tag {
 	WMI_TAG_SERVICE_READY_EXT2_EVENT = 0x334,
 	WMI_TAG_FILS_DISCOVERY_TMPL_CMD = 0x344,
 	WMI_TAG_MAC_PHY_CAPABILITIES_EXT = 0x36F,
+	WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD = 0x37b,
+	WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD,
+	WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD = 0x381,
+	WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+	WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
 	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
 	WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT,
 	WMI_TAG_TPC_STATS_GET_CMD = 0x38B,
@@ -4925,6 +4940,12 @@ struct wmi_obss_spatial_reuse_params_cmd {
 	__le32 vdev_id;
 } __packed;
 
+struct wmi_pdev_obss_pd_bitmap_cmd {
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 bitmap[2];
+} __packed;
+
 #define ATH12K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS		200
 #define ATH12K_OBSS_COLOR_COLLISION_DETECTION_DISABLE		0
 #define ATH12K_OBSS_COLOR_COLLISION_DETECTION			1
@@ -6329,6 +6350,18 @@ struct ath12k_wmi_rssi_dbm_conv_info_arg {
 /* each WMI cmd can hold 58 channel entries at most */
 #define ATH12K_WMI_MAX_NUM_CHAN_PER_CMD	58
 
+#define ATH12K_OBSS_PD_THRESHOLD_IN_DBM		BIT(29)
+#define ATH12K_OBSS_PD_SRG_EN			BIT(30)
+#define ATH12K_OBSS_PD_NON_SRG_EN		BIT(31)
+
+struct ath12k_wmi_obss_pd_arg {
+	bool srp_support;
+	bool srg_enabled;
+	bool non_srg_enabled;
+	s8  srg_th;
+	s8  non_srg_th;
+};
+
 int ath12k_wmi_cmd_send(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath12k_wmi_alloc_skb(struct ath12k_wmi_base *wmi_sc, u32 len);
@@ -6432,6 +6465,19 @@ int ath12k_wmi_send_twt_enable_cmd(struct ath12k *ar, u32 pdev_id);
 int ath12k_wmi_send_twt_disable_cmd(struct ath12k *ar, u32 pdev_id);
 int ath12k_wmi_send_obss_spr_cmd(struct ath12k *ar, u32 vdev_id,
 				 struct ieee80211_he_obss_pd *he_obss_pd);
+u32 ath12k_wmi_build_obss_pd(const struct ath12k_wmi_obss_pd_arg *arg);
+int ath12k_wmi_pdev_set_srg_bss_color_bitmap(struct ath12k *ar, u32 pdev_id,
+					     const u32 *bitmap);
+int ath12k_wmi_pdev_set_srg_partial_bssid_bitmap(struct ath12k *ar, u32 pdev_id,
+						 const u32 *bitmap);
+int ath12k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath12k *ar, u32 pdev_id,
+						 const u32 *bitmap);
+int ath12k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath12k *ar, u32 pdev_id,
+						 const u32 *bitmap);
+int ath12k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath12k *ar, u32 pdev_id,
+						     const u32 *bitmap);
+int ath12k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath12k *ar, u32 pdev_id,
+						     const u32 *bitmap);
 int ath12k_wmi_obss_color_cfg_cmd(struct ath12k *ar, u32 vdev_id,
 				  u8 bss_color, u32 period,
 				  bool enable);
-- 
2.34.1


