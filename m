Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A84C021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NicJPxFZVFMslzB4MjZKlpt7ZkRqlSicXMOAsPiZtrw=; b=P6oKqxPcFJz6/rKB5tRsXB4rqb
	Om7Z6FhQ9CQg4I4O6FH5NFatU0K+XEQgm/Iqo0WzUWrxvt6xT/R9/aig1lPOXLbTKafHBXsjnrdQp
	Twp92nopWEofZflnDidHxZnH9AU0rc2S2TKAbv2QXwyFl0UgO/bc7osilGKLtW+NhTNin1tDR8rGO
	XOxQBklWjClG7feCThowXDm7mAtgJGCRNJrfFWDHcEDXIawLRlInEkkkoHQXZ5nChEr/xskjzIMIn
	w+Ih1QIgp53Ln3K6GEXfMExJF3QBM6cbp2UgGT/hOotk/riOA/2k1G5CgErix+oRh8rSUMc5vKi9j
	1sVCubWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknqn-0000000E5oZ-24Ua
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 17:27:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknqk-0000000E5nh-4B1A
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 17:27:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGjENa031904;
	Wed, 19 Feb 2025 17:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NicJPxFZVFMslzB4MjZKlpt7ZkRqlSicXMOAsPiZtrw=; b=CgZxCEa7e4Kf35G/
	PqBfVCvESSZuIyCcuoY+lwASTDH/eYpidalEXydaWCPSzDZzA55AgUQ9LJsH/MPn
	UFRCmT5daloHIc/yfsFvhBlx7slUgvuJK9xbK3gVCMuRSYBoaJm/x2YrnrUmGvRL
	Q5MaZVkIf8sMyIijTlY6ARiLBZNNvd2ce6+aBcvHhsPZjTI9psy8Ab2hskPEifUa
	4yC9Vv/zUB2UHU9e/Jr/OnGKwFWqiqJSsocVxnnojS8+/Cl1ePCvKINnUVRcE3Pl
	ZQU1neCZxSnE3gLQb/pUM5oOOEcXs7XahSCVRidPNGS4FdzWKgXaghE3VKGQu1xU
	zgOuIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5bec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 17:27:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JHR39H013534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 17:27:03 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 09:27:03 -0800
Message-ID: <5618e86b-88d7-48e7-aeb9-5c4feabf04a3@quicinc.com>
Date: Wed, 19 Feb 2025 09:27:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] wifi: ath12k: add 6 GHz params in peer assoc
 command
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Avula Sri Charan
	<quic_asrichar@quicinc.com>
References: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
 <20240508173655.22191-5-quic_pradeepc@quicinc.com>
 <600e45a74fc3ca1bedc12c273a84966fdfa3d908.camel@freebox.fr>
 <62873a7f-d62a-4594-a7f8-c29e1df0aa30@quicinc.com>
Content-Language: en-US
In-Reply-To: <62873a7f-d62a-4594-a7f8-c29e1df0aa30@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SuOucCGuPbmPkFkNXgoEO-3Pnu6JfTy2
X-Proofpoint-GUID: SuOucCGuPbmPkFkNXgoEO-3Pnu6JfTy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_092707_146303_24F9302B 
X-CRM114-Status: GOOD (  17.03  )
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



On 2/12/2025 6:05 PM, Pradeep Kumar Chitrapu wrote:
> 
> 
> On 1/23/2025 3:35 AM, Maxime Bizon wrote:
>>
>> On Wed, 2024-05-08 at 10:36 -0700, Pradeep Kumar Chitrapu wrote:
>>
>> Hello,
>>
>> This patch has been merged, but there may be a bug here:
>>
>>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
>>> +               arg->bw_40 = true;
>>> +
>>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_80)
>>> +               arg->bw_80 = true;
>>> +
>>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160)
>>> +               arg->bw_160 = true;
>>> +
>>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_320)
>>> +               arg->bw_320 = true;
>>> +
>>
>>
>> Downstream driver does this instead:
>>
>> if (sta->deflink.bandwidth >= IEEE80211_STA_RX_BW_40)
>>     arg->bw_40  = true
>> [...]
>>
>>
>> So for a 320Mhz STA, bw_40/80/160/320 are set, resulting in multiple
>> bits WMI_PEER_xxxMHZ set the associated WMI command.
>>
>> Which one is correct ?
>>
>> (This is for EHT, but the same applies for VHT/HE code)
>>
> Hi Maxime,
> 
> I noticed that currently only one of the bandwidth flags is set in the 
> driver. I am inquiring with the firmware team to determine if we need to 
> set multiple flags from the driver. I will update you soon and, if 
> required, will post the next revision.
> 
> Thanks
> Pradeep
> 
Hi Maxime,

Currently, the firmware sets all lower bandwidth flags based on the 
highest bandwidth set. While there is no harm in setting all bandwidth 
flags, this may not be mandatory. Please let me know your thoughts.

Thanks,
Pradeep

