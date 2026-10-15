Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF1ACC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFaIVEtMC/CpMOO9oYBKRL4gUOYoxA5Pyuc8Ag8CJeU=; b=Qf8/y5PLzzSpeDuC7lv+UGF/e8
	2JsKxIIzf3PyiP68sskDXKf8ZlXZqAdKMiDXeas8plHBSvArm46QrsxsW4/mqhX9lEqtq62e1z6vh
	BnfYs6FUdipN+5qQ8Xm9bkMyLJcj78ncN0BmNNdMCpmHgmM+dPvJkrM0SQH2m9nEZWszBqpXTIqAr
	wXcqIfQxw+CjMlEOFYuo24eLg6vF9PP9bjvXzoHCxwkbzsQNTkOWqHFgAz2Ym3A0KrlLi1tsJPzuX
	0RR3v2pYCc3g1tHmrjtPGYlT21w9BQnSYmIjZKwuYPK03And4xou/V/tZK0IFye+sj4yJWH2sWzj0
	m91U1EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHbF-0000000HEjY-34D0;
	Thu, 15 Oct 2026 09:18:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHbC-0000000HEir-1uKF
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 09:18:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F77f7k2121309
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wFaIVEtMC/CpMOO9oYBKRL
	4gUOYoxA5Pyuc8Ag8CJeU=; b=bD9KSL2Pc0nxQH8++3I6uR35BjYuPj1vsfxhOI
	QZthdKvmY4aHEQWzH7K8/nhzx12W5Nj8i+k2/Q4EkiutSKulXAn55QujETMjBpFD
	AUWwCSG+TeGONkfOC/gQRfNsqj+RyFAqkTQfMozOGRPshfGlF5DcMoQmVyLW+Cj/
	uq3lieo4QI9Bs5hQWif7iUPg+L7NmJklvaKihXLbgeE206411jp6RhYytUIL44bZ
	YDd7RaJ9xifdp0p4Silp4RaxVASEbhvoHvTGdxeujYKxgWm/Xxk6BE7Vus+wAQo4
	q79vAItpp+GSto+G/IrtDkuNNBww16KEoxUvB6NHjS2yOy5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1y20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 09:18:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso330980185a.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055884; x=1792660684; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wFaIVEtMC/CpMOO9oYBKRL4gUOYoxA5Pyuc8Ag8CJeU=;
        b=NhTehf0rwMsggkyDqkuZe39RsSjvY7UEiT6Qv/1IdXpSK8ZOU/BmsgH0sA4L3+pA6c
         d+0VWCCfBljFxrhkB5RstNBuv+Sy83QkgBuQaph3/oJ2eXa1vEAXptT5HeM2HDrE1AQK
         PUKS9hP3GJUVbFs5R7Xpf0cEcPP2utT3W6HH7YzEdCHx9qZsNyF/T17nFSAMi34s8Bog
         Ain755S35i/s5f78AW+OHlpCyUw66YYK1zkeOwSEn3rWK01GiqEq1pDOLsbuln/AtxRG
         PFGYk6JQ6UiJdzK1yGvt1hmswVqAkNrkYQWZWfMFyQS33BwRoFfIOQDjhugeMfXEVrBI
         2VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055884; x=1792660684;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wFaIVEtMC/CpMOO9oYBKRL4gUOYoxA5Pyuc8Ag8CJeU=;
        b=BzMGNdDwavZUUT49cLw0WPq75sjBuJM3VcMDQqbfkuHR4fQKhBPVup9TD+GV8mBb8w
         jqn9gdNcELFLmKtRuhQm6pnGhcldUaRE2Hi35AT47dX6dHJzi6aZsnTK9HbJwAT4NtNl
         81YncVyOK44uxHozM9Wvxx7kOHVgkJh64j08aTHMN0LNXkUWZylPxWnrKd7tZ7AP4dRz
         kvdBq1pTFa/xX/5zYErowdCUd9g5y7aaHmtnVDEpoVjI6EM5pLl9KE84Lk/MLIFu6RT8
         9E2+afnTXJyUGyj+dUQI9XWlHBtKyy0M/P+uUaRgmsbIbVl7SLTylljSXyppzzC2XP3p
         yhMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwozUXtXF/0UZ0o7Wf55S/S0jLw5cCCF/ExIjsoAQPSj7ByslLwV9aV7E7xUXxwwG4cAIPWN5g=@lists.infradead.org
X-Gm-Message-State: AFq9FYIrZKC6OeQaF7Zj490T54ORFVhToEMhqOFtMVNC/38fituWJXrE
	zQQ+DyQZO3UZcCGAcYf53/XkBVJr2qVgleo+M+jjw0IvOCJvjkB1Ib4hU6BnSW4zXFP03BA8zBc
	mSQpJUyUr4b8ovpwnuO6wtJey8Iym+qcEGAXqIuTT4Apq3pj4OY2armsV/solEr2f
