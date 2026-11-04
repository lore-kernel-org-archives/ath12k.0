Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C878606A326
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wHpe6Gsv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fs1GCgGD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RbVgJukM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=; b=wHpe6GsvVxK16sDPo51PN1vhCk
	qB2MAym2f1SjrJA/T7j33mF5yfb2/3Sn2/WDn3WBqjekhsfnRv5sKd/ME/i+ILjZVRqsgVRMiNYPM
	TO7SHkXmCdMmmoJ8/sdfLEuZyglndT07GOiS+xn55kcQhMDVhMIR04NCBZa3fdzYW4lT1qa1itV5z
	5SfjN5SQzDZPOylvCloq12Ob+Ttlc9FW0Udd2IUdxeQb4TPU0FEyXxYO37irpBHhVnZzMNFC7h1qK
	tgtejQhY5KafrkfPK2TGgTh2fOErQHhp9cdcRh37UT4MOb2PYjVNwjI6G9YCWOhyJks/GJPfmQZjh
	Sa3sBBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUVv-00000004PoP-1gNy;
	Wed, 04 Nov 2026 06:30:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUVt-00000004Po5-2Lca
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 06:30:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A442ENo3300468
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 06:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O8cdky/dUq4o/+8BqqMciu
	YE3yifM3kH+XYEckRYZPA=; b=Fs1GCgGD/ycySmrQoZfYVeRePW0fDDhNA03IyB
	KamdjQ9o9qlyBQ5ad2VEOngi+296N5jBIsthiYH+Sw/mgvM4/O06B7OzDkkL+CHi
	aGRsgmrR2Q/YVABudGor5KY6wLe6p15Eogv9v7F/gI4DQnBIgu00cNoMJshxXwm0
	3RItuhLoNnrnKGU/juSL4903NpGt3PpBmU7VJCHQoZ6UUeiPwVGvLllIefqRztsW
	OZ6eJbzl0X6M1l5e+HwSveTrq2fb5kdEyo4AClRzmCA4/kreCioVls6HRLNkm0eF
	ObzUOacu/Qh8LcKFPNApDUDP7W1VeQDSz8bwaQQqjp40lkOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb08hqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 06:30:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adad90c894so602752a91.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 22:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773824; x=1794378624; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=;
        b=RbVgJukMkNpidmUpVHGEGnkv6wbT5ELmKT0NBT9cCBrDBOlx9Ic3Q+NDccJZMtjFay
         xoqJ+Igr20EOPEr01Iuo3Ii4R8/JlrxLyjfrqP29dHn7bVf7snDOwFC7M+VyCJEDHKKZ
         A4olDsgE4DXCenTj6aq+Ib+FqKqqd1n8bBycOHKwn8+KIL0E0ZmEmeTIiMsOvFQ6jdVT
         koBgWgG64Az6gai/nX/yeTBMD1LWKXpa4Rn50nBvtksDIu9E2tfqwjiSJL6quUL/g0S2
         9oqAJ05JLifo/c3oLxMjwfmV/gGffBV1/7JUe2+UujsFPbJWMw8kqsbaFTFwvoPuupgh
         vBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773824; x=1794378624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O8cdky/dUq4o/+8BqqMciuYE3yifM3kH+XYEckRYZPA=;
        b=L/BeqRSWojRTtFP6zhzzCTS7hY6tXxMgjrNMYuZe1XpNGHvu4o7yJyyhgZP6HKy4+b
         jA7i9eDR5AJ0B64KUWcOJ6x+9nyU/jKH8pU1F3JZl2u0Ys/BlDAjiKrnXHc+TaKfZ0At
         4yQQkl3ePcG9PmSqbsMxEIawaoohL6/2cQyEN1SRg33hdtuy3IxOuvkBQ5v3lS9+mvLU
         juypu+I5iFUAdwqH7cETGRz0keSa8gJ7+nt8w7ov/E6v8WbdSKd2l7PpJtgx9oTk71iu
         2KVHJR2bcSJEaven57LvIqTmqo5sNWPjPHYPmtvy/FjfykT/pVgd7WhVKf580r2gZeGS
         kPvg==
X-Forwarded-Encrypted: i=1; AKwUvBzL2kP9VDcFM0ke6/YGGZyzbMRzR15bQzkJt1aIjaijrCzEvPXhuBPnGN7lOJWX//AibZRAx10=@lists.infradead.org
X-Gm-Message-State: APuU4Z/EieuZ6sSLimWLGJLyUTCKZTOTAqgdtkJ6DyZmmy20PJCyS4Z9
	hXZ2+i8t+y7Vo1UrS96OTXnc1PjHcAjidKkItsUZCbaj2BjEoW9pFLRQkfUxCEe2XBM0Kw0fJKv
	sDlzHon3l51cBSvKwYbZAlReNhxlNkits83ZAmM6A4VsNoA52DXS1rbnJJzc1qB96
