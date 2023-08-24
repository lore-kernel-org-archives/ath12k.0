Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8FCC3DA6F
	for <ath12k@archiver.kernel.org>; Thu, 24 Aug 2023 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pq443JsD2MyIfanWnV3B535xL1wiZMgOVNpeuyKjgK0=; b=vXQt0XNO8QQk41
	HNkt5sRd/IJ3bGT/H79l1bFxK5DHApS1e8YIuNnvg6QrXsxIvuXSM5q+t6fb3k1qx9JS//30fNFYu
	VN/ngSysOWCnJOBmIvhcXYrSN9hY64ERAEpk/BXjSw9FyT7QmmgwURdYzPn8L2ZbrX10Qol53oxne
	4IMCkns+RUnmkiixQJkLLW7ADp9mU6OHSKaQAD5iuQ2/XAENncYBMrxgwn6Ox2DxPEexH73GWIyCS
	qgmIxvEgRhHSBjfFEywLnL6lRUy1AxAOJtm+jgNYefZ3AfcuomS7erjaIIJKkkL1VP7yhxmc0stFF
	5kn0RVA+aHoqk8Vh6aZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4PW-002NRz-1O
	for ath12k@archiver.kernel.org;
	Thu, 24 Aug 2023 07:05:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4PT-002NRW-2P
	for ath12k@lists.infradead.org;
	Thu, 24 Aug 2023 07:05:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O5Pm4m029141;
	Thu, 24 Aug 2023 07:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZMpNhtj+bRvoa6jXtu4DkwuJNIRYHRxJnDuz5KKL5dE=;
 b=NOO5vWpzBjUwB5Mr3KybvUcPOq0XlrGoNYQW2Fw9+0k9umEeuKX2HPWczRHEMpIYTk4H
 BxVWj8iiTTWq2XJWx78PkOuuEyaaybyiRZcMjsX/f1SI1ToWvjsBMwUlOCNUmbwi7Xod
 T6+8bNZ3aA7z84u9pUyPGCOGYlYqIU78c91Xvf1R+EJxtqqSMuOiBi0ha3Ld5klHLO5v
 QQbKXkYrbbM53OcOA1fhHAymnmWkf8AZF4rIOEf0ys0fPdKZaLLNrjpnez14dIZDwWD6
 JlXtn07sBlhU7O7ym4BvOHK5PtejzWzKMsrH2eXTao9JnGNnXsCdmJ8tSuiGdYx9+iPT aQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sntyurs1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 07:05:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37O75bNI006872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 07:05:37 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 00:05:36 -0700
Message-ID: <d32ad929-a4fc-6314-c2f7-a83946483927@quicinc.com>
Date: Thu, 24 Aug 2023 15:05:34 +0800
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
 <1a193edc-23a8-6631-5beb-2020de489934@quicinc.com>
 <b050f2633da4a81ba7cd70ef58c8e95d011e840d.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <b050f2633da4a81ba7cd70ef58c8e95d011e840d.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AmeL3PbC8Nz035c4uORAr_GOZh057E_X
X-Proofpoint-ORIG-GUID: AmeL3PbC8Nz035c4uORAr_GOZh057E_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_03,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=769 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_000539_792996_0CF0E44D 
X-CRM114-Status: GOOD (  17.42  )
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

On 8/24/2023 3:03 PM, Johannes Berg wrote:
> On Thu, 2023-08-24 at 10:26 +0800, Wen Gong wrote:
>> On 8/23/2023 2:34 PM, Johannes Berg wrote:
>>> On Wed, 2023-08-23 at 10:28 +0800, Wen Gong wrote:
>>>>>                    /* need to have local link addresses for MLO connections */
>>>>>
>>>>>                    WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
>>>>>
>>>>> makes no sense anymore. Not sure if that's the only one.
>>>> After this patch, the cr.links[link_id].addr will be a valid local link
>>>> address from
>>>>
>>>> struct cfg80211_rx_assoc_resp, so I think it is not needed remove now.
>>> You don't understand.
>>>
>>> The issue is that it's set the line above.
>>>
>>>>                   cr.links[link_id].addr = data->links[link_id].addr;
>>>>                   /* need to have local link addresses for MLO connections */
>>>>                   WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
>>> But look at that! What values can cr.links[link_id].addr get? Note how
>>> it's a pointer - assigned from an array.
>> Oh, I know it now. the cr.links[link_id].addr will always NOT 0 because
>> it is pointer
>>
>> to an array "u8 addr[ETH_ALEN]" of struct cfg80211_rx_assoc_resp.
> Yep.
>
>> So maybe we can choose one of the 2 things to do:
>>
>> 1. remove the "WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);"
>>
>> 2. change like this:
>>
>> WARN_ON(cr.ap_mld_addr && !is_valid_ether_addr(cr.links[link_id].addr));
>>
> I think we should check that it's valid, because if you don't fill it,
> it'll (hopefully) point to zeroed data somewhere.
>
> johannes
OK. So I will change it in next version.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
