Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0680C3064D
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPUwk9Bg7NOVcMjpKZiBrNcQqZRu3Q+f17SRCYvy4Hg=; b=tFKl6cf6647iY2KNatHrmA7zf+
	RYz9upw58a1nJXNZx0fVj8vIVzjT2idnJPff1gDLeyBhy4W9d5qoD2SSHbWAfKXOn7Udya7NtpdrF
	FslNGkO24YmZecIbac01Uu+c8sS/iTS11kQlurDpNzDrurI84GPbZ5FVUspi2k5YiHVZzXI2OWqPt
	9VHnr0TZOv04vz18N3cHqrjz5VrUsxX0YKBpkpJsvn8sEZ2uRCYmFc+KQZdVmpWCL7Al8Cp2JtTQ1
	O9by1mhYF5vQkBw4Y2UT5GUo2N3F+RrF0W0/EGdEyJbS7Uc94qn3oOcWMi+i18RuB8vIj+IWt3wX4
	7IS17GDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObMZ-00000006R2p-2dt0
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 11:07:55 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObMX-00000006R2D-0NBm
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 11:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DPUwk9Bg7NOVcMjpKZiBrNcQqZRu3Q+f17SRCYvy4Hg=; b=WgAZ5E4pb2qeFoMJwG+hj3zA+x
	6HSxi23BxTpnDkp++Y6FnSbWuG+kx5Bqq5+UfuyWqQ+dX/swc/2JYLf1BMgzfeBz4rAkN6C9fWBI5
	Mr7MOuTZLQ3mGiounH4jomoqx9CRrOVMk4m4s1l0/0XPWwEqDWVLDbFAm/Zqn1wHcuyE=;
Received: from p54ae9766.dip0.t-ipconnect.de ([84.174.151.102] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sObMQ-001kfi-2w;
	Tue, 02 Jul 2024 13:07:46 +0200
Message-ID: <a57d5571-f252-49b7-b182-75df6dd2d96a@nbd.name>
Date: Tue, 2 Jul 2024 13:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] wifi: mac80211: add support for DFS with
 multiple radios
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, quic_adisi@quicinc.com,
 ath12k@lists.infradead.org
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
 <61899e29de4e0f5437643d578999d2a3d4d7d7b2.1719843147.git-series.nbd@nbd.name>
 <bbb93003-807b-b6af-2096-20837de902f0@quicinc.com>
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
In-Reply-To: <bbb93003-807b-b6af-2096-20837de902f0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_040753_164183_AF2B400C 
X-CRM114-Status: GOOD (  15.76  )
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

On 02.07.24 12:58, Karthikeyan Periyasamy wrote:
> 
> 
> On 7/1/2024 7:43 PM, Felix Fietkau wrote:
>> DFS can be supported with multi-channel combinations, as long as each DFS
>> capable radio only supports one channel.
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>   net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
>>   1 file changed, 24 insertions(+), 8 deletions(-)
>> 
>> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
>> index 7578ea56c12f..58bebfdaa062 100644
>> --- a/net/mac80211/main.c
>> +++ b/net/mac80211/main.c
>> @@ -1091,6 +1091,21 @@ static int ieee80211_init_cipher_suites(struct ieee80211_local *local)
>>   	return 0;
>>   }
>>   
>> +static bool
>> +ieee80211_ifcomb_check_radar(const struct ieee80211_iface_combination *comb,
>> +			     int n_comb)
>> +{
>> +	int i;
>> +
>> +	/* DFS is not supported with multi-channel combinations yet */
>> +	for (i = 0; i < n_comb; i++, comb++)
>> +		if (comb->radar_detect_widths &&
>> +		    comb->num_different_channels > 1)
>> +			return false;
>> +
>> +	return true;
>> +}
>> +
>>   int ieee80211_register_hw(struct ieee80211_hw *hw)
>>   {
>>   	struct ieee80211_local *local = hw_to_local(hw);
>> @@ -1177,17 +1192,18 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>>   			if (comb->num_different_channels > 1)
>>   				return -EINVAL;
>>   		}
>> -	} else {
>> -		/* DFS is not supported with multi-channel combinations yet */
>> -		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
>> -			const struct ieee80211_iface_combination *comb;
>> -
>> -			comb = &local->hw.wiphy->iface_combinations[i];
>> +	} else if (hw->wiphy->n_radio) {
>> +		for (i = 0; i < hw->wiphy->n_radio; i++) {
>> +			const struct wiphy_radio *radio = &hw->wiphy->radio[i];
>>   
>> -			if (comb->radar_detect_widths &&
>> -			    comb->num_different_channels > 1)
>> +			if (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
>> +							  radio->n_iface_combinations))
>>   				return -EINVAL;
>>   		}
>> +	} else {
>> +		if (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
>> +						  hw->wiphy->n_iface_combinations))
>> +			return -EINVAL;
>>   	}
>>   
>>   	/* Only HW csum features are currently compatible with mac80211 */
> 
> In ieee80211_register_hw(), mac80211 check the global iface combination
> against the IBSS interface max.
> 
> This check may fail for the radio specific iface combination
> advertisement since global iface combination is sum of all radio
> capabilities, no ?

You're right, will fix.

Thanks,

- Felix

