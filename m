Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76420D19502
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxWCDGOalC1xTYHIkVlYbNPnVuMBEdIAI2IdHhYbv0E=; b=FQckvJFqoHAQxvHD1tZ0qdjUSg
	kclJ0YowcyvOKfVqwjYc5CAt/hixYYiuua8b8zS2/8p+jaIJAmC4wiOvwc8Gy8zqTiQHHXZPTCef+
	tEh6VYwxAc6atogQnN4g/wwErufn5pXPbrcUy1oKYngbsRE9FXxvSrzz3tC9mtu6PIcepiLfvT9m+
	vWF6odw2baZbKpeu36nBchg0qgM6B0YGw/NivDsWnRxbkMLc95fIOTJOIaH5FSfML2x2N3WSeYJzo
	Vzfzc0mwxCu50fpkIAJC+zBCiVV7+UxdZcBwKJP4g54kJR6RzJWBNbIGmlOIhsi9JGJi8ECxKcSpX
	/uKRLTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQaY-0000000CzYw-0xVt;
	Mon, 26 Jan 2026 17:41:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQaV-0000000CzXp-2JE0
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 17:41:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso25330555e9.3
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769449277; x=1770054077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxWCDGOalC1xTYHIkVlYbNPnVuMBEdIAI2IdHhYbv0E=;
        b=fMLqxpPook9mZiQPMpsHixbpfJA+wg/y37Ehhotvr+Goyn1z2q4UQkWczP9UOQ5fN1
         oiA3lzj60YbTSkAc6jxbdGzdRKshUwArTg8rOPi2snqsAwCHIW7e+IcEYewFpf1dV2J2
         3ZJ4vHZmwwNmBbxetVrP5FOU9HAIM3nb2Vfyuw2lLMM1KEOfHo02XkYITUIPOeiCIzuk
         aq26e0joCFHgF3zU6OAVTQeXm0pjXaOO6A4JYo2eZzN1vbccRJzRNpEOTXFBIrFfaaxs
         HGGgIptqyzX9FwQYGrGJJBDvGs+MsIlPrlKixg34rknqa9i+bdJv8fYv2ZAzBZY+Aoop
         SMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449277; x=1770054077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxWCDGOalC1xTYHIkVlYbNPnVuMBEdIAI2IdHhYbv0E=;
        b=U/PBHLJgwN39Fx9jRz5kkqjCLSerKgn68WR7ynoJURQUx+Y7Oa9qskay9015Nyqh9W
         77kMCCWEogRok4b+rdD4UdBBfIf1a/n3MXVgjKBztvNm+Jop6Y3Kgv8vNhjQXibCk/xW
         gqXNGwYabn0pJuREtdoYt9vuGKtK0R7uDIhQ4Bi0lumJuY0a5LdvPNiKJc5iW/3R72oF
         DVwlKhmViVPfTdVByEItz8ERJUZn5JWuOJtzrV4+6hftSax3bRXU5RSBsBLVMpRh++YJ
         471kI/svjFbl5SyO1i1mGxHyy4lh7vpGdNrXDTpZ0ZdnpgxzQli7IKesW3KpZx4wO9g5
         ntrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnQBOZmBACZS7rVksnWt4xK7t5nGeI/yDHkK1axkC+9rIqh0o8+CMnmC9kS0ZWChRzB/aAoBI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgjQWytyNz+Z4CJoZYbibAt2YyfIQNq82nWLpkCCbQVq0G9kFo
	RP7UKynkel4dRzwbdPoes0FxI6D/ruKI8nCal+I/J5hE/KExi4G4JE6fuLmyC+bJqpc=
X-Gm-Gg: AZuq6aKm4Bnlo/2NZZDC0sNCAYntRx8oplim9XQIcarxfBWjwDG3b2f8ZtBxvYOVLT5
	6VbIzU6tX0Lh72SfSraUVaDHNmlMm1tjaHDChUUL6VDvOhBsYA5xTTSIydSc3DuRim/ae4jVyqW
	+8R9DzO9q2201egUOCRuKRXxH/qBKJC+whR3H1zpwkchw7FbmAXWn+vNvRHB9zp0YhT5O/kkvkP
	QIy16YE5DyVYjjkThuKVktMNsGMM1dEpDNVvxhgmwu8Z7N5MVXzpvSz0Te5JxnYAb6fWP/2sDW5
	tMQWsTFFgVYBkxBIbTysrIP2cLSodDPq3IGto5ftGqlA6DHKYtE55PBt5yql1heXaz5SwkUA7lx
	4k8cOgRlIptbNKxgYhoN2pOx3CREJG7c4VnYp0FbfmKwWF6Iy/TnmwI5SSXPRDzzj1nDDgyM2hL
	NNFJFMGbf6Q1jHPsvGyb95lDC1lkHcoCcp2DWVb6oonpK6rSu6KG8n
X-Received: by 2002:a05:600c:4eca:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-4805ce3fdddmr78475835e9.3.1769449277609;
        Mon, 26 Jan 2026 09:41:17 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d4faecbsm109407095e9.1.2026.01.26.09.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 09:41:17 -0800 (PST)
Message-ID: <45cd1b88-105c-486b-975f-a5fcd5bf78e9@freebox.fr>
Date: Mon, 26 Jan 2026 18:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix wrong TID passed when
 stopping AMPDU session
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <2633095a-9555-45bf-b143-ad2bdaa1ab01@freebox.fr>
 <9c6369f4-c80c-4a59-a17a-7b4ed0d8a032@oss.qualcomm.com>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <9c6369f4-c80c-4a59-a17a-7b4ed0d8a032@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_094119_593493_73E085FA 
X-CRM114-Status: UNSURE (   6.77  )
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

Hello,

On 26/01/2026 18:28, Jeff Johnson wrote:
> On 1/26/2026 3:35 AM, Pablo MARTIN-GOMEZ wrote:
>
> -    ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0,
> false);
> +    ret = ath12k_peer_rx_tid_reo_update(ar, peer,
> &peer->rx_tid[params->tid], 1, 0, false);
> FYI your e-mail client is munging your patch, adding a line break.
> And using "view source" it looks like other artifacts are being added.
> My tooling (using 'b4') cannot process your patch...
Oh, my bad. I've resent both my patches for ath11k & ath12k with git 
send-email to be sure.
> Applying: wifi: ath12k: fix wrong TID passed when stopping AMPDU session
> error: git diff header lacks filename information when removing 1 leading pathname component (line 6)
>
> Suggest using https://b4.docs.kernel.org/en/latest/contributor/overview.html
>>        spin_unlock_bh(&ab->base_lock);
>>        if (ret) {
>>            ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",

Best regards,

Pablo MG


