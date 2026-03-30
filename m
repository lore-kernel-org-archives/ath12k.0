Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBF8FF493A
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 04:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3LarXX0vc7hut4xiv5RbMlDi9xe2Q0QL8lp/xZovrs=; b=aJdQYEOHceq4AYObevtDIuv+P0
	otDTC4CUMTayf4fXzxWHIGqhgnzekOype88JPCi8z8zuQVnMnqrxND/HdqmB2vcOQ/tEhv7ySufKq
	g9xGFj9suwC1WOPeViMosq5FkIRJdsaSzNwum3UuTi40R4m/VdXZ+3Xj+oGYPHYeY97JVXiVVzXcU
	1ZnBgpqvfmQ+/zxY1EDBnytTLHCuEUTnt7zNskHHu7SZCY8/9AN+sp1igMFW8/GFMmryk/OYGww2t
	Ix2DC1LSWA3ypHrVtEz4A0dMVIVuvBUhafHipArr5Sj4BrNGBQ/Zag+YVrrf0cskcdIyX6wzZVXbf
	js+6ddQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73wE-0000000AaDz-3UCB;
	Mon, 30 Mar 2026 04:09:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w73w6-0000000AaCe-2Ddh
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 04:09:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TMIaXn3171980
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 04:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P3LarXX0vc7hut4xiv5RbMlDi9xe2Q0QL8l
	p/xZovrs=; b=nz2N2eBQthPW25zilL3ObgbfO6RZl7oXsUO1y+FelkGApci55oE
	HKA9M9mrPVVHtodOEDgrliWMsAuePZsnx6tuv2yYMozL81r7R0al2hUhsVsg/7mj
	UQ6+qshjxFJslBgHcur+wHzJ1rg7NG7tO2je039kUkpx7qTEUCgQLNNwwhmnLo3s
	ld3tqxoR9v6UPlaZR++aWy0qJPAtYpSFF09eYE7liLVj67CagKn9OHfUYo7jkNKC
	vqSSBjR8QWZRhgYCCkXKQp6zojUzqYW3snSWB2sIzI10P/4TPjB09fecu4qOMHIB
	eP+TinZrkuM4TOlWvKHAFWW0yVBStL7jZwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmje0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 04:09:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0cf396c45so33976885ad.1
        for <ath12k@lists.infradead.org>; Sun, 29 Mar 2026 21:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774843747; x=1775448547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3LarXX0vc7hut4xiv5RbMlDi9xe2Q0QL8lp/xZovrs=;
        b=bCtkNkWD8N93ZOOOW2bKjqFCp7MD5LNOUzT3mLoo/s/6MpOZx5MefTsbQzIOuBTKJC
         j4CrrMbmIVIcHCQ/Tnh6RFHImPsHerKvVy+1mn/mAPfoY/ww46UF6DxcV4QnieNZy2I/
         7skpN6m75/kIs2oFSaR60pHf8LlVWu/tQag9kkO0/HGlVrO2IFIKFzxztUh29u0W4KZ5
         VxgmfZdksjn90JoS3a5jqixo1eS18tHZC89i6xA7a4PkoVCT0HZLoeiJyQtpQZrszl5R
         UZ9QaCdARIm3zKuhkj1TmijnOB7TqBUF4cFOof/2U5qrCHCyrzKBSfqoNc+XhSF2oTqp
         BzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774843747; x=1775448547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3LarXX0vc7hut4xiv5RbMlDi9xe2Q0QL8lp/xZovrs=;
        b=o4OPgWb2xiIpDD6gHfLVnAIrNbuXREzrVhnnUIJaVSDbvC4VlSoIEws6QLo0QrN7VN
         BCxggHeVee+HT1dUIGbE4K0cY+BSTR2PVz0agX3pIo2qEPM5kT9vhWhEts8jnNaWd1wd
         TsIXyaqpcsdpBcDDYCBIVkq7HilASk7MwvXLS6US3wGBb/Q43AohO8YVvH1qOpKC/UBq
         LiSb9MAOsqDaJpzOb+BMrvZp7HuHr7Vlw7FPVXSbkcxjB7TCUOU0egyTQBPOESgaPkgH
         uknAm2B9FvHu3KBrLP4r2QgMJvvZuWUPLhD99DWL9GoA7hTUJSU1nkmLbDu0J8fJ3hn1
         rrew==
