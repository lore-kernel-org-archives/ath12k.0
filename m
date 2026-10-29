Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67067606A31C
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fc+F/L3l;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UmEh678b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CS+R9264
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dWwinrMGwUDykZ7hC59tjMQpoDgfX6I4YnFKofnefH8=; b=Fc+F/L3lI/9w2XWcq2fRQdlvSN
	BY7DpFKRulfLwItpzcAEKR6TvnnhYp07oTOblQYLAwcBNEv5rZWOEvp6m94KKnxrL6dICYIhrCOWu
	+yLroWn0kQtjOLNkcvW4V4Iv1wy1US1EhqkjkR8r4wyKhMQ8VhCwLy2F3QmMK++oDqB/GUKMA4jqz
	R+Y1eekzeKe9/tE2MRJpGbGIKKtK/xaqEZzA3GFCGQtyl7rwhPxtmdOfc4F9hEODLtMpCb5537BSC
	rxxNQJ0ea6yXaHX0k33JqKUnLwxQY2RgVDymaI6YsiV3R+5tVIKa9vp9XIHzEI8VSgNsmUKN+fOu5
	qFjz7E3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMra-00000008uHn-0qwE;
	Thu, 29 Oct 2026 09:56:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMrX-00000008uH7-2GRd
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 09:56:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vbG3179664
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 09:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dWwinrMGwUDykZ7hC59tjMQpoDgfX6I4YnF
	KofnefH8=; b=UmEh678bDp5OX9wnxKYvIjKO6xg6Fja0ARclWaNfIzt+w4kO5RO
	ci1vF4q5cdKDTRCGLueIM4YkJE7KVvhIgcpE1Q8oF4AXRcADrvCdA5poCucRcDNi
	17LgEQPARmNmgBF/hF+1t2GYGpcPVBzGC0gELGEhEl+Bh6bn6fmlCqoLNC9boXha
	sGfZL+gkC5dRP225gwfWdqBV1J0EaQ4ktcrFrHefKS9jEeT0XrZzLiCmysDMEpyR
	ilCA/BKRMmZ2TIcwEPYgBvqIipbke/coiZx8bNhVy3KgjBR49FRyg1u9HkIU46iW
	lniF97MpMOcPsRffAfM3YCSrPGvWJiYwWVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2ycq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 09:55:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1292483a12.1
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793267757; x=1793872557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWwinrMGwUDykZ7hC59tjMQpoDgfX6I4YnFKofnefH8=;
        b=CS+R9264/V8YTDGCEQsmSnwQsDvMsEexj2yxB5Dc0pDKPNO4MLGwpCrQ8AFWPbV2PS
         op5t3uuKEeWr4FMy8z2h7Ax4O2vkrGULa/htONqTkrDl+RyidJ1KQkmj6aVtF0OlZDMk
         WBraPhUkHyFygudTnNwCjB61DDkQ73tvAk+oWLpdjeSfQOyHNejrg0ERnraDbxV3S5XA
         WLl5DhNtwHBWMnvZSHOEOVBtI6HxuWRvNao5K5Ul4Lq9yYGb2HxecWUK1yI7g64IxFB8
         9nHmJnNoqCX1JFt5p8k+E3mPbG1Ce+Ywdvp0BD8TPrpWh0FosaVE68aWuhfGookYjUP4
         cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267757; x=1793872557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWwinrMGwUDykZ7hC59tjMQpoDgfX6I4YnFKofnefH8=;
        b=Xnu9AJh0h6I7hKhBejl4vi/cLOIRiFegDdFOHYXu1ZM3YTqNH0dPLe7JGdx+gyfnoH
         S3g59IB7IW+7/Lu0K6++RoB2ulJKZKQBdlp0OVvb4x3CpGhBVN9/0MoCQXN4KCWWLMuM
         jBY9RORDXSyhBJsoZJ7IIOU+IVW7mwFh+zkDwk4lIIzl4MjmO0cKsgTN36T5F8KvGRyi
         BbIIiV5zgWwphwabXGnsAe51A9DFBU+Tjr2S/zWHfPCs4wC5TAnF5vWD2gpYps7UzOUP
         r7HCMd+DARGIsHxLk5/USBZF1EbIJ5FCbdbClKyTLrHmMkrX8MJT0E5HEl48xkTWtM5Z
         DNOw==
