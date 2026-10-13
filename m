Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82462CC6B03
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9ShrRG5zS8l+PwwehzQXgIOF7eyLATLXxjmQkLn458=; b=UuJVQUJplcZWQ+qhiLlRpvJ/Tf
	dm2eXtyesnJQ3x1KURMN8r8Tqc8vZYWH/yqQ/wB8HcSZamoV5ynMbgFQ/Tk+HVbcAn/lZZB1Gff5L
	VC5rRNr+4oZZGgSYDIZtuh+0s5SHZt4nF63LbRrFqcJ3TIhIRdkVH/rGOsdAQhMH079aKD/wAs1+p
	KfW8rVgKnhouEMfJRQTv2dmZHWdkiR/V/pDfTk84H+/HLqxT26B92+IwEwPuvDmI9auShM+pRPh2K
	eICw+/0eL+y4ijMc3jeX2O20T5IP7HVzJpXh5BJUcPhn12KOV1+Sl9DCBVzwU/TzD47FC6l31/nyR
	MSt3k74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGca2-0000000Cx5v-0GLA;
	Tue, 13 Oct 2026 13:30:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcZz-0000000Cx5M-3x51
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 13:30:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9Xvu2173444
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 13:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p9ShrRG5zS8l+PwwehzQXg
	IOF7eyLATLXxjmQkLn458=; b=coGzJh7VyRjliMXmDiCyBWXe0fFuMJNDPZhFJ9
	pTtmUXjhfp2Aa5tfUKKq2ypJdJqa9+7yZ8//uBbDrXC7n2mf26C5JuuNsK0+tOsO
	ZUMEc7a5QaNTkZHTT6/iql48NLAmmfdf7LePSH4rBRiqovANRAfsso9iuiaSHKD/
	RiQ/KnYbESrVzO6kj8jjIy5dd1DanjRXaZy4j8aorV9tYoUQAOIicVIZjthQxFET
	ZGdazM8MKyLO2ltOaDgBSu0JUddWIOvIMVdU0tz2dqr0hGzcszNO2Z/5/8MFQLZe
	zNDJTPl34Ny8rGDhrjUtLsMHEifQrS7KrQKF+tXBujrPTGow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqt7m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 13:30:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so598596785a.0
        for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898206; x=1792503006; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p9ShrRG5zS8l+PwwehzQXgIOF7eyLATLXxjmQkLn458=;
        b=Z7H+/TU/lOR5ZyDGhUmgKWCaA6HYaqLgFMvlUinYqMKG5iAg6Q2yUwNjS3uRDtnOfy
         rQ+0mOUd9VLCkI9ONP8OUdML+1mk9iHstf5LYXCqwOdvn8MYU5ht++6NFiwIXgkIDgC8
         RevflCDJzfzh4mSAILF4FIN30vW0F1hkPfJecCW2n05Q/Ak2IEP0pgGSDhw+uAUXOafg
         87DKVthf7KEWVQDHDz3ampvVA5U99XlEKS0HMc11A94U6syNg4vvUK1IA89ngDawlsoE
         pSdDwcpvwGiirk5hUTErus6e7rmnT1vcHO2IyFMzhnKxrAx79tcScoffS78BwFsm5sWD
         w0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898206; x=1792503006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p9ShrRG5zS8l+PwwehzQXgIOF7eyLATLXxjmQkLn458=;
        b=iRE6D2bQuYrMwe3ma+t8/mOzrlIO2+k4IQY1mMuvTm81Am1+UY53gkL5kNJsCrQrBB
         QiF+w9uiwTxcXbIoEqx/2VGIEmNJ4O7ioAMT79WMr8Yq/L2T7p3z2eJKv+Pb0rZLLQ5z
         RgEEpRpys3VqFfMZHlMR2WgNZ7pNzdgH9MtWZhONap5TOeZSB3oSZZp6aiaCCTB9yFQB
         PQTly8PTW+BVdrzB5GY0poA1kagCNMS+VOItx+9zc8OOzlxSoY9pddphNVHI019tNVVV
         lMxP0kNwTwgmnJHLMVSHQa6l8EkMFhNDQFom25WCOlmSYJzpSTgcFSVm3oo/YBLV0Pyz
         64WQ==
X-Forwarded-Encrypted: i=1; AKwUvBw33tEEQDUaZ3RMJWb0diM/cIGmV0GLWA07/MMGzlMxUYQRIzr2uek3wBrhDUvrnEG6VTzy+Mw=@lists.infradead.org
X-Gm-Message-State: AFq9FYInWH58h2q118iMXkLsOiM0Hvb7TB5SDT1tNoqQStd0EQcgqqXP
	DSL9ryysEBSEc5WXQ71tktFeo/aReNv9CcSIIYc5Q1zLZShowwXlr//jhnG0VjkvN13wUFPFZ5t
	2Ai4blFRahgwZfEcv70BkKB1shdyK7iDxbPnLj0Mf/U7REU3utPGVauRnrJREaN7d
