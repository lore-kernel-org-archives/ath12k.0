Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6E7C02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUFSwjw9Umgi+b6yQFn5Ok0HZD9Zsi5KXC6ziORTLng=; b=Whaeaq64Z/vdHumXhdSzbEiJxF
	DVcneuSexg8j2Yi3ysEoSeN9XAhRJBgw7fyjNrdoihNqWVLuF8XZeJflXV1R9pK3rqV2IBdC7Z+LX
	X73x/0HtxyJ9AoEff6FSe1n4w9bmzbTcHUCwMnDi6/8gVjstGPqS2WNObw0qxzRAqjC+REjRugkDL
	vaHgRcUqSaJwOrTiwxISxktTmi62V0KdyWHfyzGYU8h7WAlAaVg1wP7BMgkvSne0eIZi+l1omW/9C
	qEhYT++WfsMHnXy8kfc4A39ea7I5Qbv0oVqfNyR+ZEFQwIc9AeFeqEsyKpTO1vJvrwWuamKi3e2eX
	jgJousbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBHy-0000000HGW2-16MP
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 05:15:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBHw-0000000HGVh-0iqO
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 05:15:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51457pJJ008139;
	Tue, 4 Feb 2025 05:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFSwjw9Umgi+b6yQFn5Ok0HZD9Zsi5KXC6ziORTLng=; b=dZYcrMEpyvRGL/nY
	U3mWyzO1jT7wKJMM0tCS8Folpz0F/HDVMBkv8+4TnnSaMq45vWXEoZBPAH0MyZx3
	Az2gyxAzJMT6SrcN+7PlhRos6diIWxEDo0GPuOYegYdCJl3aw4EPdCm20PWC20xr
	FoLt6XGvwBRPZ4iwG2TNEBRouEPV5lMlVSlXgECAvnsmvvZVCAQpE9u56P5BoFMb
	sndZfvlDRUOi2yh5ZUC83ESTG2cpCd9Bc3el5lslSjWCHN4EVYZFiyIZCBm44qq3
	AruHcqOWwe1qjLTloXY618S8N1zSBZ2r0Z/6Msy5CtPkJu85ixI+dW5NtPpZT1EM
	scSULQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp00fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 05:15:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5145Fshj010157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 05:15:54 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 21:15:52 -0800
Message-ID: <d5fac483-9ec9-255e-cc73-92cd97524735@quicinc.com>
Date: Tue, 4 Feb 2025 10:45:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
 <901a8947-c11b-4d0a-9cdf-93c5374ddde1@oss.qualcomm.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <901a8947-c11b-4d0a-9cdf-93c5374ddde1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2s2zeYmjaj6MvvOVHBlwBIaEKCThZMME
X-Proofpoint-ORIG-GUID: 2s2zeYmjaj6MvvOVHBlwBIaEKCThZMME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=719 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_211556_338214_66E155F4 
X-CRM114-Status: GOOD (  12.42  )
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



On 2/4/2025 9:54 AM, Jeff Johnson wrote:
> On 2/3/2025 7:57 PM, Karthikeyan Periyasamy wrote:
>> Currently, peer extended Rx statistics are not supported. Peer extended Rx
>> statistics are collected form the TLV data reported in the monitor status
>> Rx path. Therefore, add support for TLV tag parser handling and debugfs
>> to configure and dump the collected information. Additionally, this series
>> does not impact the WCN7850.
>>
>> v8:
>>   - Resend due to missed patches
> 
> you had received some Reviewed-by: tags in a prior version.
> if there were no significant changes to those patches you should have
> propagated the tags.
> if there were significant changes and the tags were dropped on purpose, that
> should be mentioned in the version history

No significant changes from v6 only rebase changes in v7, so i have the 
propagated tags in this version v8.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

