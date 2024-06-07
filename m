Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B277C27C55
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fispS20cFDaSfj9ElcLdmKhsIT5a+xs6wq1EJuK18P0=; b=ycK10o9Cz4xpmaCx8gNfL3EQib
	E3iJeSZuQpw4OgFVqgqrazEktiPtpyLKlAeHyu22vNuWwbaHYyV58O67DkUILkQENHGucx1Ea1s7Q
	aA+Yiiod6ok+Yx3ZRLbs4AQKcLFYZGXPl5Mhn/MOJ57ZztUr13ngggNcCMdzeop4akxEEqqpqoS9+
	10hdVnbRJbnCsywiRMSGVx/SayGeZ0fuDvOQ8KRgxtSlPfWdKQ/R0rzk2mqmmuCaKYX/aGB1r78Vz
	+ztEFuTpwMr3bt3gc33W4B5sDzMsRfJ4gOVno6LX48aaUZeM1/Rr4OeMkc82H1GYJOiXOZrheXcRf
	Jd8qRIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXOc-0000000DeKe-2eb8
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 11:04:34 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXOZ-0000000DeIO-2S1O
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 11:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fispS20cFDaSfj9ElcLdmKhsIT5a+xs6wq1EJuK18P0=; b=Jzk1Omjh0wNozjIEpqlHS/YVEp
	wCzYMMKV641v957XXKEAkmIMmwnSB0wC3GdEcMu0+PLVlV6qVOx/5NBlewZf77pdlJQDGg7xrM7Ff
	iKbGUO5xPCUQ86scXVo/mRUMetoAVSREF2ILUPKgl15E0BjxxXSpqiueeTvLq66S2AvM=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFXOS-008sN8-1z;
	Fri, 07 Jun 2024 13:04:24 +0200
Message-ID: <096940e3-713a-4533-ab0f-e82bd647e205@nbd.name>
Date: Fri, 7 Jun 2024 13:04:24 +0200
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
 <a337de2e-fe3e-18ed-b55b-9ea2cd21baed@quicinc.com>
 <1f32cb6c-6be8-4e3d-8e8f-2d3c728875a9@nbd.name>
 <479752f5-221d-746b-7513-ba27ef547ac1@quicinc.com>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
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
In-Reply-To: <479752f5-221d-746b-7513-ba27ef547ac1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_040431_730175_CF73063F 
X-CRM114-Status: GOOD (  12.39  )
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

On 07.06.24 12:53, Karthikeyan Periyasamy wrote:
> 
> 
> On 6/7/2024 3:52 PM, Felix Fietkau wrote:
>> On 07.06.24 12:07, Karthikeyan Periyasamy wrote:
>>>
>>>
>>> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>>>> Add support for counting global and per-radio max/current number of
>>>> channels, as well as checking radio-specific interface combinations.
>>>>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> ---
>>>>   net/mac80211/cfg.c         |   7 +-
>>>>   net/mac80211/chan.c        |  17 +++--
>>>>   net/mac80211/ibss.c        |   2 +-
>>>>   net/mac80211/ieee80211_i.h |   6 +-
>>>>   net/mac80211/iface.c       |   2 +-
>>>>   net/mac80211/util.c        | 131 
>>>> +++++++++++++++++++++++++++-----------
>>>>   6 files changed, 116 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
>>>> index 62119e957cd8..950b7b72f0b8 100644
>>>> --- a/net/mac80211/cfg.c
>>>> +++ b/net/mac80211/cfg.c
>>>> @@ -263,7 +263,7 @@ static int ieee80211_start_p2p_device(struct 
>>>> wiphy *wiphy,
>>>>       lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>>> -    ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
>>>> +    ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>>>>       if (ret < 0)
>>>>           return ret;
>>>> @@ -285,7 +285,7 @@ static int ieee80211_start_nan(struct wiphy *wiphy,
>>>>       lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>>> -    ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
>>>> +    ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>>>>       if (ret < 0)
>>>>           return ret;
>>>> @@ -4001,7 +4001,7 @@ __ieee80211_channel_switch(struct wiphy *wiphy, 
>>>> struct net_device *dev,
>>>>           goto out;
>>>>       /* if reservation is invalid then this will fail */
>>>> -    err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0);
>>>> +    err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 
>>>> 0, -1);
>>>
>>> Once we reach the global limit, all the -1 passing caller get fail
>>> becuase the iface check param (existing and new) is validated against
>>> the global limit. since global limt as a sort of union of all per-radio
>>> limits.
>>>
>>> Ex:
>>> Global iface = 6 (Radio iface 2GHz:4, 5GHz:4, 6GHz:6)
>>>
>>>
>>> So far 6 iface created (Radio iface 2GHz:2, 5GHz:3, 6GHz:1)
>>>
>>> In this case, new iface creation get fail because caller uses
>>> ieee80211_check_combinations() with -1 as radio idx, so it checked
>>> against global limit
>> 
>> Use the sum of the number of interfaces from each radio instead of the 
>> maximum.
> 
> Oh, then legacy user have misconception of the global interfaces
> advertised and try to fail for the allowed limits.

Sure, but that might be an issue either way until user space is updated 
and users start looking at the per-radio ifcomb data.
The global data is simply not enough to describe the details of the 
radio split.

- Felix

