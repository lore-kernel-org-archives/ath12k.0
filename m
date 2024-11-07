Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEEDD5D688
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqqAEE5orr95uyDNMZx7djXBF2jhuSb31zAQU+Kzogk=; b=hL3MlHDLmb+DTJtmg2jm2Ej/U8
	OP3ES77sQsWtxcHNHb5j2UUXk8pRy1M0JyMqIRpZdwIyz9eUwu0psvgRDZCf9pMlVmxaLfA1jHPUj
	O4xFkuJ2V7fGut4Py2mkQTycw4Qd4dedofTehm9qn4BvfJk5hwjhJvktrJ7P6W7W3HtYsKZyoYhrq
	JVd2grJRke2Tz4XWqaWZbAOQ9M71S3LFWEIXSddgeSOwXjixKVo4SI2H9f36nAq1rkd1GVfpeGU1p
	4+PXNPTwqW0T++Sbf9hff0XMTNFDjysBBjBfG/PZuxrcapDgXWrsWIxPF1TPquOGYBYkZ2rvxpzX9
	SmhTq0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98c3-00000008A6L-0dqN
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 19:56:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98Kq-000000086PR-1CYq
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 19:38:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HLdsd010195;
	Thu, 7 Nov 2024 19:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqqAEE5orr95uyDNMZx7djXBF2jhuSb31zAQU+Kzogk=; b=JVc3ikEUMtDWtx1t
	iSnGBtUMr/Pk5X7xQzYgr/vk0gPRuGuyYhd3gsKhKXQD0+BDSdHBqXO65ZDH9ARe
	5ziks5zufXpOi4e9fFYMSK1zZg63V9fFc4M084cfvLldHhJm4k5y41z706G1yBww
	8MQ1Ad92wofxpsy5YTAQ+RTiNJ7/8fAUqSyIkX2IqEhueWgDRXOVY6G1V197rSHR
	aWO7W7u0eI44SRMJCILj8Jby723IKCAEUCEVv0/2AcoPC0ui9L2jBxtAbvAAq+GJ
	uLzkKVToQIA9U7nPkFOs2etuEA6G1ZbZs/zybMT/50/g7P5LcT2EAAccRA1IgzA8
	/fZ+lg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx8q4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 19:38:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7JcQop027022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 19:38:26 GMT
Received: from [10.48.242.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 11:38:26 -0800
Message-ID: <4d88286e-c416-4c54-96af-727f62536b98@quicinc.com>
Date: Thu, 7 Nov 2024 11:38:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
 <6f995c95-d9db-4169-8216-fd1959fce2a7@quicinc.com>
Content-Language: en-US
In-Reply-To: <6f995c95-d9db-4169-8216-fd1959fce2a7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wz-c8LUc-XABJo4ctApReyScv90yx2vr
X-Proofpoint-ORIG-GUID: wz-c8LUc-XABJo4ctApReyScv90yx2vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_113828_369958_3E08D339 
X-CRM114-Status: UNSURE (   9.88  )
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

On 11/6/2024 4:15 PM, Jeff Johnson wrote:
> On 11/5/2024 8:45 PM, Roopni Devanathan wrote:
>> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
>> These stat types give downlink pager stats, counter and TPC stats, SoC
>> common stats and Transmit PER rate stats, respectively.
>>
>> v4:
>>  - Addressed Jeff's comments pertaining to data type conversions.
>> v3:
>>  - Added macros to fix compilation issues.
>> v2:
>>  - Removed dependencies. No change in code.
>>
>> Dinesh Karthikeyan (4):
>>   wifi: ath12k: Support Downlink Pager Stats
>>   wifi: ath12k: Support phy counter and TPC stats
>>   wifi: ath12k: Support SoC Common Stats
>>   wifi: ath12k: Support Transmit PER Rate Stats
>>
>>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 630 +++++++++++++++++-
>>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
>>  2 files changed, 831 insertions(+), 3 deletions(-)
>>
>>
>> base-commit: d63fbff74ab1af1573c1dca20cfe1e876f8ffa62
> I acked 2-4/4. I can fix 1/4 in pending so no need to spin v5
> 

Please check the fixup of the 1/4 patch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=e97a15b67f1417e36d799aaa1f15e3a362293475

