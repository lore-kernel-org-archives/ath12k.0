Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042C7CD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 03:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIZO+JM0tRzuRXMFjzVNmKdCZ2orh2fS0O/Ew36WWZw=; b=e+8f8pZ9KMVAhAZMiMkCo1rQ0R
	cBxAgBw4//qsQfGIX1TEUBPz+Hl2G/LqLndlyKGX38BoL03mZ8/1dTar6M6mMo8SotmUlxr39KOUH
	26dhiojlNayuDMj6qh1WpPOkcUtYYNMZEM4Rs9KfEimTJcEaubkvLhpBAGudnUkkNEO4i8xSjQWjB
	/mcV1DW9BfNGGnsAhiOmo4cdh+GpqlsjWOW/np0I/ZLXYw/z3CbZhdPwwpxWrzUoHwV901KkYwh5c
	gtucLtmK4J+Yg9lUwP49qp4NkOxNOW4gc2Gqyf4mLHDdLipm7uwrFLFU0cOrZn07IKiK07CxNiGJS
	96BVeYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrRP-0000000Dng4-2eN4
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 03:37:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrRM-0000000DnfV-0VfJ
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 03:37:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432MolCN007114;
	Wed, 3 Apr 2024 03:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sIZO+JM0tRzuRXMFjzVNmKdCZ2orh2fS0O/Ew36WWZw=; b=MY
	/AL7d9nz8FAv0D4fRk2pJboneoUwJH4O8hqOLo3Eu+eFUCf7EWC+399aY6zueA6+
	Us4lLoS5pAtyVpcboal9r0D9+xNib9vOYWTJKZ02BmrY2KBqbRJXSPZ0cDkcXfgw
	7oQ4Eh1w9LOPqy57IOBp6cSl7A1ZtE0nqRus3Tk9a2UGGVhn9EC5gkju6/k4C0Wu
	egaYcK5TjHwy3unQ11ZVyPUlgeYnXon1kMU5dBEZz86xWolmLyDzj8+QsPKP0+Ax
	/qOtY6g8wh/QUO30ySsjotYUv5n+tYmhQtH9DD4j2SbNz1EuJUXKjwjqr8Yd+ACb
	6RhSRszqRag8IKYMZv8A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8gn5j5sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 03:37:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4333bTqc012325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 03:37:29 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 20:37:27 -0700
Message-ID: <31f9de9c-ee20-404c-c645-b7ce8b2fff99@quicinc.com>
Date: Wed, 3 Apr 2024 09:07:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] wifi: ath12k: extend the link capable flag
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
 <20240329012358.2242354-2-quic_periyasa@quicinc.com>
 <f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
 <ebeb7fa3-f0d1-230a-80bc-0877fdab7e62@quicinc.com>
 <6dac32c7-a2b2-4ac3-9c1f-b02f612ee3ef@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <6dac32c7-a2b2-4ac3-9c1f-b02f612ee3ef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Aw_DdDv781l7bsdtaw7Go1mtgBIPSWWr
X-Proofpoint-ORIG-GUID: Aw_DdDv781l7bsdtaw7Go1mtgBIPSWWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=733
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_203732_316227_120706A9 
X-CRM114-Status: GOOD (  14.57  )
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



On 4/2/2024 11:11 PM, Jeff Johnson wrote:
> On 4/2/2024 2:32 AM, Karthikeyan Periyasamy wrote:
>>
>>
>> On 4/1/2024 10:24 PM, Jeff Johnson wrote:
>>> On 3/28/2024 6:23 PM, Karthikeyan Periyasamy wrote:
>>>> Link capability categorized as Single Link Operation (SLO) and Multi Link
>>>> Operation (MLO).
>>>>
>>>> 	* Intra-chip SLO/MLO refers to links present within a chip
>>>> 	* Inter-chip SLO/MLO refers to links present across multiple chips
>>>
>>> Is "chip" the correct term?
>>>
>>> I'm thinking that this should be called "device" since that is the unit of
>>> hardware that is detected by a bus probe function and which is handled by a
>>> *device* driver.
>>>
>>> Doesn't this make more sense if the references to chip and SoC are changed to
>>> device?
>>>
>>
>> In the QMI, SLO/MLO parameter exposed as chip only not device. So
>> followed the same terminology to avoid confusion for code readability.
>>
>> struct wlfw_host_mlo_chip_info_s_v01 {
>>           u8 chip_id;
>>           u8 num_local_links;
>>           u8 hw_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
>>           u8 valid_mlo_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
>> };
>>
>> struct qmi_wlanfw_host_cap_req_msg_v01 {
>>
>> ...
>>
>> u8 mlo_num_chips;
>>
>> u8 mlo_chip_info_valid;
>>
>> struct wlfw_host_mlo_chip_info_s_v01
>> mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>>
>> ...
>>
>> }
>>
> 
> Please don't let firmware interface naming drive host driver code naming.
> And push back on the firmware team when they've introduced poor naming.
> 
> As many Software Engineering experts stress, naming is probably the single
> most important thing we do. So we need to make sure we are using the correct
> names for all of the software objects that comprise the driver, especially
> with this multi-device MLO feature where we now have to represent a multitude
> of individual devices as a single logical wiphy.
> 
> Lack of a single common term for each object in the architecture makes the
> code far less maintainable.
> 

Sure, will address this comment in the next version of the patch.


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

