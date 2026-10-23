Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A3606ACA5
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rfI+zdq/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=afQN611O;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGFGrkJ7;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZ3oUpIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=rfI+zdq/gxnk0u
	6Hrr2WDD8E9i+UBsi5K3zD2TuurvcIjPy+zyIVKe/CXVWhdjQtxorqdmUW5ZIzIxyKpZ/4yJe1hhh
	RrAyKWJN/KjlRkoAFGOcZ9BX+XWImFB6qDDc0yr/mC6trK213aN5ybcb8lAUH6uuYlOQkkmRKYMnu
	1Z91j2lzGzCng3fine5BUxrVbovcno7ClR2qws0WVavT8RDU3ds8O+JwsmQ11eLhShs4NasotOGwe
	uiZlWWO/TZSCupoIqXXy9i3ycr4eNvWmHmFpjBqC+RTNfCA48cL2R3TxrWOxc99nB48DmRfObxRar
	sDpaLJHgEyNMXXYgQPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I9-0000000Fgj7-0MPN;
	Fri, 23 Oct 2026 07:02:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I7-0000000Fget-0tCL
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=afQN611OEnaiOHCgI79Q4g2ioU
	TGGyeSZasR334IbpRWc7t6Z8SFfkRmzymndkeiebNC2NuN4sXcH2WP1aF+EsBRKWAnsNuKlGMjsvC
	u8kEaWh6dUYsVibPVr12ozoHAFpdCeBWIIFqLKkKyGlqCTCrAiKxu3iyy1kY64BcD4iJN52XSP/Ib
	APh41P5J06r0kI3UUCo/DPaVPr5xdSYjrxmA4+9lGNsP/VHY0fSibwFVXM2hHQdqLLYBf2lKCftMn
	ZIRCyDSUl3AM1O7dnVF2GAkhkIXGmi7gEIoMNSVN9HftQ8cqpqlPUzffQvTnXOlSEvVhrhm6DXCpn
	4Nh2xkPA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I1-00000008yGZ-0sE4
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FDMW1869356
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=VGFGrkJ7xeQ+67/z
	R3vFM3CO2/u/UmZZBdtQ9qBUCZdEwHGNRXTRPvtKc+fbhUrUdVVaMLvwQmOn6xSK
	uepKeRKHDf+/XKeQMZzyKN4uZrjvW4bR4jc2asmFQ37rFEKTMpy+S7GAxsNy1l6h
	NJVEPVyUX7M1Isk69Q8ci3zjhH2jGzCCkZxJpg3X7lC5/lWzDMnAVkMn1khoYDCB
	wQzBUcMOhjkGXp/0xM1ZFEOzUYx2s98ry5WltbgrRm2ga8mABoiMLVAwlPwxxlqo
	9jgTYB71ip3Wjy8iwNMUV/U/xpd2hk7UKlWzsvkJk7UCLi6WwE6auINayS7lr8+4
	GopuRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjad9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so6854435ad.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738926; x=1793343726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=TZ3oUpIe2Ab0BdvzG7h1s5WdT+oH4yxJClC7nQPyXU1APS5bO3FjVCbEUsNRHt30ta
         vg8ZrvtpYuPOihw2u24+2rzn4Ax23T+cks0za2571hJfVy27uBm95Rq0NSiChi2/npEb
         KBx9oAX/8de26fRBxU5EW4XZmn10eE+txyi3Q+SNSlfJdwl1txU+n9/a28ExeaMBray9
         ND1yAQEVZrtqaIoxMx+wSXLNJkdGqWJwoUhORj8ZZU8qDjnJ9IrrMejnItSBvR+clUyH
         5GYmmch31C2VeZEiTE6eEfnjTus25yqBCqVeAUY89PM8KV5JR1sAR7Vm29pKUwnQV+E/
         H4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738926; x=1793343726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=nyVopXh0xuhIm5vUlzubwhSbK8LSRLl97KgDW843MkK6Ir/IxdMjk9SeNvAac+N368
         LiwSJY/SIqZDJwnAzTH1oMRjcYXZgNysYBVJvNmq9uSKq0k97WviD1geYtY/Y7ZqCHOH
         nDVbo5+HXE4T33ucjdwXHq5peL5uVW38KDe8c+ZzoA2Bv8Ah2P/owEh7s6zfXcuP57Vt
         XL1loEHqAqBckhSgb2t8FOpyUgClnEy2+ZxVrJ6b3tpSLGn5xm/f1HgptYRNkavDATla
         s1eNq3YwBkoLeYpLF1lwIpGtrYzGYZak7gV6dUNmYhZmXGm95/cln7PUh6FlqErwrBqA
         OZfA==
