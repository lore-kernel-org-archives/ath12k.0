Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B8C87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U0iA5v5egIGA6QMrKtKKSRgVKgT6nDYg3PKNpf9CWM=; b=hrPf41z+W/KSg5h48Y3kH8Vkbg
	g+NEAtumwt3NJ6pq454oB0xJft2C+f7H9ImSppwkP9oTZLKLvxaORE2PAbEc2khRyvoReVgZUTutb
	z+iDoICyDqMxW1CiJkd7KE8eXPw7q1JcJGuXkY4kKmfOLaWzB6V6PiY7fq9RRLQ/rucRZlayyHRrW
	VfjThwBZdJg0V8liHd99iFU6mv5xCdxApKQyi6Nu+RtDE/0PMdBHYmKjQ5RvhgkdQNwE2Mtx238VT
	SLwPMwDJvrK4i+uGoHCcOYRL2e4jb4zOPzwuZmUbW4vn+KAA4tp3d7tBQ2j/aX0051DfkohW6ua5t
	ELuNdNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9l-0000000EzgV-2rb3;
	Wed, 06 Aug 2025 11:18:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9j-0000000EzfJ-0lfV
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FWif011017
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=8U0iA5v5egIGA6QMrKtKKSRgVKgT6nDYg3PKNpf9CWM=; b=Ta
	LexaGAqMYT44MWanjPnmOXbrvF0Reuy+IQxpukzH9brbfa0o2UfHpVntMKkJAvFZ
	aUvemPHzmbNfpLuv/Aw1MT4RPHguasVnkPiC22m9UYNP0N7B3s+5NxZdR9vftMfq
	BzDJ6RTuLoQ0Va/1SpBC0KaNGL5D1llV3w19poA8OkKa7iLWoAMFJj7Z6zVR4fG9
	KS4ki24VFEduXPk3apMS3hHsNzXHV0JNMZPJp2xTjqeXzRYEH7XtR7TYyYTS0zWU
	dBZKZWZdV522R1VBx1rl0eK9SWCJgF8R4TIPwqNIJVeix6Qw58vMOjXzlVqFyoMq
	1VtJTaTkvgezCjJuNs9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw32j2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2400117dd80so46718595ad.2
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479081; x=1755083881;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U0iA5v5egIGA6QMrKtKKSRgVKgT6nDYg3PKNpf9CWM=;
        b=ub6OC64DpADodZWcObsEJSv907GDrSCazFD8RvBieajj1Bnbc0M4C6KiFCjLLuB8tZ
         jiJ7H1u6a3nTXalMpgyZxAdi6JnLpCZB/wjmPFL87fFtY6GfS5GMCTmW4IS5u0bSajND
         Nz4bKMLvbH/AHkt943m9dlKGCwNgdcAq0Bi1TpT5cVyHdcj7X7JCHWAc9TUdoqAA7Rq/
         hsakvWKq61h1Q+/5s9ll+ppnJ7nXD1OW6OJRUfIa1h5TEeO6QF/XxuMwwUmembUlyglg
         A3wyoe7D1odCx3XXHI04a49Qi8ckQoS1wM+JuLh/neiHxetQ3aHcm6Kz1EUPN3tLbKSL
         GyeA==
X-Gm-Message-State: AOJu0YyjQRfQ+EbP2ddMeIlnr0R/9tTADOphMZZfDFqJWGCXMNSkQFmH
	4FVLwXyipsWFbLewa6IGUFnPtzJw6M5G7IHgjjOx/qA8QagBw74irsX6Mju3Uemhu8r86evO+m5
	DCcBrH/gaq9fpa+vay+HRFPyD1GMtanXNa+JjYxJn5Xtf3mJsOsWc8sojJmSzGKOgV1FuBR2a
X-Gm-Gg: ASbGnct9FQjy3AvRsOkEKSAqqAmyI5u3sCe2m3zZ+11OqCF+jsimnGk9Y33J0Kt17K4
	0mx5H9uBen0pVTultW/lPUKXrA/Tp03GsE56lYOO+UX2pn10FY4wmtzABbzjmJgC0VfVEfaMK/d
	/p5LlP0D+OCuWQy7io0opc/L4kE3kYd7hKWrkjHfW1aSV6q2caLgPX4MlsUp1Scc4kzaUq1m+fN
	0hSN4+Q+vCkkzwngY/TiXie3KJ88rtCTIXjFfx6te5A8Cl7vpxIuZPS5DptoVSf3uMZGEshS8e2
	G6KT1CXE6tznQmxqixGChsoHPE9TPXXQTM6wcMNunV2V57MC6l6c0TvIOgn7dCHmbs6qYTCaIsB
	ZQiVC09YUuR5YIeZLtujUXVgpOpkqbFtkR8PAT7TsNfhQ4OBOfoVQc37FTz6kogWSYLWF6p6AZg
	==
