Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569C5CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=; b=DtoiZc8OZaQMBgb8r5jrZ4k4t8
	50ajBcrOXjrWm1aKfY5mWvyP6oewte9wG1E4CLK0A7YyNJpJiCIE1Y+9jBqPllV7dcBmaT1uLoSw0
	QYFGn9CEZe1PdgSt9kRHtRAsQmc7IoHfLSenj67jplkCIaf68kiJ7hnmnB13TjCxQWxD6vHhwkGvC
	7F9SgTkEZGXjsPGiXINV6FYOTBY/nn47VqZn2i0OM9HaSGDKvnBoGcWiKcqYgansCVwjXP6qRsB4p
	Gc8XUTnG8L2E89gM7kLCHnDOKAmtqqUxkSfsWGFrBFQlvrOYlNteJ9srrGVbIOWiPjHqJhXn5gITS
	X5LdOV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHg2l-00000002lEc-06d2;
	Fri, 16 Oct 2026 11:24:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHg2j-00000002lEO-21fa
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 11:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=; b=DXbbP9gTX+Mts0a5qZ6NHe+KJj
	On3mbe7+fQ2p84xq8Ek6j1gth57CYjUPV6uFrEnAumGTyWMXKfUJdiLne/SV72YBIQw+jyGITuQ5v
	8Fkg7N0OcGNwW41ssVWB1Z6RAPPG39QEp6uYl54kGpa36FKc1RFemxjDSykZnhfLKwb3j/6qrE6E3
	KgtRJ+p7g0zQlwdIt17VWb+lrW+nEHB/Fxo1bLTFrl6snDf+pau2dcHRiOH7GNC9KAE4BTuU8ZXGD
	cxKBtdRPY+AMf3UhoYo272dmEijnsu2E+t5v4FRBPCBeAX1LFUgN57Nus+OoIqbasPeGO9Uv1rcZK
	XmFHFF4Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHg2g-00000001RRf-0JWU
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 11:24:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAI4B943302
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 11:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+3
	1i3C02Gg=; b=gBXGqNbz6FgTYmO33eYcO4uwEUf3iDWcuvgw5j8vb2n5pJX39n5
	BXgz59pOw/EXoopI2TeVGfWKDr14b9W1cVI8t4mI3SYmQjd+ahMoJY8fCOp2PRPV
	MOfJbCj2icfA2nW2CVCuav7AyUbCj0lR7kIQivBP+gZWClAHFB1ipMKgpsFbzeTf
	dwARh/ec2NImfrMdjuPBaS4N7od/dNr8ql3wIT61hlsemcgK78Xv4NQbMJvVqHnm
	lUzPMbX1EzlV6/nm2iwZUwrClkIQH8U9Bmke9yvUOlrEFEpK7KMM/r+29QpEyILJ
	eK9Tdmt5KfxbUyum/mNELP24mQzycTHe8sA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur08y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 11:24:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so845585eec.1
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149840; x=1792754640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=;
        b=SSaoJ/Kbo2RBq8G6kXqw9xbWS7GDDcrMTBHNAehJY8QfK1iV6NB6v/xCQx5c0xm8Fh
         wXm6iDNKX/nZt8H0Xyg67IW0WqLmCtFeC6ajsGM56ttbjQPwRB9exOjqWErVoO8L7yVj
         QpBhWVHW0n7a3+VDrrCDR/J4PYXs5+pYraMiPwwg/NHGB37cEnS3COHcCKpaixAEUi/6
         M4zdmIWOTCKrNWoWDaY/FH/glbIO0/YNOL+ZyOCMG7d6LRrEIkh7ZlvvsQM26PAky2BU
         hx5+mWp0FouOAcq3MIu6SXZdMNh0EDhnPl3Zfh+MBox/StVx56aiO+qbTJTGaZzOUxoY
         /F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149840; x=1792754640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sue0K1r/0IfYxGQ4qyY1WgHNHZN4Dy5KY+31i3C02Gg=;
        b=Wyt4murBgdKyM2E+SFt+v07NjRP0wBV129MtFjY0ctLevey6S/ule1fvbsKRtnyQYr
         VEyr+On6JD/Upnyh8O/VXLXI8sGcZIbhY6Cy74J4eHDf9vILSSZuVs8qFKaRtSUwMFmR
         co9vInVZDOnvRluxjFI7yPHI5bSXVJkacC9nSgjIZhMJ+p9TAKI0JZzf/FiVLtoBlmap
         9honeoLVpXAcaDGGyY1a2yVGQ6agMwuIrQIxg8ZvZ5W0FNOD2/ETsBEiM1vrSAffYfpC
         WVmPMtk35mcsGb+tWHFuHZIM8EFQblH8Xkzu8i4uuQOqCChuMJk2HxBZLt7mok197J35
         Zo/A==
