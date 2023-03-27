Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D3C7619A
	for <ath12k@archiver.kernel.org>; Mon, 27 Mar 2023 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdtH+hJV/eh5Osl9P8+KoZ4ZBVoyudwQEq9j4y73ryQ=; b=OOFg38Don+L1/V
	Lef7p3lMDI68Uf3F56BLFjPGS0k2sVEfw1bHcV5wbcAJxk2qGcynPB2QKJsfL0ncw89EzI+x+/ibg
	85qRaYXV7SLQ6jTAnWdVyRZSAFW0iCGBrkExw5vk1lCs1+HY1KjlmYlLyBi8P5yTNXUV85rUOKgRs
	Ng5/tluUFdX/NJYlym7XpTxTPTK6/Kn/foKkmAPCNPLQ/pW3mzTy+MOybZuvUlq7/bOJ7Qx5pXOH1
	AeMFMfG+d1//A90VMBXj6izTvbsPUNCrv5RINQFwN5GsqU8X+PIysUDygTmr2m64FimOayT8xOfdR
	+YJlkM38KuV/MBl30GWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgirj-00AQJ1-06
	for ath12k@archiver.kernel.org;
	Mon, 27 Mar 2023 09:10:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgirg-00AQI5-0n;
	Mon, 27 Mar 2023 09:10:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R40nFJ015017;
	Mon, 27 Mar 2023 09:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C+FboeoZ/bFE8+DOViTg+lZYffF8U9jm8mht5SIImDc=;
 b=CcOG537NYudKIFQWwoVsWD+HNMi9N4raZoLnoH3x92RXY8O2blb9dKOEUiunUHVK6YuJ
 pAE7ZIkZVutu3+gXYRHwPM35YPLLxeyShcONXaNUaMUYNfp5FwSh4SsAWdm/C2AMRUTm
 5V6Y9akXxMGEx0ACCBIlLekeGRcGXGgezhFfRAmAbVlUxATEMl0Rs1P2oqM3y8NoPdIM
 EefVXq0LihV6gwPVd3ZdmbguDvqHvme9mv4e1/mKgas4qqyQyA+uz7iZ/GQQF9LjSrTr
 +30az5BTWU16tTcf1enlhjLDlBm51F3jc17QI2a5STF7grI+Le4A7h4i2lPdpZ6u2Ak+ Gw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phte8btww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:10:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32R9A6u1023501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:10:06 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Mar
 2023 02:10:04 -0700
Message-ID: <baf27fe2-4702-fb8b-49f5-f5b1541c0d0e@quicinc.com>
Date: Mon, 27 Mar 2023 17:10:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
 <31b91fad-bd14-b6e1-8abe-fceb66085ecb@quicinc.com>
 <a20e39027ca0b89cae2259d35ff19d03c3c6951a.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <a20e39027ca0b89cae2259d35ff19d03c3c6951a.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9t0_hyFabZfktjVANHhH0jKQxVwHIkMq
X-Proofpoint-ORIG-GUID: 9t0_hyFabZfktjVANHhH0jKQxVwHIkMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=400 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_021008_403841_EA913B39 
X-CRM114-Status: GOOD (  15.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 3/27/2023 5:04 PM, Johannes Berg wrote:
> On Mon, 2023-03-27 at 16:40 +0800, Wen Gong wrote:
>>>>> +	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
>>>>> +		struct ieee80211_link_data *link;
>>>>> +
>>>>> +		link = sdata_dereference(sdata->link[link_id], sdata);
>>>>> +
>>>>> +		ret = ieee80211_link_use_channel(link, &link->conf->chandef,
>>>>> +						 IEEE80211_CHANCTX_SHARED);
>>>> For the 1st link of MLO connection/NON-MLO connetion, ieee80211_link_use_channel() is called before drv_change_sta_link(),
>>>> And now it is after drv_change_sta_link(), May I know is it also has some design here?
>>> Hmm, probably not really, at least I don't remember anything about that.
>>>
>>> Not sure it makes a huge difference? But I suppose we could change it, I
>>> don't really see why not either.
>> Not huge difference, I have made little change in lower-driver to match
>> that. So it is OK now.
> OK. Still maybe we should change it for consistency? I can try that
> later with our driver.
>
> johannes

I think it is not urgent for that:)

And lower-drvier should also handler different case.

>

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
