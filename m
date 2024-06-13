Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE3AC27C4F
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 19:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upQgT8P20mZATnR5JEfmI8BYfTGq3iAmLUZx9tflOdE=; b=0n3bB+ITibsIXoqLArewgumk8c
	qXuNekRcz1Dm0HY7E6zG/3utBHJnJCu6FsXzzS1k4DZ/roKd6gDIQcuOBIMxjwOA+FbkLI/bS7f6W
	rvQ0SGiD0txmFHxh6q4eXNe0xud5HmjJbJg2Ntzde0Sg5YJoQWlZYwO6WKBNUSme53mKM0SSP9sH8
	vwzz2/5bWN4paPWwxK5oBahHJ3Yv7Mym6H/ufWynLV0wQkVb/3xS9/KlDmgWC31EepNz3Me+HQIUM
	OJr8ojfJlQ3XqkDVZ1olEycXVx6Oa5dz35P/5/hDekkTy3W/ZHoplvMyGftp6EjS4xVAWVrJe4AC5
	YWqf3jeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpgC-00000000BAC-0qce
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 19:00:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpg4-00000000B5u-1MVv
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 19:00:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DItYKX025163;
	Thu, 13 Jun 2024 19:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upQgT8P20mZATnR5JEfmI8BYfTGq3iAmLUZx9tflOdE=; b=me5Msm5v0zZrpQyM
	WlANJoAguu85CxZ92Kmk+Ds+rZJTWH6O+onvjvO7kHU3YCLJTfXZGcOlLbqL+RaO
	H3WdEqyYFBBrjhlWRg3HdHNxoR85xMHfXgFR30tWQWYT8IuvBMsl76rnGJ2beAAK
	SKKCOTN0xSpS4k7vyxSE8aRtMlR6r0VH2PNS+BI/H+VKGPzqAMvLhLkpEKaAE47m
	B1UghzdNSxu3fXY9m9acFyDFrUzHdJURu8OGJ3PZYwQi91nvfaG6mqooKyHcJBZq
	oj6WiGVFTgD0QA7IKmSM/lc4HMCgel7ki1ZfUngSuUwqLYwpTAEWLUEIdvshtEwj
	b8iXIA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6fbr0bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 19:00:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DJ01Bi001656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 19:00:01 GMT
Received: from [10.110.103.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 12:00:00 -0700
Message-ID: <a7921a28-6f36-40b4-9d56-284b2c2684a6@quicinc.com>
Date: Thu, 13 Jun 2024 11:59:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix legacy peer association due to missing
 HT or 6 GHz capabilities
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>,
        Zachary Smith <dr.z.smith@gmail.com>
References: <20240612225336.2303119-1-quic_pradeepc@quicinc.com>
 <760d99d1-c709-43b5-9d15-c2a0fef98b66@quicinc.com>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <760d99d1-c709-43b5-9d15-c2a0fef98b66@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pRyuQGM8xdCurD6cDvj3vs4pwnkyjIsE
X-Proofpoint-ORIG-GUID: pRyuQGM8xdCurD6cDvj3vs4pwnkyjIsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_11,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_120004_449988_4CF551CE 
X-CRM114-Status: GOOD (  16.27  )
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



On 6/13/2024 8:42 AM, Jeff Johnson wrote:
> On 6/12/2024 3:53 PM, Pradeep Kumar Chitrapu wrote:
>> Currently SMPS configuration failed when the Information
>> Elements (IEs) did not contain HT or 6 GHz capabilities. This
>> caused legacy peer association to fail as legacy peers do not
>> have HT or 6 GHz capabilities. Fix this by not returning an
>> error when SMPS configuration fails due to the absence of HT
>> or 6 GHz capabilities.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: f0e61dc7ecf9 ("wifi: ath12k: refactor SMPS configuration")
>> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> 
> Per checkpatch:
> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> #17:
> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> 
> Is there a separate public bug report from Aditya?
Hi Jeff,
No, this was internal report and does not have weblink associated with 
it. Also, do not want to ignore reportee.

Thanks
Pradeep
> 
>> Reported-by: Zachary Smith <dr.z.smith@gmail.com>
>> Closes: https://lore.kernel.org/all/CAM=znoFPcXrn5GhDmDmo50Syic3-hXpWvD+vkv8KX5o_ZTo8kQ@mail.gmail.com/
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 2259ce22cc8b..fa9f6656a06f 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -2255,9 +2255,6 @@ static int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
>>   				     const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
>>   				     int *smps)
>>   {
>> -	if (!ht_cap->ht_supported && !he_6ghz_capa->capa)
>> -		return -EOPNOTSUPP;
>> -
>>   	if (ht_cap->ht_supported)
>>   		*smps = u16_get_bits(ht_cap->cap, IEEE80211_HT_CAP_SM_PS);
>>   	else
>> @@ -2277,6 +2274,9 @@ static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
>>   	const struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
>>   	int smps;
>>   
>> +	if (!ht_cap->ht_supported && !he_6ghz_capa->capa)
>> +		return;
>> +
>>   	if (ath12k_get_smps_from_capa(ht_cap, he_6ghz_capa, &smps))
>>   		return;
>>   
>> @@ -2756,6 +2756,9 @@ static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_vif *arvif,
>>   {
>>   	int smps, ret = 0;
>>   
>> +	if (!ht_cap->ht_supported && !he_6ghz_capa)
>> +		return 0;
>> +
>>   	ret = ath12k_get_smps_from_capa(ht_cap, he_6ghz_capa, &smps);
>>   	if (ret < 0)
>>   		return ret;
>>
>> base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39
> 