X-Forwarded-Encrypted: i=1; AKwUvByC4KKpcqAZXNYzzC+9WhVpftgbHsj5HAZCCCr8gl1mh3HJ+oA7Ibwh0Q/jIhJt/tURQ9aKGSM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJT7f9yeqoogQm1PM7mAmScS5eAxchEYWTT6yMmdWcQ2z6kFCBg
	0mrXP7Kycc0o0LxFCj2vpAqj7VjdV0moFcKvFCzzC3QWO3nbVfcmE1iIFIqYbKlJdTwT0Qb7R+E
	jdVWcd2pviXcz/1SEZoYM9gK0TB3LWtHaVRK01N6q3DHMEy56tvaJWIQlFcGVKZTZJKax9orG
X-Gm-Gg: AYBFou11sjG1TT6Y0znso60FymkLnrs8b12VJZsQ8YiH8yCcgHK2CKuKQECF5L3/uaR
	uPghXNcGJhKEq2LBIyCY/RU3gbrJnuCryszuxmDZU1pgEeYi5/tN51jbeyiTxJ99H2H3lEgvKp8
	JY4khUEASWXxWKsd0BVuN6j7tQOCpW6vkpA48Ie0qeeJ+yDZNfp403XKrNu2rnelHz4LGy+32HN
	Pa4fVo8R4OiF8L0KHTiWGln6bhRKxX+GJdD908M4wEWTNVz/3aH1GbGP3NzRMx+H3/OKjvEswJg
	2FkW5Bgm5jKzlbiwAQe5mMr1XVbPBFShNGVMrP5LF1Q6BEuZ4UHAusKJwBz16X0wF/96lIQcaQ2
	HaMlkrqKYLrCYz8uwoVUpBxavyPKBPN3e
X-Received: by 2002:a05:701b:4504:10b0:182:c472:b123 with SMTP id a92af1059eb24-182c472d135mr2637385c88.1.1792149840339;
        Fri, 16 Oct 2026 04:24:00 -0700 (PDT)
X-Received: by 2002:a05:701b:4504:10b0:182:c472:b123 with SMTP id a92af1059eb24-182c472d135mr2637343c88.1.1792149839634;
        Fri, 16 Oct 2026 04:23:59 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm5190104c88.18.2026.10.16.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:23:59 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ath12k: pci: encode qmi_instance using QRTR NID bit layout
