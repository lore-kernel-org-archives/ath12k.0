Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A66D59F7C
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4o4oDhBwaou2FC37R3e+JEtwsqqNeCqd2aFyl1njSVA=; b=XOxTwU1U7hm0VQhW5elQvLG8Qh
	Ex9Zliq+PbcQULtgawtzdPJHXOKOVrFF67Rnm4fhIxzZF3EaxEyDKM2mp6LXJCkDbHEeaQ7RJD/KW
	JsFQgqtcUsaSFUHQUj3a+Yp4Q8WoWIa3UtJRzxBcJz/knj+UXaIbTE2n4i88rBuEu/Q9fAp7rg3vo
	JQsXL35TmD0xGEAv2J5Jk5rVoAtRwAlLVFF7/RfrDZOqjpN49XNrQyjKzc3vKn3pWhElij9um6v0i
	ep0FDPC1E4e0A5Fcuz8dnYuE0FTaq3FOHvXND1JSzCmJ+hVb+rw/c8HgIpcIDhoadjESlz0cytJ5t
	hFIX27ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8qA4-000000058Xd-27JA
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 00:14:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8qA2-000000058XD-0gxF
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 00:14:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6HkgpE028840;
	Thu, 7 Nov 2024 00:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o4oDhBwaou2FC37R3e+JEtwsqqNeCqd2aFyl1njSVA=; b=bc7TuT9AQh3FIE70
	MTAV1u9kb8wzjjJHMqCj6/iRbIadaIbk0L/FQY6bFp/eL+X/H8QEIvf3j6Xg3TBt
	UKoVXiC8w3X9Vr2z0qVkityAcG9iOgcY8nGatmo2E4ANKhLozA2sMb481sqz2rci
	PsAELodo5KM6aIHgZoP06w6QlKKCQx06GVg0Eziox01kOxJx8eKPb7fbTJ1V5SIA
	hV4M9ape3QI+GWk2UbGm8OTzONtUdvZuOh3ZxvVsFsPNPQADFyENfwoJhm5eSamU
	JH47KhjyGTmYET/mqNMK8CjlZgDjd0ZX/vo74oVQECciFD8QQhYm71kbCanbRDwN
	V8i0iQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd28ctu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 00:14:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A70E3Wn026781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 00:14:03 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 16:14:03 -0800
Message-ID: <32b84dff-b547-4154-8959-8386815f0ab7@quicinc.com>
Date: Wed, 6 Nov 2024 16:14:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Support Transmit PER Rate Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
 <20241106044548.3530128-5-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106044548.3530128-5-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t5Ni30mFdffCyJ5gfFLxaM5GTiWjpo8q
X-Proofpoint-GUID: t5Ni30mFdffCyJ5gfFLxaM5GTiWjpo8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=877
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_161406_362094_F54BE281 
X-CRM114-Status: UNSURE (   6.95  )
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

On 11/5/2024 8:45 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request per rate stats through HTT stats type
> 40. These stats give information about rates of PPDUs and
> MPDUs for single user and for OFDMA and MUMIMO technologies
> corresponding to multiple users.
> 
> Sample output:
> -------------
> echo 40 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_PER_STATS:
> 
> PER_STATS_SU:
> 
> PER per BW:
> ppdus_tried_su =  0:0  1:0  2:0  3:0  4:0
> ppdus_ack_failed_su =  0:0  1:0  2:0  3:0  4:0
> mpdus_tried_su =  0:0  1:0  2:0  3:0  4:0
> mpdus_failed_su =  0:0 1:0 2:0 3:0 4:0
> 
> PER per NSS:
> ppdus_tried_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0
> ppdus_ack_failed_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0
> mpdus_tried_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0
> mpdus_failed_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0
> 
> PER per MCS:
> ppdus_tried_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0  8:0  9:0  10:0  11:0  12:0  13:0
> ppdus_ack_failed_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0  8:0  9:0  10:0  11:0  12:0  13:0
> mpdus_tried_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0  8:0  9:0  10:0  11:0  12:0  13:0
> mpdus_failed_su =  0:0  1:0  2:0  3:0  4:0  5:0  6:0  7:0  8:0  9:0  10:0  11:0  12:0  13:0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


