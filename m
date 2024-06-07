Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B0C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 05:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGnW0sszTCtTaBRB4POhCK9zVnL60J6A6aLhPnBPjUY=; b=13OGL1UT1DnlwuiMFBedj6X3F8
	8fyQsvsFnxWce25Yl/P2Gko6GNGjPxtye7KPnBfAds6koM3C6xCeZSAGJXzuEFKY3GcpOf3DOptD0
	79XVJPYH1eq9nrUzIbuO+UyBhw9aG502FNKyp592txfaCKr9BrFR+4+oxWPwwehvtaPB3Dcscvxhf
	dHjhR1AfzP0CTwuko5MWgsSDo8UQI7p4BTlt7wibT+b/1D3wFdMYdufRFGsPAssUUvhEUeeyRFDZU
	ksa5cnBlUTzL8FrcJcW0JgLVY9uSEldzeoDRFGhzBxICBwFOy+PjcayHTHzAbVOY/2NfH+SuLJLHk
	YTRDjiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRkt-0000000CRhN-1CK6
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 05:03:11 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRkq-0000000CRgv-1cdI
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 05:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pGnW0sszTCtTaBRB4POhCK9zVnL60J6A6aLhPnBPjUY=; b=bsMWK3+KPXKKK+SFgjt5t1l969
	G7pMkCPgyMwFFJt77g7pvZymDzkpzhm6NnKk9/xj8Bba2UOGurYQczgAfO2OBeB+Ina/VYsXZgF1f
	NA+BkNxXFa4MnKSc461/KqrY4yqxLk4ZrneM4OtCdndQP5wJxidpgoBVNYvAUACmi74g=;
Received: from p4ff13226.dip0.t-ipconnect.de ([79.241.50.38] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sFRkj-008nKP-1A;
	Fri, 07 Jun 2024 07:03:01 +0200
Message-ID: <da6038ed-87f8-40ec-a327-6065334097af@nbd.name>
Date: Fri, 7 Jun 2024 07:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 4/8] wifi: mac80211: add support for DFS with multiple
 radios
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, quic_adisi@quicinc.com,
 ath12k@lists.infradead.org
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
 <7cc3d89225f365c85b363874725cfbc77c9c1db5.1717696995.git-series.nbd@nbd.name>
 <2014e488-b930-43ff-86a6-c5a4801b82f5@quicinc.com>
 <21956735-3a04-4f29-8f13-0f84ed93cda2@nbd.name>
 <cdf2d06a-4d06-df69-245b-fc9ece0c1f2b@quicinc.com>
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
In-Reply-To: <cdf2d06a-4d06-df69-245b-fc9ece0c1f2b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_220308_531452_2823D600 
X-CRM114-Status: GOOD (  16.34  )
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

On 07.06.24 06:54, Karthikeyan Periyasamy wrote:
> 
> 
> On 6/7/2024 10:05 AM, Felix Fietkau wrote:
>> On 07.06.24 06:25, Karthikeyan Periyasamy wrote:
>>>
>>>
>>> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>>>> DFS can be supported with multi-channel combinations, as long as each 
>>>> DFS
>>>> capable radio only supports one channel.
>>>>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> ---
>>>>   net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
>>>>   1 file changed, 24 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
>>>> index 40fbf397ce74..e9c4cf611e94 100644
>>>> --- a/net/mac80211/main.c
>>>> +++ b/net/mac80211/main.c
>>>
>>> ...
>>>
>>>>   int ieee80211_register_hw(struct ieee80211_hw *hw)
>>>>   {
>>>>       struct ieee80211_local *local = hw_to_local(hw);
>>>> @@ -1173,17 +1188,18 @@ int ieee80211_register_hw(struct ieee80211_hw 
>>>> *hw)
>>>>               if (comb->num_different_channels > 1)
>>>>                   return -EINVAL;
>>>>           }
>>>> -    } else {
>>>> -        /* DFS is not supported with multi-channel combinations yet */
>>>> -        for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
>>>> -            const struct ieee80211_iface_combination *comb;
>>>> -
>>>> -            comb = &local->hw.wiphy->iface_combinations[i];
>>>> +    } else if (hw->wiphy->n_radio) {
>>>> +        for (i = 0; i < hw->wiphy->n_radio; i++) {
>>>> +            const struct wiphy_radio *radio = &hw->wiphy->radio[i];
>>>> -            if (comb->radar_detect_widths &&
>>>> -                comb->num_different_channels > 1)
>>>> +            if 
>>>> (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
>>>> +                              radio->n_iface_combinations))
>>>>                   return -EINVAL;
>>>>           }
>>>> +    } else {
>>>> +        if 
>>>> (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
>>>> +                          hw->wiphy->n_iface_combinations))
>>>> +            return -EINVAL;
>>>>       }
>>>>       /* Only HW csum features are currently compatible with mac80211 */
>>>
>>> Are we omitting the "wiphy->iface_combinations" if the radio specific
>>> iface combination advertised ?
>>>
>>> If so, it looks like unused "wiphy->iface_combinations" for radio
>>> specific combination advertised.
>> 
>> This patch series assumes that you have both wiphy->iface_combinations 
>> and radio->iface_combinations set. wiphy->iface_combinations applies to 
>> the full wiphy, whereas radio->iface_combinations only applies to vifs 
>> assigned to the radio.
> 
> 
> If radio->iface_combinations is set then always vifs assigned to the
> radio. so wiphy->iface_combinations get avoid for all the use cases.
> 
> Ultimately either of one combination only get used by this proposal.
> 
> or I am missing something here ?

The functions that perform interface combination checks are called both 
with -1 as radio_idx (meaning per-wiphy), as well as with the assigned 
radio id. That way, both kinds of combinations/limits are checked and 
enforced.

- Felix

