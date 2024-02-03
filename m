Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90C5C4828F
	for <ath12k@archiver.kernel.org>; Sat,  3 Feb 2024 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRBp+uYPRcH/+FXk52JgfzyKgWtslx6MHOGNDNrhoOM=; b=G7jZesimT4p1lK+lPfr8ykh92G
	/SUENCag3+oOTIwLcfrvCu8aCmi4B9RBL8A3UaBA+gRKYFROd86hWgfp9LqqLKxJYIAa5RpB4XTgZ
	qB5gMeEWvC/yx8Xhm4CQ2A/q/kePYR0qOQbujKhkc5oeSO/BrdxCdLTGA7pzLbxp9gfoAOp8L3NdV
	tmrDYsHkHQxRdWVHhI2W32zdr+KSdz+y+1FieqXFmF2kkZHA/3B0EAoXf2TgWFQGSsAEJMXPd/fOo
	7QzZsj6Z3HGy3uoMbwPcdQKQQ4NvJ0HoCQ9pfM/BD1iwpFO8naLcVBI9dBbSirO/pI7SgRxU4SH21
	UqD3HFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW8QI-0000000FKhg-2Uft
	for ath12k@archiver.kernel.org;
	Sat, 03 Feb 2024 05:18:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW7OQ-0000000F240-1dl2
	for ath12k@bombadil.infradead.org;
	Sat, 03 Feb 2024 04:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xRBp+uYPRcH/+FXk52JgfzyKgWtslx6MHOGNDNrhoOM=; b=LxtGCczMX6jYiDCJFnSduzayDb
	2vqJGQ43KzgRyKP1IqQv/8cvWMRdw1T+bNdYV+hUKzvbuK8drzNlaA5xAdwXFCeBJTZ4XtwESfegF
	XXp9auGBJGY0VeaG+xwT1GS5Qnoi9zHJLLavq0PzJUXRhx5L7dmt+8Sy8um9PRoxRYWNBYK6COucL
	/nPEqrSA09w1Berd+4nsHTKs/XJ4njE2G5x6En9n89xBje8JsrnlkeQoaSXnpQXyH0VaVS5JROVic
	Q+z3N4EoD2PwxWP8oeZSYfIH1uKmIVRHy94tTybVVSpuIyixFzEIz4oRWW1bh+GnTNRSd+yX0Y/8K
	iG/zhIcg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW7OJ-0000000AYR1-2lKe
	for ath12k@lists.infradead.org;
	Sat, 03 Feb 2024 04:12:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4133ko8q007338;
	Sat, 3 Feb 2024 03:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xRBp+uYPRcH/+FXk52JgfzyKgWtslx6MHOGNDNrhoOM=; b=bD
	fuVn9DXQ+CytURQm5Pl9cX5OIc2iRNgtobgNuX1MwYrF/S5Hj7nnTX5eWY4aROAf
	3KbZiVYdGkl5HpPumSeABLS+90aZkLI8vCtysy36naJYoPFMsw+MmYVEPCryeUP4
	TAVn+tXAC4gYKCLK0b2J9H6/XsVDVnhwzdrTOfAAE0lyiapUdbuBaYTTx0OJWKgB
	papg1X8wZ0Q3Dp6WkWgPQ43VbHxsxGdJfLGiviGppSbqFdauOVSUXCqGOwItuv9E
	rR7Fe18FTP9nVZBvjLfunfli5Go1axNRA/6jNENbI2bGwGaF9OZXXh7TV0l/AYsa
	L2Jt/stUNPqs2H9gIb6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1019skhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 03:54:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4133s9aG032070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 03:54:09 GMT
Received: from [10.253.10.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 19:54:08 -0800
Message-ID: <cb71fe6d-c22b-4d48-965f-9348eb5ebb20@quicinc.com>
Date: Sat, 3 Feb 2024 11:54:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable 802.11 power save mode in station
 mode
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240201035830.2534-1-quic_bqiang@quicinc.com>
 <875xz7t1nw.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <875xz7t1nw.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dnEyT439Y9l7D2uVoKv1_61taDwlSeBA
X-Proofpoint-GUID: dnEyT439Y9l7D2uVoKv1_61taDwlSeBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=338 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402030024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_041233_238604_187905BA 
X-CRM114-Status: UNSURE (   7.80  )
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



On 2/2/2024 9:51 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> To reduce power consumption enable 802.11 power save mode in
>> station mode. This allows both radio and CPU to sleep more.
>>
>> Only enable the mode on WCN7850, other chips don't support it
>> for now.
>>
>> To test that power save mode is running, run below command and
>> check there is no NULL Data frame seen by a sniffer:
>>          iw dev <inf> set power_save off
>>
>> And run below command, then check there is a NULL Data frame
>> in sniffer:
>>          iw dev <inf> set power_save on
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> This had simple conflicts in hw_params, please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f776fd9ccb6561c4e4fdf05552a8b57a06686a90
> 
LGTM

