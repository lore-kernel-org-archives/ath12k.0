Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D042CC07C79
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZvMuB/bw1+y2U0Cr/lazdZkdY4Z+DXTa+VUdToEdYI=; b=nM7pLqHJoZCXrAL3fMAOf1Ykgh
	SrVQrgBYBWQi9vOvjnBPM39+l8R+orzbUkdqu4zozqVRljfK4MnfxmNnKqPJK3pV9+TiRyc+HO0QK
	y2JQsGP2FyVdnH3rbVG5tIBU3nLD1dm8irQlCfmaj+379GvZWnZSOp1s4vgXFkJ9b5c5L69ZrkSiz
	AetrWfk5YdPy00yoSzkj93Y5vGNMtKdT3h+5ZEwDQIPZn6YxTPvlI4kwi2JlOz7QNgmbU7n9FgWsd
	bkDRIbULiMFzBgJb9ApK6zcszX3T0RTsRPTskk+fLtVWT7DjPCIUS6SFO7SG5DNpKo6e5RGVijJDP
	NLnI4EuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryusY-0000000DyE3-22S7
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 14:42:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryusV-0000000DyCa-1NhJ
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 14:42:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M9OlKX026485;
	Mon, 22 Apr 2024 14:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lZvMuB/bw1+y2U0Cr/lazdZkdY4Z+DXTa+VUdToEdYI=; b=fV
	gQ1jNgOm0gtEpOn2SBANuwZnMM+13TIO8CBMlpD4OoBVlIWvIsrQNMcEOtn4LFOf
	wbxnvW70Fl/NqQY/pMT91wIjPtkA/8xFoN+hRZ7IWqOwC8mS8DM2OpmMH14lltNw
	omam2mGqGfK4TIhuENxL86YwBLF7EIYagU3PmeonLNZbBOYkuM8J8jZpCAMlM55O
	mH1yshFJJtDqLWMWlZ1BTQ49QdPQY0IuJyiRDm82XYV9D7C/BctDftY7qQ8l4vWk
	jwcYAsyaYvUnmKQKICnlwIh2L7pI2t76FsrHTAy41EvAKbwXrauQS96YKAoUn4qQ
	2cZka6qSziX/izvAIaqQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82gsub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 14:42:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MEggC0008323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 14:42:42 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 07:42:41 -0700
Message-ID: <030a9e21-3ce8-4245-9650-b5b70e139479@quicinc.com>
Date: Mon, 22 Apr 2024 07:42:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: set mlo_capable_flags based on QMI PHY
 capability
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418125609.3867730-1-quic_rajkbhag@quicinc.com>
 <20240418125609.3867730-3-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418125609.3867730-3-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5azx2hr0YpVduvcqjfI3JgJ64vZkzjFi
X-Proofpoint-ORIG-GUID: 5azx2hr0YpVduvcqjfI3JgJ64vZkzjFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=993 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_074243_428552_D7C22F4C 
X-CRM114-Status: UNSURE (   9.57  )
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

On 4/18/2024 5:56 AM, Raj Kumar Bhagat wrote:
> Currently, mlo_capable_flags is set to zero if dualmac device is
> detected based on One Time Programmable (OTP) register value.
> This is not generic and in future dualmac devices may support
> Single Link Operation (SLO) and Multi Link Operation (MLO).
> 
> Thus, set mlo_capable_flags based on 'single_chip_mlo_support'
> parameter from QMI PHY capability response message from the firmware.
> Also, add check on mlo_capable_flags to disable MLO parameter in the
> host capability QMI request message.
> 
> If the firmware does not respond with this optional parameter
> 'single_chip_mlo_support' in QMI PHY capability response, default
> ab->mlo_capable_flags is used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

