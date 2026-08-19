Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECCBC5DF86
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY2wFWD6pbnQuF7Prexj5leeCcAk2N8W0fe90m+0EAI=; b=SsMyL42DYDF4TXd/71FyayYYu0
	o2wfUwIIwFyq/hghdxlmGX2TK22hHHKA+3IFTwSPaSNDA9N4tQqrEfhRXjTlDusQRF00rBshxxQic
	4j7Rlr/CLIUL11jKEWaMUd+VerMD+xHS1tDmyJKRb85+wJbetZXyRJAEYoCMrTnAtqggjRVV5l94Y
	CH1wQE4MCdZ1yzqSG28Ui3w04Lnd4K8NVogchc7J4Kr+v2HmXRLSUkybAKMfiyXuyJa5YnqFSfGJd
	WJz2ZKtSvZ9TcEgNrSKhLGRNb33rJOIXoxrWo/aMW+2qbN42j08EI8Ppx/qSeLIr69nEmn3BsIXoV
	SP4cCPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe43-00000009bYV-1FWM;
	Wed, 19 Aug 2026 11:02:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe40-00000009bXJ-2vFE
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 11:02:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8GOu3754796
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BY2wFWD6pbn
	QuF7Prexj5leeCcAk2N8W0fe90m+0EAI=; b=n2gSJyq8r4kL3kLIvuTF7zOi73Y
	hhRAxUrXFwC0LTNTym4geCx+4riZyXJzAFC4krpmV3IiWwjsVL1+8MASCRp/QUBJ
	TP7SEqj6n29mGydve1BogWCOO2xFkAUBowlkrhzSlewkSrJPlSYQtEU8odbBDmXh
	acZzdkL5LCxgKmlWf0VxdsoRp3kDbOGJfif6DcKMXL18DL2Iy5UshsH3ALvZCwOU
	0iTsHINm7IlhaTcYRHbvchWV/AzJCeqNOkctYhfNhPA9Mw9/fcxTi9kWnXXEINXu
	k2P5XE7S3xvam3FKYUh2mL/7pi9AzK1dBG9M6Z4We7aFmeVnKwW6E8sjcuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffjru9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:02:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso1392822a91.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787137351; x=1787742151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY2wFWD6pbnQuF7Prexj5leeCcAk2N8W0fe90m+0EAI=;
        b=TXB/tm+L6ka/0BWxKtpe7GkHRpOO69WbF9fjNSWgpNsX+mbdPJpwG5U+gWKb9Z6EQ+
         WI4AdUqhAM/ABAkeXYnalByYTtOyozT2auFuaTtsZvjUCHnwUDdi8W2/pBhRmRi/OL5T
         vGH4JbEcukWKESFf0zM565IaJZi/C1LU/MmgcGAU1Z/8LwZGJYSI7IQmsKYM4oeRo7Dl
         sqRVr2NRT5nZR5udnh7ijt3gGi0RKhSxWPppIp7LKKUznfAoqqDmxmVWwcIGewsskiRq
         uKGqcchh1IQrCwH8Oh3GB/r3BxcMlBlOtswAwG7luM4UGOkrPmQ2JNhXsAEg7WevVwy+
         AzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137351; x=1787742151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY2wFWD6pbnQuF7Prexj5leeCcAk2N8W0fe90m+0EAI=;
        b=nNI535pjVX+L2v2m/0SvdNUdx8RBKBUrHA6XW2l2bkmBZVFd7HsgNpbjAhTPymKbIq
         Cxc0/J7D2bsTCY87B1I8xb7HW95vMfD0swn5axolN008RhU+zN9UXZmu/cZA4bTgVMPV
         iGRosl5+Rb1/u+wl56l8pBSb3nVOAw4TFwEOyL+PqxgKROHFGtQ9oVrmJEvt/psbRAhl
         cRjl8EgP02Ytp4okBefN8+c9bzsJIkLjA7EOWzcDRx7uyZIfsohKRlnpfsz6q0IAHEFq
         SAHq5C7xDK4SqArVwjJNlI2ysuHZ9Pg8y05FLEvc9hGw2CSusvNpfmime0tEoAwSAsfv
         Y5sw==
X-Gm-Message-State: AFuF++mQWP113UMAfwFoFBNdXyS2TXli/D8ouQV+lMvpYsEhJVXyGM7R
	aSXt7M/t2C977/ba3RglDhUg1T6mwva0WgWxW3SLEBHlHqEt8aQ24nSSBa1tbxHJZ6J7ewxSYDe
	TB0Ypfw3Dk8o7NJT251WMxfkCaWU9WwdpahkFaf8apk4U5B1BdGv8xPlqY4S0weCEgrALWwTd