X-Forwarded-Encrypted: i=1; AKwUvBy42r1ilKYS3KCEkjlHRc8XfZmHkA01zB3PlyBs7K/x67Y+yEdSZEmkD/pcGZG6Rl75Sx2lCFs=@lists.infradead.org
X-Gm-Message-State: AFq9FYLhdeK8CxNB9+avQ5qXEGO99Auj1pyCTSYLcRgWa87ZPDiquKT0
	TW7oPcR/s8R5K3c0V+jwA5m3iyQgVRJ5oVZMWnTfvJHwInYjVlp7v5wmGuronrdEQBZXdpuhMjl
	CLnKZ/tpy4Z3S7UxmzRe8bE8n0d5EpxWrWrgICBC8+HJg3prj38ttyCmQZ2zeAGx+
X-Gm-Gg: AYBFou2XYgJ28co5BG9Gsb2Mt1w+TWFfOm51wa6lWf+pjJzAsSqh3xfOEizKPfK1Xyg
	c6EW6CmaYmCPc4KJ6T6Wq9iERkg7DIR+D4SnIq+MNWF2O7mKQTjZw8iXUHiHsclvwLjaupv01/e
	I72zok48PGjNpOMxpg7wlyxcWgdY0NoDIYOqkVO+jaPJmFveA0z/aBdmlUitIojBuTrI9Sg3mdN
	ibAQo7waYSR6nzXBbdlhWLkEEnabnovCnO3ttHOO6jMxgadMY9LJsSVD8ZB2uv9zWW7yO3iy1Ax
	Ib0Hy8+IGsSOwpbRBmlmjTsDyIIO6C+uZGpbNk/Q3o2Swkv76AS0HM8UptE/cYieYKENXaEyXHh
	9qMZ9pCnjsT7Kr7FnsgoH40pvNlm7TCTyp0RRWQn8JkuMK7A/sfJMwmQ36uRlU1GueDkyhKAbmH
	7fdAO4sLv5AC2OPP+YQ+cAT/EAEFKF7xjw
X-Received: by 2002:a17:90b:4a8d:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ae57f9a498mr3842304a91.12.1793267757000;
        Thu, 29 Oct 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8d:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ae57f9a498mr3842279a91.12.1793267756496;
        Thu, 29 Oct 2026 02:55:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3641564a91.14.2026.10.29.02.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
Date: Thu, 29 Oct 2026 17:55:41 +0800
Message-ID: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae3182e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=-8uvzrCIQl3F6d3rFMcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: z2j5C-miskk_RHa-RqRMOMrBp-_Y8iuh
X-Proofpoint-ORIG-GUID: z2j5C-miskk_RHa-RqRMOMrBp-_Y8iuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzOCBTYWx0ZWRfXyeb65DwNiZPA
 iBpsroF5hunj+PAb7Uv5LlAqHId/zMQOwYO0y3FhU8FNy5WEcDczE4ENYIHEeKdTllU3wFzM34T
 4IqN3tl0cvdtS3Q9hEYsroUmiZdgYzz65RhzXFePkpcSarvMr6mMC5ZEMV8wP9AJRuWTdQrLEHY
 cFyM6sXvH2yHzH2kRCqQ9EauEIidegMRrFOqy3sEJ71kmr5jUF2Srn6kSpbYANgV0Z9uOGhbHpP
 BIDPgdA1j6MHdSR8GV+diXad20hnTqRojaZtPqNpaP09ss2LT0dcO7LznkfZnQZGb69HFs+W9dT
 wT4/Qr094uqGoUn/kVziW1G65ZllDZQzs9FGI429S1vLoDIikfi8cRqthc/58hzX9av06RNUcun
 jyD5PJtlfrOyy/VNqNEcSUh9IusZxHyk/9dmv3cj9a0vskYDGXkrBWJ8ilOkCqHQ7j+RWo5VIf7
 WyM34tWm8NUaVm7eJhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzOCBTYWx0ZWRfX3Wqy1FwKNFvM
 w834/vbtxtOjtfTN/a2yNPU3PWMOVnOgVOSmOnHqRRcum3/aYpsBnwjHvAy21tH9Gg0R+ptT0tv
 KZv7wg7emYIjQrN7X4OMN1/0er7H8Ko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_025559_715853_D3D4B052 
