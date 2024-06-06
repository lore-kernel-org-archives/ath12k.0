Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D680C27C52
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gge9+e71QIIiKl79xIQ9ahcEsOGsE+WSYoADqd1DwAo=; b=KWA0SCR7bGMrfrcx9+McwejUUv
	WFSQbv8h61WZCGTuuJILyx93leVp9ESFG/maLt7imShBe8SCYsrySMZsCSIqFbb4cm2FRLWe2L1qn
	1p4/KJUrVRIuFciKXEtfjjKJZXXTrBmL4+YOErzuoK9NLlTMuPzje6ZWoWn21QgukZsL6ueLYhHuS
	VEVIVHYsA5aRjX9gd7IpxziATo8zvhkl23ERWYZbrr4HCyyaXuDiL34RlPRyB7noSBBB9POUfUuwh
	9lZObJieQJAYs2Bit1pGR2nuJF2ZBDiBIP7OETmxmSo4kbQ8lRVxCjt7GoPnQgGYTysOqwZLnkafq
	HlITo7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8xq-00000008yI6-19kP
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 08:59:18 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8xn-00000008yGT-2AGD
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 08:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gge9+e71QIIiKl79xIQ9ahcEsOGsE+WSYoADqd1DwAo=; b=XkaCPWc3BADgpt8e3Yeb394kU6
	gF4+e8pvuynGBE2Oh7azxhjcDlXNgKdVsMPmsJjclwwCXxWFASdyA7Ae3noFaD1akVFA+pZU0nge7
	yzeOoq5UuUfhfxOSiE7E3BHhZNhLOBiBUDVO/ZRu2zAnPRo6b2zak3z2uRHpYrf822NY=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sF8xY-008Rio-0o;
	Thu, 06 Jun 2024 10:59:00 +0200
Message-ID: <21208cf1-eaa7-4077-873d-5863019111e7@nbd.name>
Date: Thu, 6 Jun 2024 10:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/7] wifi: cfg80211: extend interface combination check
 for multi-radio
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, quic_adisi@quicinc.com,
 ath12k@lists.infradead.org
References: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
 <8fc2f117346fcb4ed11bb20cdf9cb1f88bcf64b4.1717611760.git-series.nbd@nbd.name>
 <8add7134-9929-0288-0770-7778013cc37c@quicinc.com>
 <23a6d1eb-3ce9-400c-aa3d-a7d29c953079@nbd.name>
 <555d6af3-5b47-6d8a-9222-d3949c156cc4@quicinc.com>
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
In-Reply-To: <555d6af3-5b47-6d8a-9222-d3949c156cc4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_015915_576554_AE00919A 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

On 06.06.24 10:56, Karthikeyan Periyasamy wrote:
> 
> 
> On 6/6/2024 1:25 PM, Felix Fietkau wrote:
>> On 06.06.24 09:20, Karthikeyan Periyasamy wrote:
>>>
>>>
>>> On 6/6/2024 12:01 AM, Felix Fietkau wrote:
>>>>       /*
>>>>        * This is a bit strange, since the iteration used to rely only on
>>>> @@ -2384,8 +2383,10 @@ int cfg80211_iter_combinations(struct wiphy 
>>>> *wiphy,
>>>>        * cfg80211 already - the only thing not would appear to be any 
>>>> new
>>>>        * interfaces (while being brought up) and channel/radar data.
>>>>        */
>>>> -    cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
>>>> -                   &beacon_int_gcd, &beacon_int_different);
>>>> +    if (!radio)
>>>> +            cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
>>>> +                           &beacon_int_gcd,
>>>> +                           &beacon_int_different);
>>>
>>> Why its avoid for radio specific iface combination ?
>> 
>> Because it iterates over all wdevs within cfg80211. I didn't think this 
>> was necessary, given that it already excludes MLO wdevs.
>> 
> 
> Dont tie the radio specific iface advertisement with MLO.
> 
> Usually the existing code consider "params->new_beacon_int" the MLO
> scenario also.

For your hardware, do beacon intervals need to be matched/aligned per 
radio or globally?

- Felix


