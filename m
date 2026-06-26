Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE44FCD4F26
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=; b=Dqg5MzR0BQLNf4J/VMfBnlv2Ow
	z9GL3n7zsn+SXKdZQn4ec/Y1Kv54QImH1Xy5nuxoGGzr/2gc1gGGRy+/h1tqihG6JF8vdtUkm+epf
	ZpJSVWtHgU5JVt+lxO/fArcKj653vZPUZ2m3MTfZIThoSvPSUnHvqBf18HrnTE2B9R1Ge80Qw2VEl
	3zLW63URwMVxTWyPZYS/zx3QFfGxEFNjBRz3XjjJ6p1osUky8g1+Bhkyk78zv9jH+UYZ7nZP8tSYd
	Waujc5Vak+O3Rr5dOrcdR9Lrl4lwZ0QkHtOotCBWyB3L3G3Q5L9WfqXHYH/w23FRqkd806VIxY76N
	AvI8WR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2JB-0000000Av45-2aaD;
	Fri, 26 Jun 2026 08:53:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J9-0000000Av2Y-0DEj
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:53:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VvDc631833
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rC2n29l+e+U
	5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=; b=kD0jgvFB0mOR5cmOllPXB4QvFw4
	z6x7LK0rjjudEraIe4Q3vLSJtm88LY9q9SkZ8LtLf7q89q6VpeQcJNeJkgFsJSjq
	hfyUteUFXAQxq8jEyeuA2ap5PxCdYHDY0Tpn8d5aATauL6BDDc1CC+icQ8r+Elbh
	5Zg1VfRbYWP4P4sCNYNjTivgqHc8gcc8zjVAxrn9kkga8oFo7ek8XyhcoEYNhc6M
	jd510acfbtDo/sJVIvUDNunYCN8dVOwZ3hSioQhSqiK9RTvC6DO1H3oQ1k+IA9Sk
	eEP88GGDKbfaz9XLozLKru9Q8NcLgSPy7Vtqdcp1d2HVAzgAY3fdVKS+MZg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asktrhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c42d96713so575136eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463985; x=1783068785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=;
        b=JGAqBUm9sRGe84QLm7Nqa7vBRlEkt2rwmPapSrk6bHp1AFS6yepidHUWeSICtyL3VF
         tiDBobymd3uHulhyn+INauGHCwZxB66J7AHWZqdGu3gp1UuULRYGFvmBNmCyTBqeMoSe
         aOuYTUjtPp4WG/V5NnaqbgTslK9jqqdyxzfiCQABDMn5JRi/rcr7fm8gz2kTMRh6ucCF
         NMf7Z1l76nUP5LMQ9snTqx76Xnf5MzNqz+3I/EPhweXybwmxl1lkJVHl5+fp2cRXNYgR
         pujPGNBM4cRMdcqOEO6Mzj1QU8aVPfX90IuOrHka9QBTG3gNZMl7q4+JNuxEXDT+z3Vx
         4K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463985; x=1783068785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=;
        b=YbBc33gEi2V/sJaPUB6FJiEmrGdLYP/yJ/RngqA7OIP7LEroiu3wEcWprniyMtB89E
         YDMTQt3RmG1CkzhBrtzZ09qxdeaawjq94VUZCY8XUH7jMMXSjiZoOXIVGU4PsvphNWtr
         /Az8HXLgjvm5v8pOXS/kv0vx5gehaPhN05lCWmpSCQklTXBV3vzw9kNtbEL/go0O53fm
         FZ9r9/t8Rh1PS1KY1YTHXU+h1PpZOcWx4EQLSC9/+I+u+Nym/tzh3pkrWGlvU+BWG+hJ
         4fsnldNJoN/vVPjGspU7j9/D16ePAxK0FWZ3UCqSE01sBfgzfbBDb7+wgklkLhLIEJBH
         Mjcg==
X-Gm-Message-State: AOJu0Yz2+sw2c26kH+ZOgVcq9OocEtdG/mR971+9rYDZ5mGY5fnvuHQ/
	W2zrj7MzCEHG+P/A4jsMYRvwFHGu0n1c7XG7hb4R6Onqv27kARPmY7Q7csYniKOUY3PF6Uexddo
	X8/FazCH19aN3gtXcJDAvbqkyk8A41+3qwRV7LSyap4Cki/w7IiXNEu3P5gAuKeQCmZkaLEs=
