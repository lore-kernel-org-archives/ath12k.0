Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C489C55170
	for <ath12k@archiver.kernel.org>; Fri, 20 Feb 2026 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2c9cut++S0ooLuRidjLDVhKVzcUPe5weI5mpOub1A8=; b=XMafHbVa6b3JsiCXESElVP/wk2
	TM6eGf9qyWPxR1l44Os7iABTYfOCAdpN9vYEorYNfplbg7WPXz8jwl/Qzua9Nfwddg0s/lkJfZKBV
	oH8gZvpuwuc39C0np+cfVJu341Itzpag0dccFDKFAlHV4prBd8oMEAFbliAmKJKsj3iShuhJCaNBg
	gGZ9mdWoBzhZePYstyg7GxRa4EGmEjBCw7KwZswVR+7HUigK0UZE/wUc4KNSfxosao1HaTOOwrvUU
	/bgQ2Kqjmwx0s/jdAiEVysGI+ov7OoVaIDdmbFTOT8/Q1Y5rkne7qEbr9tiFYpUWg+WEC00Kjd7yu
	/g2nnB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMmd-0000000DUrU-0IsG;
	Fri, 20 Feb 2026 09:26:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMmb-0000000DUqP-0ZlN
	for ath12k@lists.infradead.org;
	Fri, 20 Feb 2026 09:26:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso15080575e9.3
        for <ath12k@lists.infradead.org>; Fri, 20 Feb 2026 01:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771579603; x=1772184403; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2c9cut++S0ooLuRidjLDVhKVzcUPe5weI5mpOub1A8=;
        b=gmVUytuhNX7W4D1WhANvS7xEXmrCQVctUk2hUC8QjXEEwyCuTROM+nLTwgk2xXpUsK
         ouvS2jYXY4ZXCuKnBaXnsIfOXSjtqgtIgANVZ7LLR1kYtxARJp5PVznOc/oCVWfcx6gP
         GOKBsNronRodqh6FTNhpwCoYFjHno3p611ObD2G0oQTAMzAxlrGu/zJyj59LfF9bU211
         mD+Ex7S/12j9zKkESJyvgc03LpUkxb20HSHIbkhgXh50ds6BwGb8sFqlSpCLIz4ANZI9
         lhy06xLM26F9VI4elhARJcVvebsQW394hR/BXFldBKiTS3Iv5jQL1xCZLf6sT1cI6RHl
         3nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579603; x=1772184403;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2c9cut++S0ooLuRidjLDVhKVzcUPe5weI5mpOub1A8=;
        b=S1O5ZeC6JbVHczwx+pfYH41IrDxILDTFS2bIdmI0JMYMm0Z4Ddsk4EO7nX0HzcjvbV
         Z4zAfo2KmhprkME+neI0Pmz/aWgw1UwYO2ZFFgftoVGbBBZBXmre1UfyRuYuICU7qIr1
         KcxV41mzbKcOtc5FGgXSpRW9Uq4Heotx5itwk2fEzjAvgm1DnZ2o1yZ7njkQokDa1dVq
         b8oaY3aggEx3UP2qjfLYxUlMIqzQLIxY7PVYwOVzECVgqNaOan+esXXcSI6+YkhMYkeG
         zGNeQEIhzUhc9CQKHtPiv6M8ezeZibwgxvYPN3s2arUMMS++UPDFCGypkrm1ixkc2YV+
         Lvow==
X-Forwarded-Encrypted: i=1; AJvYcCUPHFoKegt9topXxLYHV90Nw4mSOb0B+b+aj/7uBuYo2/OU1M9GyN0rmgT/lJAjn4hU8nzXwqM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbM2dVYV/y5K2HrqQSmGvNsunMMzxSe5nr/o3CBx4hu8CtKnRn
	1E/OewAiRAtPTLB7Shdv2gdWt8Jw2OKRG8ewqlbkLWEofKnPJJ49NE0i
X-Gm-Gg: AZuq6aKJeueQRT7FOZUUP3Lsoj81ylPANWv48urWl05TTkXnaXuyRRst2NWNln8U4XO
	2cTIB+ago4t2Gcl66FIJat3wHfGMe+U3Gl8vJ2tMxJX8/UtO2CK9uydD/mYYi1lW9z3uY7jnrEq
	gNBO91ou3KJ086KnFToRM9l21Ddxy0zYeUz+WBqBOirMhZLK7cgMxsLlizt2VQG4j6cvqW5ZjCN
	ZaaVXdw8lL+/s/Nx3jcrYEJA7+0dt/U0KVJypCC1zmpuo2bZHYUspBbWmUmOvqiHrBQHgAAyCGx
	K0oDkdOvolebiAfkx3rtBTNtYleKoaF0ePPLMc1f/TfKbUoKSezl9Gu3cc8whiNTIH9EmOCr9kJ
	ZXa4qNdPwpdJ9dna1SgqYIaT8YYZjITwuzWHkPYOtt+pRQZGFd7bHB1DE8Qj3c9JtJapz4IfBYF
	lxYI9j/qKBAdJhs3YdyD/LTM/Yhgt9zyavyJd8hWEuQg==
X-Received: by 2002:a05:600c:548e:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-483a553babfmr18583515e9.25.1771579602631;
        Fri, 20 Feb 2026 01:26:42 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm56052805f8f.38.2026.02.20.01.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:26:42 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:26:41 +0100
Message-Id: <DGJOK1Q0O01C.9OQ68I9IBU41@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Aishwarya R"
 <aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, "Maharaja Kennadyrajan"
 <maharaja.kennadyrajan@oss.qualcomm.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <DGITONL8L200.PJE38TDXYRQC@gmail.com>
 <017ec99b-693f-47e5-ac38-6c207a32eb62@oss.qualcomm.com>
In-Reply-To: <017ec99b-693f-47e5-ac38-6c207a32eb62@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_012645_185411_7BAA8F8B 
X-CRM114-Status: GOOD (  10.91  )
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

On Thu Feb 19, 2026 at 10:37 PM CET, Jeff Johnson wrote:
> On 2/19/2026 1:15 AM, Nicolas Escande wrote:
>> On Thu Feb 19, 2026 at 8:34 AM CET, Maharaja Kennadyrajan wrote:
>>> +ath12k-$(CONFIG_THERMAL) +=3D thermal.o
>>>
>>=20
>> I may be wrong but I do not see Kconfig changes that allows to actually =
build
>> the new files. Is this intended ?
>
> There is no configuration specifically for the driver -- it just follows
> whatever has been configured globally. So CONFIG_THERMAL would need to be
> enabled to have the file compiled, and CONFIG_HWMON would need to be enab=
led
> to have the sysfs file exposed. ath10k and ath11k have the same logic.
>
> /jeff

Silly me, thanks.