X-Gm-Gg: AYBFou1Y3yo+mySNjuYNkR4qlo7CDSgw76e+0t0DaT84N0v6rkR90BFlb1jYDPFrrg6
	XMfQrj/GhKq+r6IOV2Wet8wijS6JRGYU+BE1UqqgSaFXfChK5QcssPN6byL2A81ujjS0MMW9pcu
	Te8kVzdB/AOXYezcqDz0B/MLvOcRUblP4hcPrn1kkg79Qh+YyIKA0OHrfPCfJSVdJlhD2rfXdre
	zzySGFeS4zi5SvnVk7PrGgkP+Sz97jHugCwBLk9ilbxrgJaNUG50aEayFUWWuqL7lVYsZcUQZbh
	qFYU8FUqdkw4aPta2ysUFLHpRTcTm7/dMOS0E/maL3pD3qqmx7Ib6UDtgsd7voRLZU9sx+oO3w/
	/CYuACvxDhqwqKQ==
X-Received: by 2002:a05:620a:294a:b0:93e:60e8:c9ae with SMTP id af79cd13be357-93eb95e2c20mr2981759385a.10.1792055883628;
        Thu, 15 Oct 2026 02:18:03 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:93e:60e8:c9ae with SMTP id af79cd13be357-93eb95e2c20mr2981757585a.10.1792055883017;
        Thu, 15 Oct 2026 02:18:03 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7773d02sm11840231f8f.13.2026.10.15.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:18:01 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:17:40 +0200
Subject: [PATCH ath-current v2] wifi: ath12k: fix decap of MSDUs spanning
 multiple RX buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ath12k-fix-descap-multiple-rx-buf-v2-1-4cde055677ed@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNSw6CMBRFt2Le2EfaIoiO3IdhUNpXaQSK/RAMY
 e827MDJTW7u52wQyFsKcD9t4GmxwbopG3E+gerl9CK0OnsQTNSc8RJl7Ll4o7EragpKzjimIdp
 5IPQrdsmgqZruRjWrtCDIP7On3D4YT8hzVMl7miK0OextiM5/D/7Cj8ofqIUjx8qUkjN10U13f
 bgQik+Sg3LjWGSBdt/3H/MLFhfmAAAA
X-Change-ID: 20261013-ath12k-fix-descap-multiple-rx-buf-f58b9e605d2e
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXy0g3MYI/nfWW
 +wWa05naz6CyLeySACVxbdSxwGFME5jM8ENDzOWKFln2vBpgDjjoRpM6dfFzVpDJtKcFdvvqdMI
 y4n+YEFrRaP3K9jCLVp6BZMHxySyZCuGeMCWjLjiyDLqBS628eaxfy6EHga1ilSAJXb/bH8AgT7
 SXC13v9kKYYnNN+t+Pc1CiSU/kzdOjvF4RbfX5fywEBOTsv79oAbP0Ig39Oo5i67qZ54rQKkO4H
 MyDx6y4bh7RnVUHHfKBhZZU2DXwHOCqT/RCZvGr3rX2EuejO/yN7cj5yKFq9/gsdsyut5KYpRDM
 /wlTvGGXvZPI7xZE5cWv3+TTIRKJnGUwRGFvK8lG9WhADFgkx12ghpyztn3jIeQaz9Zmv8qKwMG
 gk04z+qunqmHqBliKtEjMs2KHPUrQmF+rsDKRiGH62wPk9gJaXnuBvkw7wWnjdeUz68aJLHvKAI
 4ZUeJa7SaI3aFepyfWg==
X-Proofpoint-GUID: XbM07IpUk5Snj667VFUNMNqJvASJG-H5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX+2vQTpcGkDau
 Dr9ipIqITVXae5DbsQYTmReV75Q+N5fSTATUj1QFnN0+6fj62FCodlLEd7lHDXnrCy92b8vVZe+
 14x7bzA5EjyaygdKzoUyfytBbJbUA9Y=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad09a4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PGUsDrFX7Xmpg05z3e4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XbM07IpUk5Snj667VFUNMNqJvASJG-H5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_021806_619862_12D1D610 
X-CRM114-Status: GOOD (  14.56  )
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

