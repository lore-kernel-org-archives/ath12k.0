Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7BEC83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 02:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRzmcWz7R+mLeW6KePbkFbqE+CyDHllGwyZr73meTP8=; b=TpXvJRscjs4WwD3XSUv+TAhXEi
	orCmzXENS48jZ9ZmCBH195PYx01u7yQ1dAdhb/DIwTRjNSkc+q2B93eOQIgo5F5as60XjmY24uWhz
	ADZMPIYNsuf5whHkaBfAFS8+8qs4ixAK92uWYaDMQlVb2FyHLW17UpRhBi4dulpK1/eH0NnM7Awl+
	ZygcgzOtTsww/uhwwq/wPLMLtXYdAx6+/msBfpASDlQJ58kxjtCmNQqwvZ4um57+sEPXf65MCOV6D
	VG26X9gpmp5+WXBYYWmyDjsZozps9/TpBCCcJOq04JnUYdpG+/wJyION1rc2XaKI5jlND673e7tG/
	BwHzYXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG2-0000000BZ9v-3k4C;
	Fri, 18 Jul 2025 02:55:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbFz-0000000BZ8Q-23iy
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 02:55:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HLDDcC025369
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=mRzmcWz7R+mL
	eW6KePbkFbqE+CyDHllGwyZr73meTP8=; b=JSYrzEazvtdBzRWq2ccTV0cgkwRC
	HZ7DrLL5xrn0Xt7RZY1Fp71k/Hfk2Uodj6Mf7qB+h5pzmzRJ+s8VyC44Za0wG7mH
	+KsYIFTlLkQl7of8lJIg0UU6B3yUSNcqLK7KpqQjh+b/g3Whsx30TkN8ZWJ9oqri
	4sfYNlwFLErPR4ekvXbVHkD2oBduK5qTkmvXSCfk4fYh+WtOpleNNjbmshzpCQeK
	EjjKjPTtao3AYnABNSjYU+NLd0qEGaBXrc436wfh6tqmbzipU3qQFMo7A1KKJdGb
	UvY5WdHtl2l1Yjf7WkBGdJDQRz3MCGy8EzXnDrheHYc1eG6+TTT0hdl/tQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqe3f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74d12fa4619so1528773b3a.0
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807326; x=1753412126;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRzmcWz7R+mLeW6KePbkFbqE+CyDHllGwyZr73meTP8=;
        b=aYbyGmMnmaeZNw2qG0TNCBDLD81MNv2v0/2N8OFaBQjlnJ8WOyBWtKH5+TAkLuqE3i
         tbp0To03jXwVBdPvlg72eKDkh/XcnngCwBxgecs4EJ6EN5uC8PetwWj0oUoU5bUrg+GD
         bPM6KjcZLi7hUbHNKo6bu9rI+5aqcpqxgg6jTfezta8gkExCDyd/+2dZFvah50tN13s8
         qPg/tqUpB4qK+6G+kQkCo2VWQ6frg/KTi12dMcMNLy3OgD+3vaA+8bSGfdpfbCrkQIoj
         LmxqxzkfZO8C6zMFQ4OGUazeXdQDzdVFA9DKQLQnxPm3OpdS8YMRRxLvThR2LlgYOATo
         G2nQ==
X-Gm-Message-State: AOJu0Yxx/2i8q+v9tozYJNuGrs4PSGTSCYiMj/kXfQAXXYJbYn42jGuz
	9+GZ1n9IlqVFcs7Cj7LrvTMbOZg3gNV/KkdjPLmUHsuRAaqhj19ynoIGjxtK8i6sO/07NbPd95u
	CIdsdu8Ta4ETfZqGKWrvhXId31jrJk+NyfRdJtKksE/0HsqfVJ2gGE5vKmv5HLv3FQpg/UCyB
