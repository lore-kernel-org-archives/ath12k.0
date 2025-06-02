Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE5C54FB3
	for <ath12k@archiver.kernel.org>; Mon,  2 Jun 2025 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOf+PkyA5GgMoeVaDLySq++0gYfNwU+cfdIdrQGlBDk=; b=hfHudqq8haCH7KajhiQOVL1OgL
	hHAnqQtaE0/s1sUKNtSdcxxHRBaEbQh6AYqambO57qVrCXTFM6z/+TQGQ+10iQL/p7gv13hQ/ktOv
	a9xw7hmS+RJsk7QYBnLXXSyvf5izp9mhITTnEiUiDxxg8MzAawauGwBkJh4zyqs6k/EcqI6KaXEwL
	igkthZZMjZXRMrRqOsL/6tPUi6mjQgeY//9R794d3JNwyc/GVEBDu8DUpKJAmTQch3IZIM/qNUeDl
	LadCiu4YCDJ6lWuxBXyRZOWy4JkOwTrFLtw6p34LRS2xjSYkWOwL/w4ycsK44C1iSFjuQk4L7MUea
	83xoEYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM16j-000000072p0-045R;
	Mon, 02 Jun 2025 09:05:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM16g-000000072oR-2w8G
	for ath12k@lists.infradead.org;
	Mon, 02 Jun 2025 09:05:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso24349305e9.2
        for <ath12k@lists.infradead.org>; Mon, 02 Jun 2025 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855121; x=1749459921; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOf+PkyA5GgMoeVaDLySq++0gYfNwU+cfdIdrQGlBDk=;
        b=SJ67Pulaayp9qmGD3GQgutEwc7ZXQTAdpUkWbAtRs8yr1qx+o9Jg+YWadGIQL02/LC
         2v5gvjeTxIPxAW2cpGwZWn0kNzgleS3xiup5sIY6zRXvWaiSkMVE73eYlvO2s5K17wN0
         VOh6kg3Ba5LIwzQ8i89ydq855qvPwj0N8YbqLpif77vHMfRCc3kUSafcFE6jyVtRp5A+
         yLT7AlDeEEy/c0lfry+wWEpXwUFNhPUcrg3P4JxGgYnEZwlrEianMNAkLndQUR07JDAS
         ontX1kq7/9HzrpPMC3KCKvs2jOx5fMPrbMUf0hTZsNQ+BfEyqdfm3/EX8221m/Hkl37n
         Prbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855121; x=1749459921;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOf+PkyA5GgMoeVaDLySq++0gYfNwU+cfdIdrQGlBDk=;
        b=uhphxg+SvuCwkcY4+OxIVaK7klRDGKN4TKwg25v+I6F+em30no+3YgTgwOUAwpWYnY
         mUpTyXhm9W7oMdTx/w3atO1vOeWsbSv0TTpmC5a+QFSusm/9HQQxaSbeUYBmIDyRNaf0
         2Dyyfuhakq9w7G/D21NcgkB2UJIt9XKYsZAH5yypTUPPYQiFZIAHiH2g7R2aIoEDK7DO
         I0N1r40KpTuhMMngpVzw1t54pK2rGuLE/rsb4j/08ISQmcZ5EU8T/rVWaAA7BMsYEcNC
         q8vK53eVRp2sQjfF7JTQ/o6zr/XkXATOhL4TAqaR4GeWc+nkWLtQAhIoxhEhfTqfTWMA
         Irfw==
X-Forwarded-Encrypted: i=1; AJvYcCWLbp6F8R24hpU6BjRjPjc+M7wXwCO8mMeKRF9YeL5Pzr+mItTDLVxrXxgUszzyLmDvcDXYJxE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9dmDIaOgt4H9GOecuFFvnsTue2jUgYq2u1Co+OrMVxBGG+53D
	eETa9Gz1JY4XbO6RqPRWtkij/YtPz6xguxxVA9jYroDumYb78WnauOOW