X-CRM114-Status: GOOD (  19.10  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>

commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.

The default RXDMA buffer ring size of 4096 entries can become a
bottleneck under high RX traffic load, resulting in reduced receive
throughput due to limited buffer availability.

Increase the RXDMA buffer ring size to 8192 entries for the default
memory profile to provide additional RX buffering and improve RX packet
processing efficiency.

This increases memory consumption by approximately 9-10 MiB and improves
RX throughput by ~20% with the default memory profile
(ATH12K_QMI_MEMORY_MODE_DEFAULT).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://patch.msgid.link/20261007-mpp_ws-v1-2-739b1fb87d24@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Backport rationale:

v7.3 contains 58aeb412495a ("wifi: ath12k: change MAC buffer ring size
to 4096"), which sets DP_RX_MAC_BUF_RING_SIZE to 4096 while the RXDMA
buffer ring is also 4096 entries. With WCN7850 hw2.0 and the older
firmware WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (still
shipped by Debian trixie, firmware-atheros 20250410-2), every WMI
command then times out once the interface is brought up:

  ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
  ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
  ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11

so WiFi does not work at all on affected systems. With the RXDMA buffer
ring at 8192 entries, v7.3 works with the same firmware. Per Baochen
Qiang, the RXDMA buffer ring needs to be at least twice
DP_RX_MAC_BUF_RING_SIZE (four times also works): WCN7850 has two
hardware MACs, the firmware sets up an rx_mac_buf ring for each, and
both fill themselves from the single RXDMA buffer ring. Newer firmware
(WLAN.HMT.1.1.c5-00302 and later) is not affected.

Reverting 58aeb412495a is not preferable, as that gives up the
throughput improvement it provides for newer firmware.

Adapted for 7.3: 643f0bf93617 ("wifi: ath12k: Make RXDMA buffer ring
size configurable per memory profile"), on which this commit depends,
is not in 7.3 and does not apply because the profile parameters
structure lives in core.h here. Fold its rxdma_buf_ring_size field
and DP_RXDMA_BUF_RING_SIZE(ab) accessor into this backport. Values are
as upstream after both commits: 8192 for the default profile and 4096
for the low-512M profile.

Fixes: 58aeb412495a ("wifi: ath12k: change MAC buffer ring size to 4096")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/core.h  | 1 +
 drivers/net/wireless/ath/ath12k/dp.h    | 3 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b0107cde99ff..b25202effb00 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
+			.rxdma_buf_ring_size = 8192,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
@@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 16384,
 			.rx_desc_count = 6144,
 			.rx_release_ring_size = 8192,
+			.rxdma_buf_ring_size = 4096,
 		},
 	},
 };
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 93fd227b4d19..6941cd41551d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -934,6 +934,7 @@ struct ath12k_dp_profile_params {
 	u32 num_pool_tx_desc;
 	u32 rx_desc_count;
 	u32 rx_release_ring_size;
+	u32 rxdma_buf_ring_size;
 };
 
 struct ath12k_mem_profile_based_param {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..53f7cd990892 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -202,10 +202,11 @@ struct ath12k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE(ab) \
 	((ab)->profile_param->dp_params.rx_release_ring_size)
+#define DP_RXDMA_BUF_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rxdma_buf_ring_size)
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
-#define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..d1f0ac152dd4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1702,7 +1702,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 	ret = ath12k_dp_srng_setup(ab,
 				   &dp->rx_refill_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_BUF, 0, 0,
-				   DP_RXDMA_BUF_RING_SIZE);
+				   DP_RXDMA_BUF_RING_SIZE(ab));
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
 		return ret;
-- 
2.47.3


