Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5A5CCFA1A
	for <ath12k@archiver.kernel.org>; Tue, 11 Nov 2025 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coMU4DAPi+BtUyHwW1ZGlg7fVra25xQgwHzxt51usSc=; b=GWVIlCqjqWynh0w5PrMK3SOQid
	1PTKHJuobMxvLIoCogo+ETgz1tTRyMGhtO8HPUjVEIUApPoE6+g8QbvL2QxnOlytBwFP82pTlfNT0
	I1S1WpgKmgMy95M09+7IeQClmvP7ErfCjaqqneKvFjj6sNRRFP+fwEkBfJ/IWhXiNvdpeXino7lBY
	tajGffkhWrqs8qJlz0mrPXSS5oYFX9Nex8x0MfJwcyi6rlPwuCXy8wWbVdDtWKsJ+XLAZ/HmZwfYh
	Whk+66MSBNN0QZMALAQbPO3ZTDPN/byrZa2DgBW3L7mfPICRwwecPYGuPOJIKHMZeFOLk0nViDxwt
	tA6srMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqpO-00000007QFT-2Sgm;
	Tue, 11 Nov 2025 16:02:42 +0000
Received: from mail33c25.carrierzone.com ([64.29.147.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqpL-00000007QEh-0hRB
	for ath12k@lists.infradead.org;
	Tue, 11 Nov 2025 16:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1762876949;
	bh=luEWbFlPm4dvqL0JQ2wxArXI8nxq43clT3aNQcQzfiw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=ggYd0aXJaaOi7aIMHLBF+YwMdKsrlBYZXIC5U+dxhSq3zT3FIO3K1Ct9My9SpdTID
	 0rrsY/WVfcTrgoOgfUDXj9WZC37wT3UvFlY3Oz+SouLSHVEtmBjciqNZhFAY6/uEm5
	 wlxR5IMYu9uXFWGpVDHeGPKsqi8bqBz5VXF3wIxE=
Feedback-ID: pgupta@hindutoo
Received: from mail33c25.carrierzone.com (localhost [127.0.0.1])
	by mail33c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 5ABG2Ndh2871912
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 11 Nov 2025 16:02:24 +0000
Received: (from webmail@localhost)
	by mail33c25.carrierzone.com (8.14.9/8.12.2/Submit) id 5ABG11Z82868960;
	Tue, 11 Nov 2025 11:01:01 -0500
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: greearb@candelatech.com, ath12k@lists.infradead.org
Subject: Re: ath12k pcie radios with MLO support?
Date: Tue, 11 Nov 2025 11:01:00 -0500
Message-ID: <1762876860.35o0s3e54wssw80g@mailapp03.register.com>
In-Reply-To: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: dmFkZTEDwBJDOajIUfc2JNOpCxS/N95v2SLQllEsb6UnTYqk6xP+yldiELL1gHohBx9j4gEWnXK+P3+scV274/tRSMsCe9iRvjJ2THggOqT1sbhgKXAe5Frnl9CogRdFXCFNNJG+LikGHye7Z323/L4Aw+EVFMowLhcbUBXJTdU7Fj5yvewdMBCzrjaLFQC5K6Kmp86BpBaVMigF1OtA2xVXz09Ydx4RVS4lZHGUhPcogfC1BscD5adg3o8SU6WBLx1fKji+X6MWAVZxyrud2h4MqUgXSw/HJwifwO7MX5zFhbuKAYO4mifCDZdcO+Rnm8H8rVDRMwpr97+8icRG9hc4k1yRU1gb7Qin9Shh7QBHIrNDFMWN7lMtopTJFfm8ftCQdWFKBvrHyqOiYtFEvKTxciOX2c6qIf3ma1GTSRIrUr+wloltaMniFqcQTLxdwsrXTFLJbEox3Mp3ylHpkMp5LrJ2v3c38F56yX2fZk+g9mood9od6reZqi8DFD4oJK1/1hIllvCraOcog3q6QyKi63Z73Jt6uvmC94mlTGPZtOx1I4sEIS4z1JypKqP+Y4xGgaaUF/lZoGFo288cWkgt3WArNCAlL2UwTSW7KsY+AH/GZKEX/7El84ffU8Q/Mwa4awlmsdNnoO8REigmPuDC/p+N4XPv3OBVkkzfWPRnHDDUCQ
X-Rspamd-Status: No, score=1.90
X-Rspamd-Result: default: False [1.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_080239_501785_CEC06A95 
X-CRM114-Status: GOOD (  10.40  )
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
Reply-To: pgupta@hindutool.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

There is firmware available from compex that will allow you to do tri-band=
=2E  Alternatively, compex can hard program the modules, but you need to sp=
ecify this when you speak with them. I purchased the M.2 E-key modules befo=
re they came out with the mini-pcie modules.=C2=A0 I had to send the module=
s to them for re-programming, as I wanted a hardware solution and not just =
firmware.

I have yet to install the modules but compex can help you with this if you =
let them know what exact setup you are trying to do.

I have older=C2=A0WLW7000 High-Power M.2 Series=C2=A0and I believe they sol=
d a single 2GHz module and the combined 5+6 Ghz modules when I purchased th=
em. In any case, I have three modules, one for each band, and this is what =
I had to do.

Keep in mind that power connector are already soldered on, and I had to use=
 alligator clips to power the 5V supply they need.

According to compex, hostapd would be utilized if you use a plain vanilla l=
inux kernel.

Here is a video to the modules I have, I made a tictok about them:

#TikTok https://www.tiktok.com/t/ZTMWUv26h/



Regards,

Prashant

On Tue, 11 Nov 2025 07:27:52 -0800, Ben Greear <greearb@candelatech.com> wr=
ote:

>> Hello,
>>
>> Are there any current radios + software available where one can put
>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>> chassis and provide tri-band MLO?
>>
>> Last I looked, Compex had some dual-band radios and maybe single-band
>> 6ghz, but I am not sure those can be combined into a tri-band MLO soluti=
on?
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear
>> Candela Technologies Inc http://www.candelatech.com