X-Forwarded-Encrypted: i=1; AKwUvByEqjTczrT1tNUJtOnkXTlbluEHxqJ5bLdRvH+XYZ0qnZzEQhVlCs6Zhn7kfK/sL8YtNyt+rU8=@lists.infradead.org
X-Gm-Message-State: AFq9FYL9VkrevuYMWH55xj+S2IakrryQkH3E6Y2U+3gS4/7eHASp/tob
	Y7r7iuKtn2KwBR8cGi5WQAqQdn0ewTwUpi0Z8U1BqZpnUtJGVYahQEWww/X6qSqnHxhAGPSqRwV
	OmtuYEXpZ9WMu8Pv/CkIzjlZHYIgFa8OhU4fVMR1CAf9rh6X2egxSruBFjksGzTHnqtrzBPQn
X-Gm-Gg: AYBFou1uKz1IOKgvExC9Uzblbjb7nC355Nqq7Rz/1gKw2TKFmyn0S58jpEaauaNVyNq
	uYMdIVlWSlOux+dLp3CqV4e76JADuk4sl5Um1QPU7aOi1fsTafXQ5j6J8BTvY3TddgJNKHFZ3FS
	QwpHca6XYd6/zGsHOaP0f8QuoxxfkJYhzN3eeKtWh+H63R9nFoFlW2rLYE1lEw15S4jTu1O5v70
	s9Y0KmuFFZtfZXlEAUM7/wy+1Bk7F3OhCjF3A+8vLq0Mj6ttdtE1r9XLh/gYQXSJyxmZRvfM9H4
	jVUI3ev264KhWaXTtUcRuvi2Y25Ez5B1ItnnJ2pDUGcmjRPxHVP3slKNpQ4V+A/FaAS52rksRHk
	iu/cYNSooX7Ytceil2XuJGNsIdklUzgDdOX2dftLBamA5hrRc/96BfNHok999eFMTkb8rRV7VcT
	FDnDQ6gyXlRNgyRT51BcfRpA==
X-Received: by 2002:a05:6a21:3b90:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3e3693547edmr981104637.23.1792738925923;
        Fri, 23 Oct 2026 00:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b90:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3e3693547edmr981084637.23.1792738925376;
        Fri, 23 Oct 2026 00:02:05 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:04 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:15 +0530