X-Gm-Message-State: AOJu0YxhWdIQMQezYJ3yN5nG+NERnh2bJp2LkSIWJX5XcMyBZRH4c0ox
	3xJRxBQgRhAJzh/jpv6wmJlRY0vEuDP/UFI1oeJ9x7cZWRLmRBOIe+zMxu7qx2o036LVu2OWeG0
	h2s8ZjYbZt5e2xmFJqKNW7uJ17GZLsmdT+3D3HnjDO7uRfVoVOW5VR6nDI34QM0CO1bETqAWV
X-Gm-Gg: ATEYQzzDcwgUUpa3Al8deH3K7rL+PROs71giA7duPNj186KJBIbehJDICm8EEgytjmZ
	mFtQM1F01DLXf71wEIBEjL9xyumS3sutVt+3dKPXzGilcCbdCxKBFy+NrI+UhshCMS54getGdX7
	77vyJcw2AUETa+/2XhlPuoHcAu82BKqTdGuJsO4nBB6Pp4ZZ7TVPfh2SbM2Iu0E2UWXwOBw+eUl
	9p8JZfOGqDJ3fGU16keyrDredlLIWF6B76I+ApswzpESDAMLJptdHVEms4uXvgs+FR2VckXztoB
	Ka44KonuVGPJnjnFR4q21fWEViIf83VvGS2f5PD8ZCDfEc97OYq8tRzr/Oy6pEA9pfPqzyohv5O
	nn1CLVGpEaOVaDEa/QlGyZsAXWpaOq8QNywuHMXyu5djBz3ki+p08KP9KDCgY25dQtmkiPCZSPe
	CqwNpvEcxEEBwhZvE8vEArJNM/DDIzOIVI01YGC78UA7DoNpcL
X-Received: by 2002:a17:903:46c4:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b25840867dmr5016335ad.10.1774843746641;
        Sun, 29 Mar 2026 21:09:06 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b25840867dmr5016095ad.10.1774843746194;
        Sun, 29 Mar 2026 21:09:06 -0700 (PDT)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm74863095ad.72.2026.03.29.21.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:09:05 -0700 (PDT)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Skip adding inactive partner vdev info
Date: Mon, 30 Mar 2026 09:37:32 +0530
Message-Id: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyOSBTYWx0ZWRfX5IyePZh6IMCv
 7ubj3GSQ3c1PMVIN9JYw0fbMS/bcSLl8pjP4DI5XM2lndvZFnPeAjTiKEF1SMsLu4CxMitjGhgo
 d8PeJVI7NQFm/8n1ydZAF6bi04pA03utmnA3NjbfkITx4RGbTQojeZOCkDd2phkzqaBfa+yJtxb
 ImVPDEXtwFu7zk4ED4csdNKurWJAcgpdGvRJwGlN8khggJ8Zrk/Ck6wbsLRg0mQ824dIpKEm0s2
 ylHk5PlNn0f4yDYR36y0HqUiVYjvDfPMQoPyiLMwzXQSG8ILOE0hYpG7hWfU3QlSJrBTyViy3Oi
 Q3pVFEoPbwgu1D0pqRtAVQfHqjC5SRw+A+ufHLCs0POySPemXGi2mK3oCP4kRd15fHrY8n5S6bs
 9CFAbL88MjX57qnRMaXCNK2YD3l0hfrw16GOYRy3OjLtWqSQuBL1ajbiJimZskyFoS0Bugr3CKc
 OXZvzRcmu4ebARLGCZg==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69c9f763 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3bRBwJvXpg6Y2ZthPLIA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c3daOnBqMmoWmlxLNiyeYmttU7ANlfVo
X-Proofpoint-GUID: c3daOnBqMmoWmlxLNiyeYmttU7ANlfVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_210910_573877_41F0D961 
X-CRM114-Status: GOOD (  13.79  )
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

From: Avula Sri Charan <quic_asrichar@quicinc.com>

Currently, a vdev that is created is considered active for partner link
population. In case of an MLD station, non-associated link vdevs can be
created but not started. Yet, they are added as partner links. This leads
to the creation of stale FW partner entries which accumulate and cause
assertions.

To resolve this issue, check if the vdev is started and operating on a
chosen frequency, i.e., arvif->is_started, instead of checking if the vdev
is created, i.e., arvif->is_created. This determines if the vdev is active
or not and skips adding it as a partner link if it's inactive.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 553ec28b6aaa..c1a1b220f4dd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11131,7 +11131,7 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
 		if (arvif == arvif_p)
 			continue;
 
-		if (!arvif_p->is_created)
+		if (!arvif_p->is_started)
 			continue;
 
 		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,

base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
-- 
2.43.0


