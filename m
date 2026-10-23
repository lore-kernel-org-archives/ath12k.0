Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F169606ACA9
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUa/JJrw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=USxUWbjd;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmIybA5L;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G+15o+bM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=iUa/JJrweHn370
	lgxjuKuHIxTg8JXwRL1+DSM/EkrxumkK2pVn82HH1iuPxcPXN7Bl5D3Bg8QR8e17uMBnMfLNirN3H
	vjdVG7pbJMnpxqxp+P6wa8kRHySPJPxAk5/1MtmFoBk/+0AR7zeVWZpwWW2wbrqDwE7L4DfEiwe1i
	euARIQAXT0eI2PDsurBbVjLEAiYXvgFx3gL1X2SaqdVfcyRx4XgFElmKPM2ixQzqjm+/KSnwNdcSS
	MeAXwO4CYj6lfIoTrLEFv1PwTKWevSXIo3WOezEo6bFuqE1b2t54T2BZsF1R6pVaPhl2jxDV4Tq9N
	ShNmGVcZ6RROWvQG7a7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I9-0000000FgkO-2X7V;
	Fri, 23 Oct 2026 07:02:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I8-0000000FggS-0mhK
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=USxUWbjdnioFEkcxoYXTC/xNqI
	to8jqshmub1qfJnMIXR0k8nalX/pvByMeZVdzWMaZ1wUPirD7JqKjqxKKbIWo1CLl2sjPvVSbURtL
	71i2NphWS6V3epHNdwRa1r00xZ20Nd7k9SzZ/Z5szdVQxUB6nb4K366Gfb6i05U7/70cGJkwcQs+O
	u7h1AliXqKtGxZA+M0iHCjEc6xdeV+AKBHXoV4bAXfP0F8qmaO3B7ZA5AW+cMsS5QdLzHxGVeSqzW
	E4JJ2DmuPhjmOMdvPL3aN8rgNS/iTAplOUX5P72tuzOjlC81QsgUPpJC5RMHs7KnZludQsEhW2n2m
	R64Ywmkg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I4-00000009vqS-40EB
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9JP988705
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=BmIybA5LNPjbOAIc
	0Wivavpe5HSCZMshL0jUJf/WlUpJULjTEhXrHa1qBqkBrLrCIudR3WNfh/8BnfIO
	xVBnNXJ3DE1KNQfksDKlnxG7rlXIz4ddOzS+cqBovjIh2WO96NvsIEG2hOvjYia2
	nP3TjDFlolTfISpfp4cdGl5gidF4Y1j9mt+ZgCI0xzIbDoyoISsOhLf2r/XwcgpT
	XpeMKgblSIGfoOVAZPtAguY5HJclylJw4AfGWYzhoD6Dj3XpKolRCKY/I/f9qgHB
	+WTP86ge39R42HJnIyTbOyKHpMD1tPEByPULPDHLQGZXpLVC+cDX2iLoKIeUqT8G
	rJ+ucQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtsvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6ba724b6fso354841a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738930; x=1793343730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=G+15o+bMIjxZbxSVeVjzvJrECKF3BxFJHGT/PSsVxUsysDK2FAJORms5uuCv8Gx3lP
         daTeg3BBgzDWl1hbbfefvHkypvHNJrjEikZQDd3p1gaiBm92VUn9pk7Ojsd9CRi3Se+W
         XxE/CYIl1sQKQZ1aFaTaEBK9CbKuPLR7Kaj7dcnOM/XsvuArKTeeCBpcjKDXjRE979J5
         gREUX3cZ37C6j9F2DtiLc/m9nWXEUUJOXsVThZKfXqnbFXvtT2KDQNQzzJFDEkyz6dBw
         vzEXhUDV5BakQ1C2bUDa4hjtUeXUSGwCLHOkHmHxQXwb5KZcIFNkz4bs+/Zw+1CHUGh/
         X5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738930; x=1793343730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=XBPiiSk1h2Ddgu69umIqehFsm22HYUQZhwmJkEBTfzHEqvnBX2NPGCyqd+tEaEiG1s
         lo7fnpVf2YSPfXGNrVJUCco6PXBenz7+936g0z05HNuy3BcT1D3Hzkba37lt8ok0Am34
         lI8iLLdn6v8v14V12Fr1pami+9LVOjs+6HGglzHNf78Tsovg1TeHxb04iDz/EZ71OsLJ
         n1+1Za5ff4UF24LRBOFCr8MJQrH0SZqSdFaVS71KMd/5Fsw7Pb2bn/Qm4tCduipeyO84
         t+dW/aSnihUekLNzC1Cj00gD0Cc1quWQjuox8dKIDcO4gTkzVm2gNrpwopiEN+j8EECu
         /emg==
