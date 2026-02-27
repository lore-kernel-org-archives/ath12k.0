Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AE6FD7F92
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=prqlnNROXOp7LckJ0dWlSLM58OOvbPBFUlfCs8lCkEo=; b=S1bhkOWSs7QwpiRo7p8N8Ql6BW
	xLJkn9PoFk6GcMGOxZOMmA1RBBipI0j9E4Lx1F+QOk6uwsks1fI0EXgJM6SevctfYubxfADBrgrOv
	Z/mkKxmWvBhDfNmhKiSkRjXyJhv1hVvezTIMrXr2KVl02hPMO80za6MS9Y9mgNAXJOY41E1BHB1Yy
	w2Z07jELmtVKswGyZ2ykts2fsmzxnSzQvDl06zKr9W2sKZQfMIcDIRm2ArkVqlnfcNyIi9eBNbCsD
	+FyZi3nGk/jds+QQP5p+fRpdSMoJljVaE8yLCuztsu8Xp0K9HKFonKnCTlU9nfAF4+LT5xbylxthm
	/XiVy+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvbC-00000008GVm-0IbS;
	Fri, 27 Feb 2026 11:01:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvb9-00000008GVQ-2xvJ
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 11:01:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RAE3dq3762578
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 11:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=prqlnNROXOp7LckJ0dWlSLM58OOvbPBFUlf
	Cs8lCkEo=; b=VPqY7XiIy21vmiLgpQ+bSCKvw18VHD1Fc9N1CokJoW2gO7dyMid
	NzQoHolvHn9DZxBRrfA1GS+ftA76lvfwpbA3pXNrs3Ql+qAYBpDY/YiM1NdaT3Kq
	6nPLfu9Jm+dBxQLRtb5oPJ8+qeeOss7gtCA0K7xSTlCxReQZqTVPd+T+W7tPYqhz
	BFNIKB2/f/UHbxWCg3DzR7Ik+dGMQBP8TuBiCODXYxh4tRQrBnFguMiuBxWo5jnv
	bdEgv+q+3JU25VIO6Eelr9wQgYqMI0kIsxTaw/WRTh59q/xmfQTt+D2o+JafjI25
	J8UO+b7Fp4SAnZnvrZlJJC4UfmSIH6SXv1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yb9da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 11:01:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad3380076so16631675ad.1
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772190090; x=1772794890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prqlnNROXOp7LckJ0dWlSLM58OOvbPBFUlfCs8lCkEo=;
        b=V2ioy+e/Jl0E8FvVUjbzGs6ersD7kOozWqRfhShfct82NLv+1SxHDA9H5vd/5sx2ds
         xcaJPzG0y9Cv0FNuoP2Jg/2pXHVkdDCukKHfcqaD+3Xgr6T8ZcLeBsMh4SNEXvxuxXcy
         X2tvce5LX21NVMzxBctwQCInaCUTRtnvJCAZpRJoxz+Jqq1+zWbz73/x3tAd6aV8U3Ui
         Iv1i3g86tkqK1NoVEzdfq5aMWfutt+jfDUksX5ggqcHo7sS5MdR+Ym9sd2/QlgSPL6/Z
         fkr+PQ/DdExnNvfpI+tY/LK+/+6r3aiq8mDD2FSFqrfEz9Tu1c1NEe2+VD7fY4IYnfNf
         Lkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190090; x=1772794890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prqlnNROXOp7LckJ0dWlSLM58OOvbPBFUlfCs8lCkEo=;
        b=AD7upcbtxGPILMWC2VOuhJmwiUj1x0eP8hCQ/SrxOt7PMwvkaxO1PIO0JXSLfmvDVN
         mRzmBAzm4htJeT+Ywt+tr/qGbp7BiuLzR5NAj0Riqt8R+J78YM0uruli4mJ3p6NyStuP
         WF+d51P72VoTTa29J4945vyNgdE/oxvnKrbw0HEJoz8nkhCMBAXESrzbEL4e2ycBPFZz
         RWdUTiv7IP/jwaEc0elRuPs0gbXFQU5v00AUl236ewro6FuvV168+o83XmVkVMlxzIPx
         lKWg9nyDa/frjLAVJHYdgIrRBYvgzJDyvOUlNS4blTlsSZ+Yau80C+0axLr7jpNQly6W
         y38w==
X-Gm-Message-State: AOJu0YxJ6eGTwkVAMj8Kgo13hAv5p72JkJv9ZH+7VZW+ymfIMUr9LhAe
	kN+Q1bB328xXTICa++WhXxpc12r8lfULVEQ4kAquR1MD6cDv7BdiMSb4/ISYs8GdTB/txGrwxi4
	cJQOVy8Y1APJHWySJxjjCDDXlltIjmG2cGNLHmPGE7eehLAEL1EtVbPt1o2l/Kl2Jzpn9XORl
