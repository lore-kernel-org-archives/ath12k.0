Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE04FC4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra7+mEfUpCtR0s5cPk0OFG/Py5B9+cSpYZgM96IxNV4=; b=YsNfsLIEZA9nAiJWFANOaNQGHj
	bNz07HoKpTqMnETw46V2A3syX3YdnD6qUxnMor29zBaoLlwxsMgYejOPRLfDt0WOjIfwUEG7DoWwI
	6ba3Bh0XBgwOCT5ooFQI6MxB0lhWMQT7kYYv1cmyO0ylO3l5rZM5ZtXRWsxSKCnaflQwVOPdBqJOK
	v+sRj4oX435zKmkX+7nUqb2Wn8xsHUPdx5MnBa15HZNnjHkJ8Sy6MoKDAbw0ZNitybmKOcirCgihK
	7UtrlmFtRT2X+1Sbmbab9VYvzTVrX8yGHmUXj/4JeWmFhsPkAPXaSlyiPpcunTVYL783alGKZLc3U
	YqUQPLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIaB-00000000dVG-06is
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 16:01:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIa5-00000000dUT-1yjY
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 16:01:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N7uKGC007932;
	Tue, 23 Apr 2024 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ra7+mEfUpCtR0s5cPk0OFG/Py5B9+cSpYZgM96IxNV4=; b=Cr
	mphLDQMDYT+rLotkOvJzl603cl46EEv0GUUNyOPwOgONzOf9AiPA96CB2ClJEV32
	4qO1x1O1B5V5DbZkOcxScqIsoPkkjGLEt5cfaAQOWrgR7I+KLxdzp6JbX/Lyne8A
	Cf0BCM+LhmHMgIhi++5nMtrM0DVdzdAJS0Y7sWsiIFldnv5sZUeT4hb6o0GFTFJ+
	y+hnMPmmIRpEyhAGv2fdaFaMr5DHLppuiOZizNduF5bb6JN3i3jHNuCo/BofGFOV
	9vdACIp70eYK6ts2w/L81CDD19IxbfySdaVGpLerPaIW0u3pFSSi66x1FEFszJpg
	Z1VvxFdznF+nHznw2KSQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xp91fhdaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 16:01:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43NG1CqY007531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 16:01:12 GMT
Received: from [10.50.9.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 09:01:10 -0700
Message-ID: <d534ee27-0513-5c3b-b4a0-730a67fbf78a@quicinc.com>
Date: Tue, 23 Apr 2024 21:31:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 11/13] wifi: mac80211: Add multi-hardware support in the
 iface comb helper
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-12-quic_periyasa@quicinc.com>
 <ca70eeb3cdee1e8c3caee69db595bc8160eb4115.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <ca70eeb3cdee1e8c3caee69db595bc8160eb4115.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fEMo4wzjnc4vQ5BlJvJTI7q5plZHfMqh
X-Proofpoint-ORIG-GUID: fEMo4wzjnc4vQ5BlJvJTI7q5plZHfMqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_13,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404230037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_090117_684591_93810441 
X-CRM114-Status: GOOD (  23.44  )
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



On 3/28/2024 8:11 PM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>> From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
>>
>> Currently, iface combination param supports single physical hardware.
>> To support multi physical hardware, add hardware specific checks on the
>> channel context creation and populate hardware specific parameters from
>> the channel definition for which the interface combination need to check.
> 
> I haven't gone through this patch in detail, but again like on patch 9,
> I'm not so sure about the implementation of the XOR behaviour of
> checking global and per-HW limitations.
> 
> I probably wrote on the other patch that it seems it should check both,
> but I realize now that doesn't make sense: After all, the top-level
> combinations data must encode something that's supported _regardless_ of
> channels, so likely only a subset of the combinations supported across
> the different HW.
> 
> But that doesn't mean that I'm yet convinced that the design in patch 9
> is actually good, with how it checks that depending on the 'chandef'
> parameter. I'd like to explore other possibilities such as a different
> function for that, for example. It could use the same underlying helpers
> and mechanics, but it seems that might be better overall.
> 
> Or probably better yet: explore an approach where mac80211 doesn't even
> have to _know_ about the cfg80211_get_hw_idx_by_chan() and all that, but
> just prepares the information in a way that encodes enough data to
> handle that, which really means going from
> 
>   int num_different_channels;
>   int iftype_num[...];
> 
> to
> 
>   struct {
>     enum nl80211_iftype iftype;
>     u32 freq;
>   } interfaces[];
> 
> or something like that.
> 
> 
> I was almost going to write "links" instead of "interfaces" there, which
> reminds me that none of this really even works well for MLO yet. Not
> sure if that's better addressed as a separate first step?
> 

Sure, will post this change as a separate RFC patch.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

