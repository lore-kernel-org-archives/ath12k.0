Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D78106F2FC
	for <ath12k@archiver.kernel.org>; Thu, 26 Mar 2026 08:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV+/4YLQuUZVej4/BJJ/VK1qCWNO+yCpr5F0GFGmnXE=; b=ZnsT1YpjdlFOfvzrzq6i835KHg
	ldazkHIES/EUPx+JBalSyWcnxfUQnmgkO0tyVEqWVEyRzKKxamb+Ca47qJyfz24iuT9LlPVvlZ4nM
	kWYEygEKM+GiOXtkQxk9eHhyZgkB/zvML5lHPtQdzp5y2HnOIFGsbjQf4WkWygpr5+ckrYch2tQ4G
	HfsqU01LvYo1tlPPEKsctUCaGmsbMtozXIPfFx9HHQa7OGJyUkHv9qeNMOISwgyIsGHq9swH0DX9D
	WJqEiUG1FWGeb709OujgIldHjVz1pXnwCjSNiK/a1uoEzq95jVIc3BnZgnZJCEfXZITYRFzK0o+tA
	ol2SVySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gDY-000000052OA-1C2U;
	Thu, 26 Mar 2026 08:37:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gDW-000000052NR-3Ap1
	for ath12k@lists.infradead.org;
	Thu, 26 Mar 2026 08:37:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43b9144790dso351527f8f.1
        for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774514244; x=1775119044; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV+/4YLQuUZVej4/BJJ/VK1qCWNO+yCpr5F0GFGmnXE=;
        b=YPxYyQ2lOJ5DmMMR6/khyvPsGXOmsNwZ4skpDRDglor/UFkiEwYcKuGwrmhmAO1mcu
         vJp4XH3JnxDw2x/NDeJXyYrWhU1VTcAVDA4MbFMSKRyqT+HjKS1k8Dm42BrB+dQI+G9z
         iFxTCllA5MdNYIQ9Q+/9XgDwnBarNNeqhI42/DesaJNITgJiJ1jfLdsgm5wAN4tvz6tF
         +Prx5njwlSUVbn0/BhhqTRVl0XCvtnfYDclJ2ADXZ06u91pqZZ/xw/UQcd0D4OayHpHP
         jZcH9E2ohH4tUunWpCnSE2DALN7a1lN2if3eDPLn7HEBfMP3du4Wnd0eL0xZtFgG1jWN
         EhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514244; x=1775119044;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JV+/4YLQuUZVej4/BJJ/VK1qCWNO+yCpr5F0GFGmnXE=;
        b=n+C7oEPfXh8Y1Q+JK56ejHtsaJC2x+jl4pmzP6J4+vBmggq5IlA5olOR+GU7gnCNnM
         aujSCdf1GC09JgYzrRaT0vxAF9mM/c/LZ1wMpahz92rlOAfkYxQ9OIuFv+hbUftWxZDP
         8k3wGPcVleAi0E4aC68qya3FMRXVvchVCdhqp/62DcQAk0mAVi0gZ2T9KipjRceScByu
         ORdF+nirwpfbBr15kS1S4vnYjJW9rtRmHIZDmEqrfMH+CAsy0I2sfPbXPutmMpf3LQak
         XrTrtoave5dr2SmCRc9Kc5Bqdz7L/I6vEZMFigNozt4bp5FNLYvwsbhUtivdLESTau07
         aAoA==
X-Forwarded-Encrypted: i=1; AJvYcCVf13kxAwggRny6LtKfNra/18xq9H2T68IJL3ro28TH9FJ65v75g3W88p8r549WoNG6hSgOLlU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5s7ye+eExkxlzRLaenmlQS6Ge3vDBba5Tt3/y7KilqM1sJTft
	rKgiliLCN5uNljjJf6oEU7nz1LyhmjtalJuzYCIuU5lKq0X8nGXvXPM8
