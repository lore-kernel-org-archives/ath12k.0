Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD517C83F2C
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+O0cEu0l1b1TWdx5nX7FQArJDeQb9Gz9MFskVG9ZBJI=; b=bKKPzeC/jr2V2O
	4dbYpAvhMNM6VXvnSxjO+BGc5Dps83k341lGm8sRdsI1ZkQ6yuQ07CX+jeviSLpjck9Jv9OTTZ+ch
	0e8k7Ypp/ZEVP7cDXmf1mGmx8YsuAin4hdPHE+ZQ6t9TagPJ2tCNkZLYTsoaiSNB+sUFvxibBSiF5
	AlU5Se1PTbG5NLFaFRMePHIzffI98+nG5R+qPe9gkuNSeJITV8XzdXqe2CPr7+mHxc5EFHDoxXeVQ
	8wICk1P2Hdt+1B4s9O9Gf3RC1YsVMex9xLhXD1BD3VEiqWn9kjwnWh3ZYJp6Ix2IuffFiIV9RPvfM
	Mrv25a6/c32Hb0KZAEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTfu-005rP5-1i
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 10:52:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTfr-005rOe-0t
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 10:52:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3859GF5e005148;
	Tue, 5 Sep 2023 10:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=2pNZH/lbhcbUvWZ6AMgseEIhZt7WXeEeeZwUe1jAkTQ=;
 b=TAtS2pHb1RJu0lTp5ImWGN3wLPnShSPH/7FBmgApkB5qGPo/yaQc2G9RS8OkCWkCI/Hi
 nHNFJrhDeSBiBB3anaPtm0t+S7bmHtQEa6tMSjmaKDkGDIZf3slq5I8N6BbQn9HNC144
 RCdUHEjAaAlUe/LXjn2Kt6asMPiaRKSFA+dvlVnvCBC6dhslFhPilkx/X/n4xkuWcpP/
 wavBztnsCjl3tpnUs5ZRNxFELnBJae0TKZ7rb/5b8NuGkypo10/xDWYKhreV4+DC3LDw
 mHBXd6tJxcwdIa04arKg7dtV1BPhyzNW+Mapvzkzhnr/PhCSNatKBGObCzff8+WyIXaW UQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swtevgw8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 10:52:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385AqiDv020736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 10:52:44 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 5 Sep 2023 03:52:42 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix recovery fail while firmware crash when doing channel switch
Date: Tue, 5 Sep 2023 06:52:29 -0400
Message-ID: <20230905105229.10090-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Si-wOsjK2-kKxSO7sHBZqjvOiIffCWoN
X-Proofpoint-ORIG-GUID: Si-wOsjK2-kKxSO7sHBZqjvOiIffCWoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_035247_449697_6D193C78 
X-CRM114-Status: GOOD (  14.75  )
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

When firmware crashed while channel switch running, recovery starts in
ath12k. Then ieee80211_sta_connection_lost() will be called by function
ieee80211_restart_work() in mac80211. And then many WMI command timeout
because firmware is crashed. Each WMI command cost 3 seconds, then the
total time will be large and leads recovery fail.

Hence change to set value ATH12K_FLAG_CRASH_FLUSH early and then
ath12k_wmi_cmd_send() will not wait 3 seconds, then recovery will be
started quickly and success.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3df8059d5512..56be7298ac86 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -685,6 +685,9 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 	ab->stats.fw_crash_counter++;
 	spin_unlock_bh(&ab->base_lock);
 
+	if (ab->is_reset)
+		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;

base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
