Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0935DC25B78
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZKMFLv2/uWBoJL9opmL++HtiEmi5Sfi5xujSRujoyI=; b=qKK0W3UhQkn0LDt35n9wOAl2S8
	VjgThuWBIfYMWMjnGAZGoGVv0L0aSeMNJP0eA/s4HaKi7yRifNw3Rttf5EsudaBr8ePACemNlwa7W
	GWBJHYSCfGwHJH42Vcvuglrk0SZ8muUcianXyI2lvo0ki8CV2ZnNnSpGiDwhORPq/iORJIlvoKFdv
	mNck/MJkJNlPZi2dAAWc3IsW8r91RGuRWALWa8JDA3dDjd1MCdNja0oJQyfaL0PI1mFMhKbBiL4gR
	tYdkgTWHi7+d1peGQ7Z3NYqLPgo+NbycKJCV3wHNkn1uXizez0K0RujqBZUa6+rX5KsWpFVnt0Lio
	w7q0mAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6gdr-0000000Eg2B-2R4V
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 01:07:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6gdo-0000000Eg04-2IoF
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 01:07:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8UDl020184;
	Tue, 14 May 2024 01:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RZKMFLv2/uWBoJL9opmL++HtiEmi5Sfi5xujSRujoyI=; b=gU
	2GwGKjieW1tvyk9E7we2uNVhVYAO8P0FNcNTcXW0kon22t50O4RN1kJC4ZME5aIE
	cmXMaNmSpoWh6WVd/zOej/kJWBibFRaWwsUa85RpfqN7jPaw3xbEIOVg/g5AMcxy
	jbaveZeurcDvZ7a16mETAMosZOemZ2LnN3goiIuGjBG5xgQenvrssyd71bEub1Ya
	p0jFg8gO/yQAsIvvd9skCw5cB9rrV0A0FgR/nVMPIoIMdsUHNnwXbPsYo/RMIxAf
	uRMS5QXAI99jjk8hHF0OVo5Ez1CDZEP60s91MuxZBb2Gyy/izZobRwJuiQd3OQ7w
	M5LNxNg53MxkTSqUcymA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21y7vurm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:07:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E17YuK013617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:07:34 GMT
Received: from [10.50.45.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 18:07:32 -0700
Message-ID: <23354bb4-4d12-da14-1764-ea71ab05ff45@quicinc.com>
Date: Tue, 14 May 2024 06:37:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] wifi: ath12k: use correct MAX_RADIOS
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
 <20240511013644.3103905-3-quic_periyasa@quicinc.com>
 <7916534b-ee14-4b95-b339-d614ce9393f1@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <7916534b-ee14-4b95-b339-d614ce9393f1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b80ZGCVYLC-_Tn2IkhnMKjuenfQfsAfG
X-Proofpoint-GUID: b80ZGCVYLC-_Tn2IkhnMKjuenfQfsAfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_180740_619892_CC5B33CD 
X-CRM114-Status: GOOD (  14.61  )
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



On 5/14/2024 5:01 AM, Jeff Johnson wrote:
> On 5/10/2024 6:36 PM, Karthikeyan Periyasamy wrote:
>> The current value of the MAX_RADIOS define is 3. However, this value is
>> incorrect as the maximum number of radios supported by all devices does
>> not exceed 2. Therefore, the MAX_RADIOS define should be modified to 2.
> 
> Use imperative tense: Therefore, modify ...
> 

Sure, will modify in the next version.

> What is the observed problem, if any, with the current code?
> 

No problem observed but it leads to unnecessary space allocated for the 
hw links in the group and also it gives incorrect perspective to the 
code reader that ath12k support max three radio platform.

>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
>> index 496866673aea..27bec3800bff 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
>> @@ -4770,7 +4770,7 @@ struct wmi_probe_tmpl_cmd {
>>   	__le32 buf_len;
>>   } __packed;
>>   
>> -#define MAX_RADIOS 3
>> +#define MAX_RADIOS 2
>>   
>>   #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
>>   #define WMI_SEND_TIMEOUT_HZ (3 * HZ)
> 

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