X-Gm-Gg: AfdE7cm0/Y6jKbkAvfDjn2UzCGlluu0axSDqkbv8YqclbWLY1qSkvJQFqyXso/Qremc
	2krr0aF+QJkATVu+BPuLqjGMwgONAgSbiMCuYpPq1Kn9GPJzI4x63lKmJFnTzueMQOwVAUGXuM6
	PRoWpDOW8gFqKZdMWfimCzbwC339oT6zw1zSTtT6zyXKfDfT4bHLjHKd/EftibvUG266tp52FEj
	XhPvewn5Xv9E5R5Y3Ehe4HFk6EOb15d6ZLPG/zrld8BGDmC0iTfH5tNEMHnjq4JuJFDtDJqCn5g
	w40q4s7QZCjKxGqxGETbU6qAD47V5xMvluil/KyD+sM8MLxMCM7q9KVGolEdPHYN5oJ1ahJVbmG
	AfDwCIytfsv6ChBdq9HCzEAHPXn48Rl+s5NcGvtqCacU2g39kHiyLpvi5M02Zxnwd7QcmB32PcT
	wPH1AOsEfYBBqYb/DMxdIH2/AEO+dsRkUXDj0m
X-Received: by 2002:a05:7300:3b2c:b0:30c:50cd:840c with SMTP id 5a478bee46e88-30c84db3032mr6385296eec.11.1782463985038;
        Fri, 26 Jun 2026 01:53:05 -0700 (PDT)
X-Received: by 2002:a05:7300:3b2c:b0:30c:50cd:840c with SMTP id 5a478bee46e88-30c84db3032mr6385276eec.11.1782463984484;
        Fri, 26 Jun 2026 01:53:04 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm17384044eec.28.2026.06.26.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:53:04 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next v2 3/3] wifi: ath12k: Show per-radio center freq in dp stats
Date: Fri, 26 Jun 2026 14:22:53 +0530
Message-Id: <20260626085253.3927269-4-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfXwMIx5f/dwDjO
 YUHLGF6uHsCVVY5Wvvqbbx2IDKNMcf5MAn34zt/LXwAPFy+dDH7P1BlLC7EOp9lBLJFS2BzoYzp
 a8bE3W2RGPABQhyyGKn3ukxCQpLDnQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX8l8bUuI6OAF2
 7qlnwtFTLRPTgDKJqc3Th9d5UcQWg1QL4N3H+EFc8ApZD53/6B/Y8wFGV6CZa/VBhXl/ciMwE6h
 bblDY8q7fFEaouY+h/HGiBpI0kR0igbx1d0cgjA3d4z05u/IYGKvr///4ULwU5pK6FOxYS1vRNW
 kxp9r1BDr06bzBiFl7stEQzyrxRlHRxAc7jSRIf/1TuounY5b2+IL/SCRGKbANQDe1SABobvSP7
 MHFzNfjQDfNMZRzHNzDoG1zREXv/PTZ6QLUBkB+RwtzRss4lFOWWTDgDFNncTcHbBYW68cdiCA9
 hZlWXXjw/TnK1CQDqNdkJrE0TWn6V/mDSs0kROlkMVAGacdQpr3G+ZqGxOzyrHUHiEyZwvV2A4+
 Na1dCxC2EduQ7ri36QMBvD6xEJVFAV4JLgNrvCAyDjjsgXdGC9vU5ZNoaRnkFDeJHP8xlcnLShq
 GGnG6nEy/H5Wy0kBvfQ==
X-Proofpoint-GUID: nGRrgys1pjqqEoWAPcaYrPQ-tt-vS37F
X-Proofpoint-ORIG-GUID: nGRrgys1pjqqEoWAPcaYrPQ-tt-vS37F
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e3df2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JlNIVIk9kHasGwjauWMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_015307_230804_B99475D3 
X-CRM114-Status: GOOD (  13.56  )
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

Currently, the frequency on which each radio is operating
is not available in device_dp_stats. This information is
helpful in debugging the channel-specific throughput and
is available with iw/nl80211 dump.

Extend the device_dp_stats dump to display the center
frequency in the existing per-radio loop.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 57c213111259..d54995b7adb2 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1031,6 +1031,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
 	int len = 0, i, j, ret;
 	struct ath12k *ar;
+	u32 center_freq;
 	const int size = 4096;
 	static const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
 		[HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR] = "Overflow",
@@ -1164,6 +1165,12 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ath12k_mac_get_ar_by_pdev_id(ab, DP_SW2HW_MACID(i));
 		if (ar) {
+			spin_lock_bh(&ar->data_lock);
+			center_freq = ar->rx_channel ? ar->rx_channel->center_freq : 0;
+			spin_unlock_bh(&ar->data_lock);
+			len += scnprintf(buf + len, size - len,
+					 "\nradio%d center_freq: %u\n",
+					 i, center_freq);
 			len += scnprintf(buf + len, size - len,
 					"\nradio%d tx_pending: %u\n", i,
 					atomic_read(&ar->dp.num_tx_pending));
-- 
2.34.1


