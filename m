Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A010C0015E
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 22:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VWQF8a4IYpG+laSWhbxjEGHLRQNBV4l0/vqQbmu0Uo=; b=FfEIVAmlW6tprZ
	0/rT0W41eOMEewCV8TqGITwKlZ0LXmo2cJ0tUWpU1Vp+BnKE7DDDOaarzwmDm/Ss7f24c8tGlmT/f
	jMfH/xHLe6oC8/tut3cQDpBP6YEa7XcgEt4fAGNLZpT+Kocsp8HD1PvcuArl+WumUG5wi6qoOmXDr
	iJuLRBqbhL7tEPPRVAFUm1U/QEileE7LpjS7FBTQ9M4VH8JeN3i0MryBR6DrKIqYkyU3uzDunNqWf
	6yWEXmqdJFnWMj+SH3I5ZijB2HJ8WH2RmQXIdYvRtjxdoWWKZfrp3WS6HDf5+qBajVWVlM6KrqoIE
	OHWhXUmbjBZqnKk5SeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQiJ-008eoX-06
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 22:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQiG-008eoG-2s
	for ath12k@bombadil.infradead.org;
	Tue, 25 Jul 2023 22:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TpLka8jfmSqR2Nfou7svpWAMKL1ZiYnQ2PjwGfGTVK0=; b=D+1HG+aaRoESOeC6MAsOkZ76Id
	c+6d5eozQCYFpqD4diGO0pV9jN9EkYiS4JAlJ2wiTWIbTiTMfMIowggaPwm0KtI9rdD+YXTid+tCq
	XTrWGOnhFimIIJJEgy0OAqbPXj9DSS99/NWiert9pYjCo3+EWvem+Iouf8qw6julN1JoLp/DddFdn
	5OTuOyPXmgwuV/vFHcakF9WrqEOnjVcMhoKD3G90QFunAOo/tYwm8PG4J8AfQeOi7JRFTs2fE350V
	OATLdr+cQ1tdYt9aBwAkuefYxl6cHAs0yuOsS1WAj2zxTpGfNbc6K6d9jWMMEZ2Bmnk4J/Wg8+MYH
	dzPX7dCw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQi7-004NLF-32
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 22:41:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PLLU3q007935;
	Tue, 25 Jul 2023 22:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=TpLka8jfmSqR2Nfou7svpWAMKL1ZiYnQ2PjwGfGTVK0=;
 b=Ue4rggbreEBkikCSPj86/clMY5DT8Qu7l+MH1D2qYiPwMYPMoJyzabBF6Qb+wJLtFU3n
 HI8ukHr3JYXeJ7T2JiIT7c2YVWkWAvDz1vQu/hn2C7gv1lS66ebgrbJ0vTk+xPGkgUw5
 HuzeO25fd9Nc/CymqooDftXHM6CfoXZQCuhy/j20p+y2vdUCjSsCiRbUPbog5anYdN7+
 qxWf5aNsMjK3Qp9h3twiC7tcNqcprElk1qEvfq1HhQfCaKuYjtiE3oPl9fCgCd8lqrHa
 rKfPX65SjR6knVK2dPZRj0YEbQ0gjFEYO55BcoFrGmhxaby0vrZVkidGSG3CFKjKUgt1 Jw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2fms1395-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:49 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PMemOb028377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:48 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 15:40:48 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v5 08/11] wifi: ath12k: peer assoc for 320 MHz
Date: Tue, 25 Jul 2023 15:40:31 -0700
Message-ID: <20230725224034.14045-9-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230725224034.14045-1-quic_alokad@quicinc.com>
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ysjvr10GIA4s3oS02Y_1JnKeZtNATw_F
X-Proofpoint-ORIG-GUID: Ysjvr10GIA4s3oS02Y_1JnKeZtNATw_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_234057_916495_A8BA8429 
X-CRM114-Status: GOOD (  15.08  )
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

Add required peer association definitions and processing if the
bandwidth is 320 MHz.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu<quic_pradeepc@quicinc.com>
---
v5: No change from v4.
v4: No change from v3.
v3: No change from v2.
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/wmi.c | 2 ++
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index db1ff376319e..b0722050206d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1816,6 +1816,8 @@ static void ath12k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 			cmd->peer_flags |= cpu_to_le32(WMI_PEER_80MHZ);
 		if (arg->bw_160)
 			cmd->peer_flags |= cpu_to_le32(WMI_PEER_160MHZ);
+		if (arg->bw_320)
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_EXT_320MHZ);
 
 		/* Typically if STBC is enabled for VHT it should be enabled
 		 * for HT as well
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 780d589268b0..764ca4947281 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1169,6 +1169,7 @@ enum wmi_tlv_peer_flags {
 
 enum wmi_tlv_peer_flags_ext {
 	WMI_PEER_EXT_EHT = BIT(0),
+	WMI_PEER_EXT_320MHZ = BIT(1),
 };
 
 /** Enum list of TLV Tags for each parameter structure type. */
@@ -3553,6 +3554,7 @@ struct ath12k_wmi_peer_assoc_arg {
 	bool bw_40;
 	bool bw_80;
 	bool bw_160;
+	bool bw_320;
 	bool stbc_flag;
 	bool ldpc_flag;
 	bool static_mimops_flag;
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
