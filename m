Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D81C25B79
	for <ath12k@archiver.kernel.org>; Sat, 18 May 2024 01:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=; b=HkglCvz7paGUWh5C2m8SPYvA6X
	A9nHnVgGqGgFgn+vVP4BxRlgpHqn7WMYizhqf02nf5oaxh3i47UdGOTPGEo58QB+e7VXyB5FLYS6z
	BBEPHQ+WXEuhyce28AtZc+UzPSGqME2LC95zJtvhS47ZP0uD15zHYvVDoI+0AuF5Q0KEXI1fmku9g
	ACYbMUFEyEQiWz/x0iGaZANRE6EjBLDchxMmRK0naXYNjOnM3ZVo2LHb9/kWlIlo9DeYtyc6LW3wy
	lC/D4aR1GRl/CIAQ9G7DfiPJUzYQsDQH68KeSjxHdDF/VLWSnCWZoOnkUCzOh39w5bPcyEW5jdOCE
	aD4wEDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s88p6-00000009LvS-3Kmb
	for ath12k@archiver.kernel.org;
	Sat, 18 May 2024 01:25:20 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s88p2-00000009Lt9-15JE;
	Sat, 18 May 2024 01:25:18 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-24544cb03abso375825fac.3;
        Fri, 17 May 2024 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715995511; x=1716600311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=;
        b=iCkDbhIHq55rYp90OSeq3AAK6xc2uQwZqeAXpqt+MlDuMm365zhQzJiov8OEKFn4b3
         ljjW2R+WWGGOcws5qOHqvX8bKzMzrTGVZimNPo0u+S9C6HW68hUjL+2kbz0vvZM3BSRk
         uFSKV93thxNwXw+ZboTcb9hoIJbeSwRjLoIdr0uaW/TSbVHS/oQinLx5v9gQqZNqWIGq
         YocoKqa9kCjX0gisDYSbakkpseP0KAAli8AjngcIVk/4RIOFbyVqT1BMxqn3f07Z4fD1
         peY78DSlr7CaxnR5L+Oa1/8xVXsCmbTjjp80dpADZudA7kWt0tVGWYRvYZNlesAOcCIg
         eFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715995511; x=1716600311;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=;
        b=XFlqpBGKmPxHIMKlKLucL5DJfujsUT0oQi4XOVq3m8v5DKeOcCjvoqaGHYyG53VJo7
         AXEQEuFeDNCzaXYNyVtpFl4XOG98HLGeV6uieKiuSGYulKPwzqXLEblo8zmQbbYWDF27
         FZW1hH5aVLMvSFxRqRyGXb/luCOIF67LrHsHNXdCmanqf+1S2TIZrePg1iJlWPBbqAvO
         gKtl9Y3138LapPbOHEU6tbOPJrVm94pdkT6xymkl15sCN3u7wDwaJqeQq2Wlt3j0wRjf
         QVYH7Yhou0KZ8O89dBPdTKdyGvU1A7y/GvCwdoAdqQTkKWlIiBlrOGPPpCYghYxd2fHE
         wf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLds/z8qWH2wcE9lsrBN6kVWI5M9Q3HCiLkinYgB7++BehWHAfY/KOmp4kvrDGpSwsofYO5DQdGmp5LOe5PT5j5eeXJzP9PDauDucFzO1dKkDyQ5Xd2+bkLSh81eC1XWPzBFyEFf02OA+2PzSmKGzodSNw0COdRQy/xKesUrNICKeZ
X-Gm-Message-State: AOJu0YyJvdHHp8IS3rHDX/tNCJmcmyongC+fgFzixeQwbzl4L7J9XFay
	YxljdEVh/Bw6CXI0uiv/m01odFwZPS0uykm/Oif4lkypvUko/w6P
X-Google-Smtp-Source: AGHT+IFRaG5+veBhAS+2oO1Mq9a7mnKgK9vX9unu3cCbE/KbyDzrBjSt084GN8tso2cWg108BqN4VA==
X-Received: by 2002:a05:6870:a3d2:b0:240:c8ff:c96a with SMTP id 586e51a60fabf-241728fc1damr27553351fac.27.1715995510785;
        Fri, 17 May 2024 18:25:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66316sm15339938b3a.35.2024.05.17.18.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 18:25:09 -0700 (PDT)
Message-ID: <64db2b94-edb3-4ea3-87cf-bb91746869e6@roeck-us.net>
Date: Fri, 17 May 2024 18:25:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org,
 selinux@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org,
 linux-sound@vger.kernel.org, bpf@vger.kernel.org,
 linux-wpan@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
References: <20240516133454.681ba6a0@rorschach.local.home>
 <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
 <20240517134834.43e726dd@gandalf.local.home>
 <5cff0ff0-48d1-49f8-84f4-bb33571fdf16@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <5cff0ff0-48d1-49f8-84f4-bb33571fdf16@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_182516_325109_421FC696 
X-CRM114-Status: GOOD (  15.40  )
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

On 5/17/24 11:00, Guenter Roeck wrote:
> On 5/17/24 10:48, Steven Rostedt wrote:
>> On Fri, 17 May 2024 10:36:37 -0700
>> Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> Building csky:allmodconfig (and others) ... failed
>>> --------------
>>> Error log:
>>> In file included from include/trace/trace_events.h:419,
>>>                   from include/trace/define_trace.h:102,
>>>                   from drivers/cxl/core/trace.h:737,
>>>                   from drivers/cxl/core/trace.c:8:
>>> drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
>>>
>>> This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
>>> So far that seems to be the only build failure.
>>> Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
>>> cxl_general_media and cxl_dram events"). Guess we'll see more of those
>>> towards the end of the commit window.
>>
>> Looks like I made this patch just before this commit was pulled into
>> Linus's tree.
>>
>> Which is why I'll apply and rerun the above again probably on Tuesday of
>> next week against Linus's latest.
>>
>> This patch made it through both an allyesconfig and an allmodconfig, but on
>> the commit I had applied it to, which was:
>>
>>    1b294a1f3561 ("Merge tag 'net-next-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next")
>>
>> I'll be compiling those two builds after I update it then.
>>
> 
> I am currently repeating my test builds with the above errors fixed.
> That should take a couple of hours. I'll let you know how it goes.
> 

There are no more build failures caused by this patch after fixing the above
errors.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter


