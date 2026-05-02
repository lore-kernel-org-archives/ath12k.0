Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE517CD3424
	for <ath12k@archiver.kernel.org>; Sat,  2 May 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBDcfPK1AgZLUELHYdbZHtr673QegAZdp61XoieXnLk=; b=0Rcc/bG6FFYNESacgqRpWr0RfX
	Oxm0cgWfhpgKavMU5zKPPW0ANy/wcFNtbrzRCB6trjU/InlokBxK9Zs7j3oC2ypCbp8sshJmkCjRQ
	1IEh81I8eKeslQhlhqCt5urVSa/TjzsTmIs59MPoj8V9cvEC1GJwLWG6vR/qRaz/gP5IDzqxvWnE4
	lx6LKroQ00ULet850pWaHQjM52NWaywRn1RDFNSJOH5BIj88EdgN5esO+//M0cQ6mivHvTIoXyxBv
	ay0AK4uLiR+6gg3nRtR+GErYRsChGfGgi4jWoqxJLq2eL/WxKRLvUVTojbhgqZ18eDufhME+kHLbF
	GYhdx1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4aw-00000008V7J-2GZq;
	Sat, 02 May 2026 07:16:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4au-00000008V6q-0LvU
	for ath12k@lists.infradead.org;
	Sat, 02 May 2026 07:16:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso28128655e9.3
        for <ath12k@lists.infradead.org>; Sat, 02 May 2026 00:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777706214; x=1778311014; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBDcfPK1AgZLUELHYdbZHtr673QegAZdp61XoieXnLk=;
        b=l/wpsC0Z7wviXubjb+Cy9Q65h7r6PXDF70QoYHurrTI3M7pySH20W9mJiHNxFfXVMz
         KBT5z2Y2RgjkyfWeSiOOQ8rP43XdmI869gJKYww8B6Bwsg82koUgxr0M7af8BjN4JFbk
         gv+nn7rianHxoM0qubrlB3H2f1ro4XeBa+SeXSaXi6alVIJTV96qUXIuvqX6Cj/XW9Xk
         j/57yAG2izpsPkfsJr9/WO3vrH1l8ET6Jdp3ohxfJwuZ7ckTjzW+sr6+QiCiP0IFXzdN
         c97BSe7BwXroGNLuIlyF8FzdiqXT7jU2ZwHKIDZ3ECWjfbw5Bb7iFFmN58jz4Z08TCl6
         Xvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777706214; x=1778311014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBDcfPK1AgZLUELHYdbZHtr673QegAZdp61XoieXnLk=;
        b=B9OUBnVmBxoq4IIWKSOF9SO1pmE/du0waYH9X6C9mjvKeIXE9zLk71fV0nThD5WOuq
         urAc4HByEClvabJvDN7u0QrWoaAxmbHBi6s+fnkAzBG0fexM9obZ18borhKl7uf7ewq1
         Y4lNjSFOJFYLJIUccHtZCCEDlKPPoKtaAXob3YjrxLo18oBFRebNdPRwjt1arVoKRUPJ
         CH03cLKgNphwmb4tKOKdY/cwfakIRbVBYfvtrJPb7PKkWlSLXUUGXK6+qHNIcoa9JlBa
         FjQHArjXoUH24j0wEmFbm0RyWAYHxLIo+nwiU/DA98ovpW1Ock4gfmX+hmTFVbuqHK2x
         E7og==
X-Forwarded-Encrypted: i=1; AFNElJ8741VPugG7gt7E16SuQtA3f4MQNpJWTTayrjO0ckKVb93UCxIBkwq56w6oZTUhC+El0WbffWk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTI+LwmxyE4FS/r34Zf2PZmDAnoGeJe/95tQWDaByLVRs3DiJA
	8q/MKMQxWI8VdOZkVs95S/v+zaL4lrzte+lJEz9k3qQjrF8+bhPhkb7f
X-Gm-Gg: AeBDiesjKPhtR6scZ8q+YgHj6bIewMhR1I2FfBlYO3wa72HphfBGr7Cbiuky0sg0GYu
	46KkkZXyd0QyzNBXcWsv9Ilxhrd868Nydw32VaYkOIleaGeU/MMJHO1/POuubB2mceZOKHOYgs6
	e9NxTKtuFOKBeVunCbWCjIfBuUF3E342ISRxfP2vO8qGChyt+aiu7YeumPxuVfsDufzFiDnlyGy
	2Qi6H1lhv9wlTnTUJSoohKYxaqF00xMlMN/Pn0Xl9mMoCZbEEdEaOcAnao1LkPcWymKIwL+0W6/
	OxkMGdN4Pu55NQco9S5DprezrqiNWqjGZxzx2ILdLajYabnn0KItCsisvx/lGt14xgWDqAUCAEr
	SC1ugoeUCIeVjiLw4NnfBDazL4dRT2DREe8Ou0sIrrA6qHRUiPaj1CUHMImAU/K8bcHmGSi5cxH
	eHB2DVfOHnNQbhgWQ8Y1V2EnKeLuhirt8l5gZT4LesD8Rva3n0MaCo
X-Received: by 2002:a05:600c:1386:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48a9852f471mr30262875e9.2.1777706214230;
        Sat, 02 May 2026 00:16:54 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm9164249f8f.34.2026.05.02.00.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:16:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 May 2026 09:16:53 +0200
Message-Id: <DI809CEB7FV7.1M00IPJ3VSQIL@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath 0/2] fix leaks in some WMI error path
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260424144813.1708214-1-nico.escande@gmail.com>
 <67aba8de-9a4e-46bd-936a-688abdb5d01e@oss.qualcomm.com>
In-Reply-To: <67aba8de-9a4e-46bd-936a-688abdb5d01e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_001656_131428_76A34BA4 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu Apr 30, 2026 at 11:54 PM CEST, Jeff Johnson wrote:
> On 4/24/2026 7:48 AM, Nicolas Escande wrote:
>> So this is similar work to what has been posted here [0] for ath12k.
>>=20
>> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
>> explicitly checking the return value we fail to free the allocated skb.
>>=20
>> This has been split into 2 patches per Jeff's guidance to hopefully
>> ease the backporting process.
>>=20
>> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico=
.escande@gmail.com/
>>=20
>> Nicolas Escande (2):
>>   wifi: ath11k: fix leak in error path of some WOW related WMI commands
>>   wifi: ath11k: fix error path leaks in some WMI calls
>>=20
>>  drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
>>  1 file changed, 112 insertions(+), 19 deletions(-)
>>=20
>
> Please repost and include the ath11k list

Ha yes sorry about that. Got betrayed by my shell history.

