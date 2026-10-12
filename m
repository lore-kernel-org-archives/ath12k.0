Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D3CA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=; b=NFLMpPcAAFxFdSHlL2av3AZ6KP
	JKdv93HlCzbrDPDWOhnbxBvYBro7sDHpDUR5ZomCu6v/pdkPhvkEBPDAJC3IS7wyjcpI0rncnSQN1
	qrRw8KtFpbHWiA6ovyVlImXoYG0PNV83al6ClsUlaMrOwDQsNWdIH8E/icmG2z+wYmImxmfTXgtCA
	8qFiL4AbWsdxmsGZSN8Gst7NY8cpeLswxpezq+J0BroQvXzgySTgW7UiqWTOgM/nSLKn8jAh5puRs
	Y/2x5YJUA/ajlzI3TmEtE5E5SbPoy9iuqdlluqyWCpKHoVd2fLjg/0vDwEJfm7oZatddaOZWKWqjx
	KL9CZc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJHr-0000000B1sU-1Gqg;
	Mon, 12 Oct 2026 16:54:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJHn-0000000B1qx-43Z7
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 16:54:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFphwt2761070
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 16:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=; b=pIvCpBShCD+MhrCT
	LahX8GWl+Ogwdu1PhX9brdO3bWoKRbm/QmqwZXv5l3cw50rOzeAeMLrI82hQfGyF
	cadnwuI/whfPfe/6TM964zA30QZmxhxUW3d6NM1wArAfjy0WTvMkQq6ikz0HG4Ke
	tBPPX0+DfAox7nArJ6adgWlbuDsLrebMnk4Y4GQNe2B+7Ks5YgrHjeYsY/WCqRUz
	k32/08I1lxvfU0hpLXncrNLkmaxgpwj0owUbnr+fZO29VGwzu7daVQ04dsSUo4ft
	7XlOAIxtl4yEvqBzepnRDTFGYKSbCRWEXvWnCOTyq+BS81vTYHNyubTF5vgI2zYy
	zETIoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjracq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 16:54:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so1305290eec.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824042; x=1792428842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=emdiuagZp47KKDrQFr8mQRfeEN1CH407b5O6diSBtK51qu4KlS5Kd4O0yubkWKzF27
         76SZFZpfAIrHtLM+GZeYCR9L4kqZ6gfWHAM1JOCyq0pBtVEH1D4j5X0wXxrwkhTcyaQ4
         dS6v3l3WUc95nYXnqMRlkxO4E9bby84nJh4zcDWeY4h75fOb2Sht6cvb5BkzxAvIkVVZ
         zFlK/8A9LjkrK+yfUHw4Xga35hA0heMS7yrcilJSlJ8cQ0a3380Ssatw2SQ3nSIdNuWI
         g0o34zNoPrJYS1KSuex185+7B3EL/h956WkN3KGgQiuOMrRksA4ZrmpR6UmYGiXwCv7/
         lfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824042; x=1792428842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=J88mBVxsvapRFgMyWQm7ioVaP+NiROqeOboOHrdiMiC2p8tkfbPPEImkqN0dQ3p6Xm
         AgqVOuDiP0euvKvfiwQBEkWX3gAI38BtO8k4a62rG1JM+tay+P/UfxWwXVdAL/vsQgXX
         Hk+GAsmAFd3z7nLhss3RZnnBxpUONYsU8VosDA6Iofi9iNAoE/h6YUstbnRWWgW7HPIN
         9Y7VLcx8vYkKArfaiZang9TMK7ZTFa87n1W3I6TCcWRItAKiC0XymQu9aIDlrOMwNLhh
         pq9e5dwwucYQMwAbvRJ1p+49enlr6gByNYJx/zs4S9iFLfSalqcULRbt54jL/HVYIvr0
         Qn3A==
X-Forwarded-Encrypted: i=1; AKwUvByTU30HfGsws6by3J0Ikd3t0AszqnOrvSopKq9CyTkpskcVCTvZBp3wLquOZYmKDRp+CaXM1kc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKWfsGrXB+1dBWKKDTOSQYlZYauo+HuCeRfPmJyU1Vm42/TQ9Q6
	ULEvQ4CJGSVt5QQN/hFR0jp/p8UvU1/toWQuOC2o8yGRzamlAmHawvQvFJhfMAmf5o7WozQNt2L
	QyyaKVWA4Eyjb4sfCF+Z1P19jPFi0joBP2/vicL6T7RrAeAaTDfoUG8NkhlTI9RaF
X-Gm-Gg: AYBFou0zgm+iY9Vhfe/qlubIzgTPrvGkvXbZzPW9RIxja0ybe32Q9UJHohtyiv+hi7z
	JV4RQirCC0AHNAKFM/bMd/DSKWUVY/fhUCYxpTDB0liF2KM0BWnPB4kKMcPUo1fU0nLElPVCd9Q
	g4r/Pga16wkzPBBcXmTA3t6HdeKz0h9ij5AW3IwvQnwRRSS4sergltv/rsT/WDjUKyQoGALHElA
	Se5ngW5c+RhckoBu++Zu5Ql/m1NbCz8WEE3PsA0v5JFd5C0jQEga7X+WAIuxsJEcBQmeqF4ZGmE
	udJpqVu6NENRP/6sxjuWTLQ7rU9C9fOLuxlAlJlCakBd8uBApbmBDH5fhp9E3WKLmhOwsWXRz+i
	xaMhPe7f/uYWsOFcsMurUt1LtE08WWSJTxJAm7lC5iCWyM3OZgmYw+d91NA==
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121571eec.4.1791824041790;
        Mon, 12 Oct 2026 09:54:01 -0700 (PDT)
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121519eec.4.1791824041002;
        Mon, 12 Oct 2026 09:54:01 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm32044009eec.29.2026.10.12.09.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:54:00 -0700 (PDT)
Message-ID: <ef08eb14-0732-4c75-9f69-2173cba91b65@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:53:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tRy3J1iozPPTFdbsAXPAvw8-DIYhKiNI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX0s7TSx3fDNEz
 m23lajJ3UWHP1WVAoL0yrjY8zYmEILHG39PX1PrQg60lUOTMIGX+lIKsFXsTrhrgMFBLlCYbRCh
 /LJivWIptmt/zwpJA2VSncrZchbqCVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX8Mcf4qsj2jCY
 DdHkA/Q0zd8TlXfiwcjJ0zsh3f6p8iD8OTAXjmx5Icf4gcb/uX91Rr6VnjgUW1Rb2HQfZ8dcqrJ
 Cy9YSKa1/SDjs5flFvaaT1NNL2D/WjO5E5cUjqGJL74EThrmx8OfFNcpqnOh5z6Wzn8Mum7lmyG
 vuPJPOQvctvZeT4GeGaKZPt/IeqyFKlDBR/MpiHVgGXshJk8a7s/xS0OPv1sP0LJZoLUn6aY85c
 x54a5DyNNhnfWykRYPmSzAddr4XWvmyDi1XaoSO3X7Jo1ZVp5wP4tjU/3NWCrqvvX0X76FKc2PM
 8+lNKlVuQ3dlAQXECDPV/Pv8oX1CBKaSu+fZuoZYT32w6ZXAwM1GuNsf/Bl61E1RLNEB7GcjM/U
 AmvskXIdoEffWH9xQkyCMpAFRgayTuTeKX4wsUMc9vEhMnIDOpMq/+/cAuDljgGwCpnPtF0phKi
 5pBhWb4fst1iGB47Diw==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd10aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=IdRum9UsuwhjULrUfLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: tRy3J1iozPPTFdbsAXPAvw8-DIYhKiNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095404_129332_00F3C2A2 
X-CRM114-Status: GOOD (  19.66  )
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

On 10/12/2026 9:38 AM, Konrad Dybcio wrote:
> On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
>> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>
>>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>>> on those models.
> 
> [...]
> 
>>> Is this really a hardware description though ?
>>>
>>> Its really more of a logical/functional description. It tells the runtime
>>> what todo, not what the hardware is.
>>>
>>> You could also have a list of quirks in ath12k for this or have a user-space
>>> utility look for the appropriate platform device string name and disable
>>> rfkill.
>>>
>>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>>> a compat string.
>>
>> This is good point. Either this could be deducible from the compatible
>> or this should actually describe the hardware and whatever is there
>> wired/configured, not what OS should do.
> 
> Sorry for digging up an old thread. The board-compatible change is now
> I think merged into ath12k, but I'm not sure I like that, as now every
> OS consuming this DT has to carry a table of board compatibles (hence
> needing updates _every single time_ we want to support a new device),
> instead of being able to convey the quirk through the property
> 
> Perhaps we could revisit this approach?
> 
> Konrad

I share this concern although I hope the number of platforms is minimal.
It does seem strange that something supported by ACPI is not directly
supported by DT.

/jeff

