Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A492CAC5B0
	for <ath12k@archiver.kernel.org>; Mon, 29 Sep 2025 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT/DCjXCwhUv0XXBSmUnUzpw3KWocFMoT3s7DAQA7VI=; b=JZakdpZlV7kGMytR91lG2Jueot
	H+AeLmMo1PL3SXc8GY1DrP7M4P57CgLBLW1v+rcvtC0uLyLkf2Dfyhokw057UpXLoezQklWbbQrh/
	NmJlkQse0014sWePIdq0xBDjGD+s4vvaA13H0b1wb0JkLc3PPf0fibi90gb/5IRSkTkxJw0pZgNp7
	ABvWWjChMaSKvySCSmZfnyWkETScRv8BbE2RvNpWjyVgo5q6pGC5UnM52oKCV0aSAXyFGBAukvPdQ
	+6i3OkDQUZhSeo4lR3PnGivCL+GlVTaXUFSyw3hTZExOeoFiUOXb1YkB45KEGiCVsiWop2CgK0CA7
	SzFvFGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CqU-00000002STA-0ozC;
	Mon, 29 Sep 2025 12:19:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CqR-00000002SRJ-1CjL
	for ath12k@lists.infradead.org;
	Mon, 29 Sep 2025 12:19:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso28338595e9.2
        for <ath12k@lists.infradead.org>; Mon, 29 Sep 2025 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759148345; x=1759753145; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT/DCjXCwhUv0XXBSmUnUzpw3KWocFMoT3s7DAQA7VI=;
        b=jj+vP504AfY/Z1YLj8BBUBdW0l5hIn7p35tRrlr18AGGzR+PjTxoCH67SenndR99QY
         w39UWbV/HDAZCk2kRp7S3NKlcNKOk3nGNpdp8yPwRFMtselZo8/Dd+3yovwe+Xm194dD
         S8IEQQZfpI7WEVHEAknYldxGy8Ogcmrwn4xFz9dmhRg0aQ4noowgZTyTjdh41gjl8/YO
         XGbqG99WZgWxs+OWs+VLmNT1HfcHY2GMwruZ/YBXZNFjEihsYHYTk9DSM08LJKagrhGs
         vmhZDv64UL4jLKUKKSONqfQkoPGKEMphmIiUqNmZ9M8GkTG+ZIgzPy/5cCxIiSvjO1V8
         PRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759148345; x=1759753145;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aT/DCjXCwhUv0XXBSmUnUzpw3KWocFMoT3s7DAQA7VI=;
        b=ZoxnpLDchgjlq+yvlT4J/ziofA2ZuUk0oFj/qpk8BrnhM2PuoLRHtNc3M6+FO14yyo
         aQJy0Ns28B6D8Ksa0vIg21qPO+aCspKUdqzpIW/m+H40Lg+WnjlhwxvY2hPaOycQbklu
         niUogOu8vBc6abTHBg5fK8wcnh4dqhgnV25D2NBRmoCAyz84D+1Y0st+Db5Q0MoRpmHW
         7RLe0X1YgANAV5vC/DbxhVNWtaYoYiIL9dqaDFCKTWMH98w6vDxlXlqAvPwTxI6WVdyv
         lq0D8eOQv5yGQReP3Srcr6LiCSesd+Js77nnNCuUMTg+0z3E2U1s+73roO+dQpTuy1Af
         q8YA==
X-Gm-Message-State: AOJu0Yy9pdnzMTDo1pnCag5guJewpper8Xo8CGEq/mcoUUPQ1rQdyN8C
	hqyISkJZpRue+0NsO769JN3uyLnH6TCZ0jUrDwMAuDg8Ed7a9hG1wQhmY/rGjw==
