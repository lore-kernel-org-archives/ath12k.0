Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12379FD5316
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZcJjJ/XMH1eR+uh9i0K+HsXdgxllBZzSfKzwC5Di0U=; b=w1XDlXL46XI/QCZyHcVxbdJ/gS
	zHdBzTZY4f/sGgVOFbpEO+CzMTCHPMaKkYBnTmqWduLm+mBJXSKwV41oPpc5+aNqbBrLsUQQpcnnb
	7D4HwpI8SGyT58twbK61LE+Y4dtmZ9iXa5Ada/yJ3qR5svfM4LhGoHMM15Rx1tC+SQuR10DMxg7i4
	lchmkLfqWrp03Feu0ByfHNxum8vHsQs7l8SI6RY5xsAkPspLzGr2fgDxmNkY69McpOax+d6NLvS44
	Uiomq4TLXpGql28IIv5fLGUECn7sIUmQNRqkf2ckCMlVR+BxrVAcTanH5CqrLe10gQ2Goj0BgnlXu
	QPo+36xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvty1-0000000844Q-1vou;
	Fri, 27 Feb 2026 09:17:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtxz-00000008448-1OBH
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 09:17:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4837634de51so7798305e9.1
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 01:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772183817; x=1772788617; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZcJjJ/XMH1eR+uh9i0K+HsXdgxllBZzSfKzwC5Di0U=;
        b=krBoaJENOe4wXWGlvlmtLImNu16eSBJ5vP55v3bznTfQgzBTyeQzhtIUPEFQYquNWW
         Gq41rUi7+dqPUxNkW050e3Dwu2AQyPPRt0fdvFk4wHoHnquT23gnIjS8Z4snkF4bWEVa
         lC7C1lZox/QhRrbXOgehBprOnXNnHEzKIPglgx+VkfrwBIniXg0PnHV1dlnybhqB6tQq
         lMEFyige41fTvd/SLFMFdU7YvnhHlqPcb+v4yqQUTCYpztxll1BtIqcim2ja4kOsmFHJ
         UtksG1JZO6lZDgXnLb9SwG8aD3KGNHWQo5DLTyuGN5L4CT1J4eLEUiKJcgoP93kz82Bu
         vHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183817; x=1772788617;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZcJjJ/XMH1eR+uh9i0K+HsXdgxllBZzSfKzwC5Di0U=;
        b=CIe6yneOfaegEHMz8dDdGIbzbJIPChvwItdpEYk/MRruGHxltn4qJfdfMl/4Zx3Wi4
         it8zM5yH61QG0E4FIwo6Hr9H1tEDvsXb/gTwFcJrOYplJfI3Si3JHWxaSSRLGwmyOaP9
         0wYdOxPHJdUbXga7pUr9ffsQhTon/SYZE/7gUHbNGs1K72C2eNiKenxr3HTQg4tZ8oDF
         kiDLc+M//XC+9QOUfOBngE4jIhU1HBiZ2/It38CCo64cFptD5GMhCFkB3YTbCprcKBsN
         dyZE7L9hZ2YwEYqUAUwP8rBKKd3ww58iNq40cdrOOYzw5Th8Lp8M84wDitJKkSKC/Z0l
         Yt2g==
X-Forwarded-Encrypted: i=1; AJvYcCVViqzZVbfy+JFdOxDvD1kGc/asv2VkM3I7AiSpaIAhJxLXdhrIaiNJOZARyo9uYdXeHLT/0SI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdxLpyrLVgK8E7l1FryuJUiUMjvxWoUnPUyWbO8sExi2gFOmCY
	1tBPxzT1HyZef6a8fgUS7zi90cvbtO3GX4FZRaoXNZr5BF2SzoLhRgjP
X-Gm-Gg: ATEYQzzMn5o+l+P5xBWZYLJk3pNGaeY+QmW4OMCeSDk27PdGubvDGQvhYSMfK2x9Dpa
	tENQaMxmyTAFEaDx3NRTJSYdT02+0BfG3lKZPfRCcSZ8gjMbSvv/D00PJUiJTjSMMC9sYXGcujx
	yqbTBRYMfm5ZDXiVmKUnVPtKCnrC2Kn9b06smmmiHeeXOf2/2JaqjCs8cjOizuD9OOoCLffjzWR
	EWUShTxLHREilzBaXeZu0SuFJSHxmVppkhpjPT0+OBnCHQyBGZn/ha6iz02WZtP00NcqJnbe2bE
	wuhbLs0X3L/D7psobxTEPWPX/HpcnfDpQYR/OGu84CkRH4H8p3GqTPyAvS9UBRu6Rb78jUGx9jq
	qW10Qw2htxEPugogZ7/TARY/o1yISE4JEYsWzp+XqUA3uV6dD5hr7Wpmq5mqUDXDAXuiG2N5qrE
	MJoC/777Tafy32uFFk7a0eAIvAymUcXYWSFW9P1r8N2A==
X-Received: by 2002:a05:600c:b90:b0:483:abeb:7a5c with SMTP id 5b1f17b1804b1-483c9bdb600mr31323875e9.12.1772183816949;
        Fri, 27 Feb 2026 01:16:56 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm74951295e9.5.2026.02.27.01.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:16:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 10:16:55 +0100
Message-Id: <DGPMQDTEBLPC.25LCWXNBJJDZX@gmail.com>
To: "Pablo MARTIN-GOMEZ" <pmartin-gomez@freebox.fr>,
 <ath12k@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
 <f8b98f6f-5e52-4968-8270-6ffe2e381ae2@freebox.fr>
In-Reply-To: <f8b98f6f-5e52-4968-8270-6ffe2e381ae2@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_011659_407406_156A3955 
X-CRM114-Status: UNSURE (   9.69  )
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

On Thu Feb 26, 2026 at 8:48 PM CET, Pablo MARTIN-GOMEZ wrote:
[...]
>> @@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct devi=
ce *dev, size_t priv_size,
>>  	if (!ab)
>>  		return NULL;
>> =20
>> +	ab->wmi_tb =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
>> +				    __alignof__(void *));
>> +	if (!ab->wmi_tb)
>> +		goto err_sc_free;
> If `!ab->wmi_tb`, you're going to `free_percpu(ab->wmi_tb)`; it works but=
 it's not super pretty.
Yes it's by design, we do not need to null check before free() and it avoid=
s
adding a new label that would cause more code chrun
>> +
>>  	init_completion(&ab->driver_recovery);
>> =20
>>  	ab->workqueue =3D create_singlethread_workqueue("ath12k_wq");
>> @@ -2296,6 +2302,7 @@ struct ath12k_base *ath12k_core_alloc(struct devic=
e *dev, size_t priv_size,
>>  err_free_wq:
>>  	destroy_workqueue(ab->workqueue);
>>  err_sc_free:
>> +	free_percpu(ab->wmi_tb);
>>  	kfree(ab);
>>  	return NULL;
>>  }
> [...]
>> @@ -6795,11 +6749,9 @@ ath12k_pull_pdev_temp_ev(struct ath12k_base *ab, =
struct sk_buff *skb,
>>  	ev =3D tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
>>  	if (!ev) {
>>  		ath12k_warn(ab, "failed to fetch pdev temp ev");
>> -		kfree(tb);
>>  		return -EPROTO;
>>  	}
>> =20
>> -	kfree(tb);
>>  	return 0;
>>  }
> You're missing a change on `ath12k_reg_11d_new_cc_event` (was added by 59=
1de41d7008585f2e7c35dbcf5922fcb4d79e39)
Indeed, this was ported from an older kernel, I'll fix before non RFC submi=
ssion
if there is interrest from QCA around this feature.
> [...]
>
> Best regards,
> Pablo MG

