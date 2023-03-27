Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C98C77B73
	for <ath12k@archiver.kernel.org>; Mon, 27 Mar 2023 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c+YBW0vbjulGjtbWaDYAxiB4c/2IJEWmgIv3C1P9YM=; b=Fqej4sO2x16Pgf
	7Lz7MAWH/dmksQHVPPrh2dbdAi8JO7bANMNsQjTJ1wdWE98nE7mt2eSqZ0GJZ4vCAP+6XRnO4n5ab
	zOQAJrKf/bOkZOTuivNty61yX8pkZ/gbO9PZzDrsMCkmT5IuLijkniJ0uFbx6ORjhvgdGRingJwhW
	l3jnz0oVimg6iO/M27Xg0TajKMV02nPazDwT3wqz//HCJMXUDyd7T0f0vIzlRkUM4i/FlvZM1jfCi
	sDHWPtLqUl4VvI7nZo2Ceag7V+9HgBTeC/Xt9KbDcyWwQt0sMTEdqxrfzZ2rTIg0NFRakt+ymFSPI
	GKwA4V9u6ylh07/Hs7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiPY-00AJqj-1f
	for ath12k@archiver.kernel.org;
	Mon, 27 Mar 2023 08:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiPV-00AJnH-0q;
	Mon, 27 Mar 2023 08:41:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R5fBH5010438;
	Mon, 27 Mar 2023 08:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=txkBkJJ3BA/+4xpT1JKMZgVf8OH5FuGV3n3iLEp91XU=;
 b=UxP1pSJZEYi2AElSfDyXnDMM3jSh2oCipid9be6aCVBySIrVz/Jc18DvjoylF1ITMvDw
 VsmU+OGQJiG16dE7beTdx7A1VINeVt2gYnHEJy7m6Zfutl7hounFcjqUFJbpGqHJbb8b
 z0oMhs0hWvSPQRb1B6pDSa3xyGfneaU/vJ9DNcrfrhMuEIzamYmBxC8dvZvw2eLn9h/9
 rFemFrcfCyiVmvLcQATtc8uzoaLUBBT+jOwJeG8a9MAPfdjb7U8vzKLGnCa14K6v4nfA
 Vp0SXsEbzGxvTd5JSkmS/z60YN5cMQ/CPe33tp0ADtJMwYIDP+bdecYTrNYfZwAzuE9S ng== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk5770c4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 08:40:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32R8ewMJ023863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 08:40:58 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Mar
 2023 01:40:57 -0700
Message-ID: <31b91fad-bd14-b6e1-8abe-fceb66085ecb@quicinc.com>
Date: Mon, 27 Mar 2023 16:40:55 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OBTIUla-lQEqctFv-5EX9kijzPVoLdPs
X-Proofpoint-ORIG-GUID: OBTIUla-lQEqctFv-5EX9kijzPVoLdPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=768 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_014101_307934_23004D00 
X-CRM114-Status: GOOD (  20.43  )
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

On 3/27/2023 4:31 PM, Johannes Berg wrote:
> Hi,
>
>>> +	list_for_each_entry(sta, &local->sta_list, list) {
>>> +		if (sdata != sta->sdata)
>>> +			continue;
>>> +		ret = drv_change_sta_links(local, sdata, &sta->sta,
>>> +					   old_active,
>>> +					   old_active | active_links);
>>> +		WARN_ON_ONCE(ret);
>>> +	}
>>> +
>>> +	ret = ieee80211_key_switch_links(sdata, rem, add);
>> I see ieee80211_key_switch_link() only handler the per-link(link_id >=
>> 0) keys,
>>
>> So I think lower driver also install the pairwise keys(link_id = -1) for
>> the added links at this moment?
> Well from mac80211 POV they're already installed, so we can't really
> install them again. We'd have to remove them but that's racy, obviously.
> So I think the low-level driver just has to handle that, e.g. when the
> station links are updated (and the key belongs to the station.)
Got it, thanks.
>
>>> +	WARN_ON_ONCE(ret);
>>> +
>>> +	list_for_each_entry(sta, &local->sta_list, list) {
>>> +		if (sdata != sta->sdata)
>>> +			continue;
>>> +		ret = drv_change_sta_links(local, sdata, &sta->sta,
>>> +					   old_active | active_links,
>>> +					   active_links);
>>> +		WARN_ON_ONCE(ret);
>>> +	}
>>> +
>> I see 2 times to call drv_change_sta_link() above, and with sequence
>> old_active->old_active | active_links->active_links
>>
>> May I know is it has some design here?
> The problem is that we can't really have no links active even as an
> intermediate step, so you can't just deactivate old and then activate
> new.
Got it, thanks.
>
>>> +	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
>>> +		struct ieee80211_link_data *link;
>>> +
>>> +		link = sdata_dereference(sdata->link[link_id], sdata);
>>> +
>>> +		ret = ieee80211_link_use_channel(link, &link->conf->chandef,
>>> +						 IEEE80211_CHANCTX_SHARED);
>> For the 1st link of MLO connection/NON-MLO connetion, ieee80211_link_use_channel() is called before drv_change_sta_link(),
>> And now it is after drv_change_sta_link(), May I know is it also has some design here?
> Hmm, probably not really, at least I don't remember anything about that.
>
> Not sure it makes a huge difference? But I suppose we could change it, I
> don't really see why not either.
Not huge difference, I have made little change in lower-driver to match 
that. So it is OK now.
>> Also I see commit(8fb7e2ef4bab mac80211_hwsim: always activate all links) and ieee80211_if_parse_active_links()
>> will use ieee80211_set_active_links(), so I think ieee80211_set_active_links() has passed test case with some type lower driver/chip?
> Yes, we have this working on iwlwifi/mvm.

Got it, thanks.

I also have tested ieee80211_set_active_links() to enable the 2nd link 
for station success in my lower-driver after a little change in 
lower-driver.

>
> johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
