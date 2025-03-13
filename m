Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD3AC282DE
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB67YH6YfdXrNYVTUHeNhr27VpzrcXfl9PICsA70xKI=; b=VIfbbaSnv+GcMb0Hfso5JRpyUM
	EkwfmOSQlunC4tS6Mp+M9WMgidtMITtU3/oQJAtkpo0+SZrgaBfkxjzUo1dWW0IfcaFq6ZJrNsm9F
	w2wG8XKl8sfzXg0JTQbnX0X3wffrms5bszPnw8Xlo3L0c6+lAaOU7fEXHPwGEqcvyrp+JktgbLWtq
	v1yniomO729DXmfHlI49JwvVSsGUH6HN9le9FkydPFfsZ6mj/7DiNZj4o5GgYRZgZawv87l//x/pe
	+13kLgdauOlT1DefrxdvpsOARPYA4q8b04oShOx9XBZuBPFCyzzdsNf3eSC5MXDYgE6G74BHMsLci
	Azz1Cv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfXU-0000000ApHT-34zK
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 10:11:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfWM-0000000Ap6c-39cL
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 10:10:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54298ec925bso1203156e87.3
        for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1741860633; x=1742465433; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cB67YH6YfdXrNYVTUHeNhr27VpzrcXfl9PICsA70xKI=;
        b=SVHNpSOYTdaIJHndS+ye3xmsBF/rY4WvtT1yeeLq4yZTM3EUaXSNVPK1i+heGrZ4NC
         Tc78jrcFvpN0OVQkYCasXf4mRTuohuYop06n2RfXrPPsj1K/gwqC5Qy1lt9kEAULdnMb
         FzByHCV0XSR/+c47cb6aIZOOIr6ufmgXdbq8D88lxmjdVWwVBBmueomsZ5WAaX3HfHaM
         9pEHZJv3A+RBgdnzZM7JNao6VpKIkiCZupFk2nG0lxdeapufyUvzW5PZmqWY/bGuDge7
         t971iHhKZYarfSFkITgHVRiUvT/UNoUAfACHYIkwsAaTwrUK+p7fm+oJ2BtBIP5RjwUA
         4ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741860633; x=1742465433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cB67YH6YfdXrNYVTUHeNhr27VpzrcXfl9PICsA70xKI=;
        b=Sud8UQs1IBUJ+HT15pdS5/UYBLTGKTmrQLtKGpQgDHctWYcjYfGebCYdSm54rC8OmS
         EwJb0j2HZb4p8nYvG0TVA1nc9Y3UwWMh7360jWzh7XmVVgLAa2JnXSJcvOXtqyu+dbfx
         Qo33larp8NpkIjy18TbixfZhn/qD7Yx318612+QqfhiVgGi0M8RkRGi+biOMdpK+8Mrw
         3sDxWCAVUkYTVe1DFq8z4PjK3O1Gdhm629UbgvtNp7TvpJAzMmT0toAwchlyTNfM7iSc
         ddcc1VFQJoK4YsmxS8sc8pnRNlQ7Yp9Z1tiIuuhkHbaOTpYF2x+A43F6ncEAXYATy+jP
         AyHw==
X-Forwarded-Encrypted: i=1; AJvYcCWxQj/PsCym81DMleiRGgDaIbtRoFLMlodLaydYZZTJyiRwNTFJQ1pi5Kgrsg+ZUrfO4XVc3/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRw49IQikRHLrEcCyEFlHoh7l5dAd/b+fBIEbAE5F+BeKHlWVe
	zpm/koLOAKF0OlBgtYgyxtRb3d6+jRDJTImllBTMV0NrMq3ubqakr1OxqybBr5c=
X-Gm-Gg: ASbGncvHb3oDtjV7EFg4/MbLLx9V5T+8gZwxHkJYrxP4UmWGRJ2C7RfgWZeRcUeViPS
	9mmE9AH7aEAsFQGcIOAi7EoSvKWVIybsE1MhLLxmVKrrclu58C7rgaJ3G/bxlrof68vhTU9olYu
	vabcrveGbMaCMiHE2jLf6UXiCqaHE6kbWhGCu55n4n75cDrWw7evj4LDvoWjUBbiIANG192esqq
	zG07Q0HhbQ/VZ7pe8fSZnopVvDRjE0cFr7Tsbjxx3D2EPnQqZmqtn8z1fU/xXfJP8waQdLHbkKf
	7QFh2Ib1H3rvX6cMIx0fhxB7qG5aA1rsS7no6he1iO1jJwZgCNp8vIu4e0E=
X-Google-Smtp-Source: AGHT+IFG51K1w0HPoy9OtijujySdcKdTqN4yBf/VMBFgBwfH8an14pHCg9O3uX4RyxkS50AvoG6zCw==
X-Received: by 2002:a05:6512:3988:b0:545:2e76:495c with SMTP id 2adb3069b0e04-54990e6729dmr6810635e87.25.1741860632590;
        Thu, 13 Mar 2025 03:10:32 -0700 (PDT)
Received: from [192.168.2.202] ([78.62.132.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c0723sm163463e87.70.2025.03.13.03.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 03:10:31 -0700 (PDT)
Message-ID: <187c8be7-23ef-4bcb-9ac1-cf1882fe3e62@8devices.com>
Date: Thu, 13 Mar 2025 12:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: limit WMI_SCAN_CHAN_LIST_CMDID
 argument size
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250310-limit-wmi-chanlist-v1-1-8f0fb45459a7@8devices.com>
 <a44f064f-19fd-16ea-222f-058486698951@quicinc.com>
Content-Language: en-US
From: Mantas <mantas@8devices.com>
In-Reply-To: <a44f064f-19fd-16ea-222f-058486698951@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_031034_804886_8FF15635 
X-CRM114-Status: UNSURE (   9.29  )
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

On 2025-03-13 11:45, Vasanthakumar Thiagarajan wrote:
>
>
> On 3/10/2025 6:58 PM, Mantas Pucka wrote:
>> When using BDF with both 5GHz and 6GHz bands enabled on QCN9274, 
>> interface
>> fails to start. It happens because FW fails to process
>> WMI_SCAN_CHAN_LIST_CMDID with argument size >2048, resulting in a 
>> command
>> timeout. The current code allows splitting channel list across 
>> multiple WMI
>> commands but uses WMI max_msg_len (4096) as chunk size, which is 
>> still too
>
> Did you have any private changes to increase the message_len from current
> 2048 ot 4096 bytes? As mentioned in a reply for your other patch, 
> multi-band
> in qcn9274 requires additional changes in driver, only scan mode is 
> supported
> even with those changes.
>
No private changes, using unmodified FW from:

https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main/QCN9274/hw2.0/1.4.1/WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

max_msg_len comes from FW initialization message:

ath12k_htc_connect_service max_msg_len=0 flags_len=0x0 assigned_eid=0
boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
ath12k_htc_connect_service max_msg_len=2040 flags_len=0x7f80100 
assigned_eid=1
boot htc service 'HTT Data' ul pipe 4 dl pipe 1 eid 1 ready
ath12k_htc_connect_service max_msg_len=4088 flags_len=0xff80200 
assigned_eid=2
boot htc service 'WMI' ul pipe 3 dl pipe 2 eid 2 ready


Is support for multi-band AP/STA limited by FW? AFAIK it works with 
proprietary driver.


Mantas


