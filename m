Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C1CD8CA8
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XehZ6lg7KmMORG6Ha+/J71PUihEbRUaSfLz/3oRcnkA=; b=Z/SdUZ9x9m6DeTWYmuQEsi6v4+
	8GorAoxsEKSD2WLqH66U/PW8RK2BQhZU/aAgVnoGPkagKtJTQjNZsA2HTTGE3phSbz6iF1CS4CZ4V
	6oZ614BFLEjUA2bVUY1fZuw2v+MlHDeO5aABGX7wADW/qucShJxHzQRpRYwwP/9exeaPO+pDj5Ta1
	qCnh+XLHAGUGJ1yg/4fYyjjWQBYVnI1iwMsKT88LT8ltCCRohpM1lMLa1tLQ/pJm3V4tuxBs6nmsb
	mkfbU5aFj5wj4Y6H+ivfAccWsPG4AISyw9z3ZQCcyFEst2z3sPSxIwfSrmi9KTT0qzKsjQASrke3z
	lBqfk7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfEI-00000004Ic5-2FQC;
	Mon, 08 Jun 2026 19:01:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfEG-00000004IbU-0MWW
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 19:01:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Ix5j4236907
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 19:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XehZ6lg7KmMORG6Ha+/J71PUihEbRUaSfLz/3oRcnkA=; b=AKKucsqtMGlOSP2D
	e7D0Rw4BbF3CaBrMkjy2b5KtF2tXo/+pRn/5aeM4lih3u5GzyV/EJXaHM03p9Ck/
	07gu+oqh+fkc+4HEspQIX8k9SMUy0QRfKXk8c0YJ2D/C69IE+J99vAXCV26xVCh6
	qfXl45+YAtTBaJpvGqaPMZHwIVcLuFYPxqosl6g1yXN20ytzl7ja05vBzE8FUU6e
	SMhHHNN0AnkVKmdtAGqp4saoDDWxJtn1KattLKMxjw2YtIJMUxB+HZ3O7Si9Hy1n
	TlFp1/ScViLAsr4nZYciDgfzlXYvc4E96xSjllh0F8vu4lEls84HjlXAtbEctJ6K
	mFyzVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rstyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 19:01:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso67464825ad.3
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780945302; x=1781550102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XehZ6lg7KmMORG6Ha+/J71PUihEbRUaSfLz/3oRcnkA=;
        b=e330l7nXLextZBiurhcjU/61zfWpvFZMZxdRfvT12jnEOWUmNOi+dNVa8gb8Tb+SRR
         Hhbwo07Y8zBi+9ZAPIdSWDE4IG1rBIEvG2V1GxEUEHKfAomDK7Vdbua4GCToGduUEv+/
         bVXhFg9oKmv+zXU1Wt/LIsjdlJa3aJIk3PB76RNX9CIWmoq+sGIXu8fW7C1ciwJZjzy4
         gRQfvDNisj7kfgPpV+M5zHLPFNh/GzcQXani9V8veGvTYFZvl5iYiuQwpud/NGoMa34p
         niONNYFTbISBcLgS6VJIhxUmDa/turV+Etgl6dA9nN1goa3Y920qSWTC4XZriL6igCY/
         TrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945302; x=1781550102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XehZ6lg7KmMORG6Ha+/J71PUihEbRUaSfLz/3oRcnkA=;
        b=dZKNhkMuFyEvAQipaqtgpfICIepL7JQe50Y7HZ+ShATmy8CU4Bfm5xinhiR3OGhwhC
         e2DJ9qIIsWlk1uyo/n686vKhxaeCu+BahWZQPMqBQb19b6fo6Ym6jczpJuJvWL/XljYp
         E6Sv4UmfodzxKo1eVS0GPnz1PukgEEAFv5EjWjjdGB/hqdluqwuxd+FnPIKS7/QWthhT
         nnr+AZWXUyI+QLD0lGX3p0Ohozr1EsShOxY11LJghROrocxxCAhkFI5kNpGRlvDzgfgE
         iKjV6za2SOk3dWW/l9WNw2Ejj5GbFwISTNKlVhtPjma/a4aj31Gs8zpjGicKO00WejkG
         Rfjw==
X-Forwarded-Encrypted: i=1; AFNElJ9uDDloxtqwtbAkyYGP/slR1RT0agQHQ93M3VlsjULo1K8FIF8uO3L27xMigXrbggMSUrw05zs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya3dCG2kpJvhuBBM4exO+VaPQiHfU7Zm1pDfMYuUY3H2sqyx64
	MmLpmGuLBo2ss9Zgsa+8GIyXWoEKfQ25HMBDw/UaMEAwBOBCA2gFFxSikyl+bo6YQJ93zvgmB2F
	kitn30yuesr5Y03tUcEQsltnom9zUWIsJ2E5v/8+LzgUVTvw+C89yb8sJ5mQzfPH9
