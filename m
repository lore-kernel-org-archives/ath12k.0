Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDAD6CFDC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/qwcHbMcXSH8QXMkuE5bSj87sqnAzQguXyeiqhw7ME=; b=qDpYgffkB2NJ3ZyVq/p53J+caJ
	WEyXzdKrDhLLxuEXrD9Hd36PhBSLbK7VKq5XVvF1QxACY7z2bVTO0T6/Ql0KYCugYAe7LNEXDiq3w
	4uZ4N5zbygneVCd0Z6V+gdFURpcb+DAee+NbvffaUwSvJlwPE1igyn8+o2qS3GWvc3u+by1SKkcne
	xSSzXl0Q8RtG3sSZeja5gwjsY4WIeHUkfYSflZLb634UoTr8drvKRJS911Z3XaQ+X6SJht7hnAsRN
	ENr7RSVYPQsKPRDzKs/NxoCUWWTMwisTxm0AiVHHINiY/fhJogIe29MXqwcHSbx5B/DYjgdCGcNSL
	qPfl1R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBM5-00000008M0s-1HdR;
	Fri, 23 Jan 2026 07:13:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBM3-00000008LzU-0Z6V
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 07:13:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6AaBE3126228
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V/qwcHbMcXS
	H8QXMkuE5bSj87sqnAzQguXyeiqhw7ME=; b=a+x4wPkAndGyTEau+BBscujs/Cz
	sIEA+oja6uwO4eO9fVmb+py8THvB16HqnrmBqSTz2zzU5JZySyXTHfGK0Bw8e8VR
	rLTFHh/rRoQBKnKPy3JQslw/ruRx7Mu/CK9IyZpGUUsapNZemwsSdQAL3NSgXQDD
	7/JNWxZEEWtd+pa6Ii5Qa7bSB3yPd8l7neWLpWxxFW6ard7VZOwauWt4xwk4NSxO
	MmDBbx+Y+wHpUlMSS+5ervQn6ru/brkfYThC0bK0WUYNYMsS4PO5bXSEUSieKqc5
	7Xz9IUsFEM/b8TnzvRR0+vZN5g2akMZ4+zCwFHnCyXa+wkOImfg/q1Quc6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdsw6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a75ed2f89dso16900945ad.1
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152394; x=1769757194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/qwcHbMcXSH8QXMkuE5bSj87sqnAzQguXyeiqhw7ME=;
        b=fKzjr2ywXr6anlKBn9ZROd9IRGcCDkZQN8wGoJrqSA/YH1hGKbMPk4uBJxwmoLw7X1
         SsTOGLSI4vKZyWMjol83LLN+0d0HvBCK6XRhmi6euZSiS812AkG0bMPsWUiPO7oLvRDB
         pVXpu4oJUXzxeBQb6uHE+19NtVaXtPMJBUdxCFbMmX/ZuN+u9po2D3fZt1r9UTgCst+w
         hGTyQbawTINk6Km7E+xBLx7e0huVcVqbL50SpUntbxnlNpJvGgRoi549wnB+Kw+2Mm/W
         9ao7yAfD8zw5DEfN5WRUjdHXcp1qCGTzMG/uxKRgu+PtvBQsCMlXUQGSKxrhvsiG9GoX
         SvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152394; x=1769757194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/qwcHbMcXSH8QXMkuE5bSj87sqnAzQguXyeiqhw7ME=;
        b=aL6p6zzlioGWcCWkTzuQYu5HQrsd964z6/wusMd2If7zXVV6fzSK+Ugu/o3h8kBry7
         ZaSiZD9BBZdi4KSKDwffrK0BOnVLosETPC5+EwfDVrNZvrcK3zPLqFmvytO+n0sjCrM8
         w2eUhNQ4FfG98VvdxDTHqstCUUo3SPd35LBIoqNV31Oe3kgNRYefC1aSXY4GazOjNOzy
         y/o2+bd5G1fHTk8fqlFeY3rVHoAbVJfPbiN21RrDYy3Y/1CMoZSPXntrez1dq3xap12A
         MCnv7q4s+gJstukPnYm9aMm//g4S8u3HnXpiy4Y4W6tf8XB6XWz73HlcVwE/tgWwVZ6k
         CQuw==