When a MSDU is split across multiple RX buffers, the msdu_end TLV is
populated only in the last buffer. Since commit e8a1e49c6328
("wifi: ath12k: Add new infra for the rx path"), the RX info
extraction in ath12k_hal_extract_rx_desc_data_*() helpers runs before
the MSDU is coalesced, so the msdu_end-derived fields (decap_type,
mesh_ctrl_present, is_from_ds, is_to_ds, is_mcbc, is_decrypted, sgi,
rate_mcs, bw, phy_meta_data, pkt_type, nss, checksum flags and
err_bitmap, plus tid on QCN9274) were read from the first buffer, where
that TLV is not valid.

As a result decap_type was reported as DP_RX_DECAP_TYPE_RAW and the
frame was handed to mac80211 with a raw 802.11 header instead of being
converted to an ethernet frame, breaking reception of any frame larger
than the single RX buffer.

Fix it by parsing the msdu_end fields from the last buffer (ldesc) in
ath12k_hal_extract_rx_desc_data_{wcn7850,qcn9274,qcc2072}(), keeping the
mpdu_start fields (enctype, seq_no, peer_id and addr2) on the first
buffer (rx_desc). The tid field is read from mpdu_start on WCN7850 and
QCC2072, and from msdu_end on QCN9274. For single-buffer MSDUs rx_desc
and ldesc point to the same descriptor so the behavior is unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: e8a1e49c6328 ("wifi: ath12k: Add new infra for the rx path")
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Fix commit message.
- Link to v1: https://lore.kernel.org/r/20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com
---
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 30 ++++++++++----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 32 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    | 30 ++++++++++----------
 3 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 7cf00fda996f..7ea7559e882c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -402,32 +402,32 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->is_last_msdu = ath12k_hal_rx_desc_get_last_msdu_qcc2072(ldesc);
 	rx_desc_data->l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072(ldesc);
 	rx_desc_data->enctype = ath12k_hal_rx_desc_get_encrypt_type_qcc2072(rx_desc);
-	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_qcc2072(rx_desc);
+	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_qcc2072(ldesc);
 	rx_desc_data->mesh_ctrl_present =
-				ath12k_hal_rx_desc_get_mesh_ctl_qcc2072(rx_desc);
+				ath12k_hal_rx_desc_get_mesh_ctl_qcc2072(ldesc);
 	rx_desc_data->seq_ctl_valid =
 				ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcc2072(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_qcc2072(ldesc);
-	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcc2072(rx_desc);
-	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcc2072(rx_desc);
-	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcc2072(rx_desc);
-	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_qcc2072(rx_desc);
-	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_qcc2072(rx_desc);
-	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_qcc2072(rx_desc);
-	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_qcc2072(rx_desc);
-	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_qcc2072(rx_desc));
+	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcc2072(ldesc);
+	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcc2072(ldesc);
+	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcc2072(ldesc);
+	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_qcc2072(ldesc);
+	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_qcc2072(ldesc);
+	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_qcc2072(ldesc);
+	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_qcc2072(ldesc);
+	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_qcc2072(ldesc));
 	rx_desc_data->tid = ath12k_hal_rx_desc_get_mpdu_tid_qcc2072(rx_desc);
 	rx_desc_data->peer_id = ath12k_hal_rx_desc_get_mpdu_peer_id_qcc2072(rx_desc);
 	rx_desc_data->addr2_present = ath12k_hal_rx_desc_mac_addr2_valid_qcc2072(rx_desc);
 	rx_desc_data->addr2 = ath12k_hal_rx_desc_mpdu_start_addr2_qcc2072(rx_desc);
