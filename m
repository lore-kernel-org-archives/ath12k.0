Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD568606D82F
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oa0XeRP1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoxFEsAN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d4Ttv62G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=; b=oa0XeRP1nKtAe3
	hNciKrOSWUBz9mh+aQRS/mxafJzwGFNq29e1Z2jjYuCMDsQMSB2kJ+D/ufiP32LTMz9uYZ1xGsZi6
	pzPR94UnTZkFUtPeGsuXxFFcWv6X/FFSm6PRkAj5A/kHGLqPW+HaKP6swx6AsjEk90VyiFsBt1l3d
	LHG0D8u+c/2yQM/5rue5Nk8Pq2GoB43D6a0ui+/KAaTn3LpZrETEITQX0CJkh49ja44KJTGQtKxR3
	ok4RA7IevfuDC/GT6ExVFuUhIxUCgNJjmSyVAo2qIZeLdP/9avhE6Op3WwzoEzLTa0eG0gpa3JNyS
	WZ4IWwvm3YkebT+rPHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWw-000000043AD-2cf2;
	Wed, 04 Nov 2026 01:11:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWn-0000000430w-1ymU
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:11:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RCvq3335229
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=; b=OoxFEsANc5Oaa+sw
	kmCqmm0LIE1twR/DNSv5P4Uh3KP9DHbkQlhcj3sxyN0tULNk20vLQ+V0lIjC1Sgh
	/8bBTPHs30D+183dXKeryEU8Co9sQvqbP++SFWGMNjvKwuax0Jw8qba9jD7OzHAS
	LyEjRpknFdhXnEn/B9csrTpJrsCAIwf24f5EcnBoiOPxKRUdbcl9Jgri/O2KBfQN
	ZApFCQQiryzhU5buTaTQCos7yuLSFwchciHDtyZjKftytWXplGCR4k+8p58mYcK6
	VjSxRb1MXLrN+EG92t5ApRp3hBkdh7quAPzFBMtuItNH2Wp9WcJv3qP2AkmkUgmb
	4bG1SQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsfad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:11:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so283882eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754659; x=1794359459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=;
        b=d4Ttv62GpDAJ77yoTrAvN3ygjQ1WQumufYEbgMvrTrmgqWNs8NJDdhdkeP6rZlE9gz
         46SbQMcKdyXp4wLjEkHDK00qb47uwHeM5WtvNnRh4Lhri3FaPw3Ah2qhdw8LgHnEQXvu
         lLjh2tBimCNF4oB7ZJc8Zl+khpAia+zQ7N+0VBcPvFjVZ5mgkp4fORy1+rEZVBBPfFXV
         Evda/OphnFvFk2qy5z5JNsfrEs4cEfxaeetdN5sZxfLTxvAeLw8IV3cbj/UY/FkC35eN
         2rc75gfV9YAZJxcpx6EToZbLSR6I1BV6pSla3OusgygJAzlxq4jDa3CQ/PhYdrA0QNp3
         r0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754659; x=1794359459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=;
        b=tdmfnFlWla4rPV3oMeMaehph/1X9f/EZJTKW6L49ZiyXqnsQVZg0gPnEVNNlRIve2l
         s8HulNEeHMRWvHzQ07ZQnkB1u9/oC9RA/x9L5eNc/1scY5j1+NvjDGRCzlLiyPag0MZF
         4xpWQ4CWFcUir6ZrnZD/qzjBJkP4H9IWmDK6SaQGihPYXUNlVxs6zNK/TEleaNTE0+5T
         hwaShycDKYUkQY+BIntua+5Vrr3/gpwN0e9iYdjZ4icPJtZyk5Ikd1g9DfAisym2K2DO
         PM+oM5cMifswoBkyfNGmpct5PB+rf7Topjg2QDl22cY3tFK0mZUR62cPeNRfy0SDvGqq
         5HIA==
