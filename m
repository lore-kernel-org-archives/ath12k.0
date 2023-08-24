Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DD8C3DA6F
	for <ath12k@archiver.kernel.org>; Thu, 24 Aug 2023 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvQy+pFNrBKfKXUbc7+dkaTFSQQMR3HErOC9ul9Thxk=; b=ifgG9Rh6RHJIIY
	DoQrotmDp+nmglGdydqZvaAQ2dpKjb/WBcPYWy0KZceNN9WaNIxgJtMgnSmaVZGWVq+89+QtZ3jI5
	BgdnOJePKZShX0oQ7uQOe4/1h2y5yk8LzNsPInhA4hWeuK5lHZx1/fZAQ57T/dIXNuoYApkUVzdk+
	mo3B9bnkKb3SwnJq2sEwc1V9FxXhzo40eBrxR4zWg9XllK5mk8L494/CjYVAc0o2xFFLNlSohsAvs
	2X71Q12ywcS6HM4SvMoSho8w6vIDPCoB9REn8lODyYQ78/hGNCHqfwP3D8UJnL5g3CHMtVJSJm0LN
	KuA9QaahGhQj7LZygc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ03E-001xsL-2N
	for ath12k@archiver.kernel.org;
	Thu, 24 Aug 2023 02:26:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ03B-001xrU-0n
	for ath12k@lists.infradead.org;
	Thu, 24 Aug 2023 02:26:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O1UFKV025158;
	Thu, 24 Aug 2023 02:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aNdtgVnyPdNHvAsrEU+7y4frtvGGc70j5dBulEvO9+k=;
 b=dH1FHGKLWTtu2s1G9FC3610RYDXDjRaEOCokBoOI6D79t7mlyuhxTX4Lwg2vfPMP906L
 zlqJfguzgHCcuJFx3YRVdlBkqrye+XC1Hl5d5yc7LPlIdtrEdDdVKwX0lAK/picXePzO
 8N/+8fIXfIZ8ivr4soRs5F05OE9mH21ZvdYVbcrSVKscoPJeNtW291QvdO+8eFnRrne2
 EodIsFOQVwXpUJeGTyk3wjL4H/9A9UO6zulhOJ/24XODZD5guCzwo+uECBancTyHzFjS
 ndBHSdqF2TiL7IhKiU/8xcAN1YsZHziVXEf6N218k/I0Y83uRA+Qt0C7AJsVCNT7uz0w 2g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn2exuby2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 02:26:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37O2Q8fg025802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 02:26:08 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 19:26:07 -0700
Message-ID: <1a193edc-23a8-6631-5beb-2020de489934@quicinc.com>
Date: Thu, 24 Aug 2023 10:26:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] wifi: mac80211: fix cfg80211_bss always hold when
 assoc response fail for MLO connection
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230822100409.1242-1-quic_wgong@quicinc.com>
 <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
 <bcf65017-0dbc-e957-f382-98c6dc406346@quicinc.com>
 <941b1bdb6852f20722fa3a5b01f546f054f9e8a8.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <941b1bdb6852f20722fa3a5b01f546f054f9e8a8.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v7hH1cNyCZZJZce6gmJk8vwwOpYa_518
X-Proofpoint-ORIG-GUID: v7hH1cNyCZZJZce6gmJk8vwwOpYa_518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_17,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=633
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_192621_446763_79B8955F 
X-CRM114-Status: GOOD (  16.00  )
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

On 8/23/2023 2:34 PM, Johannes Berg wrote:
> On Wed, 2023-08-23 at 10:28 +0800, Wen Gong wrote:
>>>                   /* need to have local link addresses for MLO connections */
>>>
>>>                   WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
>>>
>>> makes no sense anymore. Not sure if that's the only one.
>> After this patch, the cr.links[link_id].addr will be a valid local link
>> address from
>>
>> struct cfg80211_rx_assoc_resp, so I think it is not needed remove now.
> You don't understand.
>
> The issue is that it's set the line above.
>
>>                  cr.links[link_id].addr = data->links[link_id].addr;
>>                  /* need to have local link addresses for MLO connections */
>>                  WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
> But look at that! What values can cr.links[link_id].addr get? Note how
> it's a pointer - assigned from an array.

Oh, I know it now. the cr.links[link_id].addr will always NOT 0 because 
it is pointer

to an array "u8 addr[ETH_ALEN]" of struct cfg80211_rx_assoc_resp.

So maybe we can choose one of the 2 things to do:

1. remove the "WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);"

2. change like this:

WARN_ON(cr.ap_mld_addr && !is_valid_ether_addr(cr.links[link_id].addr));

What about your advise?

>
> johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
