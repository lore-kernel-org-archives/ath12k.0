Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA29CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=; b=GYv56IDsFYqylHMaCSw2ATsNP0
	svI1Xu/u/7aHOYPiR9SZxXqGjctyAzdrZRVeCjemQRVEK75Ml1CU7VgVAKKKTqw7e9NRx3VQMTOti
	p4j7KhrmiK2Lc0/fIkT6SVt3gH13MLy1c0x58or3HcZ09BMglGpP3j4a90FbGPqUQxnqVfWchj3oS
	ogqRXC8l6BGdYNkor6ZcsCr8N3fM4mG/vmJIhOVJWaG2NLn+/lUnq/PS/ARFlTZkZsq0VzdPQ+oSV
	QdnYx+zA9bnHFnH6Qz8oH6K9JqLg9JtX8v0VSPSK7UNyMeeV0x1uDr6wWhuokCTbI6tLjeCA+WlAx
	8Fe+rLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWi-00000001pek-39wU;
	Fri, 16 Oct 2026 03:22:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWh-00000001pdP-10HN
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=; b=KSq2+W6Fi43x9+KRmHPvtTKzvB
	CGJpCdfzqKZAw6wi9so2rwo5AA4WPhUTlUvQhWK68/MUPMxDp24bdyv6q8U83cu1f/bdRtDYCov4w
	F+/a3H4aIoFYhniWH56Nt0cfgnFr2GnvrXAZnQ+7srebmqzgTPtgCnUF4paklDL38mj7gwY7rDoY3
	dQdhztJBp9vfSErinfnUt3LYXYOUDBVtd+tK2Bh2FjzQYpOocpMpi1CI8D3Ph6613i7NZxKcJuOYW
	CQCS+z5lgUkFJGO3Dit8CTZdiyXKxBWZG0u/H3ybKAHJpcL9gT3UjL2cPVvpdtCzoHWanrmHPxSge
	XssYifpg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYWb-000000012VP-0jsN
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKKCTp3800043
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=; b=IhzZtxuwPqElPCY7
	WhGPCOTJ/drqiHBzvNTTuMOvIdlPyY83jY4LOR0XE5KfeGx6bQ72ZlTeWHE01Wp8
	nBruy41A6zmfThknvOivMwuqgWqS9K1MmpiEqb76U58NV+jkO90fJW+vtXWTh9NF
	edaFRvz+7w2bTufdFIAF7VIaQw1bEZfxy9PZPjuKPMhKy3WjCBVyqi6u59ilRMdE
	Krugt3DoOcBSBMj9FOMSK73JIVvHoi4CZMbDaDYXBXpxJmWYHWWeZ6SMB7VOIsnI
	OvTu1+67KvV2KE+zZZrrKVQoMXs5zacjFGdBy/OkEmFJ/WgKll7IFNna83uWJB9v
	0BB9Ag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so12130037eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120946; x=1792725746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=;
        b=B2N71/gzucgH0PTl5DR9qNYnqgv3/rip1+WtLNiI8Dw1uD9tEx4COAh5FsAKZv/pbX
         /RCctgKTySac2EPOPjDG8aCYsYn6giBrLISNI5USSYdYVyg4Xe7+XaMVCrg3oz9tcmgR
         IIOftUSSihJ2SV7pjS/McKo9FcpIRpMIXHef9Y3qAsCzoDH/3ySs4Zoc1lGXO+rhut4p
         MCvcqP6Yeqw2NqOjaP61hcWVBPqCVwb+7Ci+4KSUsHHu8iSG+ashVlvo3kIE6EbdQfnN
         JVom1mWycEaNoneIeyMzMVlhEGQjHALYprdt12YqwUAb7y2BmG+Tz7ITeZSSgQDcYwDJ
         smVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120946; x=1792725746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=;
        b=0w2YxFQhzrW0j+dE+8mfRT6Qr/x8B1SwrpMkxa5jApYEeVp1veWuHBE3fCpf1kEp9p
         xfx0NnGwCpL2G6q52UHcvV9jWQ6XWEvNdvhLpAo0/C68fYlNlr4+Vy/qowrLGzXIPDld
         znLIATcs/EDXqbKxdogwGn3jGni930TfQyzhvE9RZkQo7KsZ2+U2QuttXo3UhDOf5SaO
         S2h0LHb2gKqowXITvcwa3/LlJX98DHAj7lLALD1IhUerTRA7ARkMfG294agspgviHXtr
         q3jA/OL/HsIE23NbnTVQSWmtK2k4abLLME8Pj/eZVI8j9TIvN6s6OULbN6HmEJ4uMFxN
         crPA==