X-Forwarded-Encrypted: i=1; AKwUvBww6HQwljhI7WkDZ75Yg+nsWEwzmksw95iWqe/zwkHPpTRA0H00gT9vusLDZmcYyO8tTEcuGTQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLQAZAMx0KA94THJHVIQtv+QJBtFPK81wcLvR/ygV/Qt+Fe8s5p
	E+5Z6VIlAxKQY5aS/N6kv8SeicFv7cmsXUS1cifKx/AeRZu7pOZwZ4XirQCxH7IOTLvqc4JbxVg
	DlRoT+tUmnS37zNfnna9eq4N1WJ6LDrC33Bmm1oGCXZ/jn5kiozo7RpnMKm4PUcxT
X-Gm-Gg: AYBFou3OpTVk+LR6Xyz062T8I/lQtDro5tDKoj8jGD0IWMV+tBo06JO3lU0WDhEmQtD
	nPbFmSk5uyE3ALlSJW2anN9FvkPLZBL8Y0GqmSLfX78Rb5q8Y7YQJMXTFuF7RiT7vY3k3k4BnNm
	8XIrm/vzsZpoPMZJu2wUjMVLuTFRNk43lvB/nFKuPFXbAgBEs/8cKF4kyEE+N13tNz7TI90Lc6x
	ArYed6KmTAZNZhvcRwCHtZ9quF5tDIOi1yR2qzSctaJScgITJdOTvZMk7y4aUqRJ80xExBVClyH
	HysjJt8R+T4ROcIwxOrdPGU/a0JUgjGK/gdP4ThdyJtv/zn5ZxfaEDvOSmxURuabrG6+c9A/caR
	uH6LyZv1VN65JoyUg8YdaMvmZmQnAcVM953R62xyoBGBgWp16XIZsOnRrcELFBhMqgC2xibQapL
	Iy+GpRiSo6GN7up0XvjZWcig==
X-Received: by 2002:a17:90b:2d8c:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3adce150b14mr1050610a91.66.1792738930292;
        Fri, 23 Oct 2026 00:02:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8c:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3adce150b14mr1050592a91.66.1792738929816;
        Fri, 23 Oct 2026 00:02:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:09 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:16 +0530
Subject: [PATCH ath-next v3 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-13-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX9ntI+uASU2cT
 oj1eCPdGMsIySVUd+mrdMM5WHjopODvicB7641cqO7qgd75NmzSlVbXZbcIrsadeZb7nxc7vXf7
 SHZ7WOUaqERqo6Lphk8TTScCQbHhdJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXybCS9VE0DUw/
 DA87BfhscXwcaedPggJ9FMjoJrf4YroFFBjMgZC1Q1bfA7GJyIE97NXQEN0/gxvzxDbGST8zfT8
 ALW5rzH0H62100CFK+DinxMtPqVMaVVM37BquHnmfeiB0pmyHDgy777Biti1Ug/OtsJbvh9g2Sw
 QNsPSn2RbQu6dQt/6pW/uWYmAxUlJIqf6BCCZCGm0qjDb5BfvowwGM4abK575+vznafx/Eq9k9K
 w+sqnk6OqN6I9QvoUiyba7y9JYanVGv2bIRFkQdAlzUl0eGTK+/pcISv7SEhfkUc4cHy2CtRx+t
 kInYsI37WoWgNd4dJ81ELbnC4BtonRE8j6ThlpSpU+kUjxQzVWlzeiL+z+XxkcrtWIhPCcTpRAL
 fn5pHwgupClksIMfAtnBP2tOO2bb1SP9oCXCzOp2F2kGjiFzm1Lm+aFA08Pob1fJbPvA/SNG4sL
 rqTdYatiDCm6k4DxljQ==
X-Proofpoint-GUID: 7cO1ZFfMkStlMbmTFkRTcMj0GJhWYv1c
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb0673 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 7cO1ZFfMkStlMbmTFkRTcMj0GJhWYv1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080213_408287_6F1D5968 
X-CRM114-Status: GOOD (  15.72  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d2ce01e0d7ac..cd0aa24848d9 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1174,8 +1174,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 108e27dd5797..5e9cdf72670f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -737,7 +737,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1