X-Gm-Gg: AR+sD12z45dorqRurmwDUMYOIwm2PeLeXK4W09H+XGBuFyG2SV3GehNjePWBnnFP543
	0NVhyY+LMgc826juLuxyOg3eWozskTyzIidcwCNOfKGdkZBRxlCBIk6h//hES5yHSs/GKrXLWcQ
	g7occ9DFGqywbRldeAj9N4UenhVHC+Mli2IBMBTIRjIje99/THJszyZumr2dqA2zk4H9v9OMDiY
	/Z4D27fZWa8jAAI/dN/XprcRQeY5n2pOy4mvxlb3ee9DkR2na68DCgY0TfprFhTc0ob9Aa3flHu
	wHGglxGQApMmvhQG3h57Rui7tuLUon4MDMhWEuYA5iqjmOScMme61/HC2SRhRhNnXWDxhwTO/2/
	CsNCcCEj0WeVXy9HdSut4ZBOwxkHV380rwK2dMVZQA+dKXN9HIdRtKV0Ly5VXE0aXnOdp0gxNhr
	PrFQgxRcDNuxcCAXST0S9Fun4=
X-Received: by 2002:a17:90b:3a45:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39580aa1085mr7699308a91.6.1787137350303;
        Wed, 19 Aug 2026 04:02:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3a45:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39580aa1085mr7699111a91.6.1787137349714;
        Wed, 19 Aug 2026 04:02:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb30541sm2223640a91.13.2026.08.19.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:02:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: Free allocated external IRQs on request_irq() failure
Date: Wed, 19 Aug 2026 16:32:15 +0530
Message-Id: <20260819110215.2485514-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfX7dM2Itcx4+vj
 XlXaCS9aMGHmaqdrUIR9DBneu3aws2FwAxio0WRjfnzOY2OnLNxAO+jeQBvw17bwd28T2l1j6ri
 0uBjK0bWFppsaNPUa2vnGYR1yGnjPjo=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a858d47 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tecUyYAXEqPB-KyWC5QA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ir2ezyaXVsWWYDuRTAgnb1XyaU6B-I0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NSBTYWx0ZWRfXwf3lLIySzMBC
 gvzB/Nk3UeTBjjA94r6Nkbe10ViWvDShsgZDOiR7m4PuN6T/1XT+ZTYWCjk+UyX4EQB/ULv4s9z
 fIusXEDa2YIb7bU3lvQ3Q3VxKkYQLYzhk+m+OF5RMX5GwHTkm0h3rV3/wUzU29ktmoM7HNOf9xS
 XFGV+Rv2ysqeRxEkdF6bvAzfarbVOHfZrKwUQvi9BdFnO3odqDmgWPLKcNfLCpy7iYd7UWn14PR
 bJ90flm7XBnawxdmmzlV9rx7fDozC+4lQLx/wYcdPD1XGkYJ63aLO0Caa+wPAIhtVVu0Qn9PIk3
 DysDbxmITYNYmuupKew6BnxNgvkgzYXEulQK5ImTvwnU3udf2ZnM//4oMksiCWZeRqS8ts2kDiV
 d8j8yVd14Zp/5GOK0s9yw1+eQ72ZerMX9j33M43DaQDQ/FRBhiciZ4xC/SRYEz678ywpmnj5ZcJ
 LFOo6V9ZHjPxXVc9Q+Q==
X-Proofpoint-GUID: ir2ezyaXVsWWYDuRTAgnb1XyaU6B-I0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040232_932275_B6824206 
X-CRM114-Status: GOOD (  15.64  )
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

When external IRQ configuration fails, the driver does not release all
IRQs that were successfully requested before the failure. This can leak
IRQ resources during probe failure.

Free previously requested external IRQs when external IRQ configuration
fails.

Also remove the NAPI instance with netif_napi_del() before freeing the
associated netdev to properly clean up the NAPI resources.

Store the IRQ number only after request_irq() succeeds to avoid recording
an IRQ that was not successfully requested.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 1525e6866cf4..af0e882fd0b5 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -326,11 +326,11 @@ static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
 	}
 }
 
-static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
+static void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 {
 	int i, j;
 
-	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
+	for (i = 0; i < num_ext_irq_grp; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		for (j = 0; j < irq_grp->num_irq; j++)
@@ -344,7 +344,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 static void ath12k_pci_free_irq(struct ath12k_base *ab)
 {
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
-	ath12k_pci_free_ext_irq(ab);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 }
 
 static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
@@ -600,8 +600,6 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 
 			irq = ath12k_pci_get_msi_irq(ab->dev, vector);
 
-			ab->irq_num[irq_idx] = irq;
-
 			ath12k_dbg(ab, ATH12K_DBG_PCI,
 				   "irq:%d group:%d\n", irq, i);
 
@@ -612,22 +610,24 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 			if (ret) {
 				ath12k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
-				goto fail_request;
+
+				for (n = 0; n < j; n++)
+					free_irq(ab->irq_num[irq_grp->irqs[n]], irq_grp);
+
+				netif_napi_del(&ab->ext_irq_grp[i].napi);
+				free_netdev(ab->ext_irq_grp[i].napi_ndev);
+				goto fail_allocate;
 			}
+
+			ab->irq_num[irq_idx] = irq;
 		}
 		ath12k_pci_ext_grp_disable(irq_grp);
 	}
 
 	return 0;
 
-fail_request:
-	/* i ->napi_ndev was properly allocated. Free it also */
-	i += 1;
 fail_allocate:
-	for (n = 0; n < i; n++) {
-		irq_grp = &ab->ext_irq_grp[n];
-		free_netdev(irq_grp->napi_ndev);
-	}
+	ath12k_pci_free_ext_irq(ab, i);
 	return ret;
 }
 
-- 
2.34.1


