Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E01C43458
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 05:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/y07Nah1gPKdVcQOzYQMg4hKJRLS1w2nIeCX7vQdc+8=; b=0WfC+lXrtCeFqwSCq08x0m4CZz
	guuJCpES0TNjxfJGh4rlDOxeSXWtKCfryl0x+H1gPVvuVmFUZ3c0RXnLc4Lo+qNJms8rA1td2RDHZ
	dQ5a81lB+s/mnBuI7lXzabrHEBcwkT2aKiZuOPHn0ZV15b5lWU228QWT9qudHmA86DYtWLSMhb0aq
	Nc0mpt22CwLW88CYAB7r3f1nqIcR1dYZtU1CyBKLsu+qxoFTLFmwF7raavgP+3c2ZZDM/A+mhzcEq
	dN7wmwsSemZL7r4unqSebQrMEkZ+sA05ANPJfDrHZlPF1hQv4QzwL6FaxqBNks4Gfq/gzdJbGN03b
	Qtj4M7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3ts-00000004Cqw-43VY;
	Fri, 10 Jul 2026 05:35:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3tp-00000004CqV-2ku1
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 05:35:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3p2wt3855173
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 05:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/y07Nah1gPKdVcQOzYQMg4hKJRLS1w2nIeC
	X7vQdc+8=; b=nLt4cIn3EtR9ZvzKi0lPYKQmpl4zhdeuhnyyyGMwJEIBza0rk9c
	daFHIv+kStQd/Fzeu+1ApAlMEA+CIp9rjLkmuhlDPjNr3yTngdzh6YPYDUM7jHOr
	JiKOhYwBSUAZmESvA70umEVr8Exx0Wjvbi14faAWBYeCEBg5jNBvHWEm+l8iZkPx
	z0n+cBoscuWoXwu8GyamyLqaD5V7WK5xmJMKCd/Rx30KiU/OBTL27UcB/KFVBLPF
	SQismoDfeixtvpi8uJQUOJSs4ekqiEQ8grMCSlyjgnHJczf6W3FDMJ4f2+Xawxlj
	o/4y/0epeJZOPP3p1gB0pqiZamdzqSx/5SA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n0bhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 05:35:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so354329a12.3
        for <ath12k@lists.infradead.org>; Thu, 09 Jul 2026 22:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783661743; x=1784266543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y07Nah1gPKdVcQOzYQMg4hKJRLS1w2nIeCX7vQdc+8=;
        b=GdDp/KQHbpgDhQff8h8NYr1kL2slh+3EoUEdsdHuK9fUlZ3pCAJo6PJD0KFkeCCjO2
         N77V2o21Dv2v/Bky3o/ul0O7VjIuyFDUN5zBxPsSSI6ZTjTpSS/QSGdmWauhRCoA2aY6
         AsK4z2RCOILDRO2nabXE3V/ptlz+hGK+WN4QS6e2TqRZRrg0/mL4otTIU/89G+KtOEhR
         Na7cO28zTkkpEmKtY5JgUADer7wucI0gB+XFH7nbvnhOgXoMW9WOkFihmqV8z8rV3RBo
         QQ8LSjSU3NeXhzYW16T5YWny6XASUGY903FfvoheghEHTNWd1ZUq1t+2jGcqx8Vrxh61
         wiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783661743; x=1784266543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y07Nah1gPKdVcQOzYQMg4hKJRLS1w2nIeCX7vQdc+8=;
        b=o20hLg6wKAHxDWZfOQrlx12OhB4jR8w06DiDmfcKyssaq/4Qfdi93CcQ6LfyPRuOga
         fAVgsSr9TVHnxf6X2urLT1o0XrJDNb+bnzQgKryQifnMyoRDEMXLUV4zpwN4YXufcAeM
         N5SdR+clccnlPg2lLpNWlGLnzAPYrnR63A/RD2fk6kAWfgj4jrs+UsTnvddwrq5WK9Vj
         HYgRkcIcA+eMJac0VKBcdiWLiNmbUVfMB5QQg6OqELZMVWu2xPlDqc2vWn5aE4U8dkpV
         U+iFDrTT0VJJwNmmH76lB07zj2ijYkB5F1bLXihjXui92LJPwjwiT7UCBkmhrf6rkIvq
         ZSOw==
X-Gm-Message-State: AOJu0YzARQRPFDDRIkTh0gQ1VllI7tPlQkGg6UukXqr4pHKCclF4fqbS
	W23iyAWbDKcLAqRT1jhi1IRj50j7qaSGU8YO9aZoNDIUjJTljEwwWJkkGvf6P27HhsQN619fx8a
	KjQ8bEvDVRfkOc4WoRDp/CIVHV2x6P4ll5y84oYX1F7tL/eMk3nwwuNyjQLkVCx0sOeVO0I7J
