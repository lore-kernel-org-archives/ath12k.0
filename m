Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF71C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZByaWQeIkVQvOslxzQROCbMlvuJnPM5R+cAjqRX9N0=; b=B6PE+OG41aLIRGieQ4YljkhTgD
	GAQ9AlVOiZKi8xPKcEEN/ATnWBOmRgzAB3VVIm6YHBMioLrc/fMTC25t16lhX4IowIPMnr2LJPew1
	LOxsBJb+UVW563d4UNxtUqitGhlQsthKgJLBpn2erdj1noNdLlyFDI14J7rNYwOSCiGj0Q2WMyXLA
	5+CWk1nQhdKk2eIpqxNTeYj6ptwQU1VSJNEbfnsFHTVGqNN4Ns+gJ+sgkSfSdx/RAUh3ryi3zqSz7
	dVTjHqVKw8tncYwrl+GU1K8oc88nQrBtQLqDSpeTbSyDJdBZr5iDV0HEwIVo08JMTdaubGD+Y/zki
	lUgP1VBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmpr-0000000DWtr-1fDo
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 10:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmpo-0000000DWr6-074W
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 10:18:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SAA29D009447;
	Thu, 28 Mar 2024 10:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cZByaWQeIkVQvOslxzQROCbMlvuJnPM5R+cAjqRX9N0=; b=My
	s3obwDJxqNnaOMEfEK6qGN6dpSspeVbmFle9C9rd0zfuU2CpRz430LIGRI3vtZo5
	7VMRQ4teIQshkaPDQxbYVqArFK8aaNvk7UtGzUFBpyQsoqgcSsxjvzjrW5tUi+Xb
	zheHU5jX+RJV9a25siikZsuzuDKHmMk7H3ydCOp+uv2vYSn8V6OjxqWltpcf+jr8
	vIluLWcZMIv8yYnxgC/xlE/6/DwH5/9BhphfPK7x8V1fThLbrXNnppjxHlKlmre8
	DjTxARERBqaYiVKEgrCDX9ZM9ooZhN/oGU4obnxQJkDv6HiiIBOXHngeSUcscED8
	VPDFUsY0JCvo7hpieAmA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4u1wtvvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 10:18:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SAI9tQ027123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 10:18:09 GMT
Received: from [10.201.201.124] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 03:18:07 -0700
Message-ID: <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
Date: Thu, 28 Mar 2024 15:48:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LLfTP08jjiV0rIY0uP6W59zScFke5kZk
X-Proofpoint-GUID: LLfTP08jjiV0rIY0uP6W59zScFke5kZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_10,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403280069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_031812_095614_F480E6C0 
X-CRM114-Status: GOOD (  16.75  )
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


On 3/28/2024 1:19 PM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>> +/**
>> + * nl80211_multi_hw_attrs - multi-hw attributes
>> + *
>> + * @NL80211_MULTI_HW_ATTR_INVALID: invalid
>> + * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the underlying HW
>> + *	for which the supported channel list is advertised. Internally refer
>> + *	the index of the wiphy's @hw_chans array.
> Is there a good reason to expose this? Seems pretty internal to me, and
> not sure what userspace would do with it?

Hostapd use this hw index for the channel switch cmd.

The hw index used as a sanity check to identify whether the user 
requested channel fall under the different hw or not.

In split-phy hardware, 5GHz band supported by two physical hardware's. 
First supports 5GHz Low band and second supports 5GHz High band.

In this case, user space cannot use band vise check here to identify 
given channel or freq supported in the given hardware.


>> +	for (i = 0; i < wiphy->num_hw; i++) {
>> +		hw_mac = nla_nest_start(msg, i + 1);
> And you kind of even have it here already ...

Then user and kernel have to make an assumption that implicit index used 
in the life cycle.


>
>> @@ -3001,6 +3042,12 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
>>   				rdev->wiphy.hw_timestamp_max_peers))
>>   			goto nla_put_failure;
>>   
>> +		state->split_start++;
>> +		break;
>> +	case 17:
>> +		if (nl80211_put_multi_hw_support(&rdev->wiphy, msg))
>> +			goto nla_put_failure;
>>
> This could be (or get) pretty big, are you sure it's not needed to push
> the splitting down into it?

ok, can do the advertise for split.


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