X-Gm-Gg: ATEYQzwewGHgHrG1AwQpVjLJKlTlW71S2PzGJRwwNqaeWrO+iNm0A/SzyLaCau4jPO/
	h1WycIEtWmyU7MMmBTJTKGqOXyNo9GJEtqSoHEhE7L1GaecRxDoZe1wtiKj9DBK17cF2jioztTr
	vboQloMgfpP+2up4m3Yz/N6qJEsQeBnHhOw74f+Cn+nm67xqCjvA0F2yTEE01ZXvZApgUK8RROa
	UuypjYCe27oGqrE4L6UwboRuzj5gmwtsqg5Vw+oLst3gUyGw/D1Cu1xjldTtIInCEvxZ7h2KzU2
	WMg4aRK6RC5OiCp6lwwuZITo9kE0yCk5sd8WVSKkIyL2dSzEK0CXDUlVrJx46op0fbViPnCScZo
	1Rup0j0+6Oo08Ipjm5zaiSxPJRWACFMl2CF2bzcBYqgXflwysEHAC1336lA3JqzPyhVgvHZXLmc
	m+WDTj+hEkw8Yl7yBQBpKL7YfJynE8yRKg5NCbFpV5kw==
X-Received: by 2002:a05:6000:2c0e:b0:43b:3e40:222c with SMTP id ffacd0b85a97d-43b88a0ff9fmr10481303f8f.26.1774514244238;
        Thu, 26 Mar 2026 01:37:24 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm5942229f8f.6.2026.03.26.01.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:37:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 09:37:23 +0100
Message-Id: <DHCKSTJAAL99.V5V5D17RLHD@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Rameshkumar Sundaram"
 <rameshkumar.sundaram@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
 <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
 <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
 <ec266bec-c371-4ec8-a60f-21ebb810d38e@oss.qualcomm.com>
 <edf86c6a-fb09-4524-9b47-3061c3d6e68f@oss.qualcomm.com>
In-Reply-To: <edf86c6a-fb09-4524-9b47-3061c3d6e68f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_013726_808381_96C8C3C0 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue Mar 24, 2026 at 5:55 PM CET, Jeff Johnson wrote:
> On 3/23/2026 5:40 AM, Rameshkumar Sundaram wrote:
>> On 3/19/2026 9:29 PM, Jeff Johnson wrote:
>>> On 3/19/2026 7:35 AM, Nicolas Escande wrote:
>>>> On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>>>>> Or may be have this allocated on first device probe and free it on la=
st
>>>>> device deinit ?
>>>>
>>>> That seems even more involved. It would be easier to go back to the pr=
evious
>>>> version and simply, alloc it once per ath12k_base
>>>>
>>>> What do you guys think ?
>>>>
>>>
>>> Going back to that may be the better solution. It isn't nice that this =
current
>>> solution may allocate memory when the driver isn't actually used. But I=
'll let
>>> others on the team weigh in as well.
>>>
>>=20
>> Yeah, allocating once per ath12k_base is definitely the simpler=20
>> ownership model.
>> I was only wondering whether sharing it across devices might be worth a=
=20
>> look, since this is per-CPU scratch space and the table itself is fairly=
=20
>> large.
>
> The other alternative is to still have a single global allocation, but al=
so
> keep a reference count that starts at 0. when each ar starts it calls a s=
ingle
> api to alloc the memory and when it stops it calls another api to dealloc=
 the
> memory
>
> when the first ar starts and calls the alloc api, the refcount will be 0 =
so it
> will allocate the memory and increment the refcount to 1. when any subseq=
uent
> ars start and call the alloc api, it will just increment the ref count. o=
n
> deinit each ar will call the dealloc api. this api will just decrement th=
e
> refcount until it reaches 0 at which time the memory is freed.

We can do that, but we'll need a lock to protect this shared ressource:

  - The clean way would mean adding yet another lock to protect this, but i=
t
    feels like there are already enough locks in ath12k.
  - The other way would be to piggy back another existing one.
     ath12k_hw_group_mutex would be a good candidate to be honest

What do you prefer ?

