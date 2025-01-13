Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F80FE7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6e59fMeJ5eErng7YxuaoW6O2OuKCvhOaDuKpX9d7SA=; b=aql3pP2U+nKIBR8X3Oof3X1yr2
	YNV8wERg9ZsqX8O17qHxY1OYl74nfOI3TqZir1hExUOXlffY8WHXv4dTdvHeS1C6RFRf5WEnVC3zo
	FL+yTgMzp6aQ1e44rmbFqNZEN6de9sl4/ad4xW7jgTunmLArWPgORaUdwUni7Qb6i144kIsYuWFOf
	QiF/9ITuw+FNJSe2+eFzhXIFvz2eflnw4J75a/mZA5MPFgUq7nI09LXvtmT2IGK6XcqAaIqilDzhZ
	2Do8YrwpV2MGPsep6uoU80PUb7+oRvOGRpnAh1zqGE6xUuIhq5bTiD1IjsU4dvqMRw0B7RzMwLFDZ
	A8YRzQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEbr-00000004CjG-0dSs
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEbn-00000004CiW-3kut
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:11:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D06HtJ006082;
	Mon, 13 Jan 2025 07:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6e59fMeJ5eErng7YxuaoW6O2OuKCvhOaDuKpX9d7SA=; b=LuK4oikpyLYdL9ex
	wFtf08rHk/jpkifoyEOV22SmSU8TDaFpRaxjPN1NuBAOXCjfSknQ3ngLCEq6Mys8
	8SevgVJRt8JuinX1gtG4ajaiifg4TLRuMjIUYF/x1m1q9LJ5wWLItAZqT3Noj6Wg
	cBx6rnnWF7ZwzrIcy1bdpIqPsSRJsd7BzMFE1+iyMS1BAyiHcjCiJuQk610tcOLq
	LwqXZtKqpy2CxU/PApVrM2O++GxinvlQIY7h4Hw0KEK6uhXIp1CWDboBzQf3PZLi
	ZAn/O7d8DzOmGBAuFWbEd3OiX6jN9CRrJe95Dk4xZVoEl4ztG8fO3zy5ClJbtILf
	UNd66A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444r01rrnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:11:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7BWp6007411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:11:32 GMT
Received: from [10.50.33.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 12 Jan
 2025 23:11:31 -0800
Message-ID: <509f4fff-b547-413e-b9b0-c0060ce8d379@quicinc.com>
Date: Mon, 13 Jan 2025 12:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] wifi: ath12k: Support Sounding, Latency, Trigger,
 FSE stats
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
 <7721a8cc-ee42-4b6a-a08e-ed2ec472041f@oss.qualcomm.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <7721a8cc-ee42-4b6a-a08e-ed2ec472041f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V63SOqQ_BTmkA9Wf40YRGYAXaqWJVe1S
X-Proofpoint-ORIG-GUID: V63SOqQ_BTmkA9Wf40YRGYAXaqWJVe1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231135_944444_6062FC87 
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



On 1/7/2025 2:16 AM, Jeff Johnson wrote:
> On 12/24/2024 2:20 AM, Roopni Devanathan wrote:
>> Add support to request HTT stats type 22, 25, 26, 27 and 28 from
>> firmware. These stats give sounding stats, latency stats, trigger stats
>> for uplink OFDMA and MUMIMO and FSE stats, respectively.
>>
>> Depends-on:
>> [PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
>> Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/
>>
>> [PATCH v4 0/2] wifi: ath12k: Support AST and Puncture Stats
>> Link: https://lore.kernel.org/all/20241217055408.1293764-1-quic_rdevanat@quicinc.com/
>>
>> v2:
>>  - Added line breaks where necessary, as pointed out by Kalle.
>>  - Modified the use of pointer arithmetic print_array_to_buf_s8().
>>  - Modified commit logs, as suggested by Kalle. 
>>
>> Dinesh Karthikeyan (5):
>>   wifi: ath12k: Support Sounding Stats
>>   wifi: ath12k: Support Latency Stats
>>   wifi: ath12k: Support Uplink OFDMA Trigger Stats
>>   wifi: ath12k: Support Uplink MUMIMO Trigger Stats
>>   wifi: ath12k: Support Received FSE Stats
>>
>> Roopni Devanathan (1):
>>   wifi: ath12k: Add API to print s8 arrays in HTT stats
>>
>>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
>>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 267 ++++++-
>>  2 files changed, 970 insertions(+), 33 deletions(-)
>>
>>
>> base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
>> prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
>> prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e
> 
> FYI this is not applying to my test tree. Strangely, you list two 2-patch
> dependencies but only have 2 prerequisite-patch-ids instead of 4.
> 
> I now have both "Rate and OFDMA Stats" and "AST and Puncture Stats" in the
> pending branch. Look for those to be merged, and then rebase on the main
> branch at that time.

Sure, Jeff. Now that the mentioned series are merged, I'll send out a v3.
 
> /jeff

