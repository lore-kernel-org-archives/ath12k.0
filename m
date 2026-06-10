Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F19CD8CA8
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 03:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FpZbdticemUFSnk51pLgq0EifnRPEpd07CbPDWjk/LY=; b=H8zgn7U89aridmcrlmfbm5oAzn
	CjElmrjcJj8+kjJTPm5dWZCx3CS2Kg74KJkXSzhs95h/QHOaeO9iza8l87uZRQAzqqhSY5wHqcR9M
	3lMxKP084+e8U6Gp1koMH+pIwpsYQeDCOmkKVo01lUEcjerKI3h0HRoNwD5SLudZi5cqCGd9B06v7
	lOV3x350pFSJ8FZKONAFC8adtCBmxCxXtQGu8vFyKfzXsIVH3VpUZvuUaxjk4mXF5ms1Uic9idbV7
	/LNRjKsZWCZX2TCyMnm9j1+XqgyCkICNtsOH8aTIay9fhCsX1I6FvqkC38Nx9vT1SO07Twn8D/Utv
	fJMg3oyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9OJ-00000006jEi-3NhY;
	Wed, 10 Jun 2026 03:14:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9OH-00000006jEB-3H75
	for ath12k@lists.infradead.org;
	Wed, 10 Jun 2026 03:14:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efUr2481554
	for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 03:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FpZbdticemUFSnk51pLgq0EifnRPEpd07Cb
	PDWjk/LY=; b=ckGU/Hj6GPQ+Do5lyDu234ICSphf3fSwI1OFgIX9a7kyieUtBjj
	E1g9NYQlw8mutO/ZCo6hmruD072hnZiIACx9LtsvAlopJwKQCLlNF0W7f1u3dtqS
	w0diA88wSNH5CMWzBi6JZ6Pmg1RLNo3YNE9RMcfFPo4VXN6VvUQqzFrXaNPEQ//2
	bilOKvosQ1XMo6tQJxBYHEyaFnRZ/nxY8SB//iq7t6E1paHQTvm+GPLiXZXpb5T/
	BmN6KF8knJ8PPHiTPoeyl6ZgPunECtCICuQHVBLWUECindBHMXGhDZcEp4AgqqFp
	Gdt/xy3oZsaZ+jxB6nr0D0cQ7j/hEBlwUkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnerfch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 03:14:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d2447962so4394178eec.0
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 20:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061244; x=1781666044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpZbdticemUFSnk51pLgq0EifnRPEpd07CbPDWjk/LY=;
        b=Eg4bQBNaWIyKZv6LHCNQq1EXteGxFBUSLwQQbc434j36m7XIMrtgt33kcrfvT4/t5R
         kKw9TnhMkCnbA6wEe2D3BRm6QHxRG8CbO/MktYyUtTqWDuS2BzQY0B7Iu50y30LwwtRI
         GJeqGWER5nSeA+jKZBWQZOyByWru9p3cfsFwYZ9nD6zxYTXx/5W5ZBFJ8UQjjm/kJVq8
         346n3kEr5pkgzLPtU46Af9EPRl0Xfr3DBEFUUkhns4meYbnF2HDlX123wv4kAvVP3zgX
         h1+Auzj1Omlveq5YMY79/9Ep7x0r8HCJlpldYfqL9xY7BIW9shqkekOptWlB/BFAApy2
         GH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061244; x=1781666044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpZbdticemUFSnk51pLgq0EifnRPEpd07CbPDWjk/LY=;
        b=Gu1uA/5klu2MnzqsrCkGiu1Lu4BBH1G8uPSmymWYzOauivsThwJgT/LTQWt2svv3Yb
         jVTeEjh8O+qaDELCtvsUzHoRUWL5vDns4L0qKD/3KYirtTChqhNYncdJakNg/BnN8iiA
         yVvo2UlRW7MqEL4sq/uVqpj7CpTlhc97/XtmOqyE84TD72yqzbFV42rmiO5dJCfW+jzg
         DjKsZL+lAF3g7qf/Ud24lVViqPnExS4U8pu1ahwo8JQLm/hVcirA8axhSLSMAYbJ15It
         2ixujc/iwnOu1srA2cvhTTK9Qy1s9jmSMnnmpZBzSpRT86xINOVO7KfOInz0xhGSwSV5
         bOyA==
