Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B7606A323
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ngk9/ngw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usp+2vFq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=; b=Ngk9/ngwIyPgSI
	9HDeTcxIaGBy8espGumNEUvP3mE74vbjPQViztbZho6CiA3Ra7fWEKudXeyOTKje158z3KrYDp6wr
	AgqOwVOADwU54vExZAIG5G0tM67aEPkkRvTH0xrEz2NK9BSIXnyy5hjCJa18KWP2+43TccCah+QxJ
	nf8t/shK8K+bxV6KzbejzY/O3lQxejWIaIWhRSwPn00P+HWPZ4Gtyp3l0WmyxXScgWLqpvlIJLf0s
	ob2ndI4qtPmUdCh2kxDNCGL4RuYK3pWA6WGG1F4wIRb8r1idB3CW2ma1CXPT63rh0duT/m67s5x4K
	peAxBGasrLKl9bqrGo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJXV-0000000GgtF-2TTp;
	Sat, 14 Nov 2026 19:35:53 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJXT-0000000GgsH-1EyB
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 19:35:52 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b31448caccso17026767b3.1
        for <ath12k@lists.infradead.org>; Sat, 14 Nov 2026 11:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684949; x=1795289749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=;
        b=usp+2vFqflxQBeXl39lH+gNgM4Ft1c1bPpwf/yYRTNOUBEU4Hw50O9X+CsMqwR4RkK
         kc62S7rZOrHUbAvW7+YK6gUyXK/N9aUODRR+7O8RQ5JoLsHcoY4O3tZbrR4Qja2yqLb7
         E911KTQk+vCilas7+isZnyPto3vZnS6A6g+TRE3iK0gJf/ML04b8XU0owb+ZhiQfbErN
         UVQc6mfFyP9ID6zZ19QNXuzi8zgFL9IogdY6m5IoPSDUZo36LITRR+t8NNjmHckP3p0l
         AN0ey+0WoHRr7G5vypZQZ60Z/U/TJYLHc1GdmysGMiwSSnUvtWTuerrr1+TerasB8jDI
         +9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684949; x=1795289749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWiiF+apEITg7T+z4C5J/H9oWTwRfn9iGA6HI9XcEQQ=;
        b=jdgFa3rNH6VGaPQ37eEvFagDyFXOmCHd1LHC44JPvOM85xuJpGeIEsgcWsYcQnPd/e
         t5J2mHj/WPo1A6dBW5KnfxSywnXorNKl3R4/iUMqPHrAG/JF4GmX/FrLpFuMZqlVDXpA
         lWfuV8HgPlmROUpmw0VIAiZSDdZHpUI6D/svIx2OH1LhaIgGlRDY2dboq6Em2Ql6Dvf6
         LTLq+z7y8+QnEb4GHKSV14PCYft08GE/Oi3Ub4U4rGLBp6qWxh3jjX72UbNIpOxUv+j6
         Jz2ZC4+zbHAdXU+vayYiZ2Ww0s+GbxtsdHRMq5SFV2EwHycoCnXmuf82AD8OHOXaWKBu
         36Uw==
X-Forwarded-Encrypted: i=1; AL+hErFo/8N8I29dYdpBwY30K50md0WDNrVP4MMguKEF1++gWP8bwoNyndl5NdFEhwp9bnwC1LZ7738=@lists.infradead.org
X-Gm-Message-State: APuU4Z/lh7CS5M723UxDgRrpgmSiUf6fv5cE3j0x1am3n/eC7JnAFIRj
	t/Av2wWfXyxn6YizXyS7EfOmKWvrcNIxvg7FmoMUV35ZjSXVa7zHODwlpLSmFQ2w
X-Gm-Gg: AYBFou08cvOiBT8F+307deH8LE3HQYIFDOIb9jz3UvBNgMs9YGLycm945SFV8Yagg2/
	t7HUMYmRDCt+1DdST2GsDflaKaww1oUldjiO9/Ux5ZTu/Yyi7beLzxAhTIjgNo1Ul0nrLjYlz0K
	WxQpmTOUJqgrhMlFXxW2N+HigIShxxedOIA6vroHwsQZqxIvpcqg5i6CDuI7au3XqHODhpKG8O6
	sNYFjCy68t5kgv8pTgQgtpyZjlQFRlYYs+kRbu9+teCXuEfag7VWn7viMRD9VMJBMtwHAY0q7Vb
	zMCgjNFtRV4fkp8/t1NgXIvPJLl9Ku5Eg3oZ0yhJKSMoNZ/2V5e6icM/tHtbzhEo555VUsdSngb
	vzMUnZdOeze0OqEQ/gjIKJS82MB1L0Jf8tu4mvcXSB56bFEtDVHJ4L1UZsbXVgccs0dso0YNwP2
	m0TEGYOMjx+kO93mMHeQYieTi5/+NkbBQxCrsteOkqee3VsNStplHrCbCJzxbvSWHP0Bb4YmLjA
	iDwTSgMnh2135tLfRdEvKdQ3n5M1+iVpVe//9sCoT96JF5CfV70Soy1Sz+GkcGFWh1CFtB0m2z+
	fvfwHlOKzEa35y82s5jHinoR+H09SIyeoX8km9rGxNO5iDplD8BssUB7dbP6sWzOurKZNlhCvVI
	TElh/Y1lL90c=
X-Received: by 2002:a05:690c:c501:b0:8b4:c1ef:7a62 with SMTP id 00721157ae682-8b4c1ef9ba3mr11528507b3.49.1794684949396;
        Sat, 14 Nov 2026 11:35:49 -0800 (PST)
Received: from [192.168.50.163] (99-7-255-95.lightspeed.clmboh.sbcglobal.net. [99.7.255.95])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm50209077b3.6.2026.11.14.11.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:35:48 -0800 (PST)
Message-ID: <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
Date: Sat, 14 Nov 2026 13:35:47 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
Content-Language: en-US
From: Walt Holman <waltholman09@gmail.com>
In-Reply-To: <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113551_341985_2F66CAF0 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 09:26, Jeff Johnson wrote:
> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>
>> Hmm, forget to reset revision number ...
>>
>> Jeff, let me know if I need to resend it with number fixed.
> 
> No, this is fine. Waiting for a R-B from the infrastructure team.
> 
> /jeff

Has there been any progress on this getting merged? I need the patches to connect to my wifi on anything other than the 2.4Ghz band with 7.4-rc2.