X-Forwarded-Encrypted: i=1; AKwUvBwGwlpitIx1zLRruOUWz/R3VaXAbo3MLEEgCoAVdbF+/DJp7BMkyUMes/9McXI2Q+87KperzcA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJxiWpKQGg8q0HAer+CkQNJZMlmaO+SaGWmNTuivx7VPetZAFXK
	FuZxDi9MPDKgZqG+E3++c4Hf0uV8uizR4HgxF97k8yNwOPMbBZRqhyTkYcmLTXpYNiBMpkGpm7h
	j4dvqL4kjhrHbLkd7XMiSTUWskyPD3O+y2dOB4C4UgApDuT02mUbxFzd0eQFn4j4D
X-Gm-Gg: AYBFou0v07w5moZ320V0e+rYsvaxsMf1iNqRsut7cMFeIwiFCbBhVZQT0y1Cb8VeZoG
	+9U5jQj/SOrRjsjBIbXiObV08A4fyeDHuNAGPNagJI2mkrzZWEupjPv6UqtSAJVi/1QrjL61bZM
	NdF307ewqfq50iiW2zmzbZzMHOjXzGZZ7RdRdAvt92s+NNIS/HJRuYbd0egFG1JhfNsLPup/5+o
	31bHgL0vzfwC2+ED5dTnYLDHkE+nfcUPGb5bAgYX9cWYMh2Fji/pO50lvKTTq+/4ZHvAIiXBDLB
	llgxnlz4xC5aV628nVZHWsDKveGJ/qi8VsrnyBmOZ54HWT5CcYxpZoKGNLRLPYC1DrVmUzBvqPQ
	DT8aNjg/wBeumeRk3bxrlqIhd/MGZa8ROWjMhgJrTjI1NMstdiDUyl6loms7F+jq4zqOcINrLcj
	NID70etA4HGbzBP4VaG5nwFw==
X-Received: by 2002:a05:693c:2806:b0:353:7f17:4358 with SMTP id 5a478bee46e88-3537f174c08mr25480182eec.24.1792120945919;
        Thu, 15 Oct 2026 20:22:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2806:b0:353:7f17:4358 with SMTP id 5a478bee46e88-3537f174c08mr25480152eec.24.1792120945315;
        Thu, 15 Oct 2026 20:22:25 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:24 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:45 +0530
Subject: [PATCH ath-next v2 08/17] wifi: ath12k: Add hif operation support
 for QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXz04lAByFyeh+
 Qt2XXRtGsHPi9IfxsrGuGMlnAvJXRy4R46VCEy6UYuG27eaJ44l7LZ2dwHBo0RfB42f3qDJRr26
 CyZ97mVQiXRIT4fmpmdF/AaRoDOc1Ao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX65LNLOZb83/i
 Ec8RvICG3YjMKw8uMaczBeNAnMyb44UlQDnM0Jrd6BT9iu9xeHw1rSuSsAnzPM57Q1TpRMelbuR
 C6aZvAtsASMrDyFSnJRUDL+Gtf2UrFipf/oxVwv0n/MU5dRNlKFktIq0be+Uce9KSBdhYqCxpg/
 x9/FBo2gTu/om49YET2u7O/C68+NXz1ccOR3/VaSEHJ0vCSkndsEnbTNqs1n6+CtQcMSNweMWDC
 ec+9BYcillvOXosBwpU7G7GyRBvCcj0PdT6kX83ii323IdVPiFuF6OCCot8xE64kyOjKo/1l80Y
 1ICp5NzTBA3+EkNr1hXA4tYJDiXRU8i1Jyto+JuuVeJ8fYZUm9c9MEhRR7zk6+kCnJQJWxa8pUH
 CJsNzLIG7adw6NDEBAnoyBeDtiY3xHHLootLE/pOBWmyWrvvfrZexVq3ywbLIyBkxR+afkswoah
 JptewsUKxoPYKokxeDQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad19872 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KhQMAEluCXMSMqz3IAgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PiPnYvgn0XnJTpLFtPtWVSOwgW-Fn300