X-Gm-Gg: AfdE7cn6Ypnjt3dMFZmYj9ZGgxalr8lW0eOfyGLfVYojTRjyrPpQ6jTcp8nFb2orYW9
	lN1lCbs7JG4zuhx0WTySKDRywU3f5pSlR+TBEcj9glYrn9Zty1hnMB++vQZbWxLI5+CpQMMqpv7
	NuREJvrZnRISCn+8H2TKt8PM04UEj2SZCHSP4mbJr/mti0jQujkT5OGw5vrf9lUTLLxSEjIiF9m
	xb4HmkvJnPYSdx/16wUBuq89XuNVmjM9+AXBENfOpo/bQHzYr1ARQRO6Wfo/cEgxwWKNmUWF6mJ
	vGxRCrY6saOnL6h0vge7U1uweTuDp3zBb74o5Pm8cNvv3CXTsx3MD0y40ap3pTLjYNjDXp/lDWw
	XqgDepSWFobzUy0TdTJFKCm7keGDWE+5KIYn2jdGPGobBtBuydMjFZQpeYWND0xKZoAFhkbL8w8
	X3XjvGRlaCJnwJ755epjNh1UNIENnMOAEYmw==
X-Received: by 2002:a05:6a20:a107:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c0bc95a3cbmr12227736637.28.1783661742503;
        Thu, 09 Jul 2026 22:35:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:a107:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c0bc95a3cbmr12227702637.28.1783661741879;
        Thu, 09 Jul 2026 22:35:41 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm34576780eec.4.2026.07.09.22.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:35:41 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: update IPQ5332 BDF address offset
Date: Fri, 10 Jul 2026 11:05:34 +0530
Message-Id: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1MCBTYWx0ZWRfXwNqN0EqiLUWK
 KZ/qQvR8wLcVnl/qCcdw2QcBsosxBsijmE20mN9mC7VUb7JJrC0obgU9kEkXzwboOSBd2OxFReu
 vlZYrJx9WWef22tKwXLC0KiQZ6eORxA=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a5084af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=veBU2d8d2MSVlRlIhgAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jfK_BdyzEIADNtOygpWW9i_vhwBonI90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1MCBTYWx0ZWRfXzHW2cxzLcqcl
 WoTEp0CzM2vYg6JSavgUMTRI5mQO7uWs7mst+AWS/GGHmTsrGAwRFbB3tAb1gN9Ncx6Y2ClRe+D
 dNNN2tn7cGtjwcnwcObC7rc4+4du00p8K74j2FoWNXit24hc4z17AbUza3nEPs6yAgi8Zi1BJtN
 QIoP/4VEeoK43JD9gNnCfrbOF+NaNOYl0+2uQ/snFn4Y32ANq1oNTCcc9UBDGifDX9ux3ORCVwX
 +ky37QMXCsNcjUjWoZijUwDnSgejfjgfLg9mRGJ1BmgABpsw1xStBq8fELwNP2iBB8r9BJd60Fx
 NLIt9yJphpdMv4sndlsPHWVC8qBr6ijQyFNWx8uJUyEBzRchffakmHaXAsqmRaVzunjCdoBvEbQ
 92C107HbFIN+pz35ldQ6uisZQ6gc32b2MUHpF8PJ7inEO/m5XBFjhlNFshiW6zajCCP07Nr3J7m
 jlOp7pFRx4aGXvsSYbw==
X-Proofpoint-GUID: jfK_BdyzEIADNtOygpWW9i_vhwBonI90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_223545_813626_DE2AC0BA 
X-CRM114-Status: GOOD (  14.22  )
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

In the ath12k driver, the BDF_MEM_REGION_TYPE address is derived by
adding a fixed bdf_addr_offset to the WCSS Q6 region base address.

The current offset (0xC00000) works only when the Q6 region contains
the IPQ5332 ucode alone. On some IPQ5332 platform variants, additional
devices share the same WCSS Q6 processor and place their firmware
ucode in the same Q6 region. This results in multiple ucode sections
within the region, and the existing offset can cause the BDF memory
region to overlap with firmware read-only sections, which can lead to
firmware crash and driver boot failure.

Increase the bdf_addr_offset to 0x1A00000, determined by analyzing
firmware memory maps across all known IPQ5332 platform variants. This
value represents the upper bound of the largest combined firmware and
ensures all IPQ5332 variants can allocate the BDF region safely without
overlapping firmware regions.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index e5bf9d218104..03f87374881f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -689,7 +689,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5332,
 		.ce_remap = &ath12k_wifi7_ce_remap_ipq5332,
-		.bdf_addr_offset = 0xC00000,
+		.bdf_addr_offset = 0x1A00000,
 
 		.dp_primary_link_only = true,
 		.client = {

base-commit: e36b3c776adc9891d8574241be77640ded819ee7
-- 
2.34.1


