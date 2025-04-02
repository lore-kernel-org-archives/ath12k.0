Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBEDC28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzctXm2pVCVvfVuhRtPIU0FYoMWF3ecX6jF4IOuaQsE=; b=Mba5a7KskNu6lxfuILcYSSn1nB
	kTTy4KQ8SJ2WY70x1oIJNDCSXSMtUM6YOdv9DNu65us//r6KBX/YxUOY37wfQi5G8r4ivX8322VYl
	apyWSzHSuwhgwh57yBt2WM8i7wj95c+EmlORrJ60NpuR4fWcxwTdrgvXu/N/9XlmSd1N+yvlht8QT
	J88Qe6+DUuMx3Kb7e9TziDzwjT0lyE7D/+pnVShuXA9/gFHHN25H1tHxkUTFLkjhVVJSng7x3b3bV
	+G0L3bEhuK8ln+oqrqZFTxzya4aQuwsZHUkSV1XJQhur8AT264Cwy6XLwkXGKZDh/YOc5Cgq+DJCW
	EPwYkx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cG-00000006tIP-1aYI
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:15:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cD-00000006tHl-265r
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:15:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D8gLq023766
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MzctXm2pVCVvfVuhRtPIU0FYoMWF3ecX6jF
	4IOuaQsE=; b=Ylfd5r8vXKpIHvathagqiBdXVr7fwwvA8rbRMsM8rEldVhI1ogr
	OKpxBaurPnAEjBfzwYfhMnK66Nw3IjO/WGixrD9Q8LZnWEvfVXtut2J9WuREf8D4
	N6DtbLamhiuGHlPe26cRQqol0pkFVBFzR+You3Px9tinbzLjGhPOfsaFmPZ1y3zh
	Swuo8t0H9mrOck8qQcIwCIi6lTzkHiNSCPt2H7sHfMt6NYqHb7uASEInz7tpvNlK
	Nvtp9gpYdB8gaQWKb2GNkvhFg5kx7TaM9YvkrgNVjmt5repVdt5FIhSlo5KwpK3s
	fdeBMLoyJtnhDgY8g55nkECQg/gKxxNMqvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapt9nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:15:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso114759a91.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617704; x=1744222504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzctXm2pVCVvfVuhRtPIU0FYoMWF3ecX6jF4IOuaQsE=;
        b=NPaMzw2TYCXfoPdz+lr7IIXUc9VBK/6irrsPQDUTpTEW4sqAIwcFx8aHSDaVHCvn4a
         RwEFac65GHojaxgoHraqccHnvDEbB54OCkP71RexagDPLL/pUkurc8IiCRRbeIhAFIPp
         WLhyCaDiXLNMR5q/mgZxJ57qqS6fLeLSLKokeapOnSoRu3661DlneH+hh1V5urEl0iyS
         QEMmct0rLLdDikek3NYH/Ye/9q7OOsi2lPq4qb+YJxxvRj8oYx9wxQ5DcYODlDznBTSO
         uK21GKyIr5KOVRaXIIOqbNTXlMu4m3z5CkGPJa+Eg5Ay3nS0C8s57XlLUFcSNhC1/Hkn
         8Ufg==
X-Gm-Message-State: AOJu0YzWXC5hKTdHQZ2qLNX+7GN6tE5uC+TW8046z2GjaLgOKGgSANh1
	FTUJPM4iTORu2UODyiTi6e3bYEu5RTofliXBmUOCkhAPYv1wxAfFXXkjhXisCT4r2p2YfbAjsc4
	1VOd4SgcgwBeQU5cisydejsi2UHddNP/Me6bQGEC/rcizAx8xaaHnyp9K7PtaVQAPMhQ8
X-Gm-Gg: ASbGncs49KjAGwzTCTn8xVcbPiHrfBkKDY33jol1Tgushr2IpOcg7GcBkKfytCcBtb7
	f9cxUOaoIHpDgz9+zfKSQxdYi2l0zDthkqyUWF4cAZe2okJQqXlQ0VkekaZUkYZJqtk0rgP9bCN
	rfxmBAJxaMZtAZ/iVZ9fxh5Xb7ckbvXBXloCXA67aErbZQJGCtG1O/i4QfZ95FiXzGasNu2l2f/
	tNYGzjyb4Gcd+sU/z17dqPYYbkXNnq+x46s3MvrXd7obhNWJijcu2GCJlgE7UaUVT8cbIW+iAYP
	JLGL96EtHPFVWpSJakzKfsHNoVRTFGhZy4/NBVg60D1+dllGgHPVM4nc6ArbXV/jZl5AltK9DwL
	Ca4Didr9/lzsTLGcOkJMzJgSzelni69UjqQ==
X-Received: by 2002:a17:90b:2552:b0:2fe:8fc4:6f4b with SMTP id 98e67ed59e1d1-3056ee35a49mr4475555a91.8.1743617703853;
        Wed, 02 Apr 2025 11:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLtNUircSwJy2Kv1ng4tGpsp3VVaTfOgEFJsVObtNuHMkdUAnc1B5xl1gXgBc0/A+LBaVu3Q==
X-Received: by 2002:a17:90b:2552:b0:2fe:8fc4:6f4b with SMTP id 98e67ed59e1d1-3056ee35a49mr4475528a91.8.1743617703473;
        Wed, 02 Apr 2025 11:15:03 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm111689675ad.137.2025.04.02.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:15:03 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/4] wifi: ath12k: Fix multicast memory leak in tx path
Date: Wed,  2 Apr 2025 23:44:50 +0530
Message-Id: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed7ea8 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=O8uiHmLsffw2fOifbccA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WJ0KGKSD_MHyXXR79YKGajOEOFui64ZJ
X-Proofpoint-GUID: WJ0KGKSD_MHyXXR79YKGajOEOFui64ZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=666
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_111505_544636_C47B00F2 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Address the memory leak caused by extended skb allocation observed during
multicast transmission in this series.

P Praneesh (4):
  wifi: ath12k: Handle error cases during extended skb allocation
  wifi: ath12k: Refactor tx descriptor handling in tx completion handler
  wifi: ath12k: Fix memory leak during extended skb allocation
  wifi: ath12k: Use skb->len for dma_unmap_single() length parameter

 drivers/net/wireless/ath/ath12k/dp.c    | 10 ++-
 drivers/net/wireless/ath/ath12k/dp.h    |  7 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 87 ++++++++++++++-----------
 3 files changed, 64 insertions(+), 40 deletions(-)


base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
-- 
2.34.1


