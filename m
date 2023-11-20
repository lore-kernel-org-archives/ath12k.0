Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BCAC54FB9
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9Wfl7ZXpY0SBdy4XF1XJVWLCGc5Pk4aexSc7viRxa4=; b=jJcZVBmWw131b7
	JxHRgIRdTqTAjx3x+FerAi8LZNYEHQyjy9EYFNtcfkxLusKJ++uZvWuBSQnsYoOMroOB8Dz5jVVpv
	esXQNcIx5q48nTuwFr/N31B0v3Bv6JV0ZJqf62PB2GYf80s5cvq7S3+y6Fjgq0s1sgaP6kOvkWYSa
	ctXLCbzwNcnEUOUcGBMrYSBVCyqazeEueevin5rMarMk5awGIPNq6cgK4qW9kSG8BsOYi2HcGAwg3
	8rb0ZwUd1NYvFMkZEtf06OrWvB76nAAsyiVUMpJ2dTmadWUlqpiCFsCGq+/EjlaAghWun7BpuCvvj
	V63d34x4+u2HthzNJs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51KD-00BkgM-38
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 10:16:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51K6-00BkdB-1L
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 10:16:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK9cnR9029629;
	Mon, 20 Nov 2023 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=juEHgcilkt5VcNKtK9H4syfLVfpYZGuEprhEkgp/0Ak=;
 b=aJBxvm+ZAhOD/+29eGJ9yVd+0IwwduLfB4x4pjltnByZeNBeO/QpDgETe8l0gLir4aks
 hv91cGSgDc3941Jpw3aAsDNaKHiw3uSp6HKeTybhVibiTycyicnU22KMCph9K0HO2fo9
 qCeSjYALeAlPPJ+KAmZYgso/ifM6rZk++0zlZqfA1934AKRwMImsK+YO3VkrqHeF0gbN
 szkAowCu/QwLVMK8vV5v6dnwB0zYXgAhUdV2kjvxtCEy7PrEl+UNZt3p/4ZP3V16lFwC
 k63d3Q+f/k7cw+p1ITIhZDE6qC/rpyE2/DFw2eSNhU6uZ58eSj9xhYPlNrSUxCwN0XCv OQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uem9ebp4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAG8Ww032014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:08 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 02:16:06 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 7/7] wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector
Date: Mon, 20 Nov 2023 18:15:43 +0800
Message-ID: <20231120101543.4369-8-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120101543.4369-1-quic_kangyang@quicinc.com>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pVPYu_4Ce5s-k8FE_XZWv5VK2egbE6b1
X-Proofpoint-GUID: pVPYu_4Ce5s-k8FE_XZWv5VK2egbE6b1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_07,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021610_589918_82C10A5E 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

With VT-d disabled on Intel platform, ath12k gets only one MSI
vector. In that case, ath12k does not free IRQ when doing suspend,
hence the kernel has to migrate it to CPU0 (if it was affine to
other CPUs) and allocates a new MSI vector. However, ath12k has
no chance to reconfig it to HW srngs during this phase, thus
ath12k fails to resume.

This issue can be fixed by setting IRQ affinity to CPU0 before
request_irq is called. With such affinity, migration will not
happen and thus the vector keeps unchanged during suspend/resume.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 3850331438de..77074443ce00 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -617,6 +617,15 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
+					    const struct cpumask *m)
+{
+	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return 0;
+
+	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+}
+
 static int ath12k_pci_config_irq(struct ath12k_base *ab)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
@@ -1359,10 +1368,16 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_pci_msi_free;
 
+	ret = ath12k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
+	if (ret) {
+		ath12k_err(ab, "failed to set irq affinity %d\n", ret);
+		goto err_pci_msi_free;
+	}
+
 	ret = ath12k_mhi_register(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to register mhi: %d\n", ret);
-		goto err_pci_msi_free;
+		goto err_irq_affinity_cleanup;
 	}
 
 	ret = ath12k_hal_srng_init(ab);
@@ -1416,6 +1431,9 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 err_pci_msi_free:
 	ath12k_pci_msi_free(ab_pci);
 
+err_irq_affinity_cleanup:
+	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 err_pci_free_region:
 	ath12k_pci_free_region(ab_pci);
 
@@ -1430,6 +1448,8 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	struct ath12k_base *ab = pci_get_drvdata(pdev);
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
+	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath12k_pci_power_down(ab);
 		ath12k_qmi_deinit_service(ab);
@@ -1456,7 +1476,9 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 static void ath12k_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ath12k_base *ab = pci_get_drvdata(pdev);
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
+	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
 	ath12k_pci_power_down(ab);
 }
 
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