Subject: [PATCH ath-next v3 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-12-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: NC3y_JdXNfMw7vTLAvgD5fgyKdsZkLTx
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb066f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BHcOcFGZyyTdvy3InMAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX7PKE+z+Igb7a
 iaL79YrjzUaO+wPq9PPg9wU62W9OiMBQBkKzvAQW63VI8EpXez5wBYQnsKDoYC7KRxXW1fK+6LP
 noU8WArjTl+uNqaaaBLhOVVDUHvoFG4=
X-Proofpoint-ORIG-GUID: NC3y_JdXNfMw7vTLAvgD5fgyKdsZkLTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX0AStRdVJDMwT
 yWXRcfabOUQMhuvQRvIz5ATgSocfGQMJVDJkYhUaF2RXjjSZXnVCwt88uO0LX11QCOdOTBsSoLH
 DxC6RPSoXRu4LxvFapXs6I0RbAbNjSN9ISK07fgU7YC/wPawSpLQupcHdVt3AubLZZPfFsed5/C
 8cpcUAQ8vhvbBi8idsoXypWZfs4TSY7e97+DfPuKIp3nbJoSnoGNYKCUBIpCBTBPFwJ/fxJ+EtU
 76ZXYqkRKyeGuyaICKGWpqZB9Bzk7fR48WxFf8ZlIUiyq4y8fK8uC5U5RA5V4vYZNRs6dBiZdcL
 p9j8+0ap828FM8nIvtfxZq43PTTGPwTMos6nKGmBa7SyJ5Vn6p+A9ZkFUCdLHPvzShVWII5AcL/
 VAYDwF2NPrulWepakmT9F3QU1cHlT5JbpFbOr2IU0JPxc+fOC9HLd64kPky20M9cTM2T7cTsZk+
 mEl18Xo6QqqoLjmtbLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080210_821300_C623F16C 
X-CRM114-Status: GOOD (  22.10  )
X-Spam-Score: -0.9 (/)
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Configure and request external MSI interrupts for DP ring groups on the
QCN6432 platform.
Create a NAPI context for each active external interrupt group and
disable the corresponding IRQs while NAPI polling is in progress.
Re-enable the IRQs after completing the NAPI poll.

Handle allocation and cleanup of NAPI contexts and external IRQs during
configuration failure and driver removal. Also disable external DP
interrupts from the AHB IRQ disable path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/pci.c  |   6 +-
 drivers/net/wireless/ath/ath12k/pcic.c | 122 +++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 21332aeb0c22..bbbde9f05ea9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -165,6 +165,7 @@ enum ath12k_hw_rev {
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
 #define ATH12K_MAX_MSI_VECTOR	32
+#define ATH12K_EXT_IRQ_NAME_LEN	32
 
 struct ath12k_ext_irq_grp {
 	struct ath12k_base *ab;
@@ -175,6 +176,7 @@ struct ath12k_ext_irq_grp {
 	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
+	char irq_name[ATH12K_EXT_IRQ_NAME_LEN];
 };
 
 enum ath12k_smbios_cc_type {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index a26fdb3c0ad2..4bb14a95aec9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -348,11 +348,15 @@ void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 	for (i = 0; i < num_ext_irq_grp; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
+		if (!irq_grp->napi_ndev)
+			continue;
+
 		for (j = 0; j < irq_grp->num_irq; j++)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
 		free_netdev(irq_grp->napi_ndev);
+		irq_grp->napi_ndev = NULL;
 	}
 }
 
@@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		if (!irq_grp->napi_enabled) {
+		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index fea284c3707b..13097cdf2794 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -181,6 +181,113 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void ath12k_pcic_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
+{
+	int i;
+
+	for (i = 0; i < irq_grp->num_irq; i++)
+		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
+}
+
+static int ath12k_pcic_ext_grp_napi_poll(struct napi_struct *napi, int budget)
+{
+	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
+						struct ath12k_ext_irq_grp,
+						napi);
+	struct ath12k_base *ab = irq_grp->ab;
+	int work_done;
+
+	work_done = ath12k_dp_service_srng(ab->dp, irq_grp, budget);
+	if (work_done < budget) {
+		if (likely(napi_complete_done(napi, work_done)))
+			ath12k_pcic_ext_grp_enable(irq_grp);
+	}
+
+	if (work_done > budget)
+		work_done = budget;
+
+	return work_done;
+}
+
+static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
+				      struct msi_desc **msi_desc, int num_msi)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ext_irq_grp *irq_grp;
+	int j, i, k, vec_idx = 0, ret = 0;
+	u8 userpd_id = ab_ahb->userpd_id;
+	u32 num_irq, base_idx;
+	struct msi_desc *desc;
+
+	base_idx = ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
+
+	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
+		num_irq = 0;
+		irq_grp = &ab->ext_irq_grp[i];
+		irq_grp->ab = ab;
+		irq_grp->grp_id = i;
+
+		if (ab->hw_params->ring_mask->tx[i] ||
+		    ab->hw_params->ring_mask->rx[i] ||
+		    ab->hw_params->ring_mask->rx_err[i] ||
+		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
+		    ab->hw_params->ring_mask->reo_status[i] ||
+		    ab->hw_params->ring_mask->host2rxdma[i] ||
+		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
+			num_irq = 1;
+		}
+
+		if (!num_irq)
+			continue;
+
+		desc = msi_desc[vec_idx];
+
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto fail_allocate;
+		}
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
+			       ath12k_pcic_ext_grp_napi_poll);
+		irq_grp->num_irq = num_irq;
+		irq_grp->irqs[0] = base_idx + i;
+
+		for (j = 0; j < irq_grp->num_irq; j++) {
+			int irq_idx = irq_grp->irqs[j];
+
+			scnprintf(irq_grp->irq_name, sizeof(irq_grp->irq_name),
+				  "pcic%u_wlan_dp_%u", userpd_id, i);
+			irq_set_status_flags(desc->irq, IRQ_DISABLE_UNLAZY);
+			ret = request_irq(desc->irq, ath12k_pci_ext_interrupt_handler,
+					  IRQF_SHARED, irq_grp->irq_name, irq_grp);
+			if (ret) {
+				ath12k_err(ab, "failed request irq %d, for group %d : %d\n",
+					   desc->irq, irq_grp->grp_id, ret);
+
+				for (k = 0; k < j; k++)
+					free_irq(ab->irq_num[irq_grp->irqs[k]], irq_grp);
+
+				netif_napi_del(&irq_grp->napi);
+				free_netdev(irq_grp->napi_ndev);
+				irq_grp->napi_ndev = NULL;
+				goto fail_allocate;
+			}
+
+			ab->irq_num[irq_idx] = desc->irq;
+			disable_irq_nosync(ab->irq_num[irq_idx]);
+		}
+
+		vec_idx = (vec_idx + 1) % num_msi;
+	}
+
+	return 0;
+
+fail_allocate:
+	ath12k_pci_free_ext_irq(ab, i);
+	return ret;
+}
+
 static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 				     struct msi_desc **msi_desc, int num_msi)
 {
@@ -294,9 +401,23 @@ int ath12k_pcic_config_irq(struct ath12k_base *ab)
 		goto free_msi;
 	}
 
+	ret = ath12k_pci_get_user_msi_assignment(ab, "DP", &num_vectors,
+						 &user_base_data, &base_vector);
+	if (ret)
+		goto free_ce_irq;
+
+	ret = ath12k_pcic_request_msi_irqs(ab, base_vector, num_vectors,
+					   ath12k_pcic_ext_irq_config);
+	if (ret) {
+		ath12k_err(ab, "failed to config DP irq\n");
+		goto free_ce_irq;
+	}
+
 	set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 	return 0;
 
+free_ce_irq:
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
 free_msi:
 	platform_device_msi_free_irqs_all(&pdev->dev);
 	return ret;
@@ -307,5 +428,6 @@ void ath12k_pcic_free_irq(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 	platform_device_msi_free_irqs_all(&pdev->dev);
 }

-- 
2.34.1