X-Gm-Message-State: AOJu0Yxz57SCn/pgLimggn5K7kNORvr2P99C2Pr4GVr73tArECyUAN6a
	mR3buIAMmXPfWr43PHyVK371Qs2IRXTaFdJBhXLyfQ+8lhTOE4RcjYucIKlofvWK7mBsRTAmfEH
	Qu4HCyYvWl+8pNm49LlD/n8g0/LRz7bIobJMu0PGcpBAyOHTSy0oJj7o/XNuj6MvnxPV+DaBe
X-Gm-Gg: Acq92OECU8ZoB43pCl9zDRgkaeNN1uAxpG2JtStVa5F1bDYZplcVs6JjpowZo0WRqJw
	GLtnuWFJVCbhfdFjcDZvH6/TsdhMwUgJAFws865NYzKEe0I42oxGhGUyfbvn3GOn96fGYHdk2XI
	gh00KEMHAnymC76Z5jq4Q7WLntHKkEJH58cigYEMG6E77a4x/zOfwxxqag4dMh9mlDPCFWUQ86y
	aOkPGgETkaRo1kMRWp0IhpfeChRBveZYT0ggHBWKkyt+IQpxzpFXTapH8/QnLKwZoeAT6wh1PN6
	CWkv4GTzlEujziHtdQYm0YdMXVw6hGr8uTE7sYB1n13WlgLdb10m13CPXSerzRx3+6WlONbNykH
	HA0vckpSh0Cp8ir/3iS+MbLkpZdEnxiYpinjX5ZS8si46RAIwSr3t4BbpieUjN6cz0M8b82gv3F
	4LdbXfoMzm45Q=
X-Received: by 2002:a05:7022:426:b0:136:bb14:b0f8 with SMTP id a92af1059eb24-13807d18667mr10674369c88.5.1781061244267;
        Tue, 09 Jun 2026 20:14:04 -0700 (PDT)
X-Received: by 2002:a05:7022:426:b0:136:bb14:b0f8 with SMTP id a92af1059eb24-13807d18667mr10674359c88.5.1781061243770;
        Tue, 09 Jun 2026 20:14:03 -0700 (PDT)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm17279534c88.6.2026.06.09.20.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:14:03 -0700 (PDT)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to 4096
Date: Tue,  9 Jun 2026 20:13:58 -0700
Message-ID: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rDEwoq7BnW3QhSFHLxRkL6oJHEgqXABG
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a28d67d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6UE3-6daUtQSQB2Os-YA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: rDEwoq7BnW3QhSFHLxRkL6oJHEgqXABG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyOCBTYWx0ZWRfX3ixq62NsyoMT
 FTEM0z9r4Il+d4Rj5yJNYqW6OyLC2cEV9wSBYXHqwqUXAO2/JHKpUEMg6Yx8wLnTz+q2UxaFP+s
 A9im4ph7iuRf24adYlGhZ+GuqA/C/fwI/L7pb2qu5+65QWYIOXxnGLoj4zXzKlK+SMxDPtFdFgg
 3QMc/qMl8Ur7FU9vWOujYca5ZJg+afOEct7D+IjjXcA4P+CmTXJPXg58jYkSqKFW/s6LiwXzb30
 qi/vdKnwE/de8c1D3fZIHaple7rb4AqoeAHUMIRD+sr3nJdtogfIle+YCrPL6DgiFzB9TIPIVvw
 BbAyeqY9QMmptBQtlTmxRRaU3NRNgwGFQwWQn6/61SxHx9jhct7JoMwPZTuL3eK3Ep9PV/623ko
 pxNMsSGojVoNlK44IctT5S+2efs6SR2Q6irPsvnW9prAqzC08wDUKkuB9ytMTvFactLV7oXWAvg
 Azl7FOKF81HHAh1vGuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_201405_821839_3C5D9956 
X-CRM114-Status: GOOD (  12.66  )
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

For WCN7850, MAC buffer ring size is updated to 2048 in
955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
to increase peak throughput.

But during the RX process, a phenomenon can still be observed where
the throughput drops by about 30% from its peak value and then recovers,
and this behavior repeats during RX.

After increasing MAC buffer ring size to 4096, the data rate drop has
gone.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index f8cfc7bb29dd..6596089d4168 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -205,7 +205,7 @@ struct ath12k_pdev_dp {
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
 #define DP_RXDMA_BUF_RING_SIZE		4096
-#define DP_RX_MAC_BUF_RING_SIZE		2048
+#define DP_RX_MAC_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
-- 
base-commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27

