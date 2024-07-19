Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4959EC3DA59
	for <ath12k@archiver.kernel.org>; Fri, 19 Jul 2024 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWnKe6cSlpMEboJMgrFxqlVNMH1ku2P2gQnO/eMy6pg=; b=iTXvIwHHj9uMIU2xCASxPvZJE4
	yQWf0DTxUujvtsvNm5nGl+uOyBIKrwMVKdr4onj7C1yTc2akbj3sIZrnnMbiJ5TfoXdYoonTyYtFg
	qrkyX9bR208f2EclQa4pdNpVf8kdq6Ff46uKU81aNTFnb7TVwLS2rPEPP72Xjvd3IV52tdDb9qPWL
	q4lIbtxKwD6TtoaSSrgO6gaOa1ied3qj/nEih2SvHBJEspbKJf4oKqExsGw1wIwv9Qt5Gcu6guotf
	wawIu+lDocBNlkyYqyZXZvlJihiY3Y+Zv48FdYYXtFbzUAerLh4XGNJmTF9e2Zks8VR74+GIUco6e
	MJ+E0VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUx77-000000040k6-3vBf
	for ath12k@archiver.kernel.org;
	Fri, 19 Jul 2024 23:34:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUx75-000000040jY-0T92
	for ath12k@lists.infradead.org;
	Fri, 19 Jul 2024 23:34:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JLDWXo015560;
	Fri, 19 Jul 2024 23:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWnKe6cSlpMEboJMgrFxqlVNMH1ku2P2gQnO/eMy6pg=; b=RTP9NDlR6ILfqJB5
	qtYjW0ZK7gsXZ7nXODGgi7vlvXQUP51boljo7IMbZfI7av2QA9Hw9Uf0GkOc03iK
	ICTu5WweEBkMFAN1Yi/hsjv7/DJ8B4pcCvWRgvWMySJm8ARkPIfte2y2USYYuD42
	zktgZznzR1XfghIMBNEvYFl1TnARkugyPLxtEd6lEuxWXxCs0k7yW0/7T52i5sPf
	8gTEbZkx0HDT/zQKvxv7dxYCaBD/jQ867euwOHcGMFjr7IdHeDrkUZ/WNUekK4Za
	kjBgdRWe2oh5CK+iZPxXjxrS1ofRsjE+FGpwmtP0NC+goTRvIAAWeywug67EC0b5
	4+7j6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe2utnnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:34:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JNY8Dt022776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:34:08 GMT
Received: from [10.48.244.127] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 16:34:08 -0700
Message-ID: <7e656bae-fb88-47b7-ab5e-41dc0c7a7f0d@quicinc.com>
Date: Fri, 19 Jul 2024 16:34:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Dump PDEV transmit rate HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240718064659.109893-1-quic_lingbok@quicinc.com>
 <20240718064659.109893-2-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240718064659.109893-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -lLS4ai_b5pliRtpeocwtCH4ZE6N3VSC
X-Proofpoint-GUID: -lLS4ai_b5pliRtpeocwtCH4ZE6N3VSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=753 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_163411_196874_9B7ABF9E 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

On 7/17/2024 11:46 PM, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> 
> Sample output:
> -------------------------
> echo 9 > /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats
> HTT_TX_PDEV_RATE_STATS_TLV:
> mac_id = 0
> tx_ldpc = 1088
> ac_mu_mimo_tx_ldpc = 0
> ax_mu_mimo_tx_ldpc = 0
> ofdma_tx_ldpc = 0
> rts_cnt = 941
> rts_success = 180
> ack_rssi = 4294967168
> Legacy CCK Rates: 1 Mbps: 830, 2 Mbps: 0, 5.5 Mbps: 0, 12 Mbps: 0
> Legacy OFDM Rates: 6 Mbps: 942, 9 Mbps: 0, 12 Mbps: 0, 18 Mbps: 0
>                    24 Mbps: 0, 36 Mbps: 0, 48 Mbps: 0, 54 Mbps: 0
> HE LTF: 1x: 0, 2x: 957, 4x: 132
> tx_mcs =  0:342, 1:260, 2:171, 3:148, 4:31, 5:34, 6:93, 7:10, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> ax_mu_mimo_tx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ofdma_tx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_nss = 1:754, 2:335, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> ac_mu_mimo_tx_nss = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> ax_mu_mimo_tx_nss = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> ofdma_tx_nss = 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> tx_bw =  0:1089, 1:0, 2:0, 3:0, 4:0
> tx_stbc =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_gi[0] = 0:210, 1:260, 2:171, 3:148, 4:31, 5:34, 6:93, 7:10, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_gi[1] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_gi[2] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_gi[3] = 0:132, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ac_mu_mimo_tx_gi[0] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ac_mu_mimo_tx_gi[1] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ac_mu_mimo_tx_gi[2] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ac_mu_mimo_tx_gi[3] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ax_mu_mimo_tx_gi[0] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ax_mu_mimo_tx_gi[1] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ax_mu_mimo_tx_gi[2] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ax_mu_mimo_tx_gi[3] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ofdma_tx_gi[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ofdma_tx_gi[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ofdma_tx_gi[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ofdma_tx_gi[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_su_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> tx_mu_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ac_mu_mimo_tx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ac_mu_mimo_tx_bw =  0:0, 1:0, 2:0, 3:0
> ax_mu_mimo_tx_bw =  0:0, 1:0, 2:0, 3:0
> ofdma_tx_bw =  0:0, 1:0, 2:0, 3:0
> tx_pream =  0:942, 1:830, 2:0, 3:0, 4:1850, 5:0, 6:0
> tx_dcm =  0:131, 1:0, 2:0, 3:0, 4:0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



