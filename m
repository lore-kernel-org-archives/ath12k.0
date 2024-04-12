Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E3EC04FF9
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6ZCaryHXYWRz0kI2Soi9uN3qEh+qXHERBjZgruRwaA=; b=xXjM4myJ7lwWa4d5MY9CJ27wgl
	LNf0A5lgk7wr2e/a+iYRtHKxD4Y3VRGQFSJ4HA5xB6kubqwQFoBGk9R87BbOD1+jJd21FMMnTPR/L
	584aDSKQmNjGp69m1QRGRj3cmwczCh3KoxzcoizkEtoC3Mbxs5vTb34eXgm7f9nK2IdOfRf18eRHP
	/JkMRQPSbRd6yqtozJ9qA9jfghO13aIswgJT0C1wqIMC9UOj019afp6ZCEijX868Q+cznl49UIXMv
	lclJzn5NCiipKbzjvXfdevIkJKlM/ACOUvKPil1N/dQVvdY8tXkf/IhAFv1b4hkOJh9UHWANerQh4
	40QwkARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3l-0000000FV5h-3ZaB
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3g-0000000FV1x-2azb
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C4bFHE014112;
	Fri, 12 Apr 2024 06:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=P6ZCaryHXYWRz0kI2Soi9uN3qEh+qXHERBjZgruRwaA=; b=H3
	aaubLhlFR2czmV6J63lEP3vnw8QIHzwRwcYfHou/EeSTq8iqg2YAtDHlnRTZ/a1e
	qP6N/4/iRBk8dWP5Va2GxmJ22lTwe21m6yV9aSAH/8COGFwgf/2VHS/X3ZySQ6v5
	za02jX2BGc8s8aHOF5yeSzZ3LRdoPy7G+OKhTfGp61FPu0JTeTSFDNBibekAB5Cz
	c3XdgGbU10Iv0M+SWaZ7bz0rdStTIY//E6boN/3pEwUvGdrjWA6ioMu64xz+MxPP
	PB8oycNo5lmQtaLqtks0G2vna8sSC4S4Nf/HFYA9cfnlSQ7stiSZzJ+GFOVYDxmx
	A+Y0AjwxyrAwzRmAc7Mg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xewr38777-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66heW019961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:43 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:42 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 05/10] wifi: ath12k: decrease MHI channel buffer length to 8KB
Date: Fri, 12 Apr 2024 14:06:15 +0800
Message-ID: <20240412060620.27519-6-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CSdlWmg5uvzq1-PjCme4fh1hIEV6kw2O
X-Proofpoint-GUID: CSdlWmg5uvzq1-PjCme4fh1hIEV6kw2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=851 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230644_829890_363DE623 
X-CRM114-Status: GOOD (  14.00  )
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

Currently buf_len field of ath12k_mhi_config_wcn7850 is assigned
with 0, making MHI use a default size, 64KB, to allocate channel
buffers. This is likely to fail in some scenarios where system
memory is highly fragmented and memory compaction or reclaim is
not allowed.

For now we haven't get any failure report on this in ath12k, but
there indeed is one such case in ath11k [1].

Actually those buffers are used only by QMI target -> host communication.
And for WCN7850, the largest packet size for that is less than 6KB. So
change buf_len field to 8KB, which results in order 1 allocation if page
size is 4KB. In this way, we can at least save some memory, and as well
as decrease the possibility of allocation failure in those scenarios.

[1] https://lore.kernel.org/ath11k/96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz/

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 403691355abf..d6083a187021 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -140,7 +140,7 @@ const struct mhi_controller_config ath12k_mhi_config_wcn7850 = {
 	.max_channels = 128,
 	.timeout_ms = 2000,
 	.use_bounce_buf = false,
-	.buf_len = 0,
+	.buf_len = 8192,
 	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_wcn7850),
 	.ch_cfg = ath12k_mhi_channels_wcn7850,
 	.num_events = ARRAY_SIZE(ath12k_mhi_events_wcn7850),
-- 
2.25.1


