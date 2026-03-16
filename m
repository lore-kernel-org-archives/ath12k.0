Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B3F4644A
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmBiFHGEKg6lWFa683rASkkA4loORSF+TCINv8eIzlI=; b=RIiW0T/gTH4joFMj9/5GWBAyO9
	QGdJg83wJAXw8wPVgtDVjgjNeuyvX0KE2coTprWt4D8aAKMBcfYDuXEobshnQmcdUU37amnkYEH5N
	AdlwVRwP9JWY+lto4p63qpGqXOFP8IHdXIYP0JjhFnuK+TImvi8ugjIvizXHRjJmunYxocQBf2k0b
	Il/7ebcTF4MSlxkZenS858Ed7EIQ7J1adK0ya5mF3GNh3AwHq6XPDXB5yqdYplUjAx5Fwss/bwjqi
	pNQDcdUzZTGy8RR8Q5uSytFLV42OBw7kKVxGPOwtUtBOZh27E6f1co7epyLzCKyEoEGR7H+qZTSjr
	WbsPcdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25dC-00000003mRC-1CGU;
	Mon, 16 Mar 2026 10:57:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25d9-00000003mQr-3FCn
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 10:57:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-485409ab264so30490195e9.1
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773658622; x=1774263422; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmBiFHGEKg6lWFa683rASkkA4loORSF+TCINv8eIzlI=;
        b=CyNhXMl3yWqp/xZ4VpYTZP2pmIFj2INvIUtLhkwv/gwvBrVEf3ctak/K90mOH2M5zz
         nror/K1lXRd/prf44jYwIUQFnxCLhfJCUA4Ijhu/gNYPW2dpHb+KnBcMduMO5HeQwEZV
         SQCQYNOTlB3u3i5s/0r7+8T2X7eld0qn0XpD2fQk6UAfMlP4hq/kc8gXbZwpKbAvFkL6
         Wctwn4NDGHNRJ5+86axMg5PLWx4XB7rHqd/BJzbIJGqk5ptKqzvrHtdh0A2h8Ykkm37H
         4db6CIArpGjVfC+DyhRc1RSNroVmMVAgmDikNNsvpGNZAHOhzqHC0uvjP464joyauJUS
         qNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658622; x=1774263422;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmBiFHGEKg6lWFa683rASkkA4loORSF+TCINv8eIzlI=;
        b=X5TXHexGqOVxZTG6kqEfowERdlCAJPmKbqardEzVvXD7kIGcuelKjXEvzvgGo2x6f0
         dUSktmCab2BSfdvjGK3x3o8Gh6fnRpwc5H+xxZ2aZIO4SkV7mimBZVwqnEE8hZ2R8+Zm
         yh22HHypb1sUSJFKdwGi6zOuEkFwDIMgih6v3Z6GwGAB7EnV91AbEx/K6bBoOw1aQ92A
         1rAKL7s4wfY60uG491wl3AqTT1cOe9T7TBAKMqkDapCl7TzT9QgjBlWpRcsLJBqGIWpZ
         8Z7M9jRNnG8n4a60N3AB5VFbdpeRde34zWER5/wUB9OQZEOzHAeZNRZkY9R2lCxfjvVW
         KA/A==
X-Forwarded-Encrypted: i=1; AJvYcCVjFqJAlXvcNF3/RChsY/o+EzCXbt1MX6xD0L8fA+aOwhhmHgnbqiDZkboqMr4AZqACpeTZs/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyG8xzp884pgMX2XO65DTowusfDJ/dTKE0wS8yik2YSGHtafYb0
	LfYQZDUAsnp4WMP4sTB/RE3TqnoAKVsS3b13JxDiCu5W3G40YypAcX6u
X-Gm-Gg: ATEYQzw1hRs7L7WlM+XRvW3i3xc06mK8Kjg9A40GsfC6N/nalK7FCaI1u6OUVt9rnsn
	YQatZDpjTSly9gl8nhBzBgbtAYvTcdhQcB6kzUd18RJzHc/LQpgAv0wOpFvOEsz4NXhETrUaKxC
	oxTaCunLpeprgDjQvUdvLhwQtG3eTghCteVHg5ehRWv2eGl6JycN4PQWukpiKXikq+SFCzrSnn/
	4+qLV7xh9LPAu3KD6eQ3fSRNsVuBmAbRvrI0TTyFHqCbpIT57oFxa1JAYzq9kZeEHVS9QnFNOHL
	ruGCzvV/tk1UBiiy3jOwlKXdeRXzzH8CJD25E9VfTxhPLQHoTF4bfrw9uSunTjlcl9GfbRM5WOO
	12OJ10mxvvrnG622fWjqqKKWfm+KFbL6eOsKyWHAxyQItS8HHQOfQ6kD5YayL3rQd1v5+4T69ff
	AsiRSOyJtrjLKec2nOpTDQdnU6QPTER4SdTVx8nHs9nnw4fGjg+GBC
X-Received: by 2002:a05:600c:1395:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-48555b2c86bmr201827335e9.9.1773658621460;
        Mon, 16 Mar 2026 03:57:01 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm522370455e9.12.2026.03.16.03.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:57:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 11:57:00 +0100
Message-Id: <DH45I9X47H77.74AIOL6V8R49@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260316103248.3042158-1-nico.escande@gmail.com>
 <d38acb9f-60dc-4d37-a3b5-8cd09f76939e@oss.qualcomm.com>
In-Reply-To: <d38acb9f-60dc-4d37-a3b5-8cd09f76939e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_035703_832144_66BDFE8F 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon Mar 16, 2026 at 11:42 AM CET, Baochen Qiang wrote:
[...]
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -2321,5 +2321,24 @@ struct ath12k_base *ath12k_core_alloc(struct devi=
ce *dev, size_t priv_size,
>>  	return NULL;
>>  }
>> =20
>> +static int ath12k_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret =3D ath12k_wmi_alloc();
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>
> nit: you can simply
>
> 	return ath12k_wmi_alloc();

Yes we can, but I did this in case we need to add more stuff in that functi=
on at
some later point. It would generate less code chrun. But I'm ok with a dire=
ct
return statement if you think that's better. Just tell me and I'll send the=
 v4.

>
>> +}
>> +
>> +static void ath12k_exit(void)
>> +{
>> +	ath12k_wmi_free();
>> +}
>> +
>> +module_init(ath12k_init);
>> +module_exit(ath12k_exit);
>> +
>>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies WLAN devic=
es");
>>  MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wirele=
ss/ath/ath12k/core.h
>> index 59c193b24764..02ee6c718621 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/average.h>
>>  #include <linux/of.h>
>>  #include <linux/rhashtable.h>
>> +#include <linux/percpu.h>
>
> does it make more sense to add this to wmi.c instead?

Indeed it does. I'll fix it.

