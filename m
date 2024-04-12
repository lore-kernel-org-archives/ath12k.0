Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ACFC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWPlCA92pTxS1RpY18IE4rrj9535hBEom20kDB6zHk8=; b=ym27geJdq/Do60UfjNJaI8d9ha
	IdUJuxQFAW87+bjj7I66zqVfAs3q9G55OUltoNSv0YeAwh9mWj+5rCQerGA8l/yRRczXsEiE8GrX9
	0LC8MfdgoMdu1gqybpJD6wTCBG/qFPnFvs+PUPVtNwwQNf+wcjVm0zRI08rCnNcQR6Fmk66CB/x15
	TBLi+04pS75fDEKJitG01e0O84jTongucgXkjyFwsPwXJ7Bzntz5UB1B5MdhhZKWBHLHjFojmVfok
	07fmBQGo1XzWjBbQYeu7DucEMMTfotSwGQen725inA7tRpmlbY/LStEhgog55iSdIt6aVmJSmkezS
	6ZjeLfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJ7y-00000000IRo-3Flk
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 15:47:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJ7v-00000000IQS-2AbU
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 15:47:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43CEDI8i031115;
	Fri, 12 Apr 2024 15:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xWPlCA92pTxS1RpY18IE4rrj9535hBEom20kDB6zHk8=; b=JB
	Yr939ch7pgsMGlFwFMwgBLECRB/R8AmId0T4F+LsGIEz7JyNL+8ZeghSF4XGYsGh
	gARLYZl20vtLiNxsNdFJQIdGs1EN2WEHTrkyF1AouZqCoK91eLwQ8h/NmW5JR73W
	PwFqUVm+XIbD8prOHZa6ODmArGMqLsvOQ7WXl9Zxcmyx7/sss3j3W/+wP+VibyjQ
	HfaQT+Vdw0sQd0A2DFktISCf5kfKSrAiTL2zxr5VTtqssQB/loQ49/5vdzSmwHHi
	diOPPV7O5d5BGbjbEIu/WXakVIkVC4fLTG9OZ138WR5f0bUDuTDEj9ok1e45MOKF
	n67wKa7WX7ApYarPpFmg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xf6h6r617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 15:47:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CFlds5024076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 15:47:39 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 08:47:39 -0700
Message-ID: <600c43f3-a069-44a6-be7a-2cc3281cf88c@quicinc.com>
Date: Fri, 12 Apr 2024 08:47:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: report station mode signal strength
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411025322.33888-1-quic_lingbok@quicinc.com>
 <20240411025322.33888-4-quic_lingbok@quicinc.com>
 <b2a14919-6478-4a6a-bdca-e018393eac34@quicinc.com>
 <70f73d7c-4ed1-4678-9eb4-7d4594af1df9@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <70f73d7c-4ed1-4678-9eb4-7d4594af1df9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: maszSJWR5S8ugDStKTil0OksdcGMZs5w
X-Proofpoint-GUID: maszSJWR5S8ugDStKTil0OksdcGMZs5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=982 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_084743_727524_F89AB306 
X-CRM114-Status: GOOD (  12.79  )
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

On 4/12/2024 2:45 AM, Lingbo Kong wrote:
> On 2024/4/12 5:51, Jeff Johnson wrote:
>> On 4/10/2024 7:53 PM, Lingbo Kong wrote:
>>> +struct ath12k_wmi_vdev_stats {
>>
>> this name does not conform to the "Naming conventions for structures" outlined
>> at the beginning of the file:
>>   * _params is a structure which is embedded either into _cmd or _event (or
>>   * both), it is not sent individually.
>>
> 
> Oh, thanks for pointing out.
> I get what you mean, but the ath12k_wmi_vdev_stats belongs to event, so, 
> i can changes it to wmi_vdev_stats_event, i will apply it in next version.

note that _event should only be used for the first TLV in the event payload.
Any subsequent TLVs in either a command or event should use _params



