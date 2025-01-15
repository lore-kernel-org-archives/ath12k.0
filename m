Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C6C02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 05:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYzg4gZ95K4UdPOeti/o1jGOxz8MHNFZitraDieLTNQ=; b=Vp7Ho2jg/t8GNrYAHjgjyh0B37
	p80q8Eh13qPMkRh0SNaT53430fySPZgukza34FANvj4LB4IcZxbNYQsy+owlgfySIDSD27kYb0SBc
	skgML+5MtxHwHu99A2HjOdGZIN/LaNE+TgJdbDsQx3pM6Uscpjx2Vc4fgmPU6IcnyLNEFgRfV+1sw
	FPCMZLNYWBkCkb3BAdxOrqhPuZ6uuMt1+1hlqog2GTo7vr3pshWTN3XoL2RF9VsxjZCpeP7EijHll
	kkboHGBaFdJZW6QJ7e5I0tVU55huzdY/f92JqL7GbZmO6CEcfc0PqKf950kzYAEWzDyumnTnvmWM/
	CZO7mTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvvI-0000000AgCV-14Rc
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 05:26:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvvF-0000000AgBx-1wIi
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 05:26:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F0aim7001344;
	Wed, 15 Jan 2025 05:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYzg4gZ95K4UdPOeti/o1jGOxz8MHNFZitraDieLTNQ=; b=Yya/FK80JeTm8Xvd
	WA/KZdt2iJ00145Dy46AUnMWbiR9dOOasFL7t3HsRg0TSNyZOJerGGp6plD5Oi7u
	64eFrn7c/iyoT2fEgG5eti+jF0jffAd52XfBLWc+QuFu+iRqsuidRiCWiTgX+6Rh
	zI1x22wOpUpHxXX2ydOFBbr6l9IhZnuvT4gRDEHXN5W/5h9ULoFs1mZoi0Ns5N9s
	5lSIRTdNdF6p/avmuLcMelHyg+UStV0aPY3A0aHDnnTxdGE9zIZOLOlaPPj2JJRG
	7smGcV257paUW0gGsdI+wEcoz2i+9wYVCyAfLgIi7GAMfkCHQh/2Afsz8nXniQPK
	ccf+bw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4462mkgj45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:26:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F5QVHC013238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:26:31 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 21:26:29 -0800
Message-ID: <d2b317e0-dccc-4683-8964-3878ef61d4fb@quicinc.com>
Date: Wed, 15 Jan 2025 10:56:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] wifi: ath12k: Fill pdev id for fw test cmd
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20250115042532.1509956-1-quic_aarasahu@quicinc.com>
 <20250115042532.1509956-5-quic_aarasahu@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250115042532.1509956-5-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5WFkbIMyYhgkosu7Nv3PbCZMgPVfGoV7
X-Proofpoint-GUID: 5WFkbIMyYhgkosu7Nv3PbCZMgPVfGoV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=891 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_212633_646743_286F6FF8 
X-CRM114-Status: GOOD (  10.98  )
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

On 1/15/25 09:55, Aaradhana Sahu wrote:
> Currently pdev id is not set properly. That can cause a crash
> if pdev id is not equal to the pdev id when firmware test
> command is run during AP bring up or ping.
> 
> Set pdev id in function ath12k_tm_cmd_wmi to resolve this
> issue.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/testmode.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 

Previous patch "[PATCH v9 3/5] wifi: ath12k: add factory test mode 
support" only added testmode.c file isn't it? So can't we squash this 
patch in that?

Let's not introduce a bug in patch X and then in same series fix it at 
patch Y.

-- 
Aditya

