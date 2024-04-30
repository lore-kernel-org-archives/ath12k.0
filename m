Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D9CC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itCVjzPEn+z50JYv9lu9ni7TOGaTKiRdbCvkVPoKtMQ=; b=BC2b7WrIzwzbXuVtxSfzemo5EE
	WcJMoesqRgE93lSE1dPfqUkrXagAztlDKtA4xJ0FzJDsNep5AyS6WZBe+EZ7MWGjwIGxxE2/GkvUK
	SA5bnlq/tQNmy81oI7/c8ps9i0CezvESDDbm5ebp1aCipcIGAh9Gnkmq/v6vWdD9ljTbk07ZPGQkJ
	m23M/mqTfiKkG6HAO4ipD7+opEf3IlEo8o+HbX+qqmU6Z1eEwFnHDbia2sapbN79+q9rG2sdFGOB0
	JuYAiBt2jSXEbWRsGrFReHX6VUaZRVj/fYCcNf4xScoJfWpPoYB90UZu7YeO0q1x9wX8IZ5cWDCW8
	/XjRizVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1q9h-00000007BH4-3HXu
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 16:16:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1q9e-00000007BFA-2ACA
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 16:16:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U9WwoX026906;
	Tue, 30 Apr 2024 16:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=itCVjzPEn+z50JYv9lu9ni7TOGaTKiRdbCvkVPoKtMQ=; b=LI
	YMq58ClXZaakx2Vatct2UuRh2pzrul6QKjC3Qag4w1usjhbwtOm0qFHekQSzy2i2
	7HN7aYEwragqxlKHpGUG1HskIshN9EAQo1M7XJQwNYNHlrq8CVX97Eh58NJiEtwv
	SoZFfcHAhIOZSPyRcXeoOlm0ymq0kr7CuKsHamy2/ijUcawXhDtZ5j5cm/uO4c8n
	8kZ11zqyVLu4M/cYCW5wicom/iD/e+EsJoIaLfz7uVZ0dy7gPJSc0bZPP21CLsoo
	aOtA2moDxm8sWc8DJbxXsMXy+8qORkA8ZosLtG9YHnIlyD13Do68r+qI93twWOMh
	1s2Za/6yOA1P0x2fFFlw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtv1hsbx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:16:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UGGSNB030483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:16:28 GMT
Received: from [10.50.19.250] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 09:16:26 -0700
Message-ID: <57fe6ced-4ebe-c48d-5ec3-430818eb4e2d@quicinc.com>
Date: Tue, 30 Apr 2024 21:46:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] wifi: ath12k: Add multi device support for WBM idle
 ring buffer setup
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430054759.722620-1-quic_periyasa@quicinc.com>
 <3a42a9fb-8528-41fd-8c34-f2d9e13bc1dd@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <3a42a9fb-8528-41fd-8c34-f2d9e13bc1dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9L_0JQBxHfmdnPrzvguQo-a6WAKEcee7
X-Proofpoint-ORIG-GUID: 9L_0JQBxHfmdnPrzvguQo-a6WAKEcee7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_09,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_091630_583145_50B03EE8 
X-CRM114-Status: GOOD (  12.24  )
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



On 4/30/2024 9:38 PM, Jeff Johnson wrote:
> On 4/29/2024 10:47 PM, Karthikeyan Periyasamy wrote:
>> Refactor the WBM idle ring buffer setup to scalable for inter device
>> multi-link operation.
>>
>> Note: This patchset rebased on top of below patch series
>>   [PATCH v2 0/8] wifi: ath12k: Introduce device group abstraction
>>   Link: https://lore.kernel.org/all/20240425055759.1181165-1-quic_hprem@quicinc.com/
>>
>> Karthikeyan Periyasamy (4):
>>    wifi: ath12k: Replace "chip" with "device" in hal Rx return buffer
>>      manager
>>    wifi: ath12k: Refactor idle ring descriptor setup
>>    wifi: ath12k: use device index to advertise MLO parameter
>>    wifi: ath12k: add multi device support for WBM idle ring buffer setup
>>
>>   drivers/net/wireless/ath/ath12k/core.c  | 10 +++++++++
>>   drivers/net/wireless/ath/ath12k/dp.c    | 27 ++++++++++++++++++++++---
>>   drivers/net/wireless/ath/ath12k/dp.h    |  1 +
>>   drivers/net/wireless/ath/ath12k/dp_rx.c |  5 +++--
>>   drivers/net/wireless/ath/ath12k/hal.c   |  5 +++--
>>   drivers/net/wireless/ath/ath12k/hal.h   | 21 ++++++++++---------
>>   drivers/net/wireless/ath/ath12k/qmi.c   |  4 ++--
>>   7 files changed, 54 insertions(+), 19 deletions(-)
>>
>>
>> base-commit: 861928281f22a08e3d258ebcfe7159d729ec07d4
>> prerequisite-patch-id: 4bc84a4f5b10ebc28db60c5167abdaf343a1619d
>> prerequisite-patch-id: ea87d2f46dbd5e7c82d5df02934906e219aa8388
>> prerequisite-patch-id: e08d8632dcde9e891d37b538832b4ecfed140d9e
>> prerequisite-patch-id: bc2c9455c9175c27b8b68f6f41d468b258007478
>> prerequisite-patch-id: 00966c65589af8a50078fea94630cbe355f0dacf
>> prerequisite-patch-id: 4bd8ce903cd89ae536109922f65f128ed1d4307c
>> prerequisite-patch-id: 54fe8eb540a77804c8befeb695b61756c133b56f
>> prerequisite-patch-id: 06244ca08d9bed3834dc5315470a19d096d749ee
>> prerequisite-patch-id: 8e7575808b1c498d81b606777153e0e2d4ee99bd
>> prerequisite-patch-id: 1baa4ce64b2054e82e117cfbe29f85870def37c7
>> prerequisite-patch-id: 733cb4a1e0d02079820d8306a3da88fe2d35b06c
> 
> My automation can't test this series since git reports:
> fatal: bad object 861928281f22a08e3d258ebcfe7159d729ec07d4
> 
> Also note that the "device group abstraction" series itself has dependencies.
> 
> Using a base that isn't visible in the upstream ath.git is not helpful
> 

Looks like "device group abstraction" patch is block due to warning call 
trace. Shall i remove the dependency and make the "device group 
abstraction" patch depend on this series ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