Date: Fri, 16 Oct 2026 16:53:55 +0530
Message-ID: <20261016112355.1108488-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfXwKlxbkkB+bVj
 bpEen+EXfijNMPmRfzzyWS3NicbHXOGaT8kxPbX00Q2DH6uz/j2Ys9gONKXNjCj95l2MwNQN06P
 24SETq2rrF3PGZtnWowui3Ax+eZkc8FSY4KIsx8NZ2Mw79a6+/B7CNoxqImeDMm37ZXWBVQJ8wn
 CI0P6i3/hw1kaiN1wPqCbOhnjtpjtrFgrfoj9ZDZKsaKsElDT9HazenqO7E7JG7y5mOslYCjDo5
 IShMa4B7MUtIBbZ/NqaQLgr03lkfNpCqlwsk8W+u+V/VgTcAvnlwyR8CDRTjxZio6GIM7psfIno
 Wt3Q5dgnvxDJdqlinwD3iro8kAP3lSH0QCFtNoKkMAzGILc+c1zQru/yTSie96Q1t1pBcIWwRfj
 NbZwhx2R06GtP1PHLU2fZYn9HBxMg8OXPR5qimXn491WDlSNJY/4mMXzstpLBEIWx+IWEot7ns7
 6AR3pyWYT3Cry6r7hLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX2nYqXIW401Og
 gKBZLlwX4lYZpaN9g7nxUzapN98rxrx/RIonGYO2OTZTElgGxBkdeHzy2PaOQR43Jmiq7TAAikb
 Rs78sWf8mK5Lecv3YMy1BQvpBJp5hAo=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad20951 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1poW-r593qKSufNXtKQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ElgN3wxVPyWujOOerVpmRIhGB9JKsO2r
X-Proofpoint-GUID: ElgN3wxVPyWujOOerVpmRIhGB9JKsO2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_122406_633687_0C28FE5F 
X-CRM114-Status: GOOD (  14.10  )
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

With ATH12K_FW_FEATURE_MULTI_QRTR_ID enabled, firmware derives the WLAN
QRTR node ID as:
  NID = IPC_ROUTER_DEFAULT_PROCESSOR_ID + PCIE_LOCAL_RSV0[15:0]

The host programs qmi_instance into PCIE_LOCAL_RSV0. Using an
incompatible bit placement can overlap node IDs used by other
processors and cause QRTR node registration conflicts.

Encode qmi_instance using the WLAN QRTR NID bit layout:
  bits [9:6]   PCI bus number
  bits [12:10] PCI domain number

The proc_id bits [5:0] are fixed to WLAN (7) in firmware and are not
encoded by the host.

Update QRTR_PCI_* masks to match these bit ranges and remove duplicate
mask definitions.

Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1

Signed-off-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pci.h | 6 ++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 12bbb75570f1..ac4bfd5b247d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -711,9 +711,14 @@ static void ath12k_pci_init_qmi_ce_config(struct ath12k_base *ab)
 	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
 
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID)) {
+		/*
+		 * QRTR NID layout: [12:10] domain, [9:6] bus, [5:0] proc_id.
+		 * proc_id is fixed for WLAN and is not encoded into qmi_instance.
+		 */
 		ab_pci->qmi_instance =
-			u32_encode_bits(pci_domain_nr(bus), DOMAIN_NUMBER_MASK) |
-			u32_encode_bits(bus->number, BUS_NUMBER_MASK);
+			u32_encode_bits(bus->number, QRTR_PCI_BUS_NUMBER_MASK) |
+			u32_encode_bits(pci_domain_nr(bus),
+					QRTR_PCI_DOMAIN_NR_MASK);
 		ab->qmi.service_ins_id += ab_pci->qmi_instance;
 	}
 }
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0e0e2020c6ae..35e8e0fe15cd 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -61,8 +61,6 @@
 
 #define PCIE_LOCAL_REG_QRTR_NODE_ID(ab) \
 	((ab)->hal.regs->qrtr_node_id)
-#define DOMAIN_NUMBER_MASK			GENMASK(7, 4)
-#define BUS_NUMBER_MASK				GENMASK(3, 0)
 
 #define PCI_BAR_WINDOW0_BASE	0x1E00000
 #define PCI_BAR_WINDOW0_END	0x1E7FFFC
@@ -73,8 +71,8 @@
 #define PCI_PARF_END		0x1E0BFFC
 #define PCI_MHIREGLEN_REG	0x1E0E100
 #define PCI_MHI_REGION_END	0x1E0EFFC
-#define QRTR_PCI_DOMAIN_NR_MASK		GENMASK(7, 4)
-#define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
+#define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(9, 6)
+#define QRTR_PCI_DOMAIN_NR_MASK		GENMASK(12, 10)
 
 struct ath12k_msi_user {
 	const char *name;

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.43.0