X-Proofpoint-GUID: PiPnYvgn0XnJTpLFtPtWVSOwgW-Fn300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042231_007804_CF61E61A 
X-CRM114-Status: GOOD (  24.26  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hif operations (ath12k_hif_ops) for the QCN6432 Wi-Fi driver.

Reuse existing hif operations such as power_up and power_down from
IPQ5332, as they are identical on QCN6432. Similarly, reuse operations
like irq_enable, irq_disable, get_user_msi_vector, and
map_service_to_pipe from QCN9274, since their behavior matches on
QCN6432.

Implement QCN6432-specific operations such as start, stop,
cmem_read32, cmem_write32, read32, write32, get_msi_address, and
config_static_window in a new pcic.c file.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile    |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c       |  23 ++++
 drivers/net/wireless/ath/ath12k/ahb.h       |   9 ++
 drivers/net/wireless/ath/ath12k/core.c      |   3 +
 drivers/net/wireless/ath/ath12k/core.h      |   2 +
 drivers/net/wireless/ath/ath12k/hif.h       |  30 ++++++
 drivers/net/wireless/ath/ath12k/pcic.c      | 156 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h      |  22 ++++
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |   7 ++
 9 files changed, 253 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 3b39b2c33307..861ec85eebed 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -22,7 +22,7 @@ ath12k-y += core.o \
 	    fw.o \
 	    p2p.o
 
-ath12k-$(CONFIG_ATH12K_AHB) += ahb.o
+ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
 
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2c55aae06dd0..bcb49ff07aa8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -16,6 +16,8 @@
 #include "ahb.h"
 #include "debug.h"
 #include "hif.h"
+#include "pci.h"
+#include "pcic.h"
 
 #define ATH12K_IRQ_CE0_OFFSET 4
 #define ATH12K_UPD_IRQ_WRD_LEN  18
@@ -790,6 +792,26 @@ const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
 };
 EXPORT_SYMBOL(ath12k_ahb_hif_ops);
 
+const struct ath12k_hif_ops ath12k_ahb_hif_ops_qcn6432 = {
+	.start = ath12k_pcic_start,
+	.stop = ath12k_pcic_stop,
+	.cmem_read32 = ath12k_pcic_cmem_read32,
+	.cmem_write32 = ath12k_pcic_cmem_write32,
+	.power_down = ath12k_ahb_power_down,
+	.power_up = ath12k_ahb_power_up,
+	.read32 = ath12k_pcic_read32,
+	.write32 = ath12k_pcic_write32,
+	.irq_enable = ath12k_pci_ext_irq_enable,
+	.irq_disable = ath12k_pci_ext_irq_disable,
+	.get_msi_address = ath12k_pcic_get_msi_address,
+	.get_user_msi_vector = ath12k_pci_get_user_msi_assignment,
+	.map_service_to_pipe = ath12k_pci_map_service_to_pipe,
+	.ce_irq_enable = ath12k_pci_ce_irqs_enable,
+	.ce_irq_disable = ath12k_pci_ce_irq_disable_sync,
+	.config_static_window = ath12k_pcic_config_static_window,
+};
+EXPORT_SYMBOL(ath12k_ahb_hif_ops_qcn6432);
+
 static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
 {
 	struct ath12k_base *ab = data;
@@ -1324,6 +1346,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "AHB device family id: %d\n", device_id);
 
 	ab_ahb->device_family_ops = &ath12k_ahb_family_drivers[device_id]->ops;
