Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CF5C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxpfBaSY7XWTED3Ye4K61KzTz8WRpqE4sxVVo0t+tJ8=; b=zMs8iOMVMvF5PHFdgpIErzOV/p
	h8/T4uc1XQ6NanQSN+jzb3UiIA/xYNgMYK9bZP8OpY6VSkmSNyQKNl/oCOuswGYdyEhKSR1CrRLRx
	WpXpFxJU1Zox0L/1GKEw4MYxB8X29F4MVqgaASf4GOdo/PFHyQ5gD/LOYBRo0w9ze71MM5Mx4M+MU
	63EtfhQImqIYBDL/Gl7F1jeUYMaXrcOfGCKBBn+nY96QmdN/f+WkgiFPPySE2LNVtDONS5HjYCG0O
	sSFNpzDQgKGmbU83vPtyFuf5Rf7ec95Ybp6wJ61jpu9LigMtfFHvXxNgjrOWHc+7M4Lc3C5bMi0We
	80kDhHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MX9-0000000Cpt9-0Idu
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 14:26:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MX6-0000000CprG-2Fdr
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 14:26:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QE0NdT018165;
	Fri, 26 Apr 2024 14:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bxpfBaSY7XWTED3Ye4K61KzTz8WRpqE4sxVVo0t+tJ8=; b=Kn
	UgEL9BJOOa1EycoAAiaa4iaIOT9EdSQn+VOa3cVWBJQ/+VjnVQgq0xEJcOsgybLO
	fOJqc59Go0Trky0ZrZSnQgifUGMU1yGTgt65+EP3h7EorOuvfVQul0DnBcOMrWT/
	F6T86x4CtgOeJf/jtQJGpfxit9b43/v913qz4INDgGl4nOjNbKTKxx6l6nIxRX63
	5UDf+gunmtzgQsg2JjuSk5Vi3ls2s27ZsX+HdLAUQZPnHS6nu17UHZ0lhQovVz8Z
	ktaEOBd2iQRbQQNaQIiwBJ8SbjMfLP/Kw382BXAsMAXi1MlBX5aft4kYtMQv+m04
	BlBtJS9gbTtpYjEaDS1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrdmr025g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:26:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43QEQXI0005043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:26:33 GMT
Received: from [10.110.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 07:26:32 -0700
Message-ID: <e5500935-6ef4-4717-9d94-3136da197262@quicinc.com>
Date: Fri, 26 Apr 2024 07:26:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] wifi: ath12k: move ath12k_hw from per soc to group
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-9-quic_hprem@quicinc.com>
 <a02ee04a-23af-4103-bb0e-2b989a59342d@quicinc.com>
 <6e2df4425fe442ce8c6a1afd56dbc4da@realtek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <6e2df4425fe442ce8c6a1afd56dbc4da@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cT-Qn61J_oZrcZH_mxAbOrwnKjz9_GLR
X-Proofpoint-GUID: cT-Qn61J_oZrcZH_mxAbOrwnKjz9_GLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=867 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_072636_878748_89FDD2F6 
X-CRM114-Status: GOOD (  12.05  )
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

On 4/25/2024 7:33 PM, Ping-Ke Shih wrote:
> Hi Jeff,
> 
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>>
>> On 4/24/2024 10:57 PM, Harshitha Prem wrote:
>>> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>
> 
> Will patchwork take 'Tested-on' tag you added automatically? Or you have a
> local script to add that tag. I use pwclient to grab this patch, but only
> your acked-by is added automatically. 
> 
> I have this question just because I want to refine my workflow of patchwork.
> 
> Ping-Ke
> 

Tested-on: is not an 'official' upstream tag -- it is our own invention. That
is why there is a blank line between those tags and the official tags. So
those tags are always managed manually.

/jeff


