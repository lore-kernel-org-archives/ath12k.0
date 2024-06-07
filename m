Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75EDC27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 04:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EccwJHAinwc9IMjUb7fiTtEJxEtENX38H43DKLAFQkc=; b=fG/J4Eho4voVg7kuoIp6g7HJPw
	81qt2SpZrqaGvkXnho1oaMCvRCUas3d/Mp934vnHNPBCeCKvGKeAkHUot65F5MkEJcycac+pNr/hz
	zgwDhTqu3zzMqRrECFrIgCbigXKX+l+2dcODzDn0iJKo9/s+cGsCV7NW6K1EnrEIDqoIiDHNz0OBC
	rpBvTzEH3zAuZmEqEj2JVLS8VdkhJmrpsmdXFnSD5N6zaVngI4UmnK6HvcfVVopcpQc8+iVmsLIbL
	SSdAGPl8bST5wnLkSrq9yCphusIJRpn97P9Oy4h1okIWyMwY2RNW6zo5p16WlV3qTyDDQLUg2vmZG
	fgkAef0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRXt-0000000CP9a-1Mj7
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 04:49:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRXq-0000000CP91-1ipy
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 04:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EccwJHAinwc9IMjUb7fiTtEJxEtENX38H43DKLAFQkc=; b=EW2tfOqwV8QCWppc2SazdrLbZN
	qNMvidONddX4wfTovCMsysKsQUMNX7pxxn96y9EFa+wwn1TY4N4sWI7rdVVrgO2YetSm6m+jOfP+8
	AfO/zOp6PfE5Umou5xEkgP07SAatMlw4v4a1F0GyLPZ0Jp2z1KBOvmO97Uy6whhDpBEA=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFRXj-008n8Q-2E;
	Fri, 07 Jun 2024 06:49:35 +0200
Message-ID: <900697d8-9db7-49a5-9949-1e256e96b0c2@nbd.name>
Date: Fri, 7 Jun 2024 06:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 6/8] wifi: mac80211: extend ifcomb check functions for
 multi-radio
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, quic_adisi@quicinc.com,
 ath12k@lists.infradead.org
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
 <bc603fc671010bb720e75881ef0e22d81ec6e2eb.1717696995.git-series.nbd@nbd.name>
 <cc9a3955-fd59-ff9b-c96b-560e620b916d@quicinc.com>
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
In-Reply-To: <cc9a3955-fd59-ff9b-c96b-560e620b916d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_214942_640914_641613D5 
X-CRM114-Status: GOOD (  16.75  )
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

On 07.06.24 06:45, Karthikeyan Periyasamy wrote:
> 
> 
> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>> Add support for counting global and per-radio max/current number of
>> channels, as well as checking radio-specific interface combinations.
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>   net/mac80211/cfg.c         |   7 +-
>>   net/mac80211/chan.c        |  17 +++--
>>   net/mac80211/ibss.c        |   2 +-
>>   net/mac80211/ieee80211_i.h |   6 +-
>>   net/mac80211/iface.c       |   2 +-
>>   net/mac80211/util.c        | 131 +++++++++++++++++++++++++++-----------
>>   6 files changed, 116 insertions(+), 49 deletions(-)
>> 
> 
> ...
> 
>>   
>> +static u32
>> +__ieee80211_get_radio_mask(struct ieee80211_sub_if_data *sdata)
>> +{
>> +	struct ieee80211_local *local = sdata->local;
>> +	struct ieee80211_chanctx_conf *conf;
>> +	struct ieee80211_link_data *link;
>> +	u32 mask = 0;
>> +
>> +	for_each_sdata_link(local, link) {
>> +		conf = rcu_dereference(link->conf->chanctx_conf);
>> +		if (!conf || conf->radio_idx < 0)
>> +			continue;
>> +
>> +		mask |= BIT(conf->radio_idx);
>> +	}
>> +
>> +	return mask;
>> +}
>> +
> 
> I believe __ieee80211_get_radio_mask(sdata) should return the radio mask
> used by this sdata right ?
> 
> if so, then you should not use "for_each_sdata_link(local, link)"
> because it iterate for all the sdata in the given local and give the
> radio mask. So always return all the radio (bitmap mask) used by the
> wiphy currently.
> 
> You can use either of below one
> 
> for_each_vif_active_link()
> 
>    or
> 
> for (link_id = 0; link_id < ARRAY_SIZE(sdata->link); link_id++)

Right, I copied the wrong code :)
Will fix, thanks.

- Felix

