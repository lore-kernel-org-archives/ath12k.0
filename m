Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE4CEB1048
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw5OkrKLTUYeiy5PocG1boVDdzf1yG7eS/+lqIiXJdA=; b=ProMLn1wQuQe0O2vU4p2QuFqkk
	5IhSHmisDTizcsy6astza2GkseVOMQ1IPjPebbksHllFmzbjQHQBqGFrKSO+8yW/Ffn8Fvhgmfxh2
	+Hv0ASIjcxSMIa6ROCyK0Pdux4dCXXA6XLJ9StEZdq+OhPwE0PeK/3ttctuDegYmGWUqAA0TQa0VZ
	tGaxYoMQQlgEZGdR2QNdVaIC+8O5wS8757+mJEK81VmeHERUI+jy0xvW9FpOeiKEgNHaOmsWQycB8
	qxUIke24XYukepNTnnB25S6O0LUWcr7jidu/+tVxiASu0+a4hDYOo6R7b81rb5b4bxsGLyblP4lgb
	59n2uNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuMj-00000009CiY-2X9L;
	Tue, 10 Mar 2026 10:31:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuMh-00000009Che-052x
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 10:31:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4327790c4e9so9865200f8f.2
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773138661; x=1773743461; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw5OkrKLTUYeiy5PocG1boVDdzf1yG7eS/+lqIiXJdA=;
        b=T11o9GA6zkjhE9aOWTuHlZETY3fxfYCm090mfQ3qvw7cn7BBlMG/EmFOaF6Aqe2GzY
         jyHdEDJkKOuilVNEdzjetoW+SIR5PEWoKe0yeSRFcv8abVqOPWq86fhjwJ6ZHltWMrJ2
         ICifv1YUoGhRf/2sLwV5eyLrxIRt+QUTQwxLFNvtSBKBZaGDcrgkTdEP7M2ITfYJopxG
         4JlUWELiy3ZbK5X1SE4o11rvFqrKbMq4YTdbUcbVM+MY4nPdA5+n9ia4meZkVYzfhVPn
         D1iKWhJ6vP7AsVFHQA62N8cRBLEDEKtJTOcHQJkQ/3F1FR73DRminH2MJbqoeQvsiJZZ
         0Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138661; x=1773743461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yw5OkrKLTUYeiy5PocG1boVDdzf1yG7eS/+lqIiXJdA=;
        b=M3Yk8OGZOXgGO/bx0OFAgLjln020lH4S4ExLEV5rw7roZwarWRaW1Ijj3kdEpGs23B
         jvJdZOm+lKIjy6xQ06QDLTSdHFhdjb+d6hnIG9fqIUx0i4XMpTOxLFv2uJa/8CUzANnA
         UipKfSjrF8iG19Xkjb09b9u95RP0T66m/WO/aYi8JNMb49mkbx1WW9rmUH7UHdn2/+9/
         7v+q4WZdsAXo7rEWJ0qXfeIMmBpvPnOrAYRhQ6CnZvxRyk8NA34iDiyJ/b5edlbxBVNC
         YNckcq7PYzSegM59LUUX0EVo/xCywnnaDqPvZQqStrlthR68g3HYBBzcLDetYMppMdzp
         aCOw==
X-Forwarded-Encrypted: i=1; AJvYcCUhQuPnAD9GP8yGAWR0g3xcnpZnIXZXxeFtDFQxfKT2rZwrA0tEgeP7JYR/jQNVHH7AH/HauOY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjx6TPX0aFbnDGI0LVRkcK9ng6bVYWA9GlK2AMED73KWk14HOR
	V9HcWeeQe9j+DGG2MjFS4wSYwenMusZbYYcCJqOYP9BWdJO+6o4GWzne
X-Gm-Gg: ATEYQzxxPSisZylX7XVXNKXsBcuvH3lJdk7OfHkbWyuphguOqy1icJ17H8lIkUBDBJW
	Kvde9pNg0f3mWBGkx//0Zrohzaf9oHxNxU0wB8kSYguX3g0A89IS/9JYCywzFr5mNsiP66fs324
	0oxohuyy2rPIJsUcDeOZvuugzQeVlqZVEGgLUYVWymeeGU2/fXQ+O5yKVSkwdqnBNPK9P1LJkAp
	Zi1/epMjp6GhuNzorbC4pXlk/SpEeQKoRUqJzU+2y6/WW1FqCVpX6S2orhJGoTHD2VuL+L9+fsX
	COoz7EC6dp1trZMQ/tqXWboZ/9Z1Eu3C25PW840IrRji3aTWFqo/g+NuYwNQDIY3ylMjtQgNC9+
	l2ycAe+I5RWKT7iMskGkszfn99O0eCxl/AE0o9JDXVWEOpyb+T9rLHVDxzZKqeGwhVARYoYXOU0
	l+NEyTdf5GBEWYBZ1KQTxXOHv1y1xWjehpjIomLqeL5KQNW9rrGkCY
X-Received: by 2002:a05:6000:420b:b0:439:b6f7:7ed9 with SMTP id ffacd0b85a97d-439da64f7edmr23080562f8f.10.1773138660855;
        Tue, 10 Mar 2026 03:31:00 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae46353sm40544538f8f.33.2026.03.10.03.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:31:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:31:00 +0100
Message-Id: <DGZ17385SNYX.3149KUG92UUU1@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309152050.191820-1-nico.escande@gmail.com>
 <04d268a7-8f6e-4aa4-b366-0dc38c355de7@oss.qualcomm.com>
In-Reply-To: <04d268a7-8f6e-4aa4-b366-0dc38c355de7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_033103_084049_1D27A7FE 
X-CRM114-Status: GOOD (  14.96  )
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

On Tue Mar 10, 2026 at 3:05 AM CET, Baochen Qiang wrote:
[...]
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wirele=
ss/ath/ath12k/core.h
>> index 59c193b24764..ebe7b94fd712 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/average.h>
>>  #include <linux/of.h>
>>  #include <linux/rhashtable.h>
>> +#include <linux/percpu.h>
>>  #include "qmi.h"
>>  #include "htc.h"
>>  #include "wmi.h"
>> @@ -937,6 +938,7 @@ struct ath12k_base {
>>  	struct device *dev;
>>  	struct ath12k_qmi qmi;
>>  	struct ath12k_wmi_base wmi_ab;
>> +	void __percpu *wmi_tb;
>
> any reason why my v1 suggestion is not considered?
>

I considered it but I for sure did not write enough about it in the changel=
og.
Sorry about that, see my thoughts bellow.

> instead of allocating it per device, how about making it global and defin=
e/allocate once
> when loading driver. This way we may save some memory in case where more =
than one devices
> get probed?

So what I did try first is to use DEFINE_PER_CPU() directly in wmi.c to hav=
e
this as a static array, directly in the compilation unit where it is used.
But this failled at runtime as the allocated size it too big and it would h=
ave
needed modifying the max alloc size that the module loader would allow.=20

My second option was to add something in the module_init so ath12k_wifi7_in=
it().
But as there is no ath12k 'global' struct, it meant adding a global variabl=
e to
hold the per cpu array, that would be alloced in wifi7/core.c and used in w=
mi.c.
And that felt weird too, the wifi version specific part of it at least.

So I stayed with the per ath12k_base, which as relatively low overhead for =
a
clean consistant interface.

But if you guys don't want it that way, I can rework it. Just tell me in mo=
re
details what you think is the right way and I can modify it.

Thanks

