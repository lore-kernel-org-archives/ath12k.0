Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA19C3064D
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJWA/vikia2eqeHvikmHerHmNek53snfgPTJOf61hUo=; b=BtXl8kZZK9TJNeb0v8Zm0x4f0k
	Hsdr3oernIDYnVXxO7IrUe5XTmLdQ8xdi3lW94WiirK99cm/SphEYgKDpPv8McTZ3OuZvfZd6hj0J
	eXoSlJcSFPrtjhHdhkvmKxx/sT1z20rKKDaLfhGXIKav8Cx+J16nXYQS7sLiDF7cl5Bp5DN/DuGV6
	OdROlHGVnZhan0bwjlq7sfGiUXjL5ace51URzReQdBojySDVj0EKmdYwHhdROyG6Icyxpi95C0oBL
	3uK+T4PjchoNFccLDafdP3FfwXY8gclpgC5rOq6BJW7RszFO4S6tPUrEsfDp4EWhKkuaJNCLqAPcC
	LjyPyUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObKt-00000006QrO-04rc
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 11:06:11 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObKo-00000006Qqr-2WnI
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 11:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qJWA/vikia2eqeHvikmHerHmNek53snfgPTJOf61hUo=; b=I3PjfW7FKF5Cto6UHhOsC5VGLh
	GyOFkmtY+Y2hArw/72W2zcHCw+AjawiH4t2eTQXz0sK5J+ap0whQg4TZfADrvGb34kycLV0PLZhBm
	Axt1sqVvkap86x6pU8+LpwWx0G0m9E0BR0FSNdO97l/VJHcPGTEzTEanvKrIO3axITWc=;
Received: from p54ae9766.dip0.t-ipconnect.de ([84.174.151.102] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sObKg-001kdO-0A;
	Tue, 02 Jul 2024 13:05:58 +0200
Message-ID: <f6cab718-2336-44db-b8a4-bad6a4d626a2@nbd.name>
Date: Tue, 2 Jul 2024 13:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] wifi: mac80211: extend ifcomb check functions
 for multi-radio
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, quic_adisi@quicinc.com,
 ath12k@lists.infradead.org
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
 <15d63cd77aad2d2eef503676a3f3fbabe78d5828.1719843147.git-series.nbd@nbd.name>
 <9c3da9ac-490a-d4aa-a830-7272c1a67b9c@quicinc.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <9c3da9ac-490a-d4aa-a830-7272c1a67b9c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_040606_752605_456B6C2C 
X-CRM114-Status: GOOD (  11.90  )
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

On 02.07.24 12:32, Karthikeyan Periyasamy wrote:
> 
> 
> On 7/1/2024 7:43 PM, Felix Fietkau wrote:
>> Add support for counting global and per-radio max/current number of
>> channels, as well as checking radio-specific interface combinations.
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>   net/mac80211/cfg.c         |   7 +-
>>   net/mac80211/chan.c        |  17 +++--
>>   net/mac80211/ibss.c        |   2 +-
>>   net/mac80211/ieee80211_i.h |   5 +-
>>   net/mac80211/iface.c       |   2 +-
>>   net/mac80211/util.c        | 126 ++++++++++++++++++++++++++------------
>>   6 files changed, 108 insertions(+), 51 deletions(-)
>> 
> 
> ...
> 
>> @@ -3982,6 +4062,8 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>>   	if (iftype != NL80211_IFTYPE_UNSPECIFIED)
>>   		params.iftype_num[iftype] = 1;
>>   
>> +	ieee80211_fill_ifcomb_params(local, &params, shared ? chandef : NULL,
>> +				     sdata);
>>   	list_for_each_entry(ctx, &local->chanctx_list, list) {
>>   		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
>>   			continue;
>> @@ -3991,28 +4073,9 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>>   			params.num_different_channels++;
>>   			continue;
>>   		}
>> -		if (chandef && chanmode == IEEE80211_CHANCTX_SHARED &&
>> -		    cfg80211_chandef_compatible(chandef,
>> -						&ctx->conf.def))
>> -			continue;
>>   		params.num_different_channels++;
>>   	}
>>   
>> -	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
>> -		struct wireless_dev *wdev_iter;
>> -
>> -		wdev_iter = &sdata_iter->wdev;
>> -
>> -		if (sdata_iter == sdata ||
>> -		    !ieee80211_sdata_running(sdata_iter) ||
>> -		    cfg80211_iftype_allowed(local->hw.wiphy,
>> -					    wdev_iter->iftype, 0, 1))
>> -			continue;
>> -
>> -		params.iftype_num[wdev_iter->iftype]++;
>> -		total++;
>> -	}
>> -
>>   	if (total == 1 && !params.radar_detect)
> 
> Here, total is always 1. no ?

Yes, seems that I forgot to delete a few lines here.
Will fix in the next version.

Thanks,

- Felix