X-Gm-Gg: Acq92OHwBEBFVzZ/Hb5UeePjulDA4AkGYH/N3lVODAWmSz1faFewwbMou5gS6uPs7Wi
	OpGThZoYZcVZ1wuGnSON21SxwPEhMle71Ne9E1oGBMev6NSnwvyab9CVy541BvIIIUgqfKb03yz
	7EQSmQUiezm55EYBBqpNgZWkk6k7zWc+6aRoEq4Izrx/6EJzAVAANUUCW9vCy8pxJ2cTz8XaB8R
	tkp+grhNKlxw76xNS+Vh38cwHEy2YAyxkP99ExxjPl19QcqQArvJdbB+e1zDBeIQ41c/H+Yo7PW
	+2wRMFMRL2dO+dsYh5cLuX590KIWaY7wC02rmZq/+agkjSFLm7oT2VjjTMWPeL0tfwy+iALwV66
	EvZen6YGWs6w/QjiHtYqu3rMNy+K9r/tVCuz8/16iIqTE/dxILomD4fshw6o=
X-Received: by 2002:a17:903:3847:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c1e80e429amr194966925ad.5.1780945301482;
        Mon, 08 Jun 2026 12:01:41 -0700 (PDT)
X-Received: by 2002:a17:903:3847:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c1e80e429amr194966435ad.5.1780945300884;
        Mon, 08 Jun 2026 12:01:40 -0700 (PDT)