-	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_qcc2072(rx_desc);
+	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_qcc2072(ldesc);
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcc2072(ldesc);
-	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(rx_desc);
-	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(rx_desc);
-	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(rx_desc);
-	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(rx_desc);
+	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(ldesc);
+	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(ldesc);
 }
 
 static int ath12k_hal_srng_create_config_qcc2072(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 052b59265af8..355cf50d2785 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -922,32 +922,32 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->is_last_msdu = ath12k_hal_rx_desc_get_last_msdu_qcn9274(ldesc);
 	rx_desc_data->l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274(ldesc);
 	rx_desc_data->enctype = ath12k_hal_rx_desc_get_encrypt_type_qcn9274(rx_desc);
-	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_qcn9274(rx_desc);
+	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_qcn9274(ldesc);
 	rx_desc_data->mesh_ctrl_present =
-		ath12k_hal_rx_desc_get_mesh_ctl_qcn9274(rx_desc);
+		ath12k_hal_rx_desc_get_mesh_ctl_qcn9274(ldesc);
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcn9274(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(rx_desc);
-	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcn9274(rx_desc);
-	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcn9274(rx_desc);
+	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcn9274(ldesc);
+	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcn9274(ldesc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_qcn9274(ldesc);
-	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcn9274(rx_desc);
-	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_qcn9274(rx_desc);
-	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_qcn9274(rx_desc);
-	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_qcn9274(rx_desc);
-	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_qcn9274(rx_desc);
-	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_qcn9274(rx_desc));
-	rx_desc_data->tid = ath12k_hal_rx_desc_get_mpdu_tid_qcn9274(rx_desc);
+	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcn9274(ldesc);
+	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_qcn9274(ldesc);
+	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_qcn9274(ldesc);
+	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_qcn9274(ldesc);
+	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_qcn9274(ldesc);
+	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_qcn9274(ldesc));
+	rx_desc_data->tid = ath12k_hal_rx_desc_get_mpdu_tid_qcn9274(ldesc);
 	rx_desc_data->peer_id = ath12k_hal_rx_desc_get_mpdu_peer_id_qcn9274(rx_desc);
 	rx_desc_data->addr2_present = ath12k_hal_rx_desc_mac_addr2_valid_qcn9274(rx_desc);
 	rx_desc_data->addr2 = ath12k_hal_rx_desc_mpdu_start_addr2_qcn9274(rx_desc);
-	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_qcn9274(rx_desc);
+	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_qcn9274(ldesc);
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274(ldesc);
-	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(rx_desc);
-	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(rx_desc);
-	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(rx_desc);
-	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(rx_desc);
+	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(ldesc);
+	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(ldesc);
 }
 
 static u16 ath12k_hal_reo_status_dec_tlv_hdr_qcn9274(void *tlv, void **desc)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 61be8443e46e..abe982faeb2b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -604,32 +604,32 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->is_last_msdu = ath12k_hal_rx_desc_get_last_msdu_wcn7850(ldesc);
 	rx_desc_data->l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850(ldesc);
 	rx_desc_data->enctype = ath12k_hal_rx_desc_get_encrypt_type_wcn7850(rx_desc);
-	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_wcn7850(rx_desc);
+	rx_desc_data->decap_type = ath12k_hal_rx_desc_get_decap_type_wcn7850(ldesc);
 	rx_desc_data->mesh_ctrl_present =
-		ath12k_hal_rx_desc_get_mesh_ctl_wcn7850(rx_desc);
+		ath12k_hal_rx_desc_get_mesh_ctl_wcn7850(ldesc);
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_wcn7850(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_wcn7850(ldesc);
-	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_wcn7850(rx_desc);
-	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_wcn7850(rx_desc);
-	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_wcn7850(rx_desc);
-	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_wcn7850(rx_desc);
-	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_wcn7850(rx_desc);
-	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_wcn7850(rx_desc);
-	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_wcn7850(rx_desc);
-	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_wcn7850(rx_desc));
+	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_wcn7850(ldesc);
+	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_wcn7850(ldesc);
+	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_wcn7850(ldesc);
+	rx_desc_data->rate_mcs = ath12k_hal_rx_desc_get_msdu_rate_mcs_wcn7850(ldesc);
+	rx_desc_data->bw = ath12k_hal_rx_desc_get_msdu_rx_bw_wcn7850(ldesc);
+	rx_desc_data->phy_meta_data = ath12k_hal_rx_desc_get_msdu_freq_wcn7850(ldesc);
+	rx_desc_data->pkt_type = ath12k_hal_rx_desc_get_msdu_pkt_type_wcn7850(ldesc);
+	rx_desc_data->nss = hweight8(ath12k_hal_rx_desc_get_msdu_nss_wcn7850(ldesc));
 	rx_desc_data->tid = ath12k_hal_rx_desc_get_mpdu_tid_wcn7850(rx_desc);
 	rx_desc_data->peer_id = ath12k_hal_rx_desc_get_mpdu_peer_id_wcn7850(rx_desc);
 	rx_desc_data->addr2_present = ath12k_hal_rx_desc_mac_addr2_valid_wcn7850(rx_desc);
 	rx_desc_data->addr2 = ath12k_hal_rx_desc_mpdu_start_addr2_wcn7850(rx_desc);
-	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_wcn7850(rx_desc);
+	rx_desc_data->is_mcbc = ath12k_hal_rx_desc_is_da_mcbc_wcn7850(ldesc);
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850(ldesc);
-	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(rx_desc);
-	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(rx_desc);
-	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(rx_desc);
-	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(rx_desc);
+	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(ldesc);
+	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(ldesc);
 }
 
 int ath12k_hal_srng_create_config_wcn7850(struct ath12k_hal *hal)

---
base-commit: 08a3f02fea636e97a7422d1512f76dacdb5b0887
change-id: 20261013-ath12k-fix-descap-multiple-rx-buf-f58b9e605d2e

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