X-Gm-Gg: AYBFou1uBkBXKq6XkwVEBjMnk08pqm63KKMKdkb82PCveb8S0Dqf0FAtufdtiOb74Yj
	NmA+DEsrRs2gfxenDkadFuC+xAqGNqDtXxQMRhNlb3YBVStIIwth/rrszRZE0x56TigvATgqtgw
	8QeIW0OIK1UyYaTFFbHZNf6Gou+ppISVkeyehORjFW8WbjDNUfvpXI0VJoZWpqKIvHe43ebuw3z
	I6rgVjtVaBeoizbKIUfNvojyt+KyjuKozsZYo+tcwh+ugl7afSCmoiVN/OJVFKvs4PnG9w4pF5T
	x8ChteBxp8INL6PmHqdLBU1ciNZFMwpEI1ZMa4/Eiq9mJPXrVFlzEpoDZUtFedlgokErivDt0ii
	pTeOJwTDEJfnUug==
X-Received: by 2002:a05:620a:6cc3:b0:93e:f4f4:346 with SMTP id af79cd13be357-93ef4f405e9mr434851085a.39.1791898204412;
        Tue, 13 Oct 2026 06:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc3:b0:93e:f4f4:346 with SMTP id af79cd13be357-93ef4f405e9mr434843585a.39.1791898203625;
        Tue, 13 Oct 2026 06:30:03 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm6386843f8f.4.2026.10.13.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:30:02 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:29:41 +0200
Subject: [PATCH ath-current] wifi: ath12k: fix decap of MSDUs spanning
 multiple RX buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQrCMBBFr1Jm7UASaVGvIi7SZGIHawyTRAqld
 3dw+eC//3aoJEwVbsMOQl+u/MkK9jRAWHx+EnJUBmfcZI09o2+LdS9MvGGkGnzBd18bl5VQNpx
 7wjRe5itNZoyOQH+KkK7/jTuojqGLUG7wOI4fJ4+Du4AAAAA=
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
X-Proofpoint-GUID: Bz5fni_7-06l6shMvO7_dLkfgXk97Brh
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace325f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=30pSA2KbGxZrRlviRsUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX0Du5IoI0RlH6
 3dLsEbJvvLYfV5wponiby9YdujNW164pCCg2QsKtdAmqdJq9iiwiMBy/V94kRgi33UVA5WdGeuY
 6apTTgodnE7WPhP4fkvcGU+6hmkxJWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfXzmgd1Qg777jV
 14nSJOw2Zyz9XzqR4ZzuqF0j5Xl0C8JYv1vsh3W7r7gQr+npKWlySAB71boSvoBq5JGwaq8b+Gr
 jqzAJnPNCi05Y2x64fwc3OWIQs4JyRhF9o+o5ENGLND13Y9b4iV+9f11z4hSWWJrB1Aka7Ox/G5
 IDrNOQF0PmUM1ngz9n6xhb2eTo9SpNkvu3SFhBGlZKL1vNiVOprk7ewtqiJROvJh34tJEE3QEi/
 99hXeJpEFtDyMJpaxCP/fG0/1QpbkDgYc45TXonWu8DOczh8ZLP+EZ5FN8teRXoEIc2mooRToAm
 kNwVeuz35yWtvFWsHQl38ch4eSFOi+1LyFfygEO1ZEBtlCjQVHFgWSnmiHfhGljSzWdJQWoZk8t
 MbhgD+ilZ80HlcRyhZy7m4ZmTplXfyuxT9oBDsVK0o3YRi5xXTkYq/6eWIpMAuydwJ9+xwhOaVT
 gGnEIeTBfw2jOJLs32g==
X-Proofpoint-ORIG-GUID: Bz5fni_7-06l6shMvO7_dLkfgXk97Brh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_063008_002418_92AF3FB2 
X-CRM114-Status: GOOD (  14.20  )
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
err_bitmap) were read from the first buffer, where that TLV is not
valid.

As a result decap_type was reported as DP_RX_DECAP_TYPE_RAW and the
frame was handed to mac80211 with a raw 802.11 header instead of being
converted to an ethernet frame, breaking reception of any frame larger
than the single RX buffer.

Fix it by parsing the msdu_end fields from the last buffer (ldesc) in
ath12k_hal_extract_rx_desc_data_{wcn7850,qcn9274,qcc2072}(), keeping the
mpdu_start fields (enctype, seq_no, peer_id, tid, addr2) on the first
buffer (rx_desc). For single-buffer MSDUs rx_desc and ldesc point to the
same descriptor so the behavior is unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: e8a1e49c6328 ("wifi: ath12k: Add new infra for the rx path")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
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