X-Gm-Gg: ASbGncswDZKREap0FfBfHA8776jdWavCVj+h68Vzus3k6QdKKH7L+xsCCRzCcrvK3p2
	8ySUeYZAA1PQ7WP4I8s+9RjvKVoqwlyb186geJ40MxaKz2NLUM1b+i+rnBLQUfKOqrd6x9pR3M+
	F5w6iTC18iUGWeVK/uUKMy+gH0EFy2YtbC3fKOB0F6of6Ps+lhx32Qn/CJ1VWXUqL+ye/NjRdBf
	HXJvcFmc8y1VysYCUR4A49ZRVh2gHb21RwnlPtMGQpM6Y2bsdczpScB+XCI1/qiClvZLi1MTc7p
	no0kuHLkJPSON89J9Ls+fxdY3nWKQ4aqErJmcGwtEK4ZNWAwSbfyujavFsZ334+ohfkkQw==
X-Google-Smtp-Source: AGHT+IGuYWcDUv4A6KOpnkgns5eFzZREoCd+HqPrUTZjIoaRW2oxarhH3bJFNmGlcRQWXrWQyeSOMg==
X-Received: by 2002:a05:600c:4d82:b0:450:d6d4:9627 with SMTP id 5b1f17b1804b1-450d6d49672mr64727295e9.29.1748855120699;
        Mon, 02 Jun 2025 02:05:20 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb0654sm114324955e9.21.2025.06.02.02.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 02:05:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 11:05:19 +0200
Message-Id: <DABXEETZP415.3EDDINBHDH42A@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>, "Jeff Johnson" <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH V13 8/9] wifi: ath12k: add support for 160 MHz bandwidth
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-9-quic_pradeepc@quicinc.com>
 <DA08F3TG062A.151WKWWF5OPL0@gmail.com>
 <c21146ef-3cf6-4d8e-a32d-8479e4d96f3b@quicinc.com>
 <DA2JV34RZGAQ.24P9Y3C865UHN@gmail.com>
 <b7d500e3-445e-455d-a74f-4ec3c7f3fde3@quicinc.com>
In-Reply-To: <b7d500e3-445e-455d-a74f-4ec3c7f3fde3@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_020522_739732_F62DA5F6 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed May 28, 2025 at 8:16 PM CEST, Pradeep Kumar Chitrapu wrote:
>
>
> On 5/22/2025 1:34 AM, Nicolas Escande wrote:
>> On Wed May 21, 2025 at 11:38 PM CEST, Pradeep Kumar Chitrapu wrote:
>> [...]
>>> Thanks Nicolas,
>>>
>>> I believe IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ mean only
>>> 80PLUS80 not both 160 and 80PLUS80 and STA must set
>>> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ flags for indicating 160 MHz
>>> support. Please correct me if my understanding is correct. However I
>>> agree that we must allow STA to connect irrespective of which flag STA
>>> sets as long as bandwidth is 160MHz. I see ath10k and ath11k also allow=
s
>>> this by setting default phymode of MODE_11AC_VHT160 for BW
>>> =3D=3DIEEE80211_STA_RX_BW_160 case.
>>> I will make this change in next revision.
>>> Thanks
>>> Pradeep
>>=20
>> Hello Pradeep,
>>=20
>> Well this is quite unclear for me maybe Johannes or someone more aware o=
f the
>> evolutions of the standard could shime in.
>>=20
>>  From what I've gathered:
>>    - the naming IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ implie=
s both
>>      which points it was the case when added
>>    - and the original 802.11ac-2013 Table 8-183v states:
>> 	Set to 0 if the STA does not support either 160 or 80+80 MHz.
>> 	Set to 1 if the STA supports 160 MHz.
>> 	Set to 2 if the STA supports 160 MHz and 80+80 MHz.
>> 	The value 3 is reserved.
>>=20
>> Things get complicated after:
>>   - later versions like 802.11-2020 have deprecated value 2 in favor of =
the new
>>     Extendeed NSS BW feature
>>   - Table 9-272 still implies both 160 & 80+80
>>   - Table 11-23 & Table 11-24 implies only 80+80 but both talk about the
>>     'VHT Operation' Channel Width field and not the 'VHT Capabilities' S=
upported
>>     Channel Width. And thoses had different values even in the first AC =
amendment
>>=20
>> So it feels like when no Extended NSS BW Support is used (first gen AC d=
evices),
>> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ really means both 160 =
& 80+80
> Thanks Nicolas for detailed response.
> Request you to kindly review V14 series and let me know if it works?
>
> Thanks
> Pradeep

Hello Pradeep,

Yes your new version fixes the problem for me.

Thanks