+	ab_ahb->reg_base = ath12k_ahb_family_drivers[device_id]->reg_base;
 
 	/* Call device specific probe. This is the callback that can
 	 * be used to override any ops in future
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index ecc4054f8742..373dc3b92728 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -11,6 +11,11 @@
 #include <linux/platform_device.h>
 #include "core.h"
 
+struct ath12k_ahb_reg_base {
+	u32 umac_base;
+	u32 ce_reg_base;
+};
+
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 
 #define ATH12K_AHB_SMP2P_SMEM_MSG		GENMASK(15, 0)
@@ -65,6 +70,7 @@ enum ath12k_ahb_userpd_irq {
 
 struct ath12k_base;
 extern const struct ath12k_hif_ops ath12k_ahb_hif_ops;
+extern const struct ath12k_hif_ops ath12k_ahb_hif_ops_qcn6432;
 
 struct ath12k_ahb_device_family_ops {
 	int (*probe)(struct platform_device *pdev);
@@ -103,12 +109,15 @@ struct ath12k_ahb {
 	bool scm_auth_enabled;
 	struct ath12k_ahb_rproc_info *rproc_info;
 	bool supports_multipd;
+	u32 static_window_reg;
+	const struct ath12k_ahb_reg_base *reg_base;
 };
 
 struct ath12k_ahb_driver {
 	const char *name;
 	const struct of_device_id *id_table;
 	struct ath12k_ahb_device_family_ops ops;
+	const struct ath12k_ahb_reg_base *reg_base;
 	struct platform_driver driver;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..d2ce01e0d7ac 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1350,6 +1350,9 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	int ret, i;
 
+	if (ab->hw_params->hybrid_bus_type)
+		ath12k_hif_config_static_window(ab);
+
 	ret = ath12k_core_start_firmware(ab, ab->fw_mode);
 	if (ret) {
 		ath12k_err(ab, "failed to start firmware: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index eaea601ab32d..293c7561b27a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1161,6 +1161,8 @@ struct ath12k_base {
 	struct {
 		const struct ath12k_msi_config *config;
 		u32 ep_base_data;
+		u32 addr_lo;
+		u32 addr_hi;
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index aecdb0c5f285..faeabd2c3d2a 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -12,6 +12,8 @@
 struct ath12k_hif_ops {
 	u32 (*read32)(struct ath12k_base *ab, u32 address);
 	void (*write32)(struct ath12k_base *ab, u32 address, u32 data);
+	int (*cmem_read32)(struct ath12k_base *ab, u32 address, u32 *value);
+	int (*cmem_write32)(struct ath12k_base *ab, u32 address, u32 data);
 	void (*irq_enable)(struct ath12k_base *ab);
 	void (*irq_disable)(struct ath12k_base *ab);
 	int (*start)(struct ath12k_base *ab);
@@ -31,6 +33,7 @@ struct ath12k_hif_ops {
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath12k_base *ab);
+	void (*config_static_window)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -126,6 +129,24 @@ static inline u32 ath12k_hif_read32(struct ath12k_base *ab, u32 address)
 	return ab->hif.ops->read32(ab, address);
 }
 
+static inline int ath12k_hif_cmem_read32(struct ath12k_base *ab, u32 address,
+					 u32 *value)
+{
+	if (!ab->hif.ops->cmem_read32)
+		return -EOPNOTSUPP;
+
+	return ab->hif.ops->cmem_read32(ab, address, value);
+}
+
+static inline int ath12k_hif_cmem_write32(struct ath12k_base *ab, u32 address,
+					  u32 data)
+{
+	if (!ab->hif.ops->cmem_write32)
+		return -EOPNOTSUPP;
+
+	return ab->hif.ops->cmem_write32(ab, address, data);
+}
+
 static inline void ath12k_hif_write32(struct ath12k_base *ab, u32 address,
 				      u32 data)
 {
@@ -153,4 +174,13 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline void ath12k_hif_config_static_window(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->config_static_window)
+		return;
+
+	ab->hif.ops->config_static_window(ab);
+}
+
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
new file mode 100644
index 000000000000..e3c8476af459
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/module.h>
+#include "ahb.h"
+#include "core.h"
+#include "debug.h"
+#include "hif.h"
+#include "hw.h"
+#include "pci.h"
+#include "pcic.h"
+
+void ath12k_pcic_config_static_window(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
+	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	u32 window;
+
+	window = (umac_window << 12) | (ce_window << 6);
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+}
+
+static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+
+	u32 window_bits, new_window, reg_value;
+	const int max_retries = 10;
+	int i;
+
+	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+
+	/* Update window bits [5:0], preserving other bits */
+	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
+
+	if (new_window == ab_ahb->static_window_reg)
+		return 0;
+
+	reg_value = WINDOW_ENABLE_BIT | new_window;
+	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+
+	/* Wait for the write to take effect */
+	for (i = 0; i < max_retries; i++) {
+		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+			ab_ahb->static_window_reg = reg_value;
+			return 0;
+		}
+
+		usleep_range(1000, 2000);
+	}
+
+	ath12k_warn(ab, "failed to set static window for cmem init\n");
+	return -ETIMEDOUT;
+}
+
+int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value)
+{
+	int ret;
+
+	if (!value)
+		return -EINVAL;
+
+	if (addr < WINDOW_START) {
+		*value = readl_relaxed(ab->mem + addr);
+		return 0;
+	}
+
+	ret = ath12k_pcic_select_static_window(ab, addr);
+	if (ret)
+		return ret;
+
+	*value = readl_relaxed(ab->mem + WINDOW_START + (addr & WINDOW_RANGE_MASK));
+	return 0;
+}
+
+int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr, u32 value)
+{
+	int ret;
+
+	if (addr < WINDOW_START) {
+		writel_relaxed(value, ab->mem + addr);
+		return 0;
+	}
+
+	ret = ath12k_pcic_select_static_window(ab, addr);
+	if (ret)
+		return ret;
+
+	writel_relaxed(value, ab->mem + WINDOW_START + (addr & WINDOW_RANGE_MASK));
+	return 0;
+}
+
+static u32 ath12k_pcic_get_window_start(struct ath12k_base *ab, u32 offset)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	u32 window_start;
+
+	/* If offset lies within DP register range, use 3rd window */
+	if ((offset ^ ab_ahb->reg_base->umac_base) <= WINDOW_RANGE_MASK)
+		window_start = 3 * WINDOW_START;
+	/* If offset lies within CE register range, use 2nd window */
+	else if ((offset ^ ab_ahb->reg_base->ce_reg_base) <= WINDOW_RANGE_MASK)
+		window_start = 2 * WINDOW_START;
+	else
+		window_start = WINDOW_START;
+
+	return window_start;
+}
+
+void ath12k_pcic_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
+				 u32 *msi_addr_hi)
+{
+	*msi_addr_lo = ab->msi.addr_lo;
+	*msi_addr_hi = ab->msi.addr_hi;
+}
+
+void ath12k_pcic_stop(struct ath12k_base *ab)
+{
+	ath12k_pci_ce_irq_disable_sync(ab);
+	timer_delete_sync(&ab->rx_replenish_retry);
+	ath12k_ce_cleanup_pipes(ab);
+}
+
+int ath12k_pcic_start(struct ath12k_base *ab)
+{
+	ath12k_pci_ce_irqs_enable(ab);
+	ath12k_ce_rx_post_buf(ab);
+	return 0;
+}
+
+u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset)
+{
+	u32 window_start;
+
+	if (offset < WINDOW_START)
+		return readl_relaxed(ab->mem + offset);
+
+	window_start = ath12k_pcic_get_window_start(ab, offset);
+	return readl_relaxed(ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
+}
+
+void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
+{
+	u32 window_start;
+
+	if (offset < WINDOW_START) {
+		writel_relaxed(value, ab->mem + offset);
+		return;
+	}
+
+	window_start = ath12k_pcic_get_window_start(ab, offset);
+	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
+}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.h b/drivers/net/wireless/ath/ath12k/pcic.h
new file mode 100644
index 000000000000..f77091927039
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/pcic.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _ATH12K_PCIC_H
+#define _ATH12K_PCIC_H
+
+#include <linux/types.h>
+
+struct ath12k_base;
+
+int ath12k_pcic_start(struct ath12k_base *ab);
+void ath12k_pcic_stop(struct ath12k_base *ab);
+void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value);
+u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset);
+void ath12k_pcic_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
+				 u32 *msi_addr_hi);
+int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr,
+			     u32 value);
+int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value);
+void ath12k_pcic_config_static_window(struct ath12k_base *ab);
+#endif /* _ATH12K_PCIC_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 70372db6abae..bff48b2fe124 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -14,6 +14,7 @@
 #include "hw.h"
 #include "dp.h"
 #include "core.h"
+#include "hal.h"
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
@@ -72,9 +73,15 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+};
+
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
 	.name = "ath12k_wifi7_ahb",
 	.id_table = ath12k_wifi7_ahb_of_match,
+	.reg_base = &ath12k_wifi7_ahb_reg_base,
 	.ops.probe = ath12k_wifi7_ahb_probe,
 	.ops.arch_init = ath12k_wifi7_arch_init,
 	.ops.arch_deinit = ath12k_wifi7_arch_deinit,

-- 
2.34.1