X-Forwarded-Encrypted: i=1; AKwUvBxzAg0o66AnVg03/ubIhAvgttVw1UFeZvbmg1wpL5sZYBjZj2SaRHyMERQwaJWK6DnSVNxEX0g=@lists.infradead.org
X-Gm-Message-State: APuU4Z+vX2YlnorugJd4FAKnPbnLFoUdoqv40oIs0Afs7IUYEctZAr6I
	d49lI39toyg1Er4l+n4kn8xGq/yyRiZK1WEVWBAXj6GSwVNlWTM95cFDbMLu4xA77BwBAB+ZSAR
	JVG9TW3kXjiPNWqfT8Ffr+0dsZiHktkPfW/DrXRsTZ7PsOcufGRMC2nNUTTeEGucn
X-Gm-Gg: AYBFou1Npgz+tBeRdzfeGK0MBtsIboRVmxvvRT8OoFB2vqsWmLFfpBHnD1Z7aqS5Y1Q
	QbcE2SRSaY72AEZgtUI/WNyi2QxCfldSF5MOuDk1DTKO0dTRbIem9a94HQ9AZIAYGD7kmJuiOre
	u7qzxXXDRpvSmO4HIstDSbuARQ/PVbfqtfiZh92xKG31b1yKQjQpHn/QJAU3L1Lj3Q+WRIV4WKq
	4d/i/Z8WgCMLRmbmlaObIguK95QMJbZZJyTpLMObkSO0smfQ99OzYTwg1s06lF5CMhEvooqomN1
	B0+K+IZqh7SCBzAHjK1WnseXI8sYJoZCSvRAv0Ph0MNOjH80FfuG7j2TRLo0IECT+UnMemVvqZe
	ijR0HKWXUYX+rEr8J2paTXI1qpJKwZjgCKGTGi8p6KX1GXOPUoGbSzoSD2/bUUYQ8xo7xjrFwNk
	qmDSvQ47Wtys0eS0j5j5NogSjIl/pJl+7+qYJp
X-Received: by 2002:a05:7301:6492:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-36a423312fbmr20105944eec.10.1793754659476;
        Tue, 03 Nov 2026 17:10:59 -0800 (PST)
X-Received: by 2002:a05:7301:6492:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-36a423312fbmr20105905eec.10.1793754658842;
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:55 -0800
Subject: [PATCH ath-next v3 12/13] wifi: ath12k: ng: wire RX TID REO
 operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-12-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: 1PJLbWO5aVWN7HRvaT9dr3v7qgZT08xG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXwxBXFBa81K68
 561QzNAahmE9PWB8SxmoGq8MGmk03EyK7m1VGJnjhjR0WTRj5MGobEZdzA37QCsiEP24faellO/
 q70b3iYlAzPNJjmh390logY01NtMPeuDQ1ldUe+hW0LQZ0QG/1Wudv63h4njuI3yQ+pulwhIFNn
 qRfR/4cA740gQuSmXy0kaYMClYte77Se3kOOdI6DDfM9NGoQT35owvcd1tRUrveXFt5nn3CuW6o
 X5z7BZrAmLwYrH5AbjBIf6QWgSeT1YLlSgV8QRGr2HEY0t2eXhJCc4+IR0k2GV57Vwrlg4LdXH3
 G93waCF2tQm+9Br0bRun4fPDhomEXz5lTInJbrfyYJpxnWkQzUSUXVLHUMRkcOSRLz2Bo0uITRH
 6eWQisALyt27TJtwMqCmPcN+Cbwz2UYduaorLKONfrl5y46bvtqD06RJ2khYx8lLanGryeLlg31
 bDL4X4ytNPMLVH1oppQ==
X-Proofpoint-ORIG-GUID: 1PJLbWO5aVWN7HRvaT9dr3v7qgZT08xG
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea8624 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bm8WxbACC0oYRj511PUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX34/gByd+/iS+
 rIM229rHXBTx+agKR5CEVyqF1yEWoyuZ8tnrrU+ymw4nXEDqXky+xJQWid7L5JEYCkVGNzWmY9R
 xSw7Iob9q/HXpqm0yDK8ayBRHBQGlTg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171105_873050_2015A953 