X-Gm-Gg: ATEYQzztUGRbZk+yAZAsLYf0X2cdmtHwFSIyJeHVyVki1pny8pHIAqCWcRfenumUQ6F
	5Ct96a35hnlk1Ws0LN/BHGXPUZHBbLxme73qXoUaQQqZnR2P2hhsCDaMgR5MHF9JwIHHsHZkukc
	ParsvNe68udhWy28ZXtKlRIpIC0udrJDhyb2nLf7m6JvbzoYZU/Wuw147poQy7chTuxlqUwlhxj
	4E8EfG3rDAxIzvW+6YWS3we6oLj25rO/6QTpuPGuqu4+ItKqC+uHiv97Xe1b/KXAzDvbVskiMg3
	LDLj2aa8zcCBqLcnQzWU5Wyenf+WVGTGW9+uEDgyFkjsdzdzGUAKYRR0OLUtdxi8K+JF4ahcEnd
	sjRNOgbFwe75Cnj0pfVMI7RwyKLQTaSN6umLwFOLi/0hOIDS8JYL20YtYiIAv2z0A8XXSZrH2zs
	dVM4RDAbxuYZAJD0U2OpQXf0pQ1L4qX2iTAorqTQyL8k/52A==
X-Received: by 2002:a17:903:1212:b0:2a7:b412:6cc8 with SMTP id d9443c01a7336-2adf78db360mr58835355ad.1.1772190089891;
        Fri, 27 Feb 2026 03:01:29 -0800 (PST)
X-Received: by 2002:a17:903:1212:b0:2a7:b412:6cc8 with SMTP id d9443c01a7336-2adf78db360mr58835055ad.1.1772190089333;
        Fri, 27 Feb 2026 03:01:29 -0800 (PST)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c2e4bsm78671365ad.32.2026.02.27.03.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 03:01:28 -0800 (PST)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session
Date: Fri, 27 Feb 2026 16:31:23 +0530
Message-Id: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qjrQSBpcRUe7xfEo5usa5fU3hTT_cLi-
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a1798a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vkfXM0Oplov9zySb:21 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YS8j5bCp7OpU4X8Xtr0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qjrQSBpcRUe7xfEo5usa5fU3hTT_cLi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NiBTYWx0ZWRfX8XePedtRvZ6X
 pR07JHlObrlv3Tp5gkDtzRdeABXkpYQAzZpKzj62GtnpaNtScchA9CuYFAcpYd8ARg/crKgXSKS
 iN04wvVX4VY6Gd3bmD1ltSO1iNo2NtcVBP3fRZU8urbBCCkIRi1/DWWpHNgu5hL+LnCc038Mzor
 v78pXmn1u23RcqD96PC5BudJtgiKdoDdCUkVI/dFu3u+YWZMRVrju5Q9O7lfaAZq3ucocKJAlYG
 byulwlb10/0VeB5etboI4u41FM/L2bfnsAuiUnctvYTIv27N7VDIN1V4G9t7AUQ6yb7g8zCjHiI
 4aOxlH/NMPp+wUthMGDZ3sO010dVmRlqKqLRaiLqYjxUz9OGPIhwJh70DTges7rHN3lP0G0V7nG
 pRi4k4WIMVV0yJCYtJ+5uQzvexzBfwPAKbDNgcKX5/NXiB5jpMH5+sfjhXCd4DuG33w8D+mBXi4
 AcZiuS5DI9r1UVg/ctQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_030131_746484_7D1C6826 
X-CRM114-Status: GOOD (  13.62  )
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

With traffic ongoing for data TID [TID 0], an DELBA request to
stop AMPDU for the BA session was received on management TID [TID 4].
The corresponding TID number was incorrectly passed to stop the BA session,
resulting in the BA session for data TIDs being stopped and the BA size
being reduced to 1, causing an overall dip in TCP throughput.

Fix this issue by passing the correct argument from
ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
which is the base address of the array, corresponding to TID 0, pass
the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
different TID numbers are accounted for.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
---
v2:
* modify 'ADDBA' to 'DELBA' request in commit message
 drivers/net/wireless/ath/ath12k/dp_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a32ee9f8061a..640f752eaa03 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -735,6 +735,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp_link_peer *peer;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
+	struct ath12k_dp_rx_tid *rx_tid;
 	struct ath12k_link_sta *arsta;
 	int vdev_id;
 	bool active;
@@ -770,7 +771,8 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 		return 0;
 	}
 
-	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, peer->dp_peer->rx_tid,
+	rx_tid = &peer->dp_peer->rx_tid[params->tid];
+	ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, rx_tid,
 						    1, 0, false);
 	spin_unlock_bh(&dp->dp_lock);
 	if (ret) {

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
-- 
2.34.1


