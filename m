Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E97C5320E
	for <ath12k@archiver.kernel.org>; Tue, 20 Aug 2024 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUUu3/LgBbpk1ls9AUySCWtQ1z70m6qQaGrI2yCsiOQ=; b=uoQ0P9bXvRiz+Muxt5U+cusoEl
	soYuYITkov87/i0sJciGPUXzjXu2CnonK2Ig0LW2rPnacej89jobSwfS+a0VILY8Ihmkm7B6WgMgP
	pb0x5v4OVzFKO2xLKABEMWH2Qp+sYTVM7LnZYpPxYiXQo3j8wnJ/syEal8KFhrwqlq5+eaXNIZKNf
	EOAKfylXybm8hFfcweVde0IrmaQ2mr0dvicuEgEbjbGh9QtpqwyA9jltVQgyvVHMbw2n7kIpKlyQY
	x+Oa5m/xLc0u0xUAjwKxgChrf66CRnt9gXNg9chHCmmQ6xu2R7Ffpami9ub1FCfCVhHJ9tepmaCBO
	lYbOJ6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJDP-00000004BCU-1eeE
	for ath12k@archiver.kernel.org;
	Tue, 20 Aug 2024 07:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJDM-00000004BBq-20Z0
	for ath12k@lists.infradead.org;
	Tue, 20 Aug 2024 07:23:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLUHkD016482;
	Tue, 20 Aug 2024 07:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUUu3/LgBbpk1ls9AUySCWtQ1z70m6qQaGrI2yCsiOQ=; b=VoeQVIAGxjjAKl64
	MLKXXv5Wq4kwAGw1thL0R96Q7dMEKSCyIpB73w2I6BMswxE9mGhAlngZH9My5vOz
	DMjDmvSVlS27U33YRKHuxqJbzYCtMWRWfoB3CMTDicTE1FowHSgKllNitj4rPddO
	uiaAVuR+//CaK7BF04cuDMSE3nRB9HNXcyxy/H5BfBUxdfgyrFsQNCciK95KkZow
	LNuyM8g1UAHvoOlNPe0kEqPAWpVyTJevwxCFVfhCrigtX0qbsU0fyPSlcvNLDQ8T
	hLJj5eobYwQFfmRwy4H6CFHhV/IBxXVHJhkXRIO7AaYlcYwy75Bbprie6YVHOde/
	dTSZuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412key6uxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:23:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K7NSTq029862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:23:28 GMT
Received: from [10.110.115.95] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 00:23:26 -0700
Message-ID: <70f66fa2-ff63-420b-9548-8d6e9df9b1d9@quicinc.com>
Date: Tue, 20 Aug 2024 15:23:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN7851 and QCN9274 monitor mode not working
To: david Atkins <david@3adesign.co.uk>,
        Florian Schmidt
	<florian.schmidt@ellisys.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <a92fb3ec6dabea4445a8a4d3fe136b1d@mail.infomaniak.com>
 <7d2761d9-3bb9-4e77-9292-b64a32a4c5a5@quicinc.com>
 <LO0P123MB4057DF53753AF14330DFBBC5D68D2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <LO0P123MB4057DF53753AF14330DFBBC5D68D2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kCEaw82l6WYxdMEp0IHKFt5r6__XnZzL
X-Proofpoint-GUID: kCEaw82l6WYxdMEp0IHKFt5r6__XnZzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=874 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_002336_681326_C1D5CE4F 
X-CRM114-Status: GOOD (  14.29  )
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



On 8/20/2024 2:44 PM, david Atkins wrote:
>>
>> On 8/19/2024 5:14 PM, Florian Schmidt wrote:
>>> Hi,
>>>
>>> I am trying to use ath12k in monitor mode with cards WCN7851 and
>> QCN9274 without success.
>>>
>>> When switching the interface to monitor, iw always fail with the following
>> response:
>>> command failed: Operation not supported (-95)
>>>
>>> But ''iw phy show’’ reports that the interface support monitor mode.
>>
>> This flag is set by mac80211 in ieee80211_register_hw():
>>
>> /* mac80211 always supports monitor */
>> hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);
>>
>> Our upstream code currently doesn't support it yet.
>>
>>>
>>> I tried with many kernels, using todays firmware from the ath12k-firmware
>> repository, the 6.10.5 kernel and the ath-pending kernel and always get the
>> same result.
>>>
>>> Is there any way to get monitor mode to work on Qualcom WiFi 7 chips?
>>
>> No, we haven't upstream related patch-set yet.
>>
>> Indeed we have some patch-sets under review now.
>>
>> Not sure when we can upstream all of them.
>>
>>
>>>
>>> Thank you.
>>>
>>
> 
> 
> Is there anyway we can build from these patch sets, are they on a branch of repo we can pull from?

No, even half of them haven't under review yet.

Only very few changes have been merged into the master branch.


> 
> David
> 