Received: from [192.168.1.8] ([116.73.159.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm244633755ad.65.2026.06.08.12.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 12:01:40 -0700 (PDT)
Message-ID: <19098782-24e9-4707-8207-6244371a904f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 00:31:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 4/5] wifi: cfg80211: Fragment per-link
 station stats in nl80211_dump_station()
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
 <20260607175912.2266215-5-praneesh.p@oss.qualcomm.com>
 <88c183f827eb184e6d471964662b7ee89caf63ad.camel@sipsolutions.net>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <88c183f827eb184e6d471964662b7ee89caf63ad.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xp8ezU4PigG96cSbbcJjNgMRhxQbyiew
X-Proofpoint-ORIG-GUID: Xp8ezU4PigG96cSbbcJjNgMRhxQbyiew
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a271196 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=0XKIscjZuezYqwSxLmfFhQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ZU5qrAxbi5h8eASNLEsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NyBTYWx0ZWRfXx0ynQg522thh
 3mxxo2y9X0FkwNXSMOOKxqMUHdMc8+jdzJCVBvbScZHrSR2btCQK6G9kqYEmyWm/5PrQkVwt4Sg
 Haqof7eg2nyTkHOaasMJB4cpFVJ/0Hu6p1x1zXLyBU2BRIvkTSA80v3S3sHYx0aD3nEc9H65r7x
 IAlrMRlxPbyTJH5ICFP931zLt4Hgm41XPiDnoE917xEi+KHK0x1oNd3vFvVl53CdA8k1aupEq/x
 AI0vKscIaEomSEVdQ6yukzki8okf6/RSYhjlb7aZHu/hL+eaiN8o+oQC79N4z+6vSQHMisZP6SJ
 4yBqEh16MuytPgpkz7WADOBLHySZI4Dg+zBRYiceVh6EjkuxI/AxrwlkvfYrPyixO1uMI80r/Iv
 mBmY0khGzB4UHx4Xcp/u1v/CuabkyE4D+TgpQWb/ZzUTG2JEsvdOuRsVZU03XcRannm7utphRuJ
 o10OMeKs/0Wtfe5FGwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_120144_243736_D944DCDB 
X-CRM114-Status: GOOD (  36.33  )
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


On 6/8/2026 1:12 PM, Johannes Berg wrote:
> On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>>   
>> +static int nl80211_fill_link_station(struct sk_buff *msg,
>> +				     struct cfg80211_registered_device *rdev,
>> +				     struct link_station_info *link_sinfo)
>> +{
>> +	struct nlattr *bss_param, *link_sinfoattr;
>> +
>> +#define PUT_LINK_SINFO(attr, memb, type) do {				\
>> +	BUILD_BUG_ON(sizeof(type) == sizeof(u64));			\
>> +	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
>> +	    nla_put_ ## type(msg, NL80211_STA_INFO_ ## attr,		\
>> +			     link_sinfo->memb))				\
>> +		goto nla_put_failure;					\
>> +	} while (0)
>> +#define PUT_LINK_SINFO_U64(attr, memb) do {				\
>> +	if (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_ ## attr) &&	\
>> +	    nla_put_u64_64bit(msg, NL80211_STA_INFO_ ## attr,		\
>> +			      link_sinfo->memb, NL80211_STA_INFO_PAD))	\
>> +		goto nla_put_failure;					\
>> +	} while (0)
>> +
>> +	link_sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
> See previous note about _noflag() in all of this code - that shouldn't
> be there.
Noted, I will address it in next version.
>> +static int nl80211_send_link_station(struct sk_buff *msg,
>> +				     struct netlink_callback *cb,
>> +				     struct cfg80211_registered_device *rdev,
>> +				     struct wireless_dev *wdev,
>> +				     const u8 *mac_addr,
>> +				     struct station_info *sinfo,
>> +				     int link_idx)
>> +{
>> +	void *hdr;
>> +	struct nlattr *links, *link;
>> +	struct link_station_info *link_sinfo;
>> +	struct nlattr *sinfoattr;
>> +	int err;
>> +
>> +	hdr = nl80211hdr_put(msg, NETLINK_CB(cb->skb).portid,
>> +			     cb->nlh->nlmsg_seq, NLM_F_MULTI,
>> +			     NL80211_CMD_NEW_STATION);
>> +	if (!hdr)
>> +		return -EMSGSIZE;
>> +
>> +	if ((wdev->netdev &&
>> +	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
>> +	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
>> +			      NL80211_ATTR_PAD) ||
>> +	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
>> +	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation)) {
>> +		err = -EMSGSIZE;
>> +		goto err_cancel;
>> +	}
>> +
>> +	sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
>> +	if (!sinfoattr) {
>> +		err = -EMSGSIZE;
>> +		goto err_cancel;
>> +	}
>> +
>> +	link_sinfo = sinfo->links[link_idx];
>> +	if (!link_sinfo) {
>> +		err = -ENOENT;
>> +		goto err_cancel;
>> +	}
>> +
>> +	nla_nest_end(msg, sinfoattr);
>> +	if (!is_valid_ether_addr(link_sinfo->addr)) {
>> +		err = -EADDRNOTAVAIL;
>> +		goto err_cancel;
> That seems really odd? why even bother going into the whole thing if
> it's invalid? Also, doesn't that ENOENT get propagated all the way and
> it aborts? I guess it does but it should never happen because of
> valid_links? Still seems a bit odd.
Both the link_sinfo null check and is_valid_ether_addr() check
will be moved to the top of the function, before any header or
nest construction. The null check for sinfo->links[link_idx] is
already guarded upstream by the valid_links bitmask so it should
never be NULL in practice, I'll add a WARN_ON_ONCE and skip rather
than returning -ENOENT, which would otherwise abort the entire dump.
Will it be okay ?
>> @@ -8354,13 +8616,22 @@ static int nl80211_dump_station(struct sk_buff *skb,
>>   	struct wireless_dev *wdev;
>>   	struct nl80211_dump_station_cb *cb_data = (void *)cb->ctx;
>>   	struct nl80211_dump_station_ctx *ctx = cb_data->ctx;
>> +	struct nlattr **attrbuf = NULL;
>>   	int err, ret;
>>   
>>   	NL_ASSERT_CTX_FITS(struct nl80211_dump_station_cb);
>>   
>> -	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
>> -	if (err)
>> +	if (!ctx) {
>> +		attrbuf = kzalloc_objs(*attrbuf, NUM_NL80211_ATTR);
>> +		if (!attrbuf)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	err = nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
>> +	if (err) {
>> +		kfree(attrbuf);
>>   		return err;
>> +	}
>>   
>>   	/* nl80211_prepare_wdev_dump acquired it in the successful case */
>>   	__acquire(&rdev->wiphy.mtx);
>> @@ -8369,15 +8640,22 @@ static int nl80211_dump_station(struct sk_buff *skb,
>>   	if (!ctx) {
>>   		ctx = kzalloc_obj(*ctx);
>>   		if (!ctx) {
>> +			kfree(attrbuf);
> perhaps better to __free(kfree) instead of doing all these kfree()
> calls?
Yes, will use __free(kfree) for attrbuf.
>> -	/* Phase 0: dump aggregated station info */
>> -	if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
>> -		while (true) {
>> +	while (true) {
>> +		/* Phase 0: dump aggregated station info */
>> +		if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
> changing it now also kind of argues for not having it in the first patch
> in the first place ;-)
Noted, the loop restructuring will be moved entirely into
patch 4, not split across patches 3 and 4.
>>   			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
>>   			for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
>>   				ctx->sinfo.links[i] =
>> @@ -8428,15 +8706,45 @@ static int nl80211_dump_station(struct sk_buff *skb,
>>   				goto out_err_release;
>>   			}
>>   
>> -			/* Reset ctx for next station */
>> -			cfg80211_sinfo_release_content(&ctx->sinfo);
>> -			ctx->sta_idx++;
>> +			ctx->phase = NL80211_DUMP_STA_PHASE_PER_LINK;
>>   		}
>> -	}
>>   
>> -	ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
>> -	err = skb->len;
>> -	goto out_err;
>> +		/* Phase 1: dump per-link station info */
>> +		if (ctx->phase == NL80211_DUMP_STA_PHASE_PER_LINK &&
>> +		    ctx->dump_link_stats && ctx->sinfo.valid_links) {
>> +			while (ctx->link_idx < IEEE80211_MLD_MAX_NUM_LINKS) {
>> +				if (!(ctx->sinfo.valid_links &
>> +				      BIT(ctx->link_idx))) {
>> +					ctx->link_idx++;
>> +					continue;
>> +				}
>> +
>> +				ret = nl80211_send_link_station(skb, cb, rdev,
>> +								wdev,
>> +								ctx->mac_addr,
>> +								&ctx->sinfo,
>> +								ctx->link_idx);
>>
> I think conceptually this code is structured a bit strangely. It would
> seem a lot simpler to me to do something like
>
>
> 	// not literally such a macro, just the while (true) loop
> 	for_each_station_starting_from_idx(...) {
> 		if (ctx->phase == 0) {
> 			// fill sinfo etc.
> 		}
>
> 		// common stuff
> 		nl80211hdr_put()
> 		nla_put_u32(msg, NL80211_ATTR_IFINDEX...)
> 		nla_put_u64_64bit(msg, NL80211_ATTR_WDEV..)
> 		nla_put(msg, NL80211_ATTR_MAC...)
> 		nla_put_u32(msg, NL80211_ATTR_GENERATION...)
>
> 		switch (phase) {
> 		case 0:
> 			nl80211_put_sta_info_common(...);
> 			phase++;
> 			ctx->link_id = 0;
> 			break;
> 		case 1:
> 			if (!multi-phase-requested)
> 				break;
> 			nl80211_put_link_station(..., ctx->link_id);
> 			ctx->link_id++;
> 			if (link_id == NUM_LINKS)
> 				ctx->phase = 0; // next sta
> 			break;
> 		}
> 	}
>
>
> or something like that, more like we handle wiphy dump with all the
> messages, for example?
>
> I think it'd be better to have just one place that creates the header
> and all the common info.
>
> But maybe it's just my brain pathways being trained for that scheme.
>
> johannes
ok, I will try to align with this suggested model. I'll refactor so the 
outer loop
produces exactly one netlink message per iteration, with header
construction in one place:

while (true) {
     if (ctx->phase == PHASE_AGGREGATED) {
         /* fetch sinfo from driver once per station */
         memset(&ctx->sinfo, ...);
         /* allocate links[], call rdev_dump_station() */
         /* apply cfg80211_sta_set_mld_sinfo() if needed */
     }

     hdr = nl80211hdr_put(msg, ...);
     /* common attrs: ifindex, wdev, mac, generation */
     nla_put_u32(msg, NL80211_ATTR_IFINDEX, ...);
     nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, ...);
     nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, ctx->mac_addr);
     nla_put_u32(msg, NL80211_ATTR_GENERATION, ...);

     switch (ctx->phase) {
     case PHASE_AGGREGATED:
         nl80211_put_sta_info_common(msg, rdev, &ctx->sinfo);
         ctx->phase = PHASE_PER_LINK;
         ctx->link_idx = first_valid_link();
         break;
     case PHASE_PER_LINK:
         nl80211_put_link_station(msg, rdev, &ctx->sinfo, ctx->link_idx);
         advance ctx->link_idx to next valid link;
         if (no more links) {
             cfg80211_sinfo_release_content(&ctx->sinfo);
             ctx->sta_idx++;
             ctx->phase = PHASE_AGGREGATED;
         }
         break;
     }

     genlmsg_end(msg, hdr);   /* or genlmsg_cancel() on EMSGSIZE 
break-out */
}


This eliminates the duplicated nla_put_u32/u64/MAC header blocks
that currently exist in both nl80211_send_accumulated_station()
and nl80211_send_link_station(), and makes the EMSGSIZE bail-out
uniform since we return before committing the message.

should the rdev_dump_station() / sinfo fill stay outside the
per-message loop (as a separate if (phase == AGGREGATED) guard
at the top), or is it preferable to fold it into the switch
case? I've sketched the former above since fetching sinfo is
logically per-station, not per-message. I'm also ok to adjust
if you'd prefer it inside the switch ?

- Praneesh

