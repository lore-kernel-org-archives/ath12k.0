Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5AC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhvahIrlB8uSeCJa0p0eowW6sGuPWsBdrk2P7izv/4Q=; b=uwLtQboq3BBBs5Hi7+T6RLTfNG
	OItGXvM50IfoMYSvdI06KnfUNhKadu3h+2DsD34O0X717DdzYXq+7XDvNuj0LgdG9aYvdeBhZv3sB
	IxiZvR7xJi9p8jbxbR0gi2L4FDh55hdkA5U7vm/DJ6guyRJ8wkCqCN9lnJIcko7GcBk0+3Hg6R8Bj
	fyLN0ZsmwGUWELPs9A81lrCUWL2gL+Liv4/ETEGUg7s/7aCBIDptHHjN4RTmdnn1XQVtOqXay2lwA
	QAmwF9h6u19rDdJZ7LWJOCKEQPmyRt+zyaNvScEMtrTb2ABLs5OMKPWqjfx5CtOZs87W5/0cwnPYY
	VRRETtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvI0u-000000000aV-2yz1
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 14:36:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvI0s-000000000a9-2s59
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 14:36:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43CClT4n010818;
	Fri, 12 Apr 2024 14:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uhvahIrlB8uSeCJa0p0eowW6sGuPWsBdrk2P7izv/4Q=; b=h1
	TrNMSk2qvS6j3irvvSNlU5paGVOzdmrVZ+M40ThLpchIBAmaly+6RmD/9Vxaw/Aj
	zX1XvP3CdG4ndQQAKvML7nHkxc0hRFjJFmZsR7V/93Sxs+RunoKHBvU82iCAb9/t
	hye7ING1LJe87P/HcM7dEGBPSSk+qgkL3EQcOtTLjopIwNRyONl0B11MmMe3Ldyy
	RUXh5EI6HCP9ES+vb47FWKgZYVbuX5NUc4vD2+VAlnI/b4u93YkzOh+tMvaSLVHF
	FkN8XzDiye3Q2Bn7H7e9ACV1kdosm7JwqbLBPZG8xO08NYXhclORQhs4lfvYajqv
	EEDLqxtF9RXbbITRnupQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeyev8xww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 14:36:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CEaLtD001153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 14:36:21 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 07:36:20 -0700
Message-ID: <c6860d94-be1b-4d3b-a840-a7afb143823e@quicinc.com>
Date: Fri, 12 Apr 2024 07:36:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: add support to handle beacon miss for
 WCN7850
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412094447.2063-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412094447.2063-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DCvYzYX4uSPnavxznftwkYIErjw8O_9E
X-Proofpoint-GUID: DCvYzYX4uSPnavxznftwkYIErjw8O_9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_11,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=689 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_073622_788916_42FAE25A 
X-CRM114-Status: GOOD (  11.56  )
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

On 4/12/2024 2:44 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> When AP goes down or too far away without indication to STA, beacon miss
> will be detected. Then for WCN7850's firmware, it will use roam event
> to send beacon miss to host.
> 
> If STA doesn't handle the beacon miss, will keep the fake connection
> and unable to roam.
> 
> So add support for WCN7850 to trigger disconnection from AP when
> receiving this event from firmware.
> 
> It has to be noted that beacon miss event notification for QCN9274
> to be handled in a separate patch as it uses STA kickout WMI event
> to notify beacon miss and the current STA kickout event is processed
> as low_ack.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