X-CRM114-Status: GOOD (  13.51  )
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

RX TID setup fails on Wi-Fi 8 while the architecture hooks are empty,
so common peer setup falls back to paths that cannot program QCN9625 REO
queue descriptors.

Install the Wi-Fi 8 RX TID hooks, initialize the REO command/list locks
used by those paths, and enable REO queue LUT support for QCN9625. Expose
the single Wi-Fi 8 REO LUT through the expected ML pointer so common qref
programming can use the same address table.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp.c | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index e89826f33206..1e636e79fc32 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -197,6 +197,9 @@ static int ath12k_wifi8_dp_reoq_lut_setup(struct ath12k_base *ab)
 	ath12k_hal_write_reoq_lut_addr(ab, dp->reoq_lut.paddr >> 8);
 	ath12k_hal_write_ml_reoq_lut_addr(ab, dp->reoq_lut.paddr >> 8);
 
+	dp->ml_reoq_lut.vaddr = dp->reoq_lut.vaddr;
+	dp->ml_reoq_lut.paddr = dp->reoq_lut.paddr;
+
 	ath12k_hal_reoq_lut_addr_read_enable(ab);
 	ath12k_hal_reoq_lut_set_max_peerid(ab);
 
@@ -215,6 +218,10 @@ static void ath12k_wifi8_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 				  dp->reoq_lut.vaddr_unaligned,
 				  dp->reoq_lut.paddr_unaligned);
 		dp->reoq_lut.vaddr_unaligned = NULL;
+		dp->reoq_lut.vaddr = NULL;
+		dp->reoq_lut.paddr = 0;
+		dp->ml_reoq_lut.vaddr = NULL;
+		dp->ml_reoq_lut.paddr = 0;
 	}
 }
 
@@ -519,6 +526,17 @@ static struct ath12k_dp_arch_ops ath12k_wifi8_dp_arch_ops = {
 	.dp_op_mlo_init = ath12k_wifi8_dp_op_mlo_init,
 	.dp_op_mlo_deinit = ath12k_wifi8_dp_op_mlo_deinit,
 	.service_srng = ath12k_wifi8_dp_service_srng,
+	.reo_cmd_send = ath12k_wifi8_dp_reo_cmd_send,
+	.setup_pn_check_reo_cmd = ath12k_wifi8_dp_setup_pn_check_reo_cmd,
+	.rx_peer_tid_delete = ath12k_wifi8_dp_rx_peer_tid_delete,
+	.reo_cache_flush = ath12k_wifi8_dp_reo_cache_flush,
+	.rx_link_desc_return = ath12k_wifi8_dp_rx_link_desc_return,
+	.rx_frags_cleanup = ath12k_wifi8_dp_rx_frags_cleanup,
+	.peer_rx_tid_reo_update = ath12k_wifi8_peer_rx_tid_reo_update,
+	.rx_assign_reoq = ath12k_wifi8_dp_rx_assign_reoq,
+	.peer_rx_tid_qref_setup = ath12k_wifi8_peer_rx_tid_qref_setup,
+	.peer_rx_tid_qref_reset = ath12k_wifi8_peer_rx_tid_qref_reset,
+	.rx_tid_delete_handler = ath12k_wifi8_dp_rx_tid_delete_handler,
 	.dp_peer_create = ath12k_wifi8_dp_peer_create,
 	.dp_peer_delete = ath12k_wifi8_dp_peer_delete,
 	.dp_link_peer_create = ath12k_wifi8_dp_link_peer_create,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index ed3ac770e754..a7da8b3a44cd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -211,6 +211,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.current_cc_support = false,
 		.ring_mask = &ath12k_wifi8_hw_ring_mask_qcn9625,
+		.reoq_lut_support = true,
 		.num_tcl_banks = 128,
 	},
 };

-- 
2.43.0


