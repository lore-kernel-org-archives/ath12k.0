Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13609D68BD8
	for <ath12k@archiver.kernel.org>; Fri, 15 Nov 2024 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gs52WvDdvXh4dtsLzEIeX4HnvZv26m9Z4wpqRlvm54=; b=10xh70CV4wm3RhxW/+GP521gy/
	/179zZzsLKHdGuXxiwCXOASUcq08MNjFOzj4G3Bu/R3EigjEAa2MeTe+cV9qoS8P08o6DYSXZOMam
	nXmzfkmFprTXumIscoky1aXe/p3tAnbCWeleNISiiS77mBQ7qStYqV2QTPrgkAaz/xRNxZEHuXSz4
	n91j5JitcDbbjpUKdh86a/EV41GUJ0SvGScv9iIIIWcFuFwKhmhejVqHRVA8v6H7aX79kzi1xzF6r
	YEym12QOPI6RMIFhCqxP0pgvJk1IobfmDyTMMOvcqgTLEvKG7kkqfzHZiuWoe1ROhg/oohw/C3ElQ
	VQOOTkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3nB-00000004BmK-3UEG
	for ath12k@archiver.kernel.org;
	Fri, 15 Nov 2024 21:23:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3n9-00000004Bjj-1vQi
	for ath12k@lists.infradead.org;
	Fri, 15 Nov 2024 21:23:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFHfOKc029684;
	Fri, 15 Nov 2024 21:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gs52WvDdvXh4dtsLzEIeX4HnvZv26m9Z4wpqRlvm54=; b=IDtBUPJ4qWIQpyxQ
	w0bg02G0pG5Eig9ws9x5f6nxqrjHnXKp+Lb+Q55Gp0+DlnnMeSRc2r1DnORVOxwY
	MyFYEMICbQMoiPE93TYiRCSY/ZLA33pFwVcP3TsCAa4qC+rA11jpl02C7rwU5+G1
	h+u4WB5Dq41FAxhPM6mNs1M7fhp02gO4qef9J7yL7H2db1ncFKXleBqYDfQK91OH
	oMgbTSYGu5fLCkVlQvJ1XIoCXoIHo8HgpM1krBLtqj5exMDYmRr2ieFv5NLD2Wjf
	JYqycc4q559qz5nVDpGcabmoxOe+Er4Q+YAvBofXX69uib/qtbjL2xo5tU87Yxsa
	NJ0sEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wjqamp29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:23:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFLNjwb021959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:23:45 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 13:23:44 -0800
Message-ID: <2140c0d4-d5d0-420d-b314-d88176988ab5@quicinc.com>
Date: Fri, 15 Nov 2024 13:23:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] wifi: ath12k: Support Transmit PER Rate Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
 <20241115062854.1919672-5-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241115062854.1919672-5-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O8W3uVvkQLcGVXQo-5HUcnGc_4TqpQTb
X-Proofpoint-ORIG-GUID: O8W3uVvkQLcGVXQo-5HUcnGc_4TqpQTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 mlxlogscore=905 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_132347_624258_E541E415 
X-CRM114-Status: UNSURE (   6.92  )
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

On 11/14/2024 10:28 PM, Roopni Devanathan wrote:
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