X-Gm-Gg: ASbGnct5sgK8rM5qCfPBD8nNxhzoJriGaWT+JEs2L+GSYmfpVNLvKgxQ5umpoRsyCfQ
	e36tznmzPES/hQYEr0n6xemlB2KXbNSWpNMBGeQGOT7XiwfiQZ3Oy/d6aJwsGWYa5FX/ZGuBoX4
	uC6pDwAnXwb1WGk/KTxBsBsIxdOIAcZdFZ/fY24C48JqKodlAgZR7Q35UzrE5bT7/D45+ZG7lVV
	+mRFYU2I6fTFB6JwIebayCo5+MqisjhxUIeE9kCgzaOm7WwhyjQ/GCilOs/U4XlR7mEf5JjbzoO
	fmrsy+KFdT+1gOWFJhrqH1wK3vyPWOnfZd0GqS70kN5pupUmSbQEmepQgC/JyMYScLYHyPnN8OI
	qFRTiTzJroFXfPjKGjFUfnlvCQTUAtuFpAGnf0rY7443KVX07cD4mXLyo71Fsezw=
X-Google-Smtp-Source: AGHT+IHBb08XFrh9vxYgcnIxlVs0+rX5j9ohWU54l76f6T3cELMRiuHTRW0h+WyLv2eggDY/UZF5Gw==
X-Received: by 2002:a05:600c:1d07:b0:45f:2805:91df with SMTP id 5b1f17b1804b1-46e329eb016mr143107405e9.20.1759148344276;
        Mon, 29 Sep 2025 05:19:04 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3dcacsm12050635e9.2.2025.09.29.05.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 05:19:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 14:19:03 +0200
Message-Id: <DD5A1KBRHCWZ.RXDUFTTTZU4J@gmail.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Ryder Lee" <ryder.lee@mediatek.com>
Subject: Re: [DESIGN RFC] Critical Update handling in the kernel
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <linux-wireless@vger.kernel.org>, "Ping-Ke Shih" <pkshih@realtek.com>,
 "Johannes Berg" <johannes@sipsolutions.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
 <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
 <fce447412112421887a1a81f5ada850e@realtek.com>
 <e79d3239-d536-45c9-b081-09ea7ba5bb00@oss.qualcomm.com>
In-Reply-To: <e79d3239-d536-45c9-b081-09ea7ba5bb00@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_051907_339443_A50B845E 
X-CRM114-Status: GOOD (  16.72  )
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

On Thu Sep 4, 2025 at 4:24 PM CEST, Jeff Johnson wrote:
> On 7/24/2025 1:48 AM, Ping-Ke Shih wrote:
>> Johannes Berg <johannes@sipsolutions.net> wrote:
>>>> Before we move forward with implementation, we'd like to confirm wheth=
er
>>>> the proposed design looks sound. Are there any concerns or potential i=
ssues
>>>> we should be aware of?
>>>>
>>>> Out of curiosity, we're also interested in understanding how other ven=
dors
>>>> are currently handling this feature in their downstream drivers. Is it
>>>> typically offloaded to firmware, or is the logic implemented in the ke=
rnel?
>>>> Just want to confirm whether all this will be used only by mac80211_hw=
sim
>>>> or will there be any actual users?
>>>
>>> I think Ping-Ke previously indicated that they were planning to do
>>> things host side? I'm not super familiar with the timing constraints
>>> though, so I'm not sure what that might imply.
>>=20
>> Yes, Realtek vendor driver handles the feature in host driver. Having no=
t
>> tested CSA and ML procedure mentioned in this discussion thread, we
>> are also not sure how timing constraint to evaluate if we have to implem=
ent
>> the feature in firmware. =20
>
> Ping-Ke (and Johannes),
> Have you had a chance to review Aditya's August 21 follow-up?
>
> We'd like to move forward with our firmware-based approach (since that lo=
gic
> is already shipping in our OpenWrt-based systems). Perhaps Realtek can pr=
opose
> alternative host-based logic, and there can be a flag to select either
> host-based or firmware-based Critical Update handling?
>
> Thanks,
> /jeff

Hey guys, any news on this one ? Seeing the ieee802.11 bn preliminary work =
done
by Johannes, reminded me that there are still some usefull parts of 802.11 =
be
that are not completely finished yet ...

Thanks,