X-Gm-Message-State: AOJu0Yyp7j8wYJAEsTgmbXiLUGB/35WeB6pXE8Ow6fPcZpETTIGJXBp1
	HgPQMsiZwfceRZMX2L2ZDXMuk0OuxGb/sqbMYQGB6uRq96mERCat0CJl5Kkph1/nXPZnVA3oWEt
	GiTU6VC03W+nMVDepB5kx+u+CRY+jZlx2yO1J0DebDsxhOxgdZMdIJi+weYS7bEalDV2C7eIY
X-Gm-Gg: AZuq6aLBWNjnA3RSqmhPZaQ5bTwovkzn5zZnH+Ni1nlLu8bUSPDg0pC33zSgEqjRpue
	hv7UgarNOa70jRwAScwegaUSzjjxhtthktw1q47hhJ8IZveHrWyVfjhl96CQ5TQnfPV61DnFUNG
	X0W4H4+ikQJfWAJem9nW4df5gL5eciMrcnHyGFSgHxwsAfOK6sCeh2k6yvK7NSU/GjpnIeNBbsq
	NxkXLLT1RHLUV6wO6U0Mq+k3+xVGO5OPQ7fcNiZL0S3qo7kX2eLJd2ZbYmxz/UFViMBq1D4VbYn
	+mSykWKmwmO/Wqa7ayEtopItW30pZjuRxKip6pWZxIwCExMIVvWb1VkyfDkfcEvS9RLc8T0akwW
	hniBDyhc047tpnB5LubGczKcIQJxYQT1qLLlp3e8P/FPw5A3xQBwyatBRKDuYjNLEgxtPR08GJ/
	9StrnhvqnIOn6Y7wXyLRl+x/ZIEZbJAnvN
X-Received: by 2002:a17:903:3508:b0:2a7:80ac:85b2 with SMTP id d9443c01a7336-2a7fe571d6bmr18174305ad.16.1769152393402;
        Thu, 22 Jan 2026 23:13:13 -0800 (PST)
X-Received: by 2002:a17:903:3508:b0:2a7:80ac:85b2 with SMTP id d9443c01a7336-2a7fe571d6bmr18174055ad.16.1769152392863;
        Thu, 22 Jan 2026 23:13:12 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa654sm11319165ad.11.2026.01.22.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:12 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath12k: Add support RX PDEV stats
Date: Fri, 23 Jan 2026 12:42:52 +0530
Message-Id: <20260123071253.2202644-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX6dM6KVxcbdrh
 ls/Bvmv69WGItwY3lkDIiBQgOw3HMM+m736q0PZL3ZkBPbij47Un3y6DYoo1v7VIDTSdIjolBmE
 xRDYG1RKEcWFGMBK6SJ8ILM8RTNhLGYbeTrN0O50Zu6NHQ5sx2mqZ7KWp7pUzufHcFmTg5KPToE
 Ux+qUMSfDZ1GlqC263NjCzui5Yg2oUUBleMrhMs5TPlYqkbHITOAPcHsVLO1GjnE1CyVfK/o2F9
 FEunqhFMbCH0hoQxyQlaqnt+HOikcnwOJEdgXEIbSeQP3qDZ8hyvJchfLkOy1l2lcqH5txnM7cZ
 VFnRoKuaF1VdtKS4BwUjPtRQC4vxJ9jdWcusjOQRehIiUxYmpSem4FsfsdNu1bI9hSBmigJgJma
 qjfmZm7GlQIvqImG4NepxZ7Fs7PQCPaRqTCbPwUm7iQ9AjGddy3F/fAIczxBJwUvzNb5ulgN2tB
 6Xgi7jENg6hZjr47Xfw==
X-Proofpoint-ORIG-GUID: nNaqFWkaVHBLaNmbPeIylAniQf85NbZa
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=69731f8a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=45njEKoxy3GZgKQkHzYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nNaqFWkaVHBLaNmbPeIylAniQf85NbZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_231315_178881_7F5BDC15 
X-CRM114-Status: GOOD (  13.00  )
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

Add support to request and receive RX pdev firmware stats using HTT
stats type 2. This stats type reports PPDU and MPDU counters, firmware
ring and buffer statistics, and RX suspend and resume counts.

Note: Currently, firmware on mobile-centric chipsets do not maintain
      these statistics, so a query will not return any information.

Sample output:
-------------
echo 2 >/sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats

HTT_RX_PDEV_FW_STATS_TLV:
mac_id = 0
ppdu_recvd = 1522
mpdu_cnt_fcs_ok = 1522
mpdu_cnt_fcs_err = 0
...
fw_ring_mpdu_ind = 1522
fw_ring_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:21, 5:0, 6:0, 7:0, 8:1501, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
fw_ring_ctrl_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
fw_ring_mcast_data_msdu = 0
fw_pkt_buf_ring_refill_cnt = 1567
fw_pkt_buf_ring_empty_cnt = 1
...
rx_suspend_cnt = 4
rx_suspend_fail_cnt = 0
rx_resume_cnt = 4
rx_resume_fail_cnt = 0
rx_ring_switch_cnt = 0
rx_ring_restore_cnt = 0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 125 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  55 ++++++++
 2 files changed, 180 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 4f749d473d0e..a667eb9966c9 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5539,6 +5539,128 @@ ath12k_htt_print_pdev_rtt_tbr_cmd_res_stats_tlv(const void *tag_buf, u16 tag_len
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf, u16 tag_len,
+				      struct debug_htt_stats_req *stats_req)
+{
+	const struct htt_rx_pdev_fw_stats_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			le32_to_cpu(htt_stats_buf->mac_id__word) & 0xFF);
+	len += scnprintf(buf + len, buf_len - len, "ppdu_recvd = %u\n",
+			le32_to_cpu(htt_stats_buf->ppdu_recvd));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_ok = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_ok));
+	len += scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_err = %u\n",
+			le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_err));
+	len += scnprintf(buf + len, buf_len - len, "tcp_msdu_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->tcp_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "tcp_ack_msdu_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->tcp_ack_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "udp_msdu_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->udp_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "other_msdu_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->other_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_ind = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_mpdu_ind));
+	len += print_array_to_buf(buf, len, "fw_ring_mgmt_subtype",
+			htt_stats_buf->fw_ring_mgmt_subtype,
+			ATH12K_HTT_STATS_SUBTYPE_MAX, "\n");
+	len += print_array_to_buf(buf, len, "fw_ring_ctrl_subtype",
+			htt_stats_buf->fw_ring_ctrl_subtype,
+			ATH12K_HTT_STATS_SUBTYPE_MAX, "\n");
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_mcast_data_msdu = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_mcast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_bcast_data_msdu = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_bcast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_ucast_data_msdu = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_ucast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_null_data_msdu = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_null_data_msdu));
+	len += scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_drop = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_ring_mpdu_drop));
+	len += scnprintf(buf + len, buf_len - len, "ofld_local_data_ind_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->ofld_local_data_ind_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			"ofld_local_data_buf_recycle_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->ofld_local_data_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len, "drx_local_data_ind_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->drx_local_data_ind_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			"drx_local_data_buf_recycle_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->drx_local_data_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len, "local_nondata_ind_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->local_nondata_ind_cnt));
+	len += scnprintf(buf + len, buf_len - len, "local_nondata_buf_recycle_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->local_nondata_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_status_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_status_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_status_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_status_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_pkt_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_link_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->fw_link_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "host_pkt_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->host_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "host_pkt_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->host_pkt_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_pkt_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_pkt_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_pkt_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			"mon_status_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_status_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_status_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_status_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_desc_buf_ring_refill_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_desc_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_desc_buf_ring_empty_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_desc_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_dest_ring_update_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_dest_ring_update_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mon_dest_ring_full_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->mon_dest_ring_full_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_suspend_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_suspend_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_suspend_fail_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_suspend_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_resume_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_resume_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_resume_fail_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_resume_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_ring_switch_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_ring_switch_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_ring_restore_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_ring_restore_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_flush_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_flush_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_recovery_reset_cnt = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_recovery_reset_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_lwm_prom_filter_dis = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_lwm_prom_filter_dis));
+	len += scnprintf(buf + len, buf_len - len, "rx_hwm_prom_filter_en = %u\n",
+			le32_to_cpu(htt_stats_buf->rx_hwm_prom_filter_en));
+	len += scnprintf(buf + len, buf_len - len, "bytes_received_low_32 = %u\n",
+			le32_to_cpu(htt_stats_buf->bytes_received_low_32));
+	len += scnprintf(buf + len, buf_len - len, "bytes_received_high_32 = %u\n",
+			le32_to_cpu(htt_stats_buf->bytes_received_high_32));
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -5692,6 +5814,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_SFM_CLIENT_USER_TAG:
 		ath12k_htt_print_sfm_client_user_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_RX_PDEV_FW_STATS_TAG:
+		ath12k_htt_print_rx_pdev_fw_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG:
 		ath12k_htt_print_tx_pdev_mu_mimo_sch_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index 8008658371aa..a6656f20b845 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -127,6 +127,7 @@ struct ath12k_htt_extd_stats_msg {
 enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_RESET				= 0,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX			= 1,
+	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX			= 2,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_SCHED			= 4,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_ERROR			= 5,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TQM			= 6,
@@ -188,6 +189,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG		= 25,
 	HTT_STATS_SFM_CMN_TAG				= 26,
 	HTT_STATS_SRING_STATS_TAG			= 27,
+	HTT_STATS_RX_PDEV_FW_STATS_TAG                  = 28,
 	HTT_STATS_TX_PDEV_RATE_STATS_TAG		= 34,
 	HTT_STATS_RX_PDEV_RATE_STATS_TAG		= 35,
 	HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG	= 36,
@@ -2075,4 +2077,57 @@ struct ath12k_htt_stats_pdev_rtt_tbr_cmd_result_stats_tlv {
 	__le32 mu_res[ATH12K_HTT_FTYPE_MAX][ATH12K_HTT_MAX_SCH_CMD_RESULT];
 } __packed;
 
+struct htt_rx_pdev_fw_stats_tlv {
+	__le32 mac_id__word;
+	__le32 ppdu_recvd;
+	__le32 mpdu_cnt_fcs_ok;
+	__le32 mpdu_cnt_fcs_err;
+	__le32 tcp_msdu_cnt;
+	__le32 tcp_ack_msdu_cnt;
+	__le32 udp_msdu_cnt;
+	__le32 other_msdu_cnt;
+	__le32 fw_ring_mpdu_ind;
+	__le32 fw_ring_mgmt_subtype[ATH12K_HTT_STATS_SUBTYPE_MAX];
+	__le32 fw_ring_ctrl_subtype[ATH12K_HTT_STATS_SUBTYPE_MAX];
+	__le32 fw_ring_mcast_data_msdu;
+	__le32 fw_ring_bcast_data_msdu;
+	__le32 fw_ring_ucast_data_msdu;
+	__le32 fw_ring_null_data_msdu;
+	__le32 fw_ring_mpdu_drop;
+	__le32 ofld_local_data_ind_cnt;
+	__le32 ofld_local_data_buf_recycle_cnt;
+	__le32 drx_local_data_ind_cnt;
+	__le32 drx_local_data_buf_recycle_cnt;
+	__le32 local_nondata_ind_cnt;
+	__le32 local_nondata_buf_recycle_cnt;
+	__le32 fw_status_buf_ring_refill_cnt;
+	__le32 fw_status_buf_ring_empty_cnt;
+	__le32 fw_pkt_buf_ring_refill_cnt;
+	__le32 fw_pkt_buf_ring_empty_cnt;
+	__le32 fw_link_buf_ring_refill_cnt;
+	__le32 fw_link_buf_ring_empty_cnt;
+	__le32 host_pkt_buf_ring_refill_cnt;
+	__le32 host_pkt_buf_ring_empty_cnt;
+	__le32 mon_pkt_buf_ring_refill_cnt;
+	__le32 mon_pkt_buf_ring_empty_cnt;
+	__le32 mon_status_buf_ring_refill_cnt;
+	__le32 mon_status_buf_ring_empty_cnt;
+	__le32 mon_desc_buf_ring_refill_cnt;
+	__le32 mon_desc_buf_ring_empty_cnt;
+	__le32 mon_dest_ring_update_cnt;
+	__le32 mon_dest_ring_full_cnt;
+	__le32 rx_suspend_cnt;
+	__le32 rx_suspend_fail_cnt;
+	__le32 rx_resume_cnt;
+	__le32 rx_resume_fail_cnt;
+	__le32 rx_ring_switch_cnt;
+	__le32 rx_ring_restore_cnt;
+	__le32 rx_flush_cnt;
+	__le32 rx_recovery_reset_cnt;
+	__le32 rx_lwm_prom_filter_dis;
+	__le32 rx_hwm_prom_filter_en;
+	__le32 bytes_received_low_32;
+	__le32 bytes_received_high_32;
+} __packed;
+
 #endif
-- 
2.34.1


