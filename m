Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C9BE7719A
	for <ath12k@archiver.kernel.org>; Sat, 11 Jan 2025 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phBm/zXx8cQ4rAo80BdajRgd+tCVQ4reg+jTZDHmAZ0=; b=j9RBGwQ6sTCG0OMiL7Px0Cqp65
	7Q8Cct2X/Tq7FEXButt/KXiYigSdEDpxjdexTx+NGULpxPBs209ObYHf+3oLEKgcAPa816xIEtoYg
	MWPkniOXE34vDZ/t/o2mCHrZ8dtbImpyCjlkcfGaFXxeaK0hOt+nhWy2bdBpO/meYiK6xKZnqDl1J
	DJGJ9GyRg3rXAa+NKCJGjOqgqeRCA6XETn4mIMrc9ppry6BTLoIvdXwTI5K1AhZ16Hyq9QnlRL1O1
	mix4nsjUWSOPv6Nyoh+NrTkcr3RGx3MyGrYhgBlglv0AI1ouAwPXzyEavL4Po3gLkhtlKgbqSxrHI
	BsGAGznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXOP-00000000TGd-1nOk
	for ath12k@archiver.kernel.org;
	Sat, 11 Jan 2025 09:02:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXOM-00000000TGE-23MH
	for ath12k@lists.infradead.org;
	Sat, 11 Jan 2025 09:02:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B7dTOC031896;
	Sat, 11 Jan 2025 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phBm/zXx8cQ4rAo80BdajRgd+tCVQ4reg+jTZDHmAZ0=; b=OKwBiy53rV3jcDB6
	QdbaE1TEBaThL6k3gm7lJfnEWRe3JC3w/nQrVkWbumSFVvrdhJyRr86y/qWEUbUp
	3JBeTElhLSImINqf5nGDKkEQ/eHQgr2tzx12YJjltIevKUw8QeoPHKJwd0C4vDhW
	KnGP+0jwRlJm99/U4SB1qOkyDVDiW8wDTos8d0tPaHv+YktWw7pT23/yo9k1UlIh
	/JqnZevdnGg34GTNqnIG5uOYVtP7Hfa8Dqmu2imF2O8lKIuY0AI7we8Z+0u9usiY
	rtp2eQooEarUIn+9aL2dFgNusdtc4dGrJh+UWzpowDQ66VVXR82+e5jkm6C1TcYL
	H+xdyQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443htgr9sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 09:02:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50B92m0E002724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 09:02:48 GMT
Received: from [10.50.23.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 Jan
 2025 01:02:46 -0800
Message-ID: <159a6ef4-2f4d-626e-9705-feb8fb3bfec6@quicinc.com>
Date: Sat, 11 Jan 2025 14:32:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/4] wifi: ath12k: Refactor ath12k_get_num_hw() helper
 function argument
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
 <20241217035920.2683568-4-quic_periyasa@quicinc.com>
 <8c756343-af71-4e8e-ae9f-6681159e90e9@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <8c756343-af71-4e8e-ae9f-6681159e90e9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dn92OqUhHdC3xyKJsNE1khVaqdrc1dVJ
X-Proofpoint-ORIG-GUID: Dn92OqUhHdC3xyKJsNE1khVaqdrc1dVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_010250_536016_DD68A0B6 
X-CRM114-Status: GOOD (  16.84  )
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



On 1/10/2025 9:42 PM, Jeff Johnson wrote:
> On 12/16/2024 7:59 PM, Karthikeyan Periyasamy wrote:
>> Currently, the ath12k_get_num_hw() helper function takes the device handle
>> as an argument. Here, the number of hardware is retrieved from the group
>> handle. Demanding the device handle from the caller is unnecessary since
>> in some cases the group handle is already available. Therefore, change this
>> helper function argument from the device handle to the group handle. This
>> also fixes the below Smatch static checker warning.
>>
>> Smatch warning:
>> ath12k_mac_destroy() error: we previously assumed 'ab' could be null
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
>> Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
>> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> ---
> 
> ...
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index 6b31e053d6da..f37a50f3eabb 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -1209,9 +1209,9 @@ static inline void ath12k_ag_set_ah(struct ath12k_hw_group *ag, int idx,
>>   	ag->ah[idx] = ah;
>>   }
>>   
>> -static inline int ath12k_get_num_hw(struct ath12k_base *ab)
>> +static inline int ath12k_get_num_hw(struct ath12k_hw_group *ag)
>>   {
>> -	return ab->ag->num_hw;
>> +	return ag->num_hw;
> 
> since there is no longer multiple indirection perhaps we should just get rid
> of this and directly use ag->num_hw at all call sites, especially given that
> there are already places that do this:
> 
> drivers/net/wireless/ath/ath12k/core.c: for (i = 0; i < ag->num_hw; i++) {
> drivers/net/wireless/ath/ath12k/mac.c:  for (i = 0; i < ag->num_hw; i++) {
> drivers/net/wireless/ath/ath12k/mac.c:  for (i = 0; i < ag->num_hw; i++) {
> 
Sure, will fix in the next version of the patch.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