X-Gm-Gg: AYBFou0n7L2H05tqc54X1waKmzX8q4j83wUXQw7ibzZUCOiP+5Yyt+4NOjqfkUxx1+P
	BZab2ODLh3fdJ0JyiFHsuu1dIyqFTb2rTM89Abie5Cvz+bo5aXJPuxB/ciHYYil9KZvhGyeQxai
	4vdIWbeLRCkTXG7n7ZL3FHxiqf+b37GCSs00ExnFTFd9QIUlhiEybK90pBMoCPrGTma885dK3wr
	x2OFaSkXShtlL2gsu6+fIZIrDYvI9a89Dduk4/KQNd8e6y6DC3ku80U+XnA2K7MQBAhfjLaPDxq
	N6L/ePGkrsYDmLu4n7tB/nCYIcvOzwg+EQ8nf/Mj1od0TX0xXl+DwDXnsixNVWGatzUv3aU0ww1
	ZEuMYajxz2LJ26Qixy0bJosR735l8gu1M2BqFnMCbNC548EWnG1QVkoUIhRtvg9cOysg8Fc55gX
	oyRvXEHrVFHq2xn8mubpAm7Gmm3xLMiRoJuDe3hmHwK4B+OGwlkinN4j+nyYhAqCL6WJS2PCkbu
	Q==
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr12837027a91.23.1793773823705;
        Tue, 03 Nov 2026 22:30:23 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr12837005a91.23.1793773823150;
        Tue, 03 Nov 2026 22:30:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm2420646a91.5.2026.11.03.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
Date: Wed, 04 Nov 2026 12:00:06 +0530
Message-Id: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7Q6moC/3WNTQ6CMBCFr2JmbQlDQYkr72EIKe1UaqTVthAM4
 e4WXLt5yZf3t0AgbyjA5bCAp8kE42yC4ngA2Qt7J2ZUYijy4oSYczbwVljVinFuR+kUsZrzc1f
 XiFUlIdVenrSZ98kbiNgzS3OE5ueEsXuQjNvilu1NiM5/9vcJ98b/owlZzghLjVwrLUq8uhCy9
 yie0g1DlgSadV2/CiWCctMAAAA=
X-Change-ID: 20261103-m3_and_aux_ucode-8337b881155c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX+xeEN1BSPRev
 gypkWEIpGkCm/6mcPfY+Bfd+vtgKE+8Syqs7xOXg0VDODCmXfnsBH1avo2JErEVciD4dIkp8F56
 qRQ9Ivo+ISrXwIgnxHLbBhoFB1Xrd/4=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aead100 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xzHXWKMcZAd5FHHA1I4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -CT8_v_SRY4d_OUw0WzUdLFP4P0Wu88w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX01D2raiQ1ree
 UxNjmQ7h19x/mJZqBlumwcUMtQ965IwnqzL6ExpxdEWibIDvqKjnwFepAUanFBB+svm1na0ht0s
 HWzFFAQQYMP7uU/fgcxGQ8N9AP5MzcmavaU7SDhYqTMeKDZg3K/HFLLefUZh6ERamo0QnthrM2b
 H/RPNIio5Ute1G5N4LdapQdZ6TxUkCb0iithyhnKJ15cbiFJfuTLc1hnfQcfKguI0K4y1wyK/3t
 sfa/d82vwVWrbSaeD/VxBZVaCMALg8jyWpbWnvs+UdnrgrlTe+rDG9cC9GRxITL0YgZJGDbXOsd
 PRYWAUvJm/C7FE8lRbP6A7xdc5nZngBBFywTODd4pZS/GBq8IO9Apx3BTwlA9/u09ZhkS6CnjoO
 NLi3iSkD60RMQXYwfgZJ4hYsM+anECevepd7mSNGpekYI7e1WZ1+DVKzZ7LkKedFA9qzrzZXZ19
 AmM8hZZLSZd1ZolY2jA==
X-Proofpoint-ORIG-GUID: -CT8_v_SRY4d_OUw0WzUdLFP4P0Wu88w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_223025_637585_158659A2 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
logic for freeing a DMA-coherent firmware memory region and loading
firmware into it. Factor the shared logic into common helpers.

Patch 1 is a preparatory, no-functional-change rename of
struct m3_mem_region to struct ath12k_fw_mem_region, since the type
is also used for the aux_uc region and the old name no longer
reflects its purpose.

Patch 2 refactors the shared free/load logic into
ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
rewires the m3 and aux_uc wrappers to use them.

---
Changes in v2:
- Addressed the review comments.
 
---
Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling
 
 drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
 drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
 2 files changed, 60 insertions(+), 114 deletions(-)
---
base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
change-id: 20261103-m3_and_aux_ucode-8337b881155c