X-Gm-Gg: ASbGncuYF/QWG+C1amo9TpvYOmwGrWjU+pgaCdK8dtEgCz1wi+BazFY8IEEseZbHo5S
	I+NWKysTerkNmSY4GBKgr8VTcUJzeWfWYfLmQWIE7KH7O0L+JC6CD4KfHLSYWnnwOXEh0ZmcDNp
	s8IDM5x4FKys2STvCUF0r37I17qn1K05HFXFNCm+ZS4xmtTIwUwodnrFC1dBf+JbHyNTB8KrBrZ
	jOtSKaEtP0YjBG2znmSKvD3fgNj/t/zSBQUVldnexSaU50QKH1UnrDftkINnj5KILCto/aCdJAs
	m0yjbtJe2ApORd/2zqg2QhRlUfWgUN2D+BKBFIRbhXXfMM9s6LC98nbyUC1gV/fhQZPtpASsitq
	jh/HutJk2nVRTEyEdn6Xl2+P8LjoPr/o6nyiE7VshoPUmdNHXjm59n3f050gqTNaJSztpu1ffCg
	==
X-Received: by 2002:a05:6a00:4642:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-759ad4012efmr1623652b3a.14.1752807326368;
        Thu, 17 Jul 2025 19:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfOSBqPPcq0Kq8bI80tZsHjU/F3kMUGLuQZu9TUFeQgRVXxb+GPqY2FCFWtTaRGqr3eHcvA==
X-Received: by 2002:a05:6a00:4642:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-759ad4012efmr1623628b3a.14.1752807325907;
        Thu, 17 Jul 2025 19:55:25 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68095sm255334b3a.139.2025.07.17.19.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:55:25 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/3] wifi: ath12k: Add 802.11 encap/decap offload support 
Date: Fri, 18 Jul 2025 08:25:10 +0530
Message-Id: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6879b7a0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=87EwTfTGHB7IU8INq4wA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -ETEB-PoqklaFvYejjB31yTJhLYD7Abp
X-Proofpoint-GUID: -ETEB-PoqklaFvYejjB31yTJhLYD7Abp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyMiBTYWx0ZWRfX0nGkVl0VJBkm
 08WKj07pr9qhbrtR3TCTsg9l1eqJKBNt1hrI27qyfI6B6UsfpC3kB0YnqjUj4B+3R6P4zx/sAJC
 ANMn/6h2lkGgfdMXoc7EMKhvU3zXxgXRFjSx7XEPDIXibRvrGgdBuJsZl/PPlH7TijzoalJxuFr
 ozCwqCSBAsJkbwS74SQiseaVSwzPkl2ILZovKnuaW4XSqvsAGrz0u4NAvQ4w3iL+YLnwCXmvx5t
 E7t4bE3jdTIIReDWhobQfdfrVcemr2aAX7ItfE/8plTuLJoOUL/PciETAXA43AGx5c46Igsz8T9
 MJtJ0nWk8YXDRav4kp2YDsPhIdAS9a2evYj24xlwSmKaEqMiL2txtTSP4q03kF/PqGaF0U6FDzl
 /FhHf9ugmJXNIJEtbLS5R3ONUQb8TZANhcIbhm/ix1/lZGFSUIWYVGLzbu57E1YhkxcSjBar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=947 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_195531_644092_C18F60EA 
X-CRM114-Status: UNSURE (   9.34  )
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

Currently, the mac80211 layer handles construction and parsing
of 802.11 headers during packet transmission and reception.
Offloading encapsulation and decapsulation to hardware can
significantly enhance performance. This can be achieved by
having the driver advertise hardware support to mac80211 to
bypass 802.11 header processing

v1 -> v2:
- Rebased on ToT
- Firmware service bit check added for EAPOL ETH offload support
- skb free handled in tx completion station negetive case

Nithyanantham Paramasivam (3):
  wifi: ath12k: Fix the handling of TX packets in Ethernet mode
  wifi: ath12k: Fix TX status reporting to mac80211 when offload is
    enabled
  wifi: ath12k: Advertise encapsulation/decapsulation offload support to
    mac80211

 drivers/net/wireless/ath/ath12k/dp_tx.c | 102 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.c   |   6 ++
 drivers/net/wireless/ath/ath12k/wmi.h   |   1 +
 3 files changed, 98 insertions(+), 11 deletions(-)


base-commit: 45bbd91fc41b7cb6319e45e6fd732c5c8a0c44e3
prerequisite-patch-id: 1d3bf121aa8bf03dd29436bd0df63de74f753027
prerequisite-patch-id: 0847395767a6f49458db6b857a9be81d12dc534c
-- 
2.17.1