X-Received: by 2002:a17:902:f691:b0:240:66ff:b253 with SMTP id d9443c01a7336-2429f55dcfdmr38715935ad.46.1754479080654;
        Wed, 06 Aug 2025 04:18:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH4tLJCCe2fVLYkYJzdC4gxRgEg1QpV+J7Ag2EAOSWFlQ+zJEhvb4jrmaE6UogtAkwFstfBQ==
X-Received: by 2002:a17:902:f691:b0:240:66ff:b253 with SMTP id d9443c01a7336-2429f55dcfdmr38715505ad.46.1754479080155;
        Wed, 06 Aug 2025 04:18:00 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:17:59 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 2/7] wifi: ath12k: Refactor RX TID deletion handling into helper function
Date: Wed,  6 Aug 2025 16:47:45 +0530
Message-Id: <20250806111750.3214584-3-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXz96TPKCE/sJX
 sXyRxnFIvKKcOLabobuJ89Ym+zgAXn8LhzvCjH1aLjYbjitOojl3BucaHm7hgeWhc1Od7pJokHi
 jq0eQeGm9ucsbh95pqHSr4c4wVKC0NMJLeWN1b9nqwCVysYciRLSQWND8k7Nod6VITineulbh/H
 3wFB9ua4m1Ma6ZgTwdbMp4nlJhtKSui78qUCQ+wZ/FCOqK9YEFXuP9rPt5wpcgYMQp5/FsXJSl6
 LnbDIW/iATAr2CajZq2bAVHt7r/p2GCuu5KmNfPz1+A1dxotXZ41uaiCvYueN7tHlaPg7KiMJjr
 5wOVziebrWlJa4xD3PmIYLGi4RvQvB7SOJWOSulSULdqnno6pzzGOKbLETuFXHSaBzoI0K4bSp4
 vTFg4ipJ
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689339ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=OHgFB0bDJtoAK5jKpLUA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ct4L7Nomb4cFX8H-Ot-uwkyHPuWizdrX
X-Proofpoint-ORIG-GUID: ct4L7Nomb4cFX8H-Ot-uwkyHPuWizdrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041803_338353_F44C4C86 
X-CRM114-Status: GOOD (  11.95  )
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

Refactor RX TID deletion handling by moving the REO command
setup and send sequence into a new helper function:
ath12k_dp_rx_tid_delete_handler().

This improves code readability and modularity, and prepares
the codebase for potential reuse of the REO command logic in
other contexts where RX TID deletion is required.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 27 +++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8ab91273592c..15097fe9e35e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -21,6 +21,9 @@
 
 #define ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
 
+static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					     struct ath12k_dp_rx_tid *rx_tid);
+
 static enum hal_encrypt_type ath12k_dp_rx_h_enctype(struct ath12k_base *ab,
 						    struct hal_rx_desc *desc)
 {
@@ -769,6 +772,21 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 	rx_tid->qbuf.vaddr = NULL;
 }
 
+static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					     struct ath12k_dp_rx_tid *rx_tid)
+{
+	struct ath12k_hal_reo_cmd cmd = {};
+
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.upd0 |= HAL_REO_CMD_UPD0_VLD;
+
+	return ath12k_dp_reo_cmd_send(ab, rx_tid,
+				      HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
+				      ath12k_dp_rx_tid_del_func);
+}
+
 static void ath12k_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u16 tid,
 					  dma_addr_t paddr)
 {
@@ -828,20 +846,13 @@ static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u
 void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 				  struct ath12k_peer *peer, u8 tid)
 {
-	struct ath12k_hal_reo_cmd cmd = {};
 	struct ath12k_dp_rx_tid *rx_tid = &peer->rx_tid[tid];
 	int ret;
 
 	if (!rx_tid->active)
 		return;
 
-	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
-	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
-	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
-	cmd.upd0 = HAL_REO_CMD_UPD0_VLD;
-	ret = ath12k_dp_reo_cmd_send(ar->ab, rx_tid,
-				     HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
-				     ath12k_dp_rx_tid_del_func);
+	ret = ath12k_dp_rx_tid_delete_handler(ar->ab, rx_tid);
 	if (ret) {
 		ath12k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
 			   tid, ret);
-- 
2.17.1


